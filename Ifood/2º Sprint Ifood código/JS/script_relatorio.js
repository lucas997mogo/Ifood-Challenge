const financialData = {
    balance: 5000.00,
    revenue: 2000.50,
    expenses: 1200.00,
};

function updateReport() {
    document.getElementById('balance').textContent = `$${financialData.balance.toFixed(2)}`;

    const analysisElement = document.getElementById('analysis');
    analysisElement.innerHTML = `
        <li class="list-group-item">Receita Total: $${financialData.revenue.toFixed(2)}</li>
        <li class="list-group-item">Despesas Totais: $${financialData.expenses.toFixed(2)}</li>
        <li class="list-group-item">Saldo: $${(financialData.revenue - financialData.expenses).toFixed(2)}</li>
    `;
}

document.addEventListener('DOMContentLoaded', updateReport);
