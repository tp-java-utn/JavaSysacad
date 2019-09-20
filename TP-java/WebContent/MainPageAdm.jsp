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
	    
    	DataAlumno DA = new DataAlumno();
		ArrayList<Alumno> Alumnos = DA.getAll();
    %>

</head>
	


<body>
	<div id="header"></div>
	
	<div class="container-fliud">
		<div class="row">
			<nav class="col-sm-3 col-md-2 hidden-xs-down bg-faded sidebar">
	          <ul class="nav nav-pills flex-column">
	            <li class="nav-item">
	              <a class="nav-link active" href="#">Alumnos <span class="sr-only">(current)</span></a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">Materias</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">Docentes</a>
	            </li>
	            <li class="nav-item">
	              <a class="nav-link" href="#">Comisiones</a>
	            </li>
	          </ul>
	        </nav>
	        
	        <div class="col-md-9 col-md-10 pt-3">
	           offset-md-2 
	        <h2>Alumnos</h2>
	        
		        <div class="table-responsive">
				<table class="table table-hover table-striped tableFixHead">
				  <colgroup span="3"></colgroup>
				  <thead>
				    <tr id="encabezado">
				      	<th scope="col"><p>LEGAJO</p></th>
				      	<th scope="col"><p>NOMBRE</p></th>
				      	<th scope="col"><p>APELLIDO</p></th>
				      	<th scope="col"><p>TELEFONO</p></th>
				      	<th scope="col"><p>EMAIL</p></th>
				      	<th scope="col"><p>ESTADO</p></th>
				    </tr>
				  </thead>
				  
		
				  
				  <tbody>
				  <% for (Alumno AS:Alumnos) {%>
				    <tr id="row">
				      <th scope="row"><%=AS.getLegajo()%></th>
				      <td><%=AS.getNombre()%></td>
				      <td><%=AS.getApellido()%></td>
				      <td><%=AS.getTelefono()%></td>
				      <td><%=AS.getEmail()%></td>
				      <td>
				      <select id="inputState" class="form-control" style="width:50%">
					      <option selected><%=AS.getEstadoPersona()%></option>
					      <option>...</option>
				      </select>
				      </td>
				
				    </tr>
				    
				  <%}%>
				  </tbody>
				</table>   
		        	
		        </div>
			</div>
		</div>
	</div>

   
	
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>