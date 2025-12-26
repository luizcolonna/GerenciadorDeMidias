package br.com.catalogo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/cadastrar-midia")
public class CadastrarMidiaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // 1. Recebe os dados do formulário
        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String anoString = request.getParameter("ano");
        String genero = request.getParameter("genero");
        String categoria = request.getParameter("categoria");
        String sinopse = request.getParameter("sinopse");
        
        // Converte o ano de String para int
        int ano = 0;
        if (anoString != null && !anoString.isEmpty()) {
            try {
                ano = Integer.parseInt(anoString);
            } catch (NumberFormatException e) {
                // Em caso de erro, você pode tratar de uma maneira mais robusta, como exibir uma mensagem de erro ao usuário.
                System.err.println("Erro ao converter o ano para inteiro: " + e.getMessage());
            }
        }

        // 2. Cria um objeto Item com os dados do formulário
        Item novoItem = new Item(titulo, autor, ano, genero, categoria, sinopse);

        // 3. Tenta salvar no banco de dados
        Connection conexao = null;
        PreparedStatement stmt = null;

        try {
            // Obtém a conexão com o banco de dados usando a sua classe Conexao
            conexao = Conexao.getConnection();

            // SQL para inserir os dados na tabela 'itens'
            String sql = "INSERT INTO itens (titulo, autor, ano, genero, categoria, sinopse) VALUES (?, ?, ?, ?, ?, ?)";
            
            // Prepara a instrução SQL para evitar ataques de SQL Injection
            stmt = conexao.prepareStatement(sql);
            stmt.setString(1, novoItem.getTitulo());
            stmt.setString(2, novoItem.getAutor());
            stmt.setInt(3, novoItem.getAno());
            stmt.setString(4, novoItem.getGenero());
            stmt.setString(5, novoItem.getCategoria());
            stmt.setString(6, novoItem.getSinopse());

            // Executa a inserção no banco
            stmt.executeUpdate();
            
            // Redireciona para a tela de confirmação estilizada
            response.sendRedirect("confirmacao.jsp?acao=cadastrar");


        } catch (Exception e) {
            // Em caso de erro, exibe a mensagem de erro no navegador
            response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<h1>Erro ao cadastrar:</h1>");
            response.getWriter().println("<p>" + e.getMessage() + "</p>");
            response.getWriter().println("<a href='cadastrar.jsp'>Voltar e tentar novamente</a>");
            e.printStackTrace(); // Imprime o erro completo no console do Eclipse
        } finally {
            // Fecha a conexão com o banco de dados no final, mesmo se houver erro
            Conexao.fecharConexao(conexao);
        }
    }
}