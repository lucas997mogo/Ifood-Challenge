document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault(); 

    var username = document.getElementById("username").value;
    var password = document.getElementById("password").value;
    var messageDiv = document.getElementById("message");

    if (username === "usuario" && password === "123") {
        messageDiv.textContent = "Login realizado com sucesso!";
        messageDiv.className = "text-success";

        window.location.href = "template.html";

    } else if (username === "usuario" && password === "senha") {
        messageDiv.textContent = "Login realizado com sucesso!";
        messageDiv.className = "text-success";

        window.location.href = "acesso_financeiro.html";
    }
     else {
        messageDiv.textContent = "Nome de usuário ou senha incorretos.";
        messageDiv.className = "text-danger";
    }
});

