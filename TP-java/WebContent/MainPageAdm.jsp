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
	
	<script>
    function choose(BtnName){
    	
    	var btn = document.getElementById(BtnName);
    	var title = document.getElementById("title");
    	btn.className = "nav-link active";
    	
    	switch (BtnName){
    		case "BtnMaterias":
    			document.getElementById("BtnAlumnos").classList.remove("active");
    			document.getElementById("BtnDocentes").classList.remove("active");
    			document.getElementById("BtnComisiones").classList.remove("active");
    			title.innerHTML = "Materias";
    		break;
    		
    		case "BtnAlumnos":
    			document.getElementById("BtnMaterias").classList.remove("active");
    			document.getElementById("BtnDocentes").classList.remove("active");
    			document.getElementById("BtnComisiones").classList.remove("active");
    			title.innerHTML = "Alumnos";
    		break;
    		
    		case "BtnDocentes":
    			document.getElementById("BtnAlumnos").classList.remove("active");
    			document.getElementById("BtnMaterias").classList.remove("active");
    			document.getElementById("BtnComisiones").classList.remove("active");
    			title.innerHTML = "Docentes";
        	break;
        		
    		case "BtnComisiones":
    			document.getElementById("BtnAlumnos").classList.remove("active");
    			document.getElementById("BtnDocentes").classList.remove("active");
    			document.getElementById("BtnMaterias").classList.remove("active");
    			title.innerHTML = "Comisiones";
        	break;
    	}
    	
    	
    }
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
	              <a id="BtnAlumnos" class="nav-link active" href="#" onClick="choose(this.id)">Alumnos <span class="sr-only">(current)</span></a>
	            </li>
	            <li class="nav-item">
	              <a id="BtnMaterias" class="nav-link" href="#" onClick="choose(this.id)">Materias</a>
	            </li>
	            <li class="nav-item">
	              <a id="BtnDocentes" class="nav-link" href="#" onClick="choose(this.id)">Docentes</a>
	            </li>
	            <li class="nav-item">
	              <a id="BtnComisiones" class="nav-link" href="#" onClick="choose(this.id)">Comisiones</a>
	            </li>
	          </ul>
	        </nav>
	        
	        <div class="col-md-9 col-md-10 pt-3">
	        <h2 id="title">Alumnos</h2>
	        
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
				      	<th scope="col"><p></p></th>
				      	<th scope="col"><p>ACCIONES</p></th>
				      	<th scope="col"><p></p></th>
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
				      <td>
				      	
				      	
				      </td>

				
				    </tr>
				    
				  <%}%>
				  </tbody>
				</table>   
		        	
		        </div>
			</div>
		</div>
	</div>
	
	 <!-- Links -->
        <h6 class="text-uppercase font-weight-bold">Contact</h6>
        <hr class="teal accent-3 mb-4 mt-0 d-inline-block mx-auto" style="width: 60px;">
        <p>
          <i class="fas fa-home mr-3"></i> New York, NY 10012, US</p>
        <p>
          <i class="fas fa-envelope mr-3"></i> info@example.com</p>
        <p>
          <i class="fas fa-phone mr-3"></i> + 01 234 567 88</p>
        <p>
          <i class="fas fa-print mr-3"></i> + 01 234 567 89</p>
	
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>