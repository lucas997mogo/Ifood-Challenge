document.addEventListener('DOMContentLoaded', function () {
    const despesas = [200, 450, 300, 500, 250];
    const receitas = [400, 600, 700, 800, 500];

    const ctxDespesas = document.getElementById('graficoDespesas').getContext('2d');
    new Chart(ctxDespesas, {
        type: 'bar',
        data: {
            labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio'],
            datasets: [{
                label: 'Despesas',
                data: despesas,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1
            }]
        },
        options: {
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

    const ctxReceitas = document.getElementById('graficoReceitas').getContext('2d');
    new Chart(ctxReceitas, {
        type: 'line',
        data: {
            labels: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio'],
            datasets: [{
                label: 'Receitas',
                data: receitas,
                fill: false,
                borderColor: 'rgba(75, 192, 192, 1)',
                tension: 0.1
            }]
        }
    });
});
