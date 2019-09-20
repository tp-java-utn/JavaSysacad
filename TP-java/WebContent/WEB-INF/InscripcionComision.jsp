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
    <title>Comision - UTN</title>
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
	
	<script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		//document.getElementById("myFrom").submit();
        }
    </script>
    
    <script type="text/javascript">
    	function Inscribirse(idComision,idMateria){
    		//A.inscripcionComision(idComision, idMateria);
    		location.reload(true); 
    	}
    </script>
    
    <% 
    	Alumno A= (Alumno)session.getAttribute("usuario");
    	String action=(String)request.getAttribute("action");
    	
	    DataMateria DM = new DataMateria();
		ArrayList<Materia> Materias = DM.getAll();
		
		DataComision DC = new DataComision();
		ArrayList<Comision> Comisiones = DC.getAll();
    %>

</head>
	


<body>

	<div id="header"></div>
	
			    	
	<form class="form-signin" id="myForm" name="myForm" action="" method="post">			
	<div role="main" class="container">	
  	
		<div class="my-3 p-3 bg-white rounded shadow-sm">
		<% for (Materia MS:Materias) {%>
			<h4 class="border-bottom border-gray pb-2 mb-0" style="margin-top: 50px;"><%=MS.getNombre()%></h4>
			<%for (Comision CS:Comisiones) {%>
				<%if(CS.getIdMateria()==MS.getIdMateria()) {%>
				    				
				    <div class="media text-muted pt-3">
				    	<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 32x32"><title>Placeholder</title><rect width="100%" height="100%" fill="#e83e8c"></rect><text x="50%" y="50%" fill="#e83e8c" dy=".3em">32x32</text></svg>
					    <div class="media-body pb-3 mb-0 small lh-125 border-bottom border-gray">
						    
						<%if(CS.getCantAlumnos()<CS.getCantAlumnosMax()) {%>
						<div class="d-flex justify-content-between align-items-center w-100">
						    	<strong class="text-gray-dark">Comision <%=CS.getIdComision()%></strong>
						    	<button type="button" class="btn btn-primary" name="BtnInscribirse" id="<%=MS.getIdMateria()%>" style="margin-top: 10px;" onclick="Inscribirse(<%=CS.getIdComision()%>,<%=MS.getIdMateria()%>)">Inscribirse<i class="far fa-eye"></i></button>
						</div>
						
						<span class="d-block">Cupos disponibles: <%=CS.getCantAlumnosMax()-CS.getCantAlumnos()%></span>
						
						<div class="progress">
					    	<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%=100*((float)CS.getCantAlumnos()/(float)CS.getCantAlumnosMax())%>%;" aria-valuenow="<%=CS.getCantAlumnos()%>" aria-valuemin="0" aria-valuemax="<%=CS.getCantAlumnosMax()%>"><%=CS.getCantAlumnos()%>/<%=CS.getCantAlumnosMax()%></div>
					    </div>
					    
					    
					    <%}else{%>
					    <div class="d-flex justify-content-between align-items-center w-100">
						    	<strong class="text-gray-dark">Comision <%=CS.getIdComision()%></strong>
						    	<button type="button" class="btn btn-secondary  disabled" name="BtnInscribirse" id="<%=MS.getIdMateria()%>" style="margin-top: 10px;" onclick="Inscribirse(<%=CS.getIdComision()%>,<%=MS.getIdMateria()%>)">Inscribirse<i class="far fa-eye"></i></button>
						</div>
						
					    <span class="d-block">Alumnos <%=CS.getCantAlumnos()%>/<%=CS.getCantAlumnosMax()%></span>
					    
					    <div class="progress">
					    	<div class="progress-bar bg-danger progress-bar-striped progress-bar-animated" role="progressbar" style="width: <%=100*(CS.getCantAlumnos()/CS.getCantAlumnosMax())%>%;" aria-valuenow="<%=CS.getCantAlumnos()%>" aria-valuemin="0" aria-valuemax="<%=CS.getCantAlumnosMax()%>">Cupo completo</div>
					    </div>
					    <%}%>
					    
					    
					    </div>
				    </div>
			   
			    <%}%>
			<%}%>
		<%}%>
		</div>
    </div>
    </form>
	<hr class="mb-4">
	<div id="footer"></div>
</body>
</html>