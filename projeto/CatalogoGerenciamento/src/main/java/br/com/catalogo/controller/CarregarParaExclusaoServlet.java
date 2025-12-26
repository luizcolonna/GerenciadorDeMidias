package br.com.catalogo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/carregar-para-exclusao")
public class CarregarParaExclusaoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CarregarParaExclusaoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Item item = null;
		
		// 1. Recebe o ID do formulário
		String idStr = request.getParameter("id");
		int id = 0;
		try {
			id = Integer.parseInt(idStr);
		} catch (NumberFormatException e) {
			// Caso o ID não seja um número, trate o erro e redirecione
			response.sendRedirect("excluir.jsp?erro=id_invalido");
			return;
		}
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// 2. Obtém a conexão com o banco de dados
			conexao = Conexao.getConnection();
			
			// 3. Cria a instrução SQL para buscar o item pelo ID
			String sql = "SELECT id, titulo, autor, ano, genero, categoria, sinopse FROM itens WHERE id = ?";
			
			stmt = conexao.prepareStatement(sql);
			stmt.setInt(1, id);
			
			// 4. Executa a busca
			rs = stmt.executeQuery();
			
			// 5. Verifica se encontrou o item e cria o objeto
			if (rs.next()) {
				String titulo = rs.getString("titulo");
				String autor = rs.getString("autor");
				int ano = rs.getInt("ano");
				String genero = rs.getString("genero");
				String categoria = rs.getString("categoria");
				String sinopse = rs.getString("sinopse");
				
				// Cria o objeto Item com os dados encontrados
				item = new Item(id, titulo, autor, ano, genero, categoria, sinopse);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				Conexao.fecharConexao(conexao);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 6. Encaminha o item para a tela de exclusão, que agora exibirá os dados
		if (item != null) {
			// Encontrou o item: encaminha o objeto Item e a origem para a tela de exclusão (excluir.jsp)
			request.setAttribute("itemParaExcluir", item);
			request.setAttribute("origem", "carregarExclusao");
			RequestDispatcher dispatcher = request.getRequestDispatcher("excluir.jsp");
			dispatcher.forward(request, response);
		} else {
			// Não encontrou o item: Redireciona para a tela estilizada de "não encontrado"
			String mensagem = "Item nao encontrado com o ID fornecido.";
			String voltarPara = "excluir.jsp";
			
			response.sendRedirect("nao-encontrado.jsp?msg=" + mensagem + "&voltar=" + voltarPara);
		}
	}
}