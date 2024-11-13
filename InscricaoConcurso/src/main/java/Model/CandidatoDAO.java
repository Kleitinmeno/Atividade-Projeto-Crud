package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CandidatoDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/candidatos_concurso";
    private String jdbcUsername = "root";  
    private String jdbcPassword = "12345";

    private static final String INSERT_CANDIDATO_SQL = "INSERT INTO candidatos(nome, cpf, sexo, escolaridade) VALUES (?, ?, ?, ?)";
    private static final String UPDATE_CANDIDATO_SQL = "UPDATE candidatos SET nome = ?, sexo = ?, escolaridade = ? WHERE cpf = ?";
    private static final String DELETE_CANDIDATO_SQL = "DELETE FROM candidatos WHERE cpf = ?";

    // Conexão com o banco de dados
    protected Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }
    
    //Método para a inserção de um novo candidato
    public void insertCandidato(Candidato candidato) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CANDIDATO_SQL)) {

            preparedStatement.setString(1, candidato.getNome());
            preparedStatement.setString(2, candidato.getCpf());
            preparedStatement.setString(3, candidato.getSexo());
            preparedStatement.setString(4, candidato.getEscolaridade());

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Tudo certo");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  
    //Método para atualização dos dados do candidato
    public boolean atualizarCandidato(String cpf, String nome, String sexo, String escolaridade) {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_CANDIDATO_SQL)) {

            preparedStatement.setString(1, nome);
            preparedStatement.setString(2, sexo);
            preparedStatement.setString(3, escolaridade);
            preparedStatement.setString(4, cpf);

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0; 

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    //Método para exclusão de um candidato
    public boolean excluirCandidato(String cpf) {
    	try(Connection connection = getConnection();
    			PreparedStatement preparedStatement = connection.prepareStatement(DELETE_CANDIDATO_SQL)){
    		
    		preparedStatement.setString(1, cpf);
    		int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0; 
    		
    	}catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}

