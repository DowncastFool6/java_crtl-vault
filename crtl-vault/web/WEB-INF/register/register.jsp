<%-- 
    Document   : register
    Created on : 28/02/2026, 17:47:35
    Author     : aliceslombardi
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Registrar Usuário</title>
</head>
<body>

<h2>Registar Novo Usuário</h2>

<!-- Mensagem de erro -->
<c:if test="${not empty erro}">
    <p style="color: red;">
        ${erro}
    </p>
</c:if>

<form action="${pageContext.request.contextPath}/register" method="post">

    <label>Nome:</label><br>
    <input type="text" name="nome"
           value="${param.nome}" required>
    <br><br>

    <label>Email:</label><br>
    <input type="email" name="email"
           value="${param.email}" required>
    <br><br>

    <label>Senha:</label><br>
    <input type="password" name="senha" required>
    <br><br>

    <button type="submit">Registar</button>

</form>

</body>
</html>
