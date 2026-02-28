<%-- 
    Document   : register
    Created on : 28/02/2026, 17:47:35
    Author     : santo
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Registrar Usuário</title>
</head>
<body>

<h2>Registrar Novo Usuário</h2>

<form action="register" method="post">

    <label>Nome:</label><br>
    <input type="text" name="nome" required><br><br>

    <label>Email:</label><br>
    <input type="email" name="email" required><br><br>

    <label>Senha:</label><br>
    <input type="password" name="senha" required><br><br>

    <button type="submit">Registrar</button>

</form>

</body>
</html>
