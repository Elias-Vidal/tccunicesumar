async function carregarFornecedores() {
    try {
        const res = await fetch('http://localhost:3000/fornecedores');
        const fornecedores = await res.json();
        const tbody = document.getElementById('tabelaFornecedores');
        tbody.innerHTML = '';
        
        fornecedores.forEach(f => {
            tbody.innerHTML += `
                <tr>
                    <td style="color: #64748b;">#${f.id}</td>
                    <td style="font-weight: 600;">${f.nome}</td>
                    <td>${f.cnpj}</td>
                    <td>${f.telefone}</td>
                </tr>
            `;
        });
    } catch (erro) { console.error("Erro ao listar fornecedores", erro); }
}

document.getElementById('formFornecedor').addEventListener('submit', async function(e) {
    e.preventDefault();
    try {
        const dados = {
            nome: document.getElementById('nome').value,
            cnpj: document.getElementById('cnpj').value,
            telefone: document.getElementById('telefone').value,
            email: document.getElementById('email').value
        };

        const res = await fetch('http://localhost:3000/fornecedores', {
            method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(dados)
        });

        if (res.ok) {
            alert("Fornecedor homologado com sucesso!");
            document.getElementById('formFornecedor').reset();
            carregarFornecedores();
        } else {
            alert("Erro interno ao homologar fornecedor.");
        }
    } catch (error) { alert("Falha na conexão com o banco de dados."); }
});

const inputCep = document.getElementById('cep');
if (inputCep) {
    inputCep.addEventListener('blur', async function() {
        let cep = this.value.replace(/\D/g, ''); // Limpa traços ou pontos
        
        if (cep.length === 8) {
            try {
                let resposta = await fetch(`https://viacep.com.br/ws/${cep}/json/`);
                let dados = await resposta.json();
                
                if (!dados.erro) {
                    document.getElementById('rua').value = dados.logradouro || '';
                    document.getElementById('bairro').value = dados.bairro || '';
                    document.getElementById('cidade').value = dados.localidade || '';
                    document.getElementById('estado').value = dados.uf || '';
                } else {
                    console.warn("CEP não encontrado.");
                }
            } catch (error) {
                console.error("Erro ao buscar CEP:", error);
            }
        }
    });
}
window.onload = carregarFornecedores;