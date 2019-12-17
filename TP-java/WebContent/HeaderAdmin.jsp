<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

	<%@page import="Entidades.*"%>
	<% 
		Administrador A= (Administrador)session.getAttribute("usuario");
    %>
    
    
    
    <link href="Styles/navbar-top-fixed.css" rel="stylesheet">
    <form class = "form-signin" action="Header" method="post" style="margin-bottom: 0px;">	
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark" >
		
		<a class="navbar-brand" href="Header?action=Main" >
			<img class="d-inline-block align-top" src="pngs/loginADM.png" height="30" width="30" alt="">
			UTN sysacad
		</a>
		
		<% if(A.getLegajo()!=null){%>
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
				      <a href="Login.jsp" class="nav-link" href="Header?action=Close">Cerrar Sesion</a>
				    </li>
				</ul>
			</div>
		</div>
  		<%}else{%>
  		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse flex-sm-column" id="navbarCollapse" style="line-height: 10%;">
			<div class="input-group">
				<ul class="navbar-nav ml-auto small">
					<li class="nav-item active">
				      <a href="LoginAdmin.jsp" class="nav-link" type = "submit">Iniciar sesion</a>
				    </li>
				</ul>
			</div>
		</div>
  		<%} %>
	
	</nav>
	</form>



