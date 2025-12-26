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

@WebServlet("/buscar-por-titulo")
public class BuscarTituloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BuscarTituloServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Este Servlet usará o método doPost, então o doGet fica vazio
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Item> listaItens = new ArrayList<>();
		
		// 1. Recebe o título do formulário
		String titulo = request.getParameter("titulo");
		
		Connection conexao = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			// 2. Obtém a conexão com o banco de dados
			conexao = Conexao.getConnection();
			
			// 3. Cria a instrução SQL para buscar itens por título (busca exata)
			String sql = "SELECT id, titulo, autor, ano, genero, categoria, sinopse FROM itens WHERE titulo = ? ORDER BY id ASC";
			
			stmt = conexao.prepareStatement(sql);
			stmt.setString(1, titulo);
			
			// 4. Executa a busca e armazena o resultado
			rs = stmt.executeQuery();
			
			// 5. Percorre o resultado e cria objetos Item
			while (rs.next()) {
				int id = rs.getInt("id");
				String tituloEncontrado = rs.getString("titulo");
				String autor = rs.getString("autor");
				int ano = rs.getInt("ano");
				String genero = rs.getString("genero");
				String categoria = rs.getString("categoria");
				String sinopse = rs.getString("sinopse");
				
				Item item = new Item(id, tituloEncontrado, autor, ano, genero, categoria, sinopse);
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
			String mensagem = "Nenhuma obra encontrada com esse titulo.";
			String voltarPara = "buscar-titulo.jsp";
			
			response.sendRedirect("nao-encontrado.jsp?msg=" + mensagem + "&voltar=" + voltarPara);
		} else {
			// Se encontrou, envia a lista e a variável de controle para a página JSP
			request.setAttribute("listaItens", listaItens);
			request.setAttribute("origem", "buscarTitulo");
			RequestDispatcher dispatcher = request.getRequestDispatcher("listar.jsp");
			dispatcher.forward(request, response);
		}
	}
}