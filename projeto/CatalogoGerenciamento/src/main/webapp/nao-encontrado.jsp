<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Item Não Encontrado</title>
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
            color: #dc3545; /* Cor vermelha para erro */
        }

        .btn-group {
            margin-top: 20px;
            width: 100%; 
            display: flex;
            justify-content: center;
        }

        .btn {
            width: 80%; /* Botão largo para caber na linha */
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
        // Recebe a URL para onde o usuário deve voltar (para continuar a busca)
        String voltarPara = request.getParameter("voltar"); 
        String mensagem = request.getParameter("msg");
        if (mensagem == null || mensagem.isEmpty()) {
            mensagem = "Item não encontrado.";
        }
        if (voltarPara == null || voltarPara.isEmpty()) {
            voltarPara = "index.jsp";
        }
    %>

    <div class="container">
        <h1>Ops!</h1>
        <p><%= mensagem %></p>
        
        <div class="btn-group">
            <a href="<%= voltarPara %>" class="btn">Voltar e tentar novamente</a>
        </div>
    </div>
</body>
</html>