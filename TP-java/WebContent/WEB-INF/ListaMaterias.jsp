<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.*"%>
<%@page import="Data.*"%>
<html>
<head>


<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Inicio - UTN</title>
	<link rel="shortcut icon" type="image/png" href="pngs/login.png">

    <!-- Bootstrap core CSS -->
	<link href="Styles/bootstrap.min.css" rel="stylesheet">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
      
	<link href="Styles/NewAlumno.css" rel="stylesheet">
	
	<!-- Script para el Header -->
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
	<script> 
	$(function(){
	  $("#header").load("Header.jsp");
	  $("#footer").load("Footer.jsp"); 
	});
	</script>
	

    <% 
    	Alumno A= (Alumno)session.getAttribute("usuario");
    	DataMateria DM = new DataMateria();
    	ArrayList<Materia> Materias = DM.getAll();
    %>

</head>
	


<body>
	<div id="header"></div>
	
	<div class="container">
	  	<div class="py-5 text-center">
	       	<h1 class="text-primary">Inscripcion Materias</h1>
	  	</div>
	</div>
	
	<div class="table-responsive">
		<table class="table table-striped table-hover">
		  <colgroup span="3"></colgroup>
		  <thead>
		    <tr>
		      	<th scope="col"><p>ID</p></th>
		      	<th scope="col"><p>AÑO</p></th>
		      	<th colspan="3" scope="col">
		      		<p align="center">CORRELATIVAS</p>
		      	</th>
		      	<th scope="col"><p>MATERIA</p></th>
		      	<th scope="col"><p>CURSADO</p></th>
		      	<th scope="col"><p>ACCIONES</p></th>
		    </tr>
		  </thead>
		  
		  <thead>
		    <tr>
		    	<th scope="col"></th>
		    	<th scope="col"></th>
		    	<th scope="col"><p align="center">REGULARES</p></th>
		    	<th scope="col"><p align="center">APROBADAS</p></th>
		    	<th scope="col"><p align="center">RENDIR</p></th>
		    	<th scope="col"></th>
		    	<th scope="col"></th>
		    	<th scope="col"></th>
		    </tr>
		  </thead>
		  
		  <tbody>
		  <% for (Materia MS:Materias) {%>
		    <tr>
		      <th scope="row"><%=MS.getIdMateria()%></th>
		      <td><%=MS.getAño()%></td>
		      
		      <% if(MS.getCorrelativasRegulares()!=null) {%>
		      <td> <p align="center"><%=MS.getCorrelativasRegulares()%></p></td>
		      <%}else{ %>
		      <td> <p align="center">-</p></td>
		      <%}%>
		      
		      <% if(MS.getCorrelativasAprobadas()!=null) {%>
		      <td> <p align="center"><%=MS.getCorrelativasAprobadas()%></p></td>
		      <%}else{ %>
		      <td> <p align="center">-</p></td>
		      <%}%>
		      
		      <% if(MS.getCorrelativasRendir()!=null) {%>
		      <td> <p align="center"><%=MS.getCorrelativasRendir()%></p></td>
		      <%}else{ %>
		      <td> <p align="center">-</p></td>
		      <%}%>
		      
		      <td><%=MS.getNombre()%></td>
		      <td><%=MS.getcursado()%></td>
		      <td>
			      <button type="button" class="btn btn-primary">Inscribirse<i class="far fa-eye"></i></button>
		      </td>
		    </tr>
		  <%} %>
		  </tbody>
		</table>
	</div>
	
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>