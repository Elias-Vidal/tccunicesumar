const express = require('express');
const router = express.Router();
const db = require('../config/db');

const registrarHistorico = (produto_id, nome, qtd, tipo, origem) => {
    const sql = 'INSERT INTO historico_estoque (produto_id, nome_produto, quantidade, tipo_movimentacao, origem) VALUES (?, ?, ?, ?, ?)';
    db.query(sql, [produto_id, nome, qtd, tipo, origem], (err) => {
        if(err) console.error("Erro ao gravar auditoria:", err);
    });
};

router.post('/', (req, res) => {
    const { identificacao, nome_cliente } = req.body; 
    db.query("INSERT INTO comandas (identificacao, nome_cliente) VALUES (?, ?)", [identificacao || 'Balcão', nome_cliente || null], (err, result) => {
        if (err) return res.status(500).json({ erro: 'Erro ao abrir comanda' });
        res.status(201).json({ mensagem: 'Comanda aberta!', id: result.insertId });
    });
});

router.get('/abertas', (req, res) => {
    db.query("SELECT * FROM comandas WHERE status = 'aberta' ORDER BY data_abertura DESC", (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar comandas' });
        res.json(results);
    });
});

router.get('/:id/itens', (req, res) => {
    db.query('SELECT * FROM itens_comanda WHERE comanda_id = ?', [req.params.id], (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar itens' });
        res.json(results);
    });
});

router.post('/:id/itens', (req, res) => {
    const comanda_id = req.params.id;
    const { produto_id, quantidade } = req.body;

    if (quantidade <= 0) return res.status(400).json({ erro: 'A quantidade deve ser maior que zero!' });

    db.query('SELECT nome, valor, quantidade AS estoque_atual FROM estoque WHERE id = ?', [produto_id], (err, prodResults) => {
        if (err || prodResults.length === 0) return res.status(404).json({ erro: 'Produto não encontrado' });
        
        const produto = prodResults[0];
        if (produto.estoque_atual < quantidade) return res.status(400).json({ erro: `Estoque insuficiente! Restam ${produto.estoque_atual} unidades.` });

        const subtotal = produto.valor * quantidade;

        db.query('UPDATE estoque SET quantidade = quantidade - ? WHERE id = ?', [quantidade, produto_id], (errEstoque) => {
            if (errEstoque) return res.status(500).json({ erro: 'Erro ao atualizar estoque' });
            
            registrarHistorico(produto_id, produto.nome, quantidade, 'saida', `Venda PDV - Comanda ${comanda_id}`);

            db.query('INSERT INTO itens_comanda (comanda_id, produto_id, nome_produto, quantidade, preco_unitario, subtotal) VALUES (?, ?, ?, ?, ?, ?)', 
            [comanda_id, produto_id, produto.nome, quantidade, produto.valor, subtotal], (errInsert) => {
                if (errInsert) return res.status(500).json({ erro: 'Erro ao adicionar item' });

                db.query('UPDATE comandas SET total = total + ? WHERE id = ?', [subtotal, comanda_id], (errUpdate) => {
                    if (errUpdate) return res.status(500).json({ erro: 'Erro ao atualizar total' });
                    res.status(201).json({ mensagem: 'Item adicionado!' });
                });
            });
        });
    });
});

router.delete('/:comanda_id/itens/:item_id', (req, res) => {
    const { comanda_id, item_id } = req.params;

    db.query('SELECT produto_id, nome_produto, quantidade, subtotal FROM itens_comanda WHERE id = ?', [item_id], (err, results) => {
        if (err || results.length === 0) return res.status(404).json({ erro: 'Item não encontrado' });
        const item = results[0];

        db.query('DELETE FROM itens_comanda WHERE id = ?', [item_id], (errDel) => {
            if (errDel) return res.status(500).json({ erro: 'Erro ao remover item' });

            db.query('UPDATE estoque SET quantidade = quantidade + ? WHERE id = ?', [item.quantidade, item.produto_id], (errEst) => {
                registrarHistorico(item.produto_id, item.nome_produto, item.quantidade, 'entrada', `Estorno - Comanda ${comanda_id}`);
                
                db.query('UPDATE comandas SET total = total - ? WHERE id = ?', [item.subtotal, comanda_id], () => {
                    res.json({ mensagem: 'Item estornado com sucesso!' });
                });
            });
        });
    });
});

router.post('/:id/fechar', (req, res) => {
    const comanda_id = req.params.id;
    const { pagamentos } = req.body; 

    db.query('SELECT * FROM comandas WHERE id = ?', [comanda_id], (err, results) => {
        if (err || results.length === 0) return res.status(404).json({ erro: 'Comanda não encontrada' });
        
        const comanda = results[0];
        if (comanda.status !== 'aberta') return res.status(400).json({ erro: 'Comanda já fechada' });

        let totalPago = pagamentos.reduce((acc, p) => acc + parseFloat(p.valor), 0);
        if (totalPago < comanda.total) return res.status(400).json({ erro: `Falta R$ ${(comanda.total - totalPago).toFixed(2)}` });

        let troco = totalPago - comanda.total;
        let pagamentosParaSalvar = [...pagamentos];
        
        if (troco > 0) {
            let pgDinheiro = pagamentosParaSalvar.find(p => p.forma === 'Dinheiro');
            if (pgDinheiro) pgDinheiro.valor -= troco; 
        }

        db.query("UPDATE comandas SET status = 'paga', data_fechamento = CURRENT_TIMESTAMP WHERE id = ?", [comanda_id], (errUpdate) => {
            if(errUpdate) return res.status(500).json({ erro: 'Erro ao fechar comanda' });

            pagamentosParaSalvar.forEach(pg => {
                if (pg.valor > 0) {
                    db.query('INSERT INTO pagamentos_comanda (comanda_id, forma_pagamento, valor) VALUES (?, ?, ?)', [comanda_id, pg.forma, pg.valor]);
                    const descricaoCaixa = `Venda PDV - Comanda #${comanda_id}`;
                    db.query('INSERT INTO caixa (tipo, descricao, valor, forma_pagamento) VALUES (?, ?, ?, ?)', 
                        ['entrada', descricaoCaixa, pg.valor, pg.forma], 
                        (errCaixa) => {
                            if (errCaixa) console.error("ERRO CAIXA:", errCaixa);
                        }
                    );
                }
            });
            res.json({ mensagem: 'Conta fechada com sucesso!', troco: troco });
        });
    });
});

router.delete('/:id', (req, res) => {
    const id = req.params.id;
    db.query('DELETE FROM itens_comanda WHERE comanda_id = ?', [id], (err) => {
        if (err) return res.status(500).json({ erro: 'Erro ao remover itens' });
        db.query('DELETE FROM comandas WHERE id = ? AND status = "aberta"', [id], (err2, result) => {
            if (err2 || result.affectedRows === 0) return res.status(400).json({ erro: 'Comanda não pode ser excluída' });
            res.json({ mensagem: 'Comanda cancelada com sucesso!' });
        });
    });
});

module.exports = router;