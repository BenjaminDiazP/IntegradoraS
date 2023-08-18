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

document.addEventListener("DOMContentLoaded", function () {
    const searchForm = document.getElementById("searchForm");
    const searchInput = document.getElementById("search");
    const clearButton = document.getElementById("clearSearch");
    const productRows = document.querySelectorAll(".catalog-table tbody tr");
    const originalTableContent = Array.from(productRows);

    function buscarArticulos() {
        const filtro = searchInput.value.trim().toLowerCase();
        let seEncontroCoincidencia = false;

        if (filtro === "") {
            alert("Por favor, ingresa un término de búsqueda.");
            return;
        }

        productRows.forEach((product) => {
            let mostrarFila = false;
            for (let j = 0; j < product.cells.length; j++) {
                const cellValue = product.cells[j].textContent.toLowerCase();
                if (cellValue.includes(filtro)) {
                    mostrarFila = true;
                    seEncontroCoincidencia = true;
                    break;
                }
            }
            product.style.display = mostrarFila ? "table-row" : "none";
        });

        clearButton.style.display = filtro !== "" ? "block" : "none";

        if (!seEncontroCoincidencia) {
            alert("No se encontraron coincidencias.");
            productRows.forEach((product, index) => {
                product.style.display = "table-row";
            });
        }
    }

    searchForm.addEventListener("submit", function (event) {
        event.preventDefault();
        buscarArticulos();
    });

    searchInput.addEventListener("input", function () {
        if (this.value.trim() !== "") {
            clearButton.style.display = "block";
        } else {
            clearButton.style.display = "none";
            restoreOriginalTable();
        }
    });

    clearButton.addEventListener("click", function () {
        searchInput.value = "";
        clearButton.style.display = "none";
        restoreOriginalTable();
    });

    function restoreOriginalTable() {
        originalTableContent.forEach((product, index) => {
            product.style.display = "table-row";
        });
    }
});