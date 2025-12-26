<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Buscar por Autor</title>
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
            text-align: center; /* Centraliza todo o conteúdo dentro do container */
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
    </style>
</head>
<body>

    <div class="container">
        <h1>Buscar por Autor</h1>
        
        <form action="buscar-por-autor" method="post">
            <div class="form-control">
                <label for="autor">Digite o autor:</label>
                <input type="text" id="autor" name="autor" required>
            </div>
            
            <div class="btn-group form-buttons">
                <button type="submit" class="btn">Buscar</button>
                <a href="index.jsp" class="btn">Voltar para a tela inicial</a>
            </div>
        </form>
    </div>

</body>
</html>