document.addEventListener('DOMContentLoaded', function() {
    const saldo = 5000.50;
    const transacoes = [
        { id: 1, descricao: 'Venda de produto A', valor: -50.00, data: '2024-08-20' },
        { id: 2, descricao: 'Venda de produto B', valor: -30.00, data: '2024-08-22' },
        { id: 3, descricao: 'Pagamento de comissão', valor: 200.00, data: '2024-08-25' }
    ];

    function atualizarSaldo() {
        document.getElementById('saldo').textContent = `R$ ${saldo.toFixed(2)}`;
    }

    function atualizarTransacoes() {
        const transacoesList = document.getElementById('transacoes');
        transacoesList.innerHTML = '';
        transacoes.forEach(transacao => {
            const item = document.createElement('li');
            item.className = 'list-group-item';
            item.textContent = `${transacao.descricao} - R$ ${transacao.valor.toFixed(2)} - ${transacao.data}`;
            transacoesList.appendChild(item);
        });
    }

    atualizarSaldo();
    atualizarTransacoes();

    document.getElementById('refreshSaldo').addEventListener('click', function() {
        alert('Saldo atualizado!');
        atualizarSaldo(); 
    });
});
