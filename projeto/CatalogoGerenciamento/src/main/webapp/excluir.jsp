<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.catalogo.controller.Item" %>
<% 
    // Tenta obter o item e a origem da requisição
    Item item = (Item) request.getAttribute("itemParaExcluir");
    String origem = (String) request.getAttribute("origem");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Excluir Item</title>
    <link rel="stylesheet" href="css/style.css">
    
    <style>
        .container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            border: 2px solid black;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: f0f0f0;
            text-align: center;
        }
        
        /* Estilos adicionais para a tela de confirmação */
        .container.tabela {
            width: 800px; /* Alarga para exibir a tabela */
            margin: 50px auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }
        
        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .form-control label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control input[type="text"] {
            width: 80%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn-group.form-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn-excluir {
            background-color: #dc3545; /* Vermelho para exclusão */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-excluir:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container <%= "carregarExclusao".equals(origem) ? "tabela" : "" %>">

        <% if (item == null) { %>
            <h1>Buscar por Id - Exclusão</h1>
            
            <form action="carregar-para-exclusao" method="get">
                <div class="form-control">
                    <label for="id">Id:</label>
                    <input type="text" id="id" name="id" required>
                </div>
                
                <div class="btn-group form-buttons">
                    <button type="submit" class="btn">Buscar</button>
                    <a href="index.jsp" class="btn">Voltar a tela inicial</a>
                </div>
            </form>
        
        <% } else { %>
            <h1>Resultados da Busca</h1>
            <p>Confirme os dados antes de excluir.</p>
            

            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Título</th>
                        <th>Autor</th>
                        <th>Ano</th>
                        <th>Gênero</th>
                        <th>Categoria</th>
                        <th>Sinopse</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td><%= item.getId() %></td>
                        <td><%= item.getTitulo() %></td>
                        <td><%= item.getAutor() %></td>
                        <td><%= item.getAno() %></td>
                        <td><%= item.getGenero() %></td>
                        <td><%= item.getCategoria() %></td>
                        <td><%= item.getSinopse() %></td>
                    </tr>
                </tbody>
            </table>
            
            <form action="excluir-item" method="post">
                <input type="hidden" name="id" value="<%= item.getId() %>">
                
                <div class="btn-group form-buttons">
                    <button type="submit" class="btn-excluir">Excluir</button>
                    <a href="index.jsp" class="btn">Voltar a tela inicial</a>
                </div>
            </form>
        <% } %>
    </div>
</body>
</html>