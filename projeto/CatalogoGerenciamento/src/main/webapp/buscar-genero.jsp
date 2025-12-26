<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar por Gênero</title>
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

        .form-control {
            margin-bottom: 15px;
        }

        .form-control label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .form-control select {
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
    </style>
</head>
<body>

    <div class="container">
        <h1>Buscar por Gênero</h1>
        
        <form action="buscar-por-genero" method="post">
            <div class="form-control">
                <label for="genero">Gênero:</label>
                <select id="genero" name="genero" required>
                    <option value="">-- Selecione um Gênero --</option>
                    <option value="Comedia">Comédia</option>
                    <option value="Aventura">Aventura</option>
                    <option value="Ficcao">Ficção</option>
                    <option value="Documentario">Documentário</option>
                    <option value="Suspense">Suspense</option>
                    <option value="Romance">Romance</option>
                    <option value="Acao">Ação</option> 
                    <option value="Drama">Drama</option>
                    <option value="Outro">Outro</option>
                    <option value="Terror">Terror</option>
                    </select>
            </div>
            
            <div class="btn-group form-buttons">
                <button type="submit" class="btn">Buscar</button>
                <a href="index.jsp" class="btn">Voltar para a tela inicial</a>
            </div>
        </form>
    </div>

</body>
</html>