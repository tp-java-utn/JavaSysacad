<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<%@page import="Entidades.Alumno"%>
	<% 
    	Alumno A= (Alumno)session.getAttribute("usuario");
    %>
    
    
    <link href="Styles/navbar-top-fixed.css" rel="stylesheet">
    	
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		
		<a class="navbar-brand" href="/">UTN sysacad</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>

		
		<ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
		    <li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><Strong><%=A.getNombre()+" "+A.getApellido()%></Strong></a>
			    <div class="dropdown-menu">
			      <a class="dropdown-item" href="#">Action</a>
			      <a class="dropdown-item" href="#">Another action</a>
			      <a class="dropdown-item" href="#">Something else here</a>
			      <div class="dropdown-divider"></div>
			      <a class="dropdown-item" href="#">Separated link</a>
			    </div>
		    </li>
		</ul>
		    


		
		
		

		
	</nav>

