const express = require('express');
const router = express.Router();
const db = require('../config/db');

router.post('/clientes', (req, res) => {
    const { nome, email, telefone, cpf } = req.body;
    db.query('INSERT INTO clientes (nome, email, telefone, cpf) VALUES (?, ?, ?, ?)', [nome, email, telefone, cpf], (err, result) => {
        if (err) return res.status(500).json({ erro: 'Erro ao salvar cliente.' });
        res.status(201).json({ mensagem: 'Cliente cadastrado!', id: result.insertId });
    });
});

router.get('/clientes', (req, res) => {
    db.query('SELECT * FROM clientes ORDER BY nome ASC', (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar clientes' });
        res.json(results);
    });
});

router.post('/fornecedores', (req, res) => {
    const { nome, email, telefone, cnpj } = req.body;
    db.query('INSERT INTO fornecedores (nome, email, telefone, cnpj) VALUES (?, ?, ?, ?)', [nome, email, telefone, cnpj], (err, result) => {
        if (err) return res.status(500).json({ erro: 'Erro ao salvar fornecedor.' });
        res.status(201).json({ mensagem: 'Fornecedor cadastrado!', id: result.insertId });
    });
});

router.get('/fornecedores', (req, res) => {
    db.query('SELECT * FROM fornecedores ORDER BY nome ASC', (err, results) => {
        if (err) return res.status(500).json({ erro: 'Erro ao buscar fornecedores' });
        res.json(results);
    });
});

module.exports = router;