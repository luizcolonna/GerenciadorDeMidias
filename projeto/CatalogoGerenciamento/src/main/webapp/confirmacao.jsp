<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Confirmação</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 2px solid black;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: f0f0f0;
            text-align: center;
        }
        
        h1 {
            color: #28a745; /* Cor verde para sucesso */
        }

        /* Ajuste a largura do contêiner do botão para centralizar */
        .btn-group {
            margin-top: 20px;
            width: 100%; 
            display: flex; /* Garante que o botão use a largura máxima do seu grupo */
            justify-content: center;
        }

        /* Aumenta a largura do botão para ele caber em uma linha centralizada */
        .btn {
            width: 80%; /* Define uma largura considerável para o botão */
            padding: 10px 20px;
            text-decoration: none;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <% 
        String acao = request.getParameter("acao"); 
        String tituloMsg = "Sucesso!";
        String textoMsg = "A operação foi concluída com sucesso.";

        if ("excluir".equals(acao)) {
            textoMsg = "O item foi excluído com sucesso.";
        } else if ("alterar".equals(acao)) {
            textoMsg = "O item foi alterado com sucesso.";
        } else if ("cadastrar".equals(acao)) {
            textoMsg = "O item foi cadastrado com sucesso.";
        }
    %>
    
    <div class="container">
        <h1><%= tituloMsg %></h1>
        <p><%= textoMsg %></p>
        
        <div class="btn-group">
            <a href="index.jsp" class="btn">Voltar para a tela inicial</a>
        </div>
    </div>
</body>
</html>