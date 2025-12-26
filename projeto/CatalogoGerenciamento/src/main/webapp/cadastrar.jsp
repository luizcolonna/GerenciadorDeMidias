<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastrar Mídia</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        /* Estilos específicos para o formulário */
        form {
            display: flex;
            flex-direction: column;
            align-items: center; /* Centraliza o formulário no container */
            width: 100%;
        }
        
        /* Controles do formulário (label + input/select) */
        .form-control {
            display: flex; /* Para colocar label e input na mesma linha */
            align-items: center; /* Alinha verticalmente */
            width: 80%; /* Largura dos controles */
            margin-bottom: 10px; /* Espaçamento menor entre os elementos */
        }

        .form-control label {
            font-weight: bold;
            flex-shrink: 0; /* Impede que o label encolha */
            width: 100px; /* Largura fixa para os labels */
            text-align: right; /* Alinha o texto do label à direita */
            margin-right: 10px; /* Espaçamento entre label e input */
        }

        .form-control input, 
        .form-control select {
            flex-grow: 1; /* Faz o input/select ocupar o restante do espaço */
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid black;
            border-radius: 5px;
            background-color: #ffffff; /* Cor de fundo branca */
        }
        
        /* Estilo específico para a sinopse (não na mesma linha do label) */
        .form-control-sinopse {
            width: 80%; /* Largura da sinopse */
            margin-bottom: 10px; /* Espaçamento */
            text-align: left;
        }

        .form-control-sinopse label {
            font-weight: bold;
            display: block; /* Para o label ficar em cima do textarea */
            margin-bottom: 5px; /* Espaçamento entre label e textarea */
        }

        .form-control-sinopse textarea {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
            border: 1px solid black;
            border-radius: 5px;
            height: 100px;
            resize: vertical; /* Permite redimensionar verticalmente */
            background-color: #ffffff; /* Cor de fundo branca */
        }

        /* Estilos para os botões do formulário */
        .btn-group.form-buttons {
            display: flex;
            justify-content: center; /* Centraliza os botões */
            width: 80%; /* Largura dos botões */
            gap: 20px;
            margin-top: 20px;
        }

        .btn-group.form-buttons button,
        .btn-group.form-buttons a {
            flex-grow: 1; /* Faz os botões ocuparem o espaço disponível */
            max-width: 180px; /* Limite de largura para os botões */
            box-sizing: border-box;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Cadastrar</h1>
        <form action="cadastrar-midia" method="post">
            <div class="form-control">
                <label for="titulo">Título:</label>
                <input type="text" id="titulo" name="titulo" required>
            </div>
            
            <div class="form-control">
                <label for="autor">Autor:</label>
                <input type="text" id="autor" name="autor">
            </div>
            
            <div class="form-control">
                <label for="ano">Ano:</label>
                <input type="number" id="ano" name="ano">
            </div>

            <div class="form-control">
                <label for="genero">Gênero:</label>
                <select id="genero" name="genero">
                    <option value="">Selecione</option>
                    <option value="Acao">Ação</option>
                    <option value="Aventura">Aventura</option>
                    <option value="Comedia">Comédia</option>
                    <option value="Documentario">Documentário</option>
                    <option value="Drama">Drama</option>
                    <option value="Ficcao">Ficção</option>
                    <option value="Outro">Outro</option>
                    <option value="Romance">Romance</option>
                    <option value="Suspense">Suspense</option>
                    <option value="Terror">Terror</option>
                </select>
            </div>

            <div class="form-control">
                <label for="categoria">Categoria:</label>
                <select id="categoria" name="categoria">
                    <option value="">Selecione</option>
                    <option value="Filme">Filme</option>
                    <option value="Serie">Série</option>
                    <option value="Livro">Livro</option>
                </select>
            </div>

            <div class="form-control-sinopse">
                <label for="sinopse">Sinopse:</label>
                <textarea id="sinopse" name="sinopse" rows="5" cols="40"></textarea>
            </div>

            <div class="btn-group form-buttons">
                <button type="submit" class="btn">Cadastrar</button>
                <a href="index.jsp" class="btn">Voltar para tela Inicial</a>
            </div>
        </form>
    </div>

</body>
</html>