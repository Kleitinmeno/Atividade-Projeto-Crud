package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.CandidatoDAO;
import Model.Candidato;

/**
 * Servlet implementation class AtualizarCandidatoServlet
 */
public class AtualizarCandidatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cpf = request.getParameter("cpf");
        String nome = request.getParameter("nome");
        String sexo = request.getParameter("sexo");
        String escolaridade = request.getParameter("escolaridade");
        
       
        CandidatoDAO candidatoDAO = new CandidatoDAO();
        boolean atualizado = candidatoDAO.atualizarCandidato(cpf, nome, sexo, escolaridade);

        if (atualizado) {
            response.sendRedirect("InscricaoRealizada.jsp");
        } else {
            response.sendRedirect("PaginaDeErro.jsp");
        }
    }

}
