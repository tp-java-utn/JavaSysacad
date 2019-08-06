package Servlets;


import Entidades.*;
import Logic.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.pept.transport.Connection;

import Data.DataAlumno;
import Data.FactoryConexion;

import javax.servlet.annotation.WebServlet;
/**
 * Servlet implementation class MiServlet
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

    private void response(HttpServletResponse resp, String msg)
			throws IOException {
		PrintWriter out = resp.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<t1>" + msg + "</t1>");
		out.println("</body>");
		out.println("</html>");
	}
    

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException {
			
		doPost(req, resp);
			

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String user = req.getParameter("user");
		String pass = req.getParameter("password");
		System.out.print(user +"/"+ pass);
		Usuario u = new Usuario();
		Alumno A = u.Validate(user, pass);
		
		if (A == null) {
			//response(resp, "invalid login");
		} else {
			req.getSession().setAttribute("usuario", A);
        	System.out.println(A.toString());
        	//resp.sendRedirect("MainPage");
        	req.getRequestDispatcher("WEB-INF/MainPage.jsp").forward(req, resp);
		}
	}

}
