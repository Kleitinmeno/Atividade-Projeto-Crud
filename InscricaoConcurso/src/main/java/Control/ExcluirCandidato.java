package Control;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import Model.CandidatoDAO;

/**
 * Servlet implementation class ExcluirCandidato
 */
public class ExcluirCandidato extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cpf = request.getParameter("cpf");
		
		CandidatoDAO candidatoDAO = new CandidatoDAO();
		boolean excluir = candidatoDAO.excluirCandidato(cpf);
		
		if(excluir){
			response.sendRedirect("Concurso.jsp");
		}else {
			response.sendRedirect("PaginaDeErro.jsp");
		}
	}

}
