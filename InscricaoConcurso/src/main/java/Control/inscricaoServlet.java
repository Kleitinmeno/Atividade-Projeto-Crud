package Control;

import Model.Candidato;
import Model.CandidatoDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.io.IOException;
import java.sql.SQLException;


public class inscricaoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private CandidatoDAO candidatoDAO;
    public void init() {
        candidatoDAO = new CandidatoDAO();
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpf = request.getParameter("cpf"); 
        Candidato candidato = null;

        try {
   
            String url = "jdbc:mysql://localhost:3306/candidatos_concurso";
            String usuario = "root";
            String senha = "12345";
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            }

            Connection conexao = DriverManager.getConnection(url, usuario, senha);
            String sql = "SELECT * FROM candidatos WHERE cpf = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, cpf); 
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                candidato = new Candidato();
                candidato.setNome(rs.getString("nome"));
                candidato.setCpf(rs.getString("cpf"));
                candidato.setSexo(rs.getString("sexo"));
                candidato.setEscolaridade(rs.getString("escolaridade"));
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("candidato", candidato);
        request.getRequestDispatcher("CandidatoInfo.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	
        String nome = request.getParameter("nome");
        String cpf = request.getParameter("cpf");
        String sexo = request.getParameter("sexo");
        String escolaridade = request.getParameter("escolaridade");

        Candidato candidato = new Candidato(nome, cpf, sexo, escolaridade);
     
		candidatoDAO.insertCandidato(candidato);
	
        response.sendRedirect("InscricaoRealizada.jsp");
    }
}