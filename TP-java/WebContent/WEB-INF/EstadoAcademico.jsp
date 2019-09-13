<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="Data.*"%>
<%@page import="Entidades.Alumno"%>
<%@page import="Entidades.EstadoAcademico"%>
<%@page import="Entidades.Materia"%>
<html>
<head>


<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>Estado Academico - UTN</title>
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
      
      #row:hover{
    	background-color: #e0e0e0;
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
	
    	DataEstadoAcademico DEA = new DataEstadoAcademico();
    	ArrayList<EstadoAcademico> EstadosAcademicos = A.getEstadosAcedemicos(DEA.getAll());
    %>

</head>
	


<body>
	<div id="header"></div>
	
	<div class="container">
	  	<div class="py-5 text-center">
	       	<h1 class="text-primary"><strong>Estado Academico</strong></h1>
	  	</div>
	</div>

	<div class="table-responsive">
		<table class="table table-striped table-hover tableFixHead">
			  <colgroup span="3"></colgroup>
			  <thead>
			    <tr id="encabezado">
			      	<th scope="col"><p>ID</p></th>
			      	<th scope="col"><p>MATERIA</p></th>
			      	<th scope="col"><p>ASISTENCIA</p></th>
			      	<th scope="col"><p>NOTA</p></th>
			      	<th scope="col"><p>ESTADO</p></th>
			    </tr>
			  </thead>
			  
	
			  
			  <tbody>
			  <% for (Materia M:Materias) {%>
			    <tr id="row">
					<th scope="row"><%=M.getIdMateria()%></th>
			        <td><%=M.getNombre()%></td>
			        <% for (EstadoAcademico EAS:EstadosAcademicos) {%>
			        	<%if(EAS.getIdMateria()==M.getIdMateria()){%>
			        	<td><%=EAS.getAsistencia()%>%</td>
			        	<td><%=EAS.getNota()%>/10</td>
			        	<td><%=EAS.getEstado()%></td>
			        	<%}%>
			        <%}%>

			    </tr>
			  <%} %>
			  </tbody>
		</table>      
	</div>
	

		
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>