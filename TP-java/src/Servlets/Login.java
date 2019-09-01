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
    

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
		throws ServletException, IOException {
			
		doPost(req, resp);
			

	}


	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int minpass=3;
		int maxpass=10;
		int minuser=5;
		int maxuser=10;
		String user = req.getParameter("user");
		String pass = req.getParameter("password");
		String errorUser = "";
		String errorPass = "";
		ErrorManager em1 = new ErrorManager("El legajo",5,10);
		ErrorManager em2 = new ErrorManager("La contraseña",3,10);
		
		Validator v = new Validator();
		if(v.stringOk(user, minuser, maxuser) && v.stringOk(pass, minpass, maxpass)) {
			Usuario u = new Usuario();
			Alumno A = u.Validate(user, pass);
			
			if (A.getLegajo() == null) {
				ErrorManager em = new ErrorManager("El legajo y/o contraseña son incorrectos.");
				errorPass = em.specificError();
				req.setAttribute("errorPass",errorPass);
				req.getRequestDispatcher("/Login.jsp").forward(req, resp);
			} else {
				req.getSession().setAttribute("usuario", A);
				System.out.println("[Login]Legajo: "+user +"/Contraseña: "+ pass);
				System.out.println(A.toString());
	        	req.getRequestDispatcher("WEB-INF/MainPage.jsp").forward(req, resp);
			}
		}
		else if(!v.stringOk(user, minuser, maxuser) && !v.stringOk(pass, minpass, maxpass))
		{
			errorUser = em1.error();
			errorPass = em2.error();
			req.setAttribute("errorUser",errorUser);
			req.setAttribute("errorPass",errorPass);
			req.getRequestDispatcher("/Login.jsp").forward(req, resp);
		}
		else if(!v.stringOk(user, minuser, maxuser))
		{
			errorUser = em1.error();
			req.setAttribute("errorUser",errorUser);
			req.getRequestDispatcher("/Login.jsp").forward(req, resp);
		}
		else if(!v.stringOk(pass, minpass, maxpass))
		{
			errorPass = em2.error();
			req.setAttribute("errorPass",errorPass);
			req.getRequestDispatcher("/Login.jsp").forward(req, resp);
		}
		else
		{
			req.getRequestDispatcher("/Login.jsp").forward(req, resp);
		}

	}

}
