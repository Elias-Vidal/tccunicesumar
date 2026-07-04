async function carregarDashboardCompleto() {
    try {
        const resResumo = await fetch('http://localhost:3000/financeiro/dashboard/resumo');
        if (resResumo.ok) {
            const dados = await resResumo.json();
            document.getElementById('dashFaturamentoHoje').innerText = `R$ ${parseFloat(dados.faturamento_hoje).toFixed(2).replace('.', ',')}`;
            document.getElementById('dashFaturamentoMes').innerText = `R$ ${parseFloat(dados.faturamento_mes).toFixed(2).replace('.', ',')}`;
        }

        const resMaisVendido = await fetch('http://localhost:3000/financeiro/dashboard/mais-vendido');
        if (resMaisVendido.ok) {
            const produtoCampeao = await resMaisVendido.json();
            document.getElementById('dashMaisVendido').innerText = produtoCampeao.nome_produto || 'Nenhum';
            document.getElementById('qtdMaisVendido').innerText = `Total: ${produtoCampeao.total_vendido || 0} un.`;
        }

        const resVendas = await fetch('http://localhost:3000/financeiro/dashboard/grafico-vendas');
        if (resVendas.ok) {
            const historico = await resVendas.json();
            const rotulos = historico.map(h => new Date(h.dia).toLocaleDateString('pt-BR', {weekday: 'short'}));
            const valores = historico.map(h => parseFloat(h.total));
            
            new Chart(document.getElementById('vendasChart'), {
                type: 'line',
                data: {
                    labels: rotulos.length > 0 ? rotulos : ['Sem dados'],
                    datasets: [{
                        label: 'Faturamento Diário (R$)',
                        data: valores.length > 0 ? valores : [0],
                        borderColor: '#2980b9', backgroundColor: 'rgba(41, 128, 185, 0.1)',
                        borderWidth: 3, fill: true, tension: 0.4,
                        pointBackgroundColor: '#fff', pointBorderColor: '#2980b9', pointBorderWidth: 2, pointRadius: 4
                    }]
                },
                options: { responsive: true, plugins: { legend: { display: false } }, scales: { y: { beginAtZero: true, grid: { borderDash: [5, 5] } }, x: { grid: { display: false } } } }
            });
        }

        const resPg = await fetch('http://localhost:3000/financeiro/dashboard/pagamentos');
        if (resPg.ok) {
            const pagamentos = await resPg.json();
            new Chart(document.getElementById('pagamentoChart'), {
                type: 'doughnut',
                data: {
                    labels: pagamentos.map(p => p.forma_pagamento),
                    datasets: [{ data: pagamentos.map(p => p.total), backgroundColor: ['#27ae60', '#3498db', '#f1c40f', '#e67e22', '#9b59b6', '#34495e'], borderWidth: 0 }]
                },
                options: { responsive: true, maintainAspectRatio: false, plugins: { legend: { position: 'bottom', labels: { boxWidth: 12, font: { size: 11 } } } } }
            });
        }

        const resTop = await fetch('http://localhost:3000/financeiro/dashboard/top-3');
        if (resTop.ok) {
            const top3 = await resTop.json();
            const divRanking = document.getElementById('rankingTop3');
            divRanking.innerHTML = ''; 
            if(top3.length > 0) {
                const maxVendas = top3[0].total_vendido;
                top3.forEach((item, index) => {
                    const porcentagem = (item.total_vendido / maxVendas) * 100;
                    divRanking.innerHTML += `
                        <div class="ranking-item">
                            <div style="display: flex; justify-content: space-between; align-items: flex-end;">
                                <span style="font-weight: 600; color: #1e293b; font-size: 14px;">${index + 1}º - ${item.nome_produto}</span>
                                <span style="color: #64748b; font-size: 13px; font-weight: 600;">${item.total_vendido} unidades</span>
                            </div>
                            <div class="bar-bg"><div class="bar-fill" style="width: ${porcentagem}%"></div></div>
                        </div>`;
                });
            } else { divRanking.innerHTML = '<p style="color: #94a3b8; font-size: 13px;">Nenhuma venda registrada até o momento.</p>'; }
        }
    } catch (erro) { 
        console.error("Erro ao carregar o dashboard:", erro); 
        alert("Falha na comunicação com o servidor.");
    }
}

window.onload = carregarDashboardCompleto;