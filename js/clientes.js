async function carregarClientes() {
    try {
        const res = await fetch('http://localhost:3000/clientes');
        const clientes = await res.json();
        const tbody = document.getElementById('tabelaClientes');
        tbody.innerHTML = '';
        
        clientes.forEach(c => {
            tbody.innerHTML += `
                <tr>
                    <td style="color: #64748b;">#${c.id}</td>
                    <td style="font-weight: 600;">${c.nome}</td>
                    <td>${c.cpf}</td>
                    <td>${c.telefone}</td>
                </tr>
            `;
        });
    } catch (erro) { console.error("Erro ao listar clientes", erro); }
}

document.getElementById('formCliente').addEventListener('submit', async function(e) {
    e.preventDefault();
    try {
        const dados = {
            nome: document.getElementById('nome').value,
            cpf: document.getElementById('cpf').value,
            telefone: document.getElementById('telefone').value,
            email: document.getElementById('email').value
        };

        const res = await fetch('http://localhost:3000/clientes', {
            method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(dados)
        });

        if (res.ok) {
            alert("Cliente cadastrado com sucesso!");
            document.getElementById('formCliente').reset();
            carregarClientes();
        } else {
            alert("Erro interno ao cadastrar cliente.");
        }
    } catch (error) { alert("Falha na conexão com o banco de dados."); }
});
const inputCep = document.getElementById('cep');
if (inputCep) {
    inputCep.addEventListener('blur', async function() {
        let cep = this.value.replace(/\D/g, ''); 
        
        if (cep.length === 8) {
            try {
                let resposta = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
                let dados = await resposta.json();
                
                if (!dados.erro) {
                    document.getElementById('rua').value = dados.logradouro || '';
                    document.getElementById('bairro').value = dados.bairro || '';
                    document.getElementById('cidade').value = dados.localidade || '';
                    document.getElementById('uf').value = dados.uf || '';
                } else {
                    console.warn("CEP não encontrado.");
                }
            } catch (error) {
                console.error("Erro ao buscar CEP:", error);
            }
        }
    });
}

window.onload = carregarClientes;