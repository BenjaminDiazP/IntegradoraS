function toggleMenu(menuId) {
    var menu = document.getElementById(menuId);
    menu.style.display = menu.style.display === 'block' ? 'none' : 'block';
}

function abrirModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = "block";
}

function cerrarModal(modalId) {
    const modal = document.getElementById(modalId);
    modal.style.display = "none";
}

const searchForm = document.getElementById("searchForm");
const searchInput = document.getElementById("search");
const clearButton = document.getElementById("clearSearch");
const productRows = document.querySelectorAll(".catalog-table tbody tr");

function buscarArticulos() {
    const filtro = searchInput.value.toLowerCase();

    productRows.forEach((product) => {
        let mostrarFila = false;
        for (let j = 2; j < product.cells.length; j++) {
            const cellValue = product.cells[j].textContent.toLowerCase();
            if (cellValue.includes(filtro)) {
                mostrarFila = true;
                break;
            }
        }
        product.style.display = mostrarFila ? "table-row" : "none";
    });

    clearButton.style.display = filtro !== "" ? "block" : "none";
}

//fdsfsdfsdfd
searchForm.addEventListener("submit", function (event) {
    event.preventDefault();
    buscarArticulos();
});

searchInput.addEventListener("input", function () {
    if (this.value !== "") {
        clearButton.style.display = "block";
    } else {
        clearButton.style.display = "none";
        showAllProducts();
    }
});

clearButton.addEventListener("click", function () {
    searchInput.value = "";
    clearButton.style.display = "none";
    showAllProducts();
});

function showAllProducts() {
    productRows.forEach((product) => {
        product.style.display = "table-row";
    });
}

document.getElementById('precio').addEventListener('input', function () {
    var precioInput = document.getElementById('precio');
    var precioValue = parseFloat(precioInput.value);

    if (precioValue < 0) {
        alert('No se permiten números negativos en el campo Precio.');
        precioInput.value = '';
    }
});

document.getElementById('stock').addEventListener('input', function () {
    var cantidadInput = document.getElementById('stock');
    var cantidadValue = parseFloat(cantidadInput.value);

    if (cantidadValue < 0) {
        alert('No se permiten números negativos en el campo Cantidad.');
        cantidadInput.value = '';
    }
});