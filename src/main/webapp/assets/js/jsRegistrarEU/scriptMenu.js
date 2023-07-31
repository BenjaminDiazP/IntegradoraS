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