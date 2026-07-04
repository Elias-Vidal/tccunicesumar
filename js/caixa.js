async function carregarCaixa() {
    try {
        const res = await fetch('http://localhost:3000/financeiro/caixa/hoje');
        const transacoes = await res.json();
        
        let entradas = 0, saidas = 0;
        let metodos = { 'Dinheiro': 0, 'Pix': 0, 'Cartão de Crédito': 0, 'Cartão de Débito': 0 };
        const tbody = document.getElementById('tabelaCaixa');
        tbody.innerHTML = '';

        transacoes.forEach(t => {
            const valor = parseFloat(t.valor);
            const isEntrada = t.tipo === 'entrada';
            
            if (isEntrada) entradas += valor; else saidas += valor;
            if (isEntrada && metodos[t.forma_pagamento] !== undefined) metodos[t.forma_pagamento] += valor;

            const corTxt = isEntrada ? 'var(--sucesso)' : 'var(--primaria)';
            const sinal = isEntrada ? '+' : '-';
            const dataFormatada = new Date(t.data_transacao).toLocaleTimeString('pt-BR');

            tbody.innerHTML += `
                <tr>
                    <td>${dataFormatada}</td>
                    <td><span style="background: ${isEntrada ? '#d1fae5' : '#fee2e2'}; color: ${corTxt}; padding: 3px 8px; border-radius: 4px; font-size: 11px; font-weight: bold;">${t.tipo.toUpperCase()}</span></td>
                    <td>${t.descricao}</td><td>${t.forma_pagamento}</td>
                    <td style="color: ${corTxt}; font-weight: bold;">${sinal} R$ ${valor.toFixed(2).replace('.', ',')}</td>
                </tr>`;
        });

        document.getElementById('totalEntradas').innerText = `R$ ${entradas.toFixed(2).replace('.', ',')}`;
        document.getElementById('totalSaidas').innerText = `R$ ${saidas.toFixed(2).replace('.', ',')}`;
        document.getElementById('saldoAtual').innerText = `R$ ${(entradas - saidas).toFixed(2).replace('.', ',')}`;
        document.getElementById('resPix').innerText = `R$ ${metodos['Pix'].toFixed(2).replace('.', ',')}`;
        document.getElementById('resCredito').innerText = `R$ ${metodos['Cartão de Crédito'].toFixed(2).replace('.', ',')}`;
        document.getElementById('resDebito').innerText = `R$ ${metodos['Cartão de Débito'].toFixed(2).replace('.', ',')}`;
        document.getElementById('resDinheiro').innerText = `R$ ${metodos['Dinheiro'].toFixed(2).replace('.', ',')}`;
    } catch (erro) { console.error('Erro ao buscar movimentações do caixa:', erro); }
}

document.getElementById('formCaixa').addEventListener('submit', async function(e) {
    e.preventDefault();
    try {
        const dados = {
            tipo: document.getElementById('tipo').value,
            descricao: document.getElementById('descricao').value,
            forma_pagamento: document.getElementById('forma_pagamento').value,
            valor: parseFloat(document.getElementById('valor').value)
        };

        if(dados.valor <= 0) return alert("O valor deve ser maior que zero!");

        await fetch('http://localhost:3000/financeiro/caixa', {
            method: 'POST', headers: { 'Content-Type': 'application/json' }, body: JSON.stringify(dados)
        });
        document.getElementById('formCaixa').reset();
        carregarCaixa(); 
    } catch (error) { alert("Erro de conexão com o banco de dados."); }
});

window.onload = carregarCaixa;