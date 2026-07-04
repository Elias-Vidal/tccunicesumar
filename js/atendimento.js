let valorTotalDaComanda = 0;

async function carregarProdutos() {
    try {
        const res = await fetch('http://localhost:3000/estoque');
        const produtos = await res.json();
        const select = document.getElementById('produtoSelect');
        select.innerHTML = '';
        produtos.forEach(p => {
            if(p.tipo === 'Produto Final') {
                select.innerHTML += `<option value="${p.id}">[R$ ${p.valor}] ${p.nome} (Estoque: ${p.quantidade})</option>`;
            }
        });
    } catch (error) { console.error("Erro ao carregar produtos:", error); }
}

async function carregarComandas() {
    try {
        const res = await fetch('http://localhost:3000/comandas/abertas');
        const comandas = await res.json();
        const container = document.getElementById('listaComandas');
        container.innerHTML = '';
        
        if (comandas.length === 0) {
            container.innerHTML = '<p style="color: #94a3b8; font-size: 13px;">Nenhuma mesa aberta.</p>';
            document.getElementById('painelCarrinho').style.display = 'none';
            return;
        }
        
        comandas.forEach(c => {
            container.innerHTML += `
                <div class="comanda-card" id="card-${c.id}" onclick="selecionarComanda(${c.id}, '${c.identificacao}', ${c.total}, '${c.nome_cliente || ''}')">
                    <strong>${c.identificacao}</strong><br>R$ ${parseFloat(c.total).toFixed(2).replace('.', ',')}
                </div>`;
        });
    } catch (error) { console.error("Erro ao carregar comandas:", error); }
}

document.getElementById('formNovaComanda').addEventListener('submit', async e => {
    e.preventDefault();
    try {
        const dados = { identificacao: document.getElementById('idComanda').value, nome_cliente: document.getElementById('nomeCliente').value };
        await fetch('http://localhost:3000/comandas', { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(dados) });
        document.getElementById('formNovaComanda').reset();
        carregarComandas();
    } catch (error) { alert("Erro de conexão ao abrir comanda."); }
});

function selecionarComanda(id, identificacao, total, nome) {
    document.querySelectorAll('.comanda-card').forEach(c => c.classList.remove('comanda-ativa'));
    document.getElementById(`card-${id}`).classList.add('comanda-ativa');
    document.getElementById('painelCarrinho').style.display = 'block';
    document.getElementById('tituloComanda').innerText = `Comanda: ${identificacao} ${nome && nome !== 'null' ? `(${nome})` : ''}`;
    document.getElementById('comandaAtualId').value = id;
    valorTotalDaComanda = parseFloat(total);
    document.getElementById('totalComandaText').innerText = `Total: R$ ${valorTotalDaComanda.toFixed(2).replace('.', ',')}`;
    carregarItensDaComanda(id);
}

async function carregarItensDaComanda(id) {
    try {
        const res = await fetch(`http://localhost:3000/comandas/${id}/itens`);
        const itens = await res.json();
        const tbody = document.getElementById('tabelaItens');
        tbody.innerHTML = '';
        itens.forEach(item => {
            tbody.innerHTML += `
                <tr>
                    <td>${item.nome_produto}</td><td style="text-align: center;">${item.quantidade}</td>
                    <td>R$ ${parseFloat(item.preco_unitario).toFixed(2).replace('.', ',')}</td><td>R$ ${parseFloat(item.subtotal).toFixed(2).replace('.', ',')}</td>
                    <td style="text-align: center;"><button class="btn-remover" onclick="removerItem(${id}, ${item.id})" style="background:var(--primaria); padding:4px 8px; border:none; color:white; border-radius:4px;">❌</button></td>
                </tr>`;
        });
    } catch (error) { console.error("Erro ao carregar itens da comanda:", error); }
}

document.getElementById('formAdicionarItem').addEventListener('submit', async e => {
    e.preventDefault();
    try {
        const comanda_id = document.getElementById('comandaAtualId').value;
        const dados = { produto_id: document.getElementById('produtoSelect').value, quantidade: document.getElementById('qtdItem').value };
        const res = await fetch(`http://localhost:3000/comandas/${comanda_id}/itens`, { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify(dados) });
        
        if(res.ok) { 
            carregarComandas(); 
            setTimeout(() => document.getElementById(`card-${comanda_id}`).click(), 100); 
            carregarProdutos(); 
        } else { 
            const erro = await res.json(); 
            alert(erro.erro); 
        }
    } catch (error) { alert("Erro de comunicação ao lançar item."); }
});

async function removerItem(comanda_id, item_id) {
    if(confirm('Devolver este item ao estoque?')) {
        try {
            await fetch(`http://localhost:3000/comandas/${comanda_id}/itens/${item_id}`, { method: 'DELETE' });
            carregarComandas(); 
            setTimeout(() => document.getElementById(`card-${comanda_id}`).click(), 100); 
            carregarProdutos();
        } catch (error) { alert("Erro ao remover item."); }
    }
}

async function excluirComandaAtual() {
    const id = document.getElementById('comandaAtualId').value;
    if(confirm('Tem certeza que deseja CANCELAR e excluir esta comanda? Todos os itens voltarão ao estoque.')) {
        try {
            await fetch(`http://localhost:3000/comandas/${id}`, { method: 'DELETE' });
            document.getElementById('painelCarrinho').style.display = 'none'; 
            carregarComandas();
        } catch (error) { alert("Erro ao cancelar comanda."); }
    }
}

function imprimirConferencia() { window.print(); }

function abrirModalPagamento() {
    if (valorTotalDaComanda <= 0) return alert('A comanda está vazia.');
    document.getElementById('modalPagamento').style.display = 'block';
    document.getElementById('modalTotal').innerText = `Total: R$ ${valorTotalDaComanda.toFixed(2).replace('.', ',')}`;
    document.querySelectorAll('.input-pg').forEach(input => input.value = 0);
    calcularTroco();
}

function fecharModalPagamento() { document.getElementById('modalPagamento').style.display = 'none'; }

function calcularTroco() {
    let soma = 0;
    document.querySelectorAll('.input-pg').forEach(i => soma += parseFloat(i.value) || 0);
    const btn = document.getElementById('btnConfirmarPg'), txtTroco = document.getElementById('modalTroco');
    if (soma >= valorTotalDaComanda) {
        txtTroco.style.color = 'var(--sucesso)'; 
        txtTroco.innerText = soma > valorTotalDaComanda ? `Troco: R$ ${(soma - valorTotalDaComanda).toFixed(2).replace('.', ',')}` : 'Valor Exato. Ok!';
        btn.disabled = false; btn.style.opacity = 1; btn.style.cursor = 'pointer';
    } else {
        txtTroco.style.color = 'var(--primaria)'; 
        txtTroco.innerText = `Faltam: R$ ${(valorTotalDaComanda - soma).toFixed(2).replace('.', ',')}`;
        btn.disabled = true; btn.style.opacity = 0.5; btn.style.cursor = 'not-allowed';
    }
}

async function finalizarComanda() {
    try {
        const comanda_id = document.getElementById('comandaAtualId').value;
        const pagamentos = [
            { forma: 'Dinheiro', valor: parseFloat(document.getElementById('pgDinheiro').value) || 0 },
            { forma: 'Pix', valor: parseFloat(document.getElementById('pgPix').value) || 0 },
            { forma: 'Cartão de Crédito', valor: parseFloat(document.getElementById('pgCredito').value) || 0 },
            { forma: 'Cartão de Débito', valor: parseFloat(document.getElementById('pgDebito').value) || 0 }
        ];
        
        const res = await fetch(`http://localhost:3000/comandas/${comanda_id}/fechar`, { method: 'POST', headers: {'Content-Type': 'application/json'}, body: JSON.stringify({ pagamentos }) });
        const resposta = await res.json();
        
        if (res.ok) {
            let msg = resposta.mensagem;
            if (resposta.troco > 0) msg += `\n\n💰 ENTREGUE O TROCO: R$ ${resposta.troco.toFixed(2).replace('.', ',')}`;
            alert(msg);
            fecharModalPagamento(); 
            document.getElementById('painelCarrinho').style.display = 'none'; 
            carregarComandas(); 
        } else { alert(resposta.erro || 'Erro ao fechar comanda'); }
    } catch (error) { alert("Erro fatal ao finalizar o pagamento."); }
}

window.onload = () => { carregarProdutos(); carregarComandas(); };