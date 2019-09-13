package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Header
 */
@WebServlet("/Header")
public class Header extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Header() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String op = null;
		
		if(req.getParameter("BtnHome")!=null)
		{
			op = "Home";
		}
		else if(req.getParameter("Value")!=null)
		{
			op = "Close";
		}

		
		switch(op) 
		{
			case "Home":
				req.getRequestDispatcher("WEB-INF/MainPage.jsp").forward(req, resp);
			break;
			
			case "Close":
				HttpSession session = req.getSession();
				session.invalidate();
				req.getRequestDispatcher("Login.jsp").forward(req, resp);
			break;
		
		}
	}

}
