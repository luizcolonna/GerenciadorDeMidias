package br.com.catalogo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/excluir-item")
public class ExcluirItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExcluirItemServlet() {
        super();
    }
    
    // Deixe o doGet vazio, pois o formulário usa POST
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. Recebe o ID do campo escondido (hidden)
		String idStr = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			// Caso o ID não seja um número, trate o erro e redirecione
			response.sendRedirect("index.jsp"); // Redireciona para a tela inicial
			return;
		}
		
		Connection conexao = null;
		PreparedStatement stmt = null;

		try {
			// 2. Obtém a conexão com o banco de dados
			conexao = Conexao.getConnection();
			
			// 3. Cria a instrução SQL para DELETAR o item pelo ID
			String sql = "DELETE FROM itens WHERE id = ?";
			
			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			
			// 4. Executa a exclusão
			stmt.executeUpdate();
			
			// 5. Se chegou aqui, a exclusão foi bem-sucedida!

		} catch (Exception e) {
			e.printStackTrace();
			// Se houver erro, podemos redirecionar para uma página de erro
			response.sendRedirect("index.jsp?erro=exclusao");
			return;
		} finally {
			try {
				if (stmt != null) stmt.close();
				Conexao.fecharConexao(conexao);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 6. Redireciona o usuário para a lista completa (ou para a tela inicial)
		// Redireciona para a tela de confirmação, passando uma flag
		//response.sendRedirect("confirmacao.jsp?acao=excluir");
		
		// Redireciona para a tela de confirmação, passando uma flag
		response.sendRedirect("confirmacao.jsp?acao=excluir");
	}
}