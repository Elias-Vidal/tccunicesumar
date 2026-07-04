const express = require('express');
const router = express.Router();
const db = require('../config/db');

const registrarHistorico = (produto_id, nome, qtd, tipo, origem) => {
    const sql = 'INSERT INTO historico_estoque (produto_id, nome_produto, quantidade, tipo_movimentacao, origem) VALUES (?, ?, ?, ?, ?)';
    db.query(sql, [produto_id, nome, qtd, tipo, origem], (err) => {
        if(err) console.error("Erro ao gravar auditoria:", err);
    });
};

router.get('/', (req, res) => {
    db.query('SELECT * FROM estoque ORDER BY nome ASC', (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar estoque' });
        res.json(results);
    });
});

router.post('/', (req, res) => {
    const { nome, tipo, quantidade, custo, valor } = req.body;
    db.query('INSERT INTO estoque (nome, tipo, quantidade, custo, valor) VALUES (?, ?, ?, ?, ?)', [nome, tipo, quantidade, custo, valor], (err, result) => {
        if (err) return res.status(500).json({ erro: 'Erro ao salvar item' });
        res.status(201).json({ mensagem: 'Item cadastrado!', id: result.insertId });
    });
});

router.put('/movimentar/:id', (req, res) => {
    const id = req.params.id;
    const { acao, quantidade } = req.body; 

    if (quantidade <= 0) return res.status(400).json({ erro: 'Quantidade inválida!' });

    db.query('SELECT nome, quantidade FROM estoque WHERE id = ?', [id], (err, results) => {
        if (err || results.length === 0) return res.status(404).json({ erro: 'Item não encontrado' });

        const produto = results[0];
        let novaQtd = acao === 'soma' ? produto.quantidade + quantidade : produto.quantidade - quantidade;
        if (novaQtd < 0) novaQtd = 0;

        db.query('UPDATE estoque SET quantidade = ? WHERE id = ?', [novaQtd, id], (errUpdate) => {
            if (errUpdate) return res.status(500).json({ erro: 'Erro ao atualizar quantidade' });
            registrarHistorico(id, produto.nome, quantidade, acao === 'soma' ? 'entrada' : 'saida', 'Ajuste Manual - Gerente');
            res.json({ mensagem: 'Estoque atualizado!', novaQuantidade: novaQtd });
        });
    });
});

router.put('/:id', (req, res) => {
    const { nome, tipo, custo, valor } = req.body;
    db.query('UPDATE estoque SET nome=?, tipo=?, custo=?, valor=? WHERE id=?', [nome, tipo, custo, valor, req.params.id], (err) => {
        if (err) return res.status(500).json({ erro: 'Erro ao editar item' });
        res.json({ mensagem: 'Item atualizado!' });
    });
});

router.delete('/:id', (req, res) => {
    db.query('DELETE FROM estoque WHERE id = ?', [req.params.id], (err) => {
        if (err) return res.status(500).json({ erro: 'Erro ao excluir item' });
        res.json({ mensagem: 'Item excluído!' });
    });
});

module.exports = router;