Eficiência e Controle: Um Sistema de Gestão Web para Confeitarias
Este repositório contém o código-fonte do Trabalho de Conclusão de Curso (TCC) focado no desenvolvimento de um sistema ERP e PDV para pequenos negócios, utilizando arquitetura Cliente-Servidor.
Tecnologias Utilizadas
Front-end: HTML5, CSS3, Vanilla JavaScript.
Back-end: Node.js, Express.js.
Banco de Dados: MySQL.

Pré-requisitos para Execução
Para rodar este projeto localmente, certifique-se de ter instalado em sua máquina:
Node.js
XAMPP (ou qualquer servidor MySQL local)
Passo a Passo para Instalação e Execução
1. Configuração do Banco de Dados
Inicie os serviços Apache e MySQL através do painel do XAMPP.
Acesse o phpMyAdmin (geralmente em http://localhost/phpmyadmin).
Crie um novo banco de dados (verifique o nome exato esperado nas configurações do Back-end).
Acesse a aba Importar, selecione o arquivo .sql fornecido na raiz deste projeto e execute a importação das tabelas e dados iniciais.

3. Configuração do Back-end (Servidor)
Abra o terminal na pasta raiz do projeto.
Instale as dependências do Node.js executando o comando:
npm install
Inicie o servidor da API executando o comando:
node server.js (ou npm start, conforme configurado no package.json).
O terminal indicará a porta em que o servidor está rodando (ex: Servidor rodando na porta 3000).

3. Acesso ao Front-end (Interface)
Com o servidor rodando e o banco de dados ativo, abra o arquivo principal index.html (ou a rota inicial configurada) diretamente no navegador para operar o sistema.
