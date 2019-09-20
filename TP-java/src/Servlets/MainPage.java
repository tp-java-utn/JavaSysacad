package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Entidades.Alumno;
import Logic.Usuario;

/**
 * Servlet implementation class MainPage
 */
@WebServlet("/MainPage")
public class MainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPage() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
				
		String op = null;
		
		if(req.getParameter("BtnExamen")!=null)
		{
			op = "Examen";
		}
		else if(req.getParameter("BtnMateria")!=null)
		{
			op = "Materia";
		}
		else if(req.getParameter("BtnEstadoAcademico")!=null)
		{
			op = "EstadoAcademico";
		}
		
		switch(op) 
		{
			case "Examen":
				req.getRequestDispatcher("WEB-INF/NewAlumno.html").forward(req, resp);
			break;
			
			case "Materia":
				req.getRequestDispatcher("WEB-INF/InscripcionComision.jsp").forward(req, resp);
			break;
			
			case "EstadoAcademico":
				req.getRequestDispatcher("WEB-INF/EstadoAcademico.jsp").forward(req, resp);
			break;
			
			default:
		
		}
				

		}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}

}
