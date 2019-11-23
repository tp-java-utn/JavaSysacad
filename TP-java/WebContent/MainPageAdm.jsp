<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="Entidades.*"%>
<%@page import="Data.*"%>
<%@page import="Entidades.Alumno.Carreras"%>
<%@page import="Entidades.Persona.EstadosPersona"%>

<html>
<head>


<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.5">
    <title>ADM - UTN</title>
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
	   .sidebar-container {
		  position: fixed;
		  width: 220px;
		  height: 100%;
		  left: 0;
		  overflow-x: hidden;
		  overflow-y: auto;
		  background: #1a1a1a;
		  color: #fff;
		}
		
		.content-container {
		  padding-top: 20px;
		}
		
		.sidebar-logo {
		  padding: 10px 15px 10px 30px;
		  font-size: 20px;
		  background-color: #2574A9;
		}
		
		.sidebar-navigation {
		  padding: 0;
		  margin: 0;
		  list-style-type: none;
		  position: relative;
		}
		
		.sidebar-navigation li {
		  background-color: transparent;
		  position: relative;
		  display: inline-block;
		  width: 100%;
		  line-height: 20px;
		}
		
		.sidebar-navigation li a {
		  padding: 10px 15px 10px 30px;
		  display: block;
		  color: #fff;
		}
		
		.sidebar-navigation li .fa {
		  margin-right: 10px;
		}
		
		.sidebar-navigation li a:active,
		.sidebar-navigation li a:hover,
		.sidebar-navigation li a:focus {
		  text-decoration: none;
		  outline: none;
		}
		
		.sidebar-navigation li::before {
		  background-color: #2574A9;
		  position: absolute;
		  content: '';
		  height: 100%;
		  left: 0;
		  top: 0;
		  -webkit-transition: width 0.2s ease-in;
		  transition: width 0.2s ease-in;
		  width: 3px;
		  z-index: -1;
		}
		
		.sidebar-navigation li:hover::before {
		  width: 100%;
		}
		
		.sidebar-navigation .header {
		  font-size: 12px;
		  text-transform: uppercase;
		  background-color: #151515;
		  padding: 10px 15px 10px 30px;
		}
		
		.sidebar-navigation .header::before {
		  background-color: transparent;
		}
		
		.content-container {
		  padding-left: 220px;
		}
    </style>
      
	<link href="Styles/NewAlumno.css" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	<!-- Script para el Header -->
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="JavaScripts/bootstrap.js"></script>
	<script src="JavaScripts/bootstrap.min.js"></script>
	
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
	
	<div class="sidebar-container">
		<div class="sidebar-logo">
		    UTN Administrador
		</div>
		  	<ul class="sidebar-navigation">
		    <li class="header">Personas</li>
		    <li>
		      <a href="#">
		        <i class="fa fa-home" aria-hidden="true"></i> Alumnos
		      </a>
		    </li>
		    <li>
		      <a href="#">
		        <i class="fa fa-tachometer" aria-hidden="true"></i> Docentes
		      </a>
		    </li>
		    <li class="header">Entidades</li>
		    <li>
		      <a href="#">
		        <i class="fa fa-users" aria-hidden="true"></i> Materias
		      </a>
		    </li>
		    <li>
		      <a href="#">
		        <i class="fa fa-cog" aria-hidden="true"></i> Comisiones
		      </a>
		    </li>
		    <li>
		      <a href="#">
		        <i class="fa fa-info-circle" aria-hidden="true"></i> Mesas
		      </a>
		    </li>
	  	</ul>
	</div>
	
	<form id="myForm" name="myForm" action="MainPageAdm" method="get">	
		<div class="content-container">
		  	<div class="container-fluid">
		
			    <!-- Main component for a primary marketing message or call to action -->
			    <div class="jumbotron" style="padding: 0">
			    	<table border="0" cellpadding="20">
			    		<tr>
			    			<td>
			    				<h1><Strong>Alumnos</Strong></h1>
			    			</td>
			    		</tr>
			    		<tr>
			    			<td>
			    				<p>Los <strong>Alumnos</strong>  pueden cursar las siguientes carreras:</p>
							      <ul>
									  <li class="text-info">Sistemas</li>
									  <li class="text-success">Quimica</li>
									  <li class="text-secondary">Mecanica</li>
									  <li class="text-danger">Civil</li>
									  <li class="text-primary">Electrica</li>
								  </ul> 
			    			</td>
			    			<td>
			    				<p>Los posibles estados que puede tener un <strong>Alumnos</strong> son:</p>
						      	  <ul>
									  <li class="text-primary">Activo </li>
									  <li class="text-muted">Pendiente</li>
									  <li class="text-danger">Eliminado</li>
									  <li style="visibility: hidden"></li>
									  <li style="visibility: hidden"></li>
								  </ul>
			    			</td>
			    		</tr>
			    	</table>
			      
			      <p style="padding-left: 15px; padding-bottom: 20px">
			        <a class="btn btn-lg btn-primary" href="NewAlumnos.jsp" role="button" >Agregar Alumno &raquo;</a>
			      </p>
			    </div>
			    
				<div class="table-responsive">
					<table class="table table-hover table-sm">
				  		<thead class="thead-dark">
					    	<tr style="text-align:center;">
							    <th scope="col">Apellido y Nombre</th>
							    <th scope="col">Legajo</th>
							    <th scope="col">Documento</th>
							    <th scope="col">Email</th>
							    <th scope="col">Telefono</th>
							    <th scope="col">Direccion</th>
							    <th scope="col">Carrera</th>
							    <th scope="col">Estado</th>
							    <th scope="col" >Acciones</th>
					    	</tr>
				  		</thead>
			  		
				  		<tbody>
				  		<% for (Alumno Al:Alumnos) {%>
				  			<tr>
							    <th scope="row"><%=Al.getApellido()%> <%=Al.getNombre()%></th>
							    <td><%=Al.getLegajo()%></td>
							    <td><%=Al.getDocumento().getNumero()%></td>
							    <td><%=Al.getEmail()%></td>
							    <td><%=Al.getTelefono()%></td>
							    
							    <% if(Al.getDireccion().getPiso()==0) {%>
							    <td><%=Al.getDireccion().getCalle()%> <%=Al.getDireccion().getNumero()%></td>
							    <% }else{%>
							    <td><%=Al.getDireccion().getCalle()%> <%=Al.getDireccion().getNumero()%>, <%=Al.getDireccion().getPiso()%> <%=Al.getDireccion().getDept()%></td>
							    <% }%>
							    
							    <td ><%=Al.getCarrera()%></td>
							    
							    <% if(EstadosPersona.valueOf(Al.getEstadoPersona()).equals(EstadosPersona.Activo)){%>
							    <td class="text-primary"><span class="label label-default"><%=Al.getEstadoPersona()%></span></td>
							    <% }else if(EstadosPersona.valueOf(Al.getEstadoPersona()).equals(EstadosPersona.Pendiente)){%>
							    <td class="text-muted"><span class="label label-default"><%=Al.getEstadoPersona()%></span></td>
							    <% }else{%>
							    <td class="text-danger"><span class="label label-default"><%=Al.getEstadoPersona()%></span></td>
							    <% }%>		
							    					
							    <td>					
							    	<% if(!EstadosPersona.valueOf(Al.getEstadoPersona()).equals(EstadosPersona.Eliminado)){%>
							    	
							    		<% if(!EstadosPersona.valueOf(Al.getEstadoPersona()).equals(EstadosPersona.Activo)){%>
								    	<a href="MainPageAdm?action=Activar&id=<%=Al.getLegajo()%>" type="button" class="btn btn-primary" ><i class="fas fa-user-edit"></i> Activar</a>
								    	<% }else {%>	
								    	<a href="MainPageAdm?action=Activar&id=<%=Al.getLegajo()%>" type="button" class="btn btn-primary disabled" ><i class="fas fa-user-edit"></i> Activar</a>
								    	<% }%>
								    	
								    	<a href="MainPageAdm?action=Editar&id=<%=Al.getLegajo()%>" type="button" class="btn btn-secondary"><i class="fas fa-user-edit"></i> Editar</a>
								    	
							    	<% }%>
						    							    	
							    	<%if(!EstadosPersona.valueOf(Al.getEstadoPersona()).equals(EstadosPersona.Eliminado)){%>
							    	<a href="MainPageAdm?action=Eliminar&id=<%=Al.getLegajo()%>" type="button" class="btn btn-danger"><i class="far fa-trash-alt"></i> Eliminar</a>
							    	<% }else{%>		
							    	<a href="MainPageAdm?action=Recuperar&id=<%=Al.getLegajo()%>" type="button" class="btn btn-primary btn-block"><i class="far fa-trash-alt"></i> Recuperar</a>			
									<% }%>
							    </td>
						    </tr>
				  		<% }%>
				  	
				  		</tbody>
					</table>
				</div>
		  	</div>
		</div>
	
	</form>
	
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>