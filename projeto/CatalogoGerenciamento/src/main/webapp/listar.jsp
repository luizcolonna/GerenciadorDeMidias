<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<% String origem = (String) request.getAttribute("origem"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Listar Itens</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .container {
            width: 800px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .info-section {
            margin-top: 20px;
        }
        
        /* Ajuste para o botão voltar */
        .btn-group.form-buttons {
            display: flex;
            justify-content: center;
            width: 100%;
            margin-top: 20px;
        }
    </style>
</head>
<body>

    <div class="container">
        <% if ("buscarAutor".equals(origem) || "buscarTitulo".equals(origem) || "buscarGenero".equals(origem)) { %>
    		<h1>Resultados da Busca</h1>
		<% } else { %>
    		<h1>LISTAR TODOS</h1>
		<% } %>

                
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
    <% 
        List<br.com.catalogo.controller.Item> listaItens = (List<br.com.catalogo.controller.Item>) request.getAttribute("listaItens");
        if (listaItens != null) {
            for (br.com.catalogo.controller.Item item : listaItens) {
    %>
        <tr>
            <td><%= item.getId() %></td>
            <td><%= item.getTitulo() %></td>
			<td><%= item.getAutor() %></td>
            <td><%= item.getAno() %></td>
            <td><%= item.getGenero() %></td>
            <td><%= item.getCategoria() %></td>
            <td><%= item.getSinopse() %></td>
        </tr>
    <% 
            }
        }
    %>
</tbody>
        </table>
        
        <div class="btn-group form-buttons">
            <a href="index.jsp" class="btn">Voltar para a tela inicial</a>
        </div>
    </div>

</body>
</html>