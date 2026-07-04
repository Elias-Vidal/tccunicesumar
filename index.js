const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();
app.use(cors());
app.use(express.json());

const geralRoutes = require('./routes/geral');
const estoqueRoutes = require('./routes/estoque');
const comandasRoutes = require('./routes/comandas');
const financeiroRoutes = require('./routes/financeiro');

app.use('/', geralRoutes);
app.use('/estoque', estoqueRoutes);
app.use('/comandas', comandasRoutes);
app.use('/financeiro', financeiroRoutes); 

app.listen(3000, () => console.log('Servidor rodando, porta 3000'));