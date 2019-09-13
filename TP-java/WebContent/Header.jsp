<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<%@page import="Entidades.Alumno"%>
	<% 
    	Alumno A= (Alumno)session.getAttribute("usuario");
    %>
    
    
    <link href="Styles/navbar-top-fixed.css" rel="stylesheet">
    <form class = "form-signin" action="Header" method="post">	
	<nav class="navbar navbar-expand-md navbar-dark fixed-top" style="background-color:  #072146 ;">
		
		<a class="navbar-brand" href="#" >
			<img class="d-inline-block align-top" src="pngs/login.png" height="30" width="30" alt="">
			UTN sysacad
		</a>
		
		
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse flex-sm-column" id="navbarCollapse" style="line-height: 10%;">
			<ul class="navbar-nav ml-auto">
			    <li class="nav-item active">
			      <a class="nav-item nav-link disabled" href="#"><Strong><%=A.getNombre()+" "+A.getApellido()%></Strong></a>
			    </li>		    
			</ul>
				<div class="input-group">
				<ul class="navbar-nav ml-auto small">
					<li class="nav-item active">
				      <a href="Login.jsp" class="nav-link" type = "submit">Cerrar Sesion</a>
				    </li>
				</ul>
			</div>
		</div>
  
	
	</nav>
	</form>



