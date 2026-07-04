const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.post('/caixa', (req, res) => {
    const { tipo, descricao, valor, forma_pagamento } = req.body;
    db.query('INSERT INTO caixa (tipo, descricao, valor, forma_pagamento) VALUES (?, ?, ?, ?)', [tipo, descricao, valor, forma_pagamento], (err, result) => {
        if (err) return res.status(500).json({ erro: 'Erro ao registrar no caixa' });
        res.status(201).json({ mensagem: 'Registro salvo no caixa!' });
    });
});

router.get('/caixa/hoje', (req, res) => {
    db.query('SELECT * FROM caixa WHERE DATE(data_transacao) = CURDATE() ORDER BY data_transacao DESC', (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar caixa' });
        res.json(results);
    });
});

router.get('/dashboard/resumo', (req, res) => {
    const sqlCaixaHoje = "SELECT SUM(valor) AS total FROM caixa WHERE DATE(data_transacao) = CURDATE() AND tipo = 'entrada'";
    const sqlCaixaMes = "SELECT SUM(valor) AS total FROM caixa WHERE MONTH(data_transacao) = MONTH(CURDATE()) AND YEAR(data_transacao) = YEAR(CURDATE()) AND tipo = 'entrada'";
    const sqlItensMes = "SELECT SUM(ic.quantidade) AS total_itens FROM itens_comanda ic JOIN comandas c ON ic.comanda_id = c.id WHERE MONTH(c.data_fechamento) = MONTH(CURDATE()) AND YEAR(c.data_fechamento) = YEAR(CURDATE()) AND c.status = 'paga'";
    const sqlAlerta = "SELECT COUNT(*) AS produtos_acabando FROM estoque WHERE quantidade <= 5 AND tipo != 'Produto Final'";

    db.query(sqlCaixaHoje, (err, resHoje) => {
        db.query(sqlCaixaMes, (err, resMes) => {
            db.query(sqlItensMes, (err, resItens) => {
                db.query(sqlAlerta, (err, resAlerta) => {
                    res.json({ 
                        faturamento_hoje: resHoje[0]?.total || 0,
                        faturamento_mes: resMes[0]?.total || 0,
                        itens_vendidos_mes: resItens[0]?.total_itens || 0,
                        alertas_estoque: resAlerta[0]?.produtos_acabando || 0 
                    });
                });
            });
        });
    });
});

router.get('/dashboard/mais-vendido', (req, res) => {
    const sql = `SELECT nome_produto, SUM(quantidade) as total_vendido FROM itens_comanda GROUP BY produto_id ORDER BY total_vendido DESC LIMIT 1`;
    db.query(sql, (err, result) => {
        res.json(result[0] || { nome_produto: 'Nenhum', total_vendido: 0 });
    });
});

router.get('/dashboard/grafico-vendas', (req, res) => {
    const sql = `
        SELECT DATE(data_transacao) as dia, SUM(valor) as total 
        FROM caixa 
        WHERE tipo = 'entrada' AND data_transacao >= DATE_SUB(CURDATE(), INTERVAL 7 DAY)
        GROUP BY DATE(data_transacao)
        ORDER BY dia ASC`;
        
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao gerar gráfico' });
        res.json(results);
    });
});

router.get('/dashboard/pagamentos', (req, res) => {
    const sql = `SELECT forma_pagamento, COUNT(*) as total FROM pagamentos_comanda GROUP BY forma_pagamento`;
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar pagamentos' });
        res.json(results);
    });
});

router.get('/dashboard/top-3', (req, res) => {
    const sql = `SELECT nome_produto, SUM(quantidade) as total_vendido FROM itens_comanda GROUP BY produto_id ORDER BY total_vendido DESC LIMIT 3`;
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar top 3' });
        res.json(results);
    });
});

module.exports = router;