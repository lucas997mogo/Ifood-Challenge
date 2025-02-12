document.addEventListener('DOMContentLoaded', function() {
    const pagamentos = [
        { data: '2024-08-01', valor: 'R$ 1.000,00' },
        { data: '2024-08-15', valor: 'R$ 750,00' },
        { data: '2024-08-22', valor: 'R$ 500,00' }
    ];

    const recebiveis = [
        { data: '2024-08-10', valor: 'R$ 1.200,00' },
        { data: '2024-08-20', valor: 'R$ 800,00' }
    ];

    function addListItems(id, items) {
        const list = document.getElementById(id);
        items.forEach(item => {
            const listItem = document.createElement('li');
            listItem.className = 'list-group-item';
            listItem.textContent = `${item.data} - ${item.valor}`;
            list.appendChild(listItem);
        });
    }

    addListItems('pagamentos-list', pagamentos);
    addListItems('recebiveis-list', recebiveis);
});
