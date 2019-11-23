package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Data.DataAlumno;
import Entidades.Persona.EstadosPersona;

/**
 * Servlet implementation class MainPageAdm
 */
@WebServlet("/MainPageAdm")
public class MainPageAdm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainPageAdm() {
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
			DataAlumno DA = new DataAlumno();
			String legajo = request.getParameter("id");
			DA.delete(legajo);
			request.getRequestDispatcher("/MainPageAdm.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Activar"))
		{
			DataAlumno DA = new DataAlumno();
			String legajo = request.getParameter("id");
			DA.setEstate(legajo,EstadosPersona.Activo);
			request.getRequestDispatcher("/MainPageAdm.jsp").forward(request, response);
		}
		else if(action.equalsIgnoreCase("Recuperar"))
		{
			DataAlumno DA = new DataAlumno();
			String legajo = request.getParameter("id");
			DA.setEstate(legajo,EstadosPersona.Pendiente);
			request.getRequestDispatcher("/MainPageAdm.jsp").forward(request, response);
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
