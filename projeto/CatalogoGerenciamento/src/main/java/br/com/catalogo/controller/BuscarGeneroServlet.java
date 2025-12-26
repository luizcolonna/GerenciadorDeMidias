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

@WebServlet("/buscar-por-genero")
public class BuscarGeneroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarGeneroServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Este Servlet usará o método doPost, então o doGet fica vazio
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> listaItens = new ArrayList<>();
		
		// 1. Recebe o gênero do formulário (vindo do campo <select>)
		String genero = request.getParameter("genero");
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// 2. Obtém a conexão com o banco de dados
			conexao = Conexao.getConnection();
			
			// 3. Cria a instrução SQL para buscar itens por gênero (busca exata)
			String sql = "SELECT id, titulo, autor, ano, genero, categoria, sinopse FROM itens WHERE genero = ? ORDER BY id ASC";
			
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, genero);
			
			// 4. Executa a busca e armazena o resultado
			rs = stmt.executeQuery();
			
			// 5. Percorre o resultado e cria objetos Item
			while (rs.next()) {
				int id = rs.getInt("id");
				String titulo = rs.getString("titulo");
				String autor = rs.getString("autor");
				int ano = rs.getInt("ano");
				String generoEncontrado = rs.getString("genero");
				String categoria = rs.getString("categoria");
				String sinopse = rs.getString("sinopse");
				
				Item item = new Item(id, titulo, autor, ano, generoEncontrado, categoria, sinopse);
				listaItens.add(item);
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

		// 6. Verifica se algum item foi encontrado
		if (listaItens.isEmpty()) {
			// Redireciona para a tela estilizada de "não encontrado"
			String mensagem = "Nenhuma obra encontrada com esse genero.";
			String voltarPara = "buscar-genero.jsp";
			
			// Passa a mensagem de erro e o endereço de retorno como parâmetros
			response.sendRedirect("nao-encontrado.jsp?msg=" + mensagem + "&voltar=" + voltarPara);
		} else {
			// Se encontrou, envia a lista e a variável de controle para a página JSP
			request.setAttribute("listaItens", listaItens);
			request.setAttribute("origem", "buscarGenero");
			RequestDispatcher dispatcher = request.getRequestDispatcher("listar.jsp");
			dispatcher.forward(request, response);
		}
	}
}