package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Data.DataAlumno;
import Data.DataDocente;
import Entidades.Persona.EstadosPersona;

/**
 * Servlet implementation class MainPageAdm
 */
@WebServlet("/MainPageAdmDocentes")
public class MainPageAdmDocentes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageAdmDocentes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String acceso = "";
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("Eliminar"))
		{
			DataDocente DD = new DataDocente();
			String idDocente = request.getParameter("id");
			DD.delete(Integer.valueOf(idDocente));	
			request.getRequestDispatcher("WEB-INF/ADM/MainPageAdmEliminados.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Recuperar"))
		{
			DataDocente DD = new DataDocente();
			String idDocente = request.getParameter("id");
			DD.setEstate(Integer.valueOf(idDocente),EstadosPersona.Activo);	
			request.getRequestDispatcher("WEB-INF/ADM/MainPageAdmDocentes.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Editar"))
		{
			DataAlumno DA = new DataAlumno();
			String legajo = request.getParameter("id");
			request.getSession().setAttribute("Alumno",DA.getOne(legajo));
			request.getRequestDispatcher("WEB-INF/ADM/MainPageAdmAlumnoEdit.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
