<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.com.catalogo.controller.Item" %>
<% 
    // Tenta obter o item que pode ter sido carregado pelo Servlet
    Item item = (Item) request.getAttribute("itemParaAlterar");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Alterar Item</title>
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

        /* Ajuste para o formulário de Alteração (quando o item é carregado) */
        .container.form-completo {
            width: 500px; /* Deixa o formulário maior para os campos */
            text-align: left;
        }

        .form-control {
            margin-bottom: 15px;
        }

        .form-control label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control input[type="text"], 
        .form-control select,
        .form-control textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        
        .form-control textarea {
            resize: vertical;
            min-height: 100px;
        }

        .btn-group.form-buttons {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        
        .btn-alterar {
            background-color: #ffc107; /* Amarelo para alteração */
            color: black;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
        }

        .btn-alterar:hover {
            background-color: #e0a800;
        }
    </style>
</head>
<body>
    <div class="container <%= item != null ? "form-completo" : "" %>">

        <% if (item == null) { %>
            <h1>Buscar por Id - Alterar</h1>
            
            <form action="carregar-para-alteracao" method="get">
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
            <h1 style="text-align: center;">Alterar Item (ID: <%= item.getId() %>)</h1>
            

            <form action="alterar-item" method="post">
                <input type="hidden" name="id" value="<%= item.getId() %>">
                
                <div class="form-control">
                    <label for="titulo">Título:</label>
                    <input type="text" id="titulo" name="titulo" value="<%= item.getTitulo() %>" required>
                </div>
                
                <div class="form-control">
                    <label for="autor">Autor:</label>
                    <input type="text" id="autor" name="autor" value="<%= item.getAutor() %>" required>
                </div>
                
                <div class="form-control">
                    <label for="ano">Ano:</label>
                    <input type="text" id="ano" name="ano" value="<%= item.getAno() %>" required>
                </div>
                
                <div class="form-control">
                    <label for="genero">Gênero:</label>
                    <select id="genero" name="genero" required>
                        <option value="<%= item.getGenero() %>" selected><%= item.getGenero() %></option>
                        <option value="Comédia" <%= "Comédia".equals(item.getGenero()) ? "" : "" %>>Comédia</option>
                        <option value="Aventura" <%= "Aventura".equals(item.getGenero()) ? "" : "" %>>Aventura</option>
                        <option value="Ficção" <%= "Ficção".equals(item.getGenero()) ? "" : "" %>>Ficção</option>
                        <option value="Documentário" <%= "Documentário".equals(item.getGenero()) ? "" : "" %>>Documentário</option>
                        <option value="Suspense" <%= "Suspense".equals(item.getGenero()) ? "" : "" %>>Suspense</option>
                        <option value="Romance" <%= "Romance".equals(item.getGenero()) ? "" : "" %>>Romance</option>
                        </select>
                </div>
                
                <div class="form-control">
                    <label for="categoria">Categoria:</label>
                    <select id="categoria" name="categoria" required>
                        <option value="<%= item.getCategoria() %>" selected><%= item.getCategoria() %></option>
                        <option value="Filme" <%= "Filme".equals(item.getCategoria()) ? "" : "" %>>Filme</option>
                        <option value="Série" <%= "Série".equals(item.getCategoria()) ? "" : "" %>>Série</option>
                        <option value="Livro" <%= "Livro".equals(item.getCategoria()) ? "" : "" %>>Livro</option>
                        </select>
                </div>
                
                <div class="form-control">
                    <label for="sinopse">Sinopse:</label>
                    <textarea id="sinopse" name="sinopse" required><%= item.getSinopse() %></textarea>
                </div>
                
                <div class="btn-group form-buttons">
                    <button type="submit" class="btn-alterar">Alterar</button>
                    <a href="index.jsp" class="btn">Voltar para a tela inicial</a>
                </div>
            </form>
        <% } %>
    </div>
</body>
</html>