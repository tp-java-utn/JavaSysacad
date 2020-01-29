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
    <title>Administrador - UTN</title>
	<link rel="shortcut icon" type="image/png" href="pngs/loginADM.png">

	<!-- Session -->
	<script src="JavaScripts/SessionTimeOutADM.js"></script>
	
    <!-- Bootstrap core CSS -->
	<link href="Styles/bootstrap.min.css" rel="stylesheet">  
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	
	<!-- Custom CSS -->
	<link href="Styles/NewAlumno.css" rel="stylesheet">
	<link href="Styles/Admin.css" rel="stylesheet">
	
	<!-- Script para el Header -->
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script src="JavaScripts/bootstrap.js"></script>
	<script src="JavaScripts/bootstrap.min.js"></script>
	<script src="https://kit.fontawesome.com/1baa4ceec0.js"></script>
	
	<script> 
	$(function(){
	  $("#header").load("HeaderAdmin.jsp");
	  $("#footer").load("Footer.jsp"); 
	});
	</script>
	
    <%
	    DataMateria DM = new DataMateria();
		ArrayList<Materia> Materias = DM.getAll();
    %>

</head>
	


<body>

	<div id="header"></div>
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
			    <li>
			      <a href="MainPageAdm?action=Eliminados">
			        <i class="fas fa-trash"></i> Eliminados
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
			        <i class="fa fa-users"></i> Comisiones
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
	
	<form id="myForm" name="myForm" action="MainPageAdmAddMesa" method="get">	
		<div class="content-container">
		  	<div class="container-fluid">
		
				
			    
			    <div class="col-md-12 order-md-1">
	  				<h1><Strong>Nueva Mesa</Strong></h1>
	  			
		  			
	  				<div class="row">
	  				
			          	<div class="col-md-6 mb-3">
			          		<div class="mb-4">
					        <label for="Materia">Materia</label>
					        <select name="Materia" id="Materia" class="custom-select d-block w-100" required>
					        <option value="">Elige...</option>
					       	</select>
						        <div class="invalid-feedback">
						              Por favor seleccione una Materia.
						        </div>
					        </div>
			        	</div>
					    
					    <div class="col-md-6 mb-3">
			      		<label for="Salon">Salon</label>
		      	  		<input name= "Salon" type="number" class="form-control" id="Salon" min="0" maxlength="20"
				        	title = "El Tama�o minimo es de 3 y el maximo de 20">
					    </div> 
				          	 
	
	          		</div>	        	
          		
          			<div class="row">
          			
          				<div class="col-md-6 mb-3">
			      		<label for="Horario">Horario</label>
		      	  		<input name= "Horario" type="number" class="form-control" id="Horario" min="0" max="24" maxlength="20"
				        	title = "El Tama�o minimo es de 4 y el maximo de 20">
					    </div> 
				        
				        <div class="col-md-6 mb-3">
			      		<label for="Fecha">Fecha</label>
		      	  		<input name= "Fecha" type="date" class="form-control" id="Fecha" min="0" maxlength="20"
				        	title = "El Tama�o minimo es de 4 y el maximo de 20">
					    </div> 
				        
          			</div>
          			
      
          			
          		</div>         				      
		        
	      		

		        
	 		</div>
  		
		 </div>
		
		<div class="row justify-content-center">
			<div class="col-3">
		    	<button class="btn btn-warning btn-lg btn-block" type="submit" ><i class="fas fa-save"></i> Guardar</button> 
		    </div>
    	</div>
    	
	</form>
	
	<hr class="mb-4">
	<div id="footer"></div>
	
	
	
</body>

<script type="text/javascript">
<%for(Materia M:Materias){%>
$('#Materia').append($('<option>', {
    value: <%=M.getIdMateria()%>,
    text: '<%=M.getNombre()%>'
}));
<%}%>
</script>

</html>