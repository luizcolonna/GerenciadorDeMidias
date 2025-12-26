<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Catálogo de Mídias</title>
<link rel="stylesheet" href="css/style.css">
</head>
<body>

    <div class="container">
        <h1>CATÁLOGO DE LIVROS, SÉRIES, FILMES</h1>
        <div class="subtitle">Selecione a opção:</div>

        <div class="btn-group">
            <a href="cadastrar.jsp" class="btn">Cadastrar</a>
            <a href="alterar.jsp" class="btn">Alterar</a>
            <a href="excluir.jsp" class="btn">Excluir</a>
        </div>

        <div class="btn-group search">
            <a href="buscar-titulo.jsp" class="btn">Buscar por Título</a>
            <a href="buscar-autor.jsp" class="btn">Buscar por Autor</a>
            <a href="buscar-genero.jsp" class="btn">Buscar por Gênero</a>
        </div>
        
        <div class="btn-group list">
            <a href="listar-todos" class="btn">Listar Todos</a>
        </div>

        <div class="info-section">
            <p>Sistema Gerenciador de Livros, Séries e Filmes</p>
            <p>Matéria: Projeto Integrador Transdisciplinar em Ciência da Computação</p>
            <p>Aluno: Luiz Henrique Igreja Colonna</p>
            <p>RGM: 46095586</p>
        </div>
    </div>

</body>
</html>