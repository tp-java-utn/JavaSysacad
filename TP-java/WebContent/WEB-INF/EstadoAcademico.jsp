<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="Data.*"%>
<%@page import="Entidades.Alumno"%>
<%@page import="Entidades.EstadoAcademico"%>
<%@page import="Entidades.Materia"%>
<%@page import="Entidades.EstadoAcademico.*"%>
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
			    <tr id="encabezado" align="center">
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
					<td align="center"><strong><%=M.getIdMateria()%></strong></td>
			        <td><%=M.getNombre()%></td>
			        <% for (EstadoAcademico EAS:EstadosAcademicos) {%>
			        	<%if(EAS.getIdMateria()==M.getIdMateria()){%>
			        	<td align="center"><%=EAS.getAsistencia()%>%</td>
			        	<td align="center"><%=EAS.getNota()%>/10</td>
			        	
			        	<td align="justify">
			        		<%if(EAS.getEstado().equals(estadosMateria.Cursando.toString())){%>
				        	<svg width="10" height="12">
						    	<circle cx="5" cy="5" r="5"  fill="#428bca" />
						    </svg>
						    <%}else if(EAS.getEstado().equals(estadosMateria.Libre.toString())){%>
						    <svg width="10" height="12">
						    	<circle cx="5" cy="5" r="5"  fill="#d9534f" />
						    </svg>
						    <%}else if(EAS.getEstado().equals(estadosMateria.Aprobada.toString())){%>
						    <svg width="10" height="12">
						    	<circle cx="5" cy="5" r="5"  fill="#5cb85c" />
						    </svg>
						    <%}else{%>
						    <svg width="10" height="12">
						    	<circle cx="5" cy="5" r="5"  fill="#5bc0de" />
						    </svg>
						    <%}%>
						    
			        	<%=EAS.getEstado()%>
			        	</td>
			        	
			        	<%}%>
			        <%}%>

			    </tr>
			  <%} %>
			  </tbody>
		</table>      
	</div>
	

	<div class="row justify-content-center">
		<div class="col-3">
	    	<a class="btn btn-primary btn-lg btn-block" href="MainPage?action=volver">Volver al Menu</a>
	    </div>
    </div>
		
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>