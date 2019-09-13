<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.Alumno"%>
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
    %>

</head>
	


<body>
	<div id="header"></div>

		

		  	<div  class="jumbotron">
			  	<div class="py-5 text-center">
		        	<img class="d-block mx-auto mb-4" src="pngs/utn.png" alt="" width="200" height="200">
		        	<h1>UTN FRRO</h1>
			  	</div>
			  	
			  	<div class="container">
			  		<p class="lead"> 	Bienvenido <Strong><%=A.getNombre()+" "+A.getApellido()%></Strong>, aqui podras realizar todas las acciones basicas relacionadas con la facunltad 
					como lo pueden ser la inscripcion a materias, ver tu estado acadamico, notas de parciales/finales, entrar a una comision y mucho mas.</p>
			  	</div>
			</div>
			
		 <div class="container">	
	     <form class="needs-validation" action="MainPage" method="get">
	        <div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		        <div class="col p-4 d-flex flex-column position-static">
		          <h1><strong class="d-inline-block mb-2 text-primary">Incribirte a un Examen</strong></h1>
		          <p class="card-text mb-auto">Consideraciones a tener en cuenta, para poder
		          anotarte en un examen deberas cumplir con las correlatividades necesarias, poseer el 
		          estado de regularidad en la misma y incribirte 24hs habiles antes del examen.</p>
		          <button type = "submit" name="BtnExamen" value = "Examen" class="btn btn-primary my-2" style="display:block;width:200px">Ingresar</button>
		        </div>
		        
		        <div class="col-auto d-none d-lg-block">
		        	<img class="d-block mx-auto mb-4" src="pngs/newExam.png" alt="" width="200" height="200">
	      		</div>
			</div>
		
			
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		        <div class="col p-4 d-flex flex-column position-static">
		          <h1><strong class="d-inline-block mb-2 text-primary">Incribirte a una Materia</strong></h1>
		          <p class="card-text mb-auto">Consideraciones a tener en cuenta, para poder
		          anotarte en una materia deberas cumplir con sus correlativas (regulares y aprobadas) y hacerlo
		          en el periodo de inscripcion de las mismas.</p>
		          <button type = "submit" name="BtnMateria" value = "Materia" class="btn btn-primary my-2" style="display:block;width:200px">Ingresar</button>
		        </div>
		        
		        <div class="col-auto d-none d-lg-block">
		        	<img class="d-block mx-auto mb-4" src="pngs/newMateria.png" alt="" width="200" height="200">
	      		</div>
			</div>
			
			<div class="row no-gutters border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
		        <div class="col p-4 d-flex flex-column position-static">
		          <h1><strong class="d-inline-block mb-2 text-primary">Estado Academico</strong></h1>
		          <p class="card-text mb-auto">Aqui podras ver tu estado academico, es el espacio donde se subiran las notas de los 
		          parciales/ finales, y el estado de tus materias, ya sea libre/cursando/regular/aprobada.</p>
		          <button type = "submit" name="BtnEstadoAcademico" value = "EstadoAcademico" class="btn btn-primary my-2" style="display:block;width:200px">Ingresar</button>
		        </div>
		        
		        <div class="col-auto d-none d-lg-block">
		        	<img class="d-block mx-auto mb-4" src="pngs/estadoAcademico.png" alt="" width="200" height="200">
	      		</div>
			</div>
		</form>
			
		</div>
		<hr class="mb-4">
		<div id="footer"></div>
</body>
</html>