async function carregarEstoque() {
    try {
        const res = await fetch('http://localhost:3000/estoque');
        const estoque = await res.json();
        const tbody = document.getElementById('tabelaEstoque');
        tbody.innerHTML = '';
        
        estoque.forEach(item => {
            const alertaEstilo = item.quantidade <= 5 && item.tipo !== 'Produto Final' ? 'color: red; font-weight: bold;' : '';
            tbody.innerHTML += `
                <tr>
                    <td>${item.id}</td>
                    <td>${item.nome}</td>
                    <td>${item.tipo}</td>
                    <td style="${alertaEstilo}">${item.quantidade}</td>
                    <td>R$ ${parseFloat(item.custo).toFixed(2).replace('.', ',')}</td>
                    <td>R$ ${parseFloat(item.valor).toFixed(2).replace('.', ',')}</td>
                    <td>
                        <button onclick="movimentarEstoque(${item.id}, 'soma')" style="background: var(--sucesso); padding: 5px; font-size: 11px;">+ Qtd</button>
                        <button onclick="movimentarEstoque(${item.id}, 'subtrai')" style="background: var(--alerta); padding: 5px; font-size: 11px;">- Qtd</button>
                        <button onclick="editarItem(${item.id}, '${item.nome}', '${item.tipo}', ${item.custo}, ${item.valor})" style="background: #2980b9; padding: 5px; font-size: 11px;">✏️ Ed</button>
                        <button onclick="excluirItem(${item.id})" style="background: var(--primaria); padding: 5px; font-size: 11px;">🗑️ Ex</button>
                    </td>
                </tr>`;
        });
    } catch (erro) { 
        console.error('Erro ao buscar estoque:', erro);
        alert('Não foi possível carregar o estoque. Servidor desconectado.');
    }
}

document.getElementById('formEstoque').addEventListener('submit', async e => {
    e.preventDefault();
    try {
        const dados = {
            nome: document.getElementById('nome').value,
            tipo: document.getElementById('tipo').value,
            quantidade: document.getElementById('quantidade').value,
            custo: parseFloat(document.getElementById('custo').value),
            valor: parseFloat(document.getElementById('valor').value)
        };
        if (dados.custo < 0 || dados.valor < 0 || dados.quantidade < 0) {
            return alert("Valores numéricos não podem ser negativos!");
        }

        await fetch('http://localhost:3000/estoque', {
            method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(dados)
        });
        document.getElementById('formEstoque').reset();
        carregarEstoque();
    } catch (error) { alert("Erro de conexão ao salvar item."); }
});

async function movimentarEstoque(id, acao) {
    const qtd = prompt(`Quantas unidades deseja ${acao === 'soma' ? 'ADICIONAR' : 'REMOVER'}?`);
    if (qtd && !isNaN(qtd) && parseInt(qtd) > 0) {
        try {
            await fetch(`http://localhost:3000/estoque/movimentar/${id}`, {
                method: 'PUT', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify({ acao: acao, quantidade: parseInt(qtd) })
            });
            carregarEstoque();
        } catch (error) { alert("Falha ao comunicar com o servidor."); }
    }
}
async function editarItem(id, nomeAtual, tipoAtual, custoAtual, valorAtual) {
    const novoNome = prompt("Descrição do item:", nomeAtual) || nomeAtual;
    const novoCusto = prompt("Custo de Produção (R$):", custoAtual) || custoAtual;
    const novoValor = prompt("Preço de Venda (R$):", valorAtual) || valorAtual;
    if(parseFloat(novoCusto) < 0 || parseFloat(novoValor) < 0) return alert("Valores não podem ser negativos.");
    try {
        await fetch(`http://localhost:3000/estoque/${id}`, {
            method: 'PUT', headers: { 'Content-Type': 'application/json' }, 
            body: JSON.stringify({ nome: novoNome, tipo: tipoAtual, custo: parseFloat(novoCusto), valor: parseFloat(novoValor) })
        });
        carregarEstoque();
    } catch (error) { alert("Erro ao editar o item."); }
}
async function excluirItem(id) {
    if(confirm("Confirma a exclusão definitiva deste item do inventário?")) {
        try {
            await fetch(`http://localhost:3000/estoque/${id}`, { method: 'DELETE' });
            carregarEstoque();
        } catch (error) { alert("Erro ao excluir item."); }
    }
}
window.onload = carregarEstoque;