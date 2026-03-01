<%-- 
    Document   : login
    Created on : 01/03/2026, 12:50:07
    Author     : aliceslombardi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - CTRL+VAULT</title>
</head>
<body>

<h2>Login</h2>

<form action="login" method="post">
    
    <label>Email:</label><br>
    <input type="email" name="email" required /><br><br>
    
    <label>Senha:</label><br>
    <input type="password" name="senha" required /><br><br>

    <button type="submit">Entrar</button>
</form>

<c:if test="${not empty mensagem}">
    <p style="color:green;">${mensagem}</p>
</c:if>
<c:if test="${not empty erro}">
    <p style="color:red;">${erro}</p>
</c:if>

</body>
</html>
