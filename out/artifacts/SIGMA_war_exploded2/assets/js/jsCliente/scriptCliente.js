document.addEventListener("DOMContentLoaded", function () {
    
    var passwordMenuBtn = document.getElementById("passwordMenuBtn");
    var emailMenuBtn = document.getElementById("emailMenuBtn");
    var servicesMenuBtn = document.getElementById("servicesMenuBtn");  
    var passwordMenu = document.getElementById("passwordMenu");
    var emailMenu = document.getElementById("emailMenu");
    var servicesMenu = document.getElementById("servicesMenu");  

    passwordMenuBtn.addEventListener("click", function () {
        passwordMenu.style.display = passwordMenu.style.display === "none" ? "block" : "none";
        emailMenu.style.display = "none";
        servicesMenu.style.display = "none";
    });

    emailMenuBtn.addEventListener("click", function () {
        emailMenu.style.display = emailMenu.style.display === "none" ? "block" : "none";
        passwordMenu.style.display = "none";
        servicesMenu.style.display = "none";
    });

    servicesMenuBtn.addEventListener("click", function () {
        servicesMenu.style.display = servicesMenu.style.display === "none" ? "block" : "none";
        passwordMenu.style.display = "none";
        emailMenu.style.display = "none";
    });
});
