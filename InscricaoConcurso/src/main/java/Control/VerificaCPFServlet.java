package Control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.Candidato;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class VerificaCPFServlet extends HttpServlet {
    private static final String URL = "jdbc:mysql://localhost:3306/candidatos_concurso";
    private static final String USER = "root";
    private static final String PASSWORD = "12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro no driver JDBC.");
            return;
        }

        String cpf = request.getParameter("cpf");
        String mensagem;

    
        if (cpf == null || cpf.isEmpty()) {
            mensagem = "CPF não pode ser vazio.";
            request.setAttribute("mensagem", mensagem);
            request.getRequestDispatcher("resultadoBusca.jsp").forward(request, response);
            return;
        }

      
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            String sql = "SELECT nome, sexo, escolaridade FROM candidatos WHERE cpf = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, cpf);
                try (ResultSet resultSet = statement.executeQuery()) {
                    if (resultSet.next()) {
                   
                        String nome = resultSet.getString("nome");
                        String sexo = resultSet.getString("sexo");
                        String escolaridade = resultSet.getString("escolaridade");

                      
                        Candidato candidato = new Candidato(cpf, nome, sexo, escolaridade);
                        request.setAttribute("candidato", candidato);

                
                        request.getRequestDispatcher("CandidatoInfo.jsp").forward(request, response);
                    } else {
                 
                        mensagem = "CPF não encontrado.";
                        request.setAttribute("mensagem", mensagem);
                        request.getRequestDispatcher("PaginaDeErro.jsp").forward(request, response);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erro na consulta ao banco de dados.");
        }
    }
}

