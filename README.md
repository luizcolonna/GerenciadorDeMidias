# 📚 Sistema de Gerenciamento de Catálogo de Mídias (TCC)

Este projeto é um Sistema Web para gerenciamento de catálogos de obras (livros, filmes, séries), desenvolvido como projeto de conclusão para a disciplina de Desenvolvimento Web. A aplicação foca na implementação da arquitetura **MVC (Model-View-Controller)** utilizando tecnologias nativas da plataforma Java EE.

---

## 📸 Visualização do Projeto

Aqui estão algumas prévias das principais funcionalidades do sistema em execução:

### Tela Inicial
*(Exibe todas as operações disponíveis do sistema)*

<img width="1917" height="888" alt="image" src="https://github.com/user-attachments/assets/d5f50f49-ff5c-42b7-958b-1c99294e2e69" />


### Tela de Cadastro
*(Formulário para inserção de novas obras)*

<img width="1919" height="915" alt="image" src="https://github.com/user-attachments/assets/7e1840ad-fd9a-4b22-a6f2-46e3b799ecce" />

---

## 🚀 Funcionalidades (CRUD)

O sistema permite a gestão completa do ciclo de vida dos dados:
- **Cadastrar:** Inserção de novas mídias com título, autor, ano, gênero, categoria e sinopse.
- **Listar:** Visualização de todos os itens cadastrados em uma tabela organizada.
- **Buscar:** Consultas refinadas por Título, Autor, Gênero ou ID.
- **Alterar:** Edição de informações de registros existentes.
- **Excluir:** Remoção de mídias do catálogo com confirmação.

---

## 🛠️ Tecnologias Utilizadas

As seguintes ferramentas e tecnologias foram empregadas no desenvolvimento:

* **Linguagem:** Java 8+
* **Web:** Servlets e JSP (JavaServer Pages)
* **Persistência:** JDBC (Java Database Connectivity)
* **Banco de Dados:** MySQL 8.0
* **Servidor de Aplicação:** Apache Tomcat 9.0+
* **IDE:** Eclipse IDE for Enterprise Java Developers
* **Estilização:** CSS3 e HTML5

---

## 🏗️ Arquitetura do Projeto

A aplicação segue o padrão **MVC**, garantindo a separação de responsabilidades:

- **Model:** Classes Java (POJOs) representando a entidade `Item` e a classe `Conexao` para gestão do JDBC.
- **View:** Páginas JSP que geram a interface dinâmica para o usuário.
- **Controller:** Servlets que interceptam as requisições, processam a lógica de negócio e comunicam-se com o banco de dados.

---

## 🔒 Segurança

O sistema foi desenvolvido seguindo boas práticas de segurança para aplicações web:
- **Prevenção de SQL Injection:** Utilização sistemática de `PreparedStatement` em todas as consultas e comandos SQL.
- **Tratamento de Exceções:** Fluxos de erro controlados para evitar exposição de *stack traces* ao usuário final.
- **Validação de Tipos:** Conversão segura de parâmetros de requisição no lado do servidor.

---

## ⚙️ Como Executar o Projeto

1.  **Pré-requisitos:**
    * Java JDK instalado.
    * Apache Tomcat configurado.
    * MySQL Server em execução.

2.  **Configuração do Banco de Dados:**
    Execute o script SQL abaixo no seu MySQL:
    ```sql
    CREATE DATABASE catalogo_midias;
    USE catalogo_midias;

    CREATE TABLE itens (
        id INT AUTO_INCREMENT PRIMARY KEY,
        titulo VARCHAR(255) NOT NULL,
        autor VARCHAR(255) NOT NULL,
        ano INT NOT NULL,
        genero VARCHAR(100),
        categoria VARCHAR(100),
        sinopse TEXT
    );
    ```

3.  **Configuração da Conexão:**
    * No projeto, localize a classe `Conexao.java`.
    * Ajuste as constantes `USER` e `PASS` com suas credenciais do MySQL.

4.  **Deployment:**
    * Importe o projeto no Eclipse como "Existing Projects into Workspace".
    * Clique com o botão direito no projeto > **Run As** > **Run on Server**.
    * Selecione o Apache Tomcat e finalize.

---

## 📂 Estrutura de Pastas Principal

```text
src/
 └── main/
      ├── java/            # Servlets e classes de modelo (Lógica)
      └── webapp/          # Arquivos JSP e CSS (Interface)
           └── WEB-INF/    # Arquivos de configuração e bibliotecas (lib)

```

---

## 📝 Autor
Desenvolvido por Luiz Colonna.
