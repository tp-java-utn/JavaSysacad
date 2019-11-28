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
    <title>Administrador - UTN</title>
	<link rel="shortcut icon" type="image/png" href="pngs/loginADM.png">

    <!-- Bootstrap core CSS -->
	<link href="Styles/bootstrap.min.css" rel="stylesheet">
	<link href="Styles/NewAlumno.css" rel="stylesheet">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	<!-- Custom CSS -->
	<link href="Styles/Admin.css" rel="stylesheet">
	
	<!-- Script para el Header -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="JavaScripts/bootstrap.js"></script>
	<script src="JavaScripts/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/1baa4ceec0.js"></script>
	
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
   		Alumno A = (Alumno)session.getAttribute("Alumno");
    %>

</head>
	


<body>

	<form name="myForm" action="MainPage" method="get">
		<div class="sidebar-container">
			<div class="sidebar-logo" >
			    UTN Administrador
			</div>
			  	<ul class="sidebar-navigation">
			    <li class="header">Personas</li>
			    <li>
			      <a href="MainPageAdm?action=Alumnos">
			        <i class="fas fa-user-alt"></i> Alumnos
			      </a>
			    </li>
			    <li>
			      <a href="MainPageAdm?action=Docentes">
			        <i class="fas fa-user-tie"></i> Docentes
			      </a>
			    </li>
			    <li class="header">Entidades</li>
			    <li>
			      <a href="MainPageAdm?action=Materias">
			         <i class="far fa-clipboard"></i> Materias
			      </a>
			    </li>
			    <li>
			      <a href="MainPageAdm?action=Comisiones">
			        <i class="fa fa-users" aria-hidden="true"></i> Comisiones
			      </a>
			    </li>
			    <li>
			      <a href="MainPageAdm?action=Mesas">
			        <i class="fas fa-graduation-cap"></i> Mesas
			      </a>
			    </li>
		  	</ul>
		</div>
	</form>
	
	<form id="myForm" name="myForm" action="MainPageAdmAlumno" method="get">	
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
			    </div>  
			    
			    <div class="col-md-12 order-md-1">
  			
  			
	  			
  				<div class="row">
  				
		          	<div class="col-md-6 mb-3">
		          	<label for="nombre">Nombre</label>
			        <input name= "nombre" type="text" class="form-control" id="nombre" value="<%=A.getNombre()%>" required pattern="[A-Za-z ]{4,20}" required
			        	title = "El Tamaño minimo es de 4 y el maximo de 20">
				        <div class="invalid-feedback">
				        	Tu nombre es necesario.
				        </div>
				    </div>
				    
				    <div class="col-md-6 mb-3">
		      		<label for="apellido">Apellido</label>
		      	  	<input name="apellido" type="text" class="form-control" id="apellido" value="<%=A.getApellido()%>" required pattern="[A-Za-z ]{4,20}" required
		      	  		title = "El Tamaño minimo es de 4 y el maximo de 20">	      	 
			          	<div class="invalid-feedback">
			            	Tu apellido es necesario.
			          	</div>
	          		</div>
	          			
          		</div>
          		
          		<div class="row">
			        <div class="col-md-4 mb-3">
		          		<div class="mb-4">
				        <label for="carrera">Tipo de Documento</label>
				        <select name="tipoDocumento" id="tipoDocumento" class="custom-select d-block w-100" required required>
				        <option value="">Elige...</option>
				        <option>Documento Nacional de Identidad</option>
				        <option>Pasaporte</option>
				        <option>Libreta de Enrolamiento</option>
				        <option>Libreta Civica</option>
				       	</select>
					        <div class="invalid-feedback">
					              Por favor seleccione un tipo de Documento.
					        </div>
				        </div>
			        </div>
			        
		        	<div class="col-md-6 mb-3">
			      		<label for="legajo">Nuemro de Documento</label>
				        <input  name="documento" type="text" class="form-control" id="documento" value="<%=A.getDocumento().getNumero()%>" required pattern="[0-9 ]{4,20}" required
				        	title = "El Tamaño minimo es de 4 y el maximo de 20 digitos">
					        <div class="invalid-feedback">
					        	Por favor ingrese un Numero de Documento valido.
					        </div>
			        </div>
		        </div>
		        
          		
		        

		        
	      		<div class="mb-3">
	      		<label for="email">Email</label>
		        <input name="email" type="email" class="form-control" id="email" value="<%=A.getEmail()%>" maxlength="30" required
		        	title = "El Tamaño minimo es de 10 y el maximo de 30">
			        <div class="invalid-feedback">
			        	Por favor ingrese un email valido.
			        </div>
		        </div>

       			<div class="mb-3">
	      		<label for="telefono">Telefono</label>
		        <input name="telefono" type="tel" class="form-control" id="telefono" value="<%=A.getTelefono()%>" required pattern="[0-9 ]{7,20}" required
		        	title = "El Tamaño minimo es de 7 y el maximo de 20 digitos">
			        <div class="invalid-feedback">
			            Por favor ingrese un telefono valido.
			        </div>
		        </div>
		        
		        <div class="mb-4">
		        <label for="carrera">Carrera</label>
		        <select name="Carrera" id="Carrera" class="custom-select d-block w-100" id="carrera" required required>
		        <option value="">Elige...</option>
		        <option>Ingenieria Mecanica</option>
		        <option>Ingenieria Electrica</option>
		        <option>Ingenieria en Sistemas de Informacio</option>
		        <option>Ingenieria Civil</option>
		        <option>Ingenieria Qumica</option>
		       	</select>
			        <div class="invalid-feedback">
			              Por favor seleccione una carrera.
			        </div>
		        </div>
		        
		        <hr class="mb-4">
		        
		        <div class="row">
			        <div class="col-md-6 mb-3">
		      		<label for="direccion">Direccion</label>
			        <input name="direccion" type="text" class="form-control" id="direccion" value="<%=A.getDireccion().getCalle()%>" required pattern="[A-Za-z ]{4,20}" required
			        	title = "El Tamaño minimo es de 4 y el maximo de 20">
				        <div class="invalid-feedback">
				            Por favor ingrese una direccion valido.
				        </div>
			        </div>
			        
			        <div class="col-md-3 mb-3">
		      		<label for="numero">Numero</label>
			        <input name="numero" type="number" class="form-control" id="numero" value="<%=A.getDireccion().getNumero()%>" maxlength="5" required
			        	title = "El Tamaño minimo es de 1 y el maximo de 5 digitos">
				        <div class="invalid-feedback">
				            Por favor ingrese un numero valido.
				        </div>
			        </div>
		        </div>
		        
		        <div class="row">
		        	<div class="col-md-3 mb-3"> 
		      		<label for="piso">Piso <span class="text-muted">(Opcional)</span></label>
			        <input name="piso" type="number" class="form-control" id="piso" maxlength="5" value="<%=A.getDireccion().getPiso()%>"
			        	title = "El Tamaño minimo es de 1 y el maximo de 5 digitos">
				        <div class="invalid-feedback">
				            Por favor ingrese un piso valido.
				        </div>
			        </div>
			        
			        <div class="col-md-3 mb-3"> 
		      		<label for="departamento">Depto <span class="text-muted">(Opcional)</span></label>
			        <input name="departamento" type="text" class="form-control" id="departamento" maxlength="3" value="<%=A.getDireccion().getDept()%>"
			        	title = "El Tamaño minimo es de 1 y el maximo de 5">
				        <div class="invalid-feedback">
				            Por favor ingrese un departamento valido.
				        </div>
			        </div>
		        </div>
		        
		        
		        
	 		</div>
  		
		  	</div>
		</div>
	</form>
	
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>