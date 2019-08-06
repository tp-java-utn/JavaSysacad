package Servlets;


import Entidades.*;
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
@WebServlet("/NewAlumno")
public class NewAlumno extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public NewAlumno() {
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
			String nombre = req.getParameter("nombre");
			String apellido = req.getParameter("apellido");
			String contraseña = req.getParameter("contraseña");
			String email = req.getParameter("email");
			String telefono = req.getParameter("telefono");
			String legajo = req.getParameter("legajo");
			String direccion = req.getParameter("direccion");
			String numero = req.getParameter("numero");
			String piso = req.getParameter("piso");
			String departamento = req.getParameter("departamento");
			int nro = Integer.parseInt(numero);		
			
			//System.out.println(piso+"/"+departamento);
			Alumno A = new Alumno(nombre,apellido,email,contraseña,telefono,legajo,direccion,nro);
			
			if(piso != "" && departamento != "")
			{
				int p = Integer.parseInt(piso);
				Direccion D = new Direccion(direccion,nro,p,departamento);
				A.setDireccion(D);
			}
				
			if ("yo".equals(contraseña)) {
				response(resp, "login ok");
				System.out.print(A.toString());
			} else {
				response(resp, "invalid login");
			}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}