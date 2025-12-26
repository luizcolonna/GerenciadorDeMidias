package br.com.catalogo.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/listar-todos")
public class ListarItensServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ListarItensServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> listaItens = new ArrayList<>();
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// 1. Obtém a conexão com o banco de dados
			conexao = Conexao.getConnection();
			
			// 2. Cria a instrução SQL para selecionar todos os itens
			String sql = "SELECT id, titulo, autor, ano, genero, categoria, sinopse FROM itens";
			
			stmt = conexao.prepareStatement(sql);
			
			// 3. Executa a busca no banco e armazena o resultado
			rs = stmt.executeQuery();
			
			// 4. Percorre o resultado e cria objetos Item
			while (rs.next()) {
				// Os IDs das colunas na tabela começam com 1.
				int id = rs.getInt("id");
				String titulo = rs.getString("titulo");
				String autor = rs.getString("autor");
				int ano = rs.getInt("ano");
				String genero = rs.getString("genero");
				String categoria = rs.getString("categoria");
				String sinopse = rs.getString("sinopse");
				
				// Cria um novo objeto Item com os dados do banco
				Item item = new Item(id, titulo, autor, ano, genero, categoria, sinopse);
				listaItens.add(item);
			}

		} catch (Exception e) {
			// Em caso de erro, exibe a mensagem no console
			e.printStackTrace();
		} finally {
			// 5. Fecha as conexões com o banco de dados
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				Conexao.fecharConexao(conexao);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 6. Envia a lista para a página JSP
		request.setAttribute("listaItens", listaItens);
		RequestDispatcher dispatcher = request.getRequestDispatcher("listar.jsp");
		dispatcher.forward(request, response);
	}
}