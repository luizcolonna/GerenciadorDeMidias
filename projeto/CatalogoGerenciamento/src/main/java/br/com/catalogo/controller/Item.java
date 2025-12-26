package br.com.catalogo.controller;

public class Item {
    
	private int id; // Novo campo para o ID
    private String titulo;
    private String autor;
    private int ano;
    private String genero;
    private String categoria;
    private String sinopse;

    // Construtor
    public Item(int id,String titulo, String autor, int ano, String genero, String categoria, String sinopse) {
    	this.id = id;
        this.titulo = titulo;
        this.autor = autor;
        this.ano = ano;
        this.genero = genero;
        this.categoria = categoria;
        this.sinopse = sinopse;
    }
    
 // Construtor para a criação de novos itens (sem ID, pois o banco gera)
    public Item(String titulo, String autor, int ano, String genero, String categoria, String sinopse) {
        this.titulo = titulo;
        this.autor = autor;
        this.ano = ano;
        this.genero = genero;
        this.categoria = categoria;
        this.sinopse = sinopse;
    }

    // Métodos Getters (para acessar os valores das propriedades)
    
    public int getId() {
        return id;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public String getAutor() {
        return autor;
    }

    public int getAno() {
        return ano;
    }

    public String getGenero() {
        return genero;
    }

    public String getCategoria() {
        return categoria;
    }

    public String getSinopse() {
        return sinopse;
    }
}