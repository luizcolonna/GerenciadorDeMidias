package br.com.catalogo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/alterar-item")
public class AlterarItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AlterarItemServlet() {
        super();
    }
    
    // Deixe o doGet vazio, pois o formulário usa POST
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1. Recebe todos os parâmetros do formulário
		String idStr = request.getParameter("id");
		String titulo = request.getParameter("titulo");
		String autor = request.getParameter("autor");
		String anoStr = request.getParameter("ano");
		String genero = request.getParameter("genero");
		String categoria = request.getParameter("categoria");
		String sinopse = request.getParameter("sinopse");
		
		int id = 0;
		int ano = 0;
		
		try {
			id = Integer.parseInt(idStr);
			ano = Integer.parseInt(anoStr);
		} catch (NumberFormatException e) {
			// Trata erro de conversão
			e.printStackTrace();
			response.sendRedirect("alterar.jsp?erro=dados_invalidos");
			return;
		}
		
		Connection conexao = null;
		PreparedStatement stmt = null;

		try {
			// 2. Obtém a conexão com o banco de dados
			conexao = Conexao.getConnection();
			
			// 3. Cria a instrução SQL para ALTERAR (UPDATE) o item
			String sql = "UPDATE itens SET titulo=?, autor=?, ano=?, genero=?, categoria=?, sinopse=? WHERE id=?";
			
			stmt = conexao.prepareStatement(sql);
			// Define os valores dos parâmetros
			stmt.setString(1, titulo);
			stmt.setString(2, autor);
			stmt.setInt(3, ano);
			stmt.setString(4, genero);
			stmt.setString(5, categoria);
			stmt.setString(6, sinopse);
			stmt.setInt(7, id); // O ID vai por último no WHERE
			
			// 4. Executa a alteração
			stmt.executeUpdate();
			
			// 5. Se chegou aqui, a alteração foi bem-sucedida!

		} catch (Exception e) {
			e.printStackTrace();
			// Redireciona para a página de erro ou a tela inicial
			response.sendRedirect("index.jsp?erro=alteracao");
			return;
		} finally {
			try {
				if (stmt != null) stmt.close();
				Conexao.fecharConexao(conexao);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 6. Redireciona o usuário para a tela de confirmação, como na exclusão
		response.sendRedirect("confirmacao.jsp?acao=alterar");
	}
}