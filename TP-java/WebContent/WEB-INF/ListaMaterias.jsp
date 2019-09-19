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
    <title>Lista de Materias - UTN</title>
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
		function openRow(id)
		{
			document.getElementById(id).innerHTML = "press "+id;
			if(document.getElementById("hide"+id).style.display == "none")
			{
				document.getElementById("hide"+id).style.display= "block";
			}
			else
			{
				document.getElementById("hide"+id).style.display= "none";
			}
			
		}
	</script>
	
	<script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		//document.getElementById("myFrom").submit();
        }
    </script>

    <% 
    	Alumno A= (Alumno)session.getAttribute("usuario");
    	
    	DataMateria DM = new DataMateria();
    	ArrayList<Materia> Materias = DM.getAll();
    	
    	DataComision DC = new DataComision();
    	ArrayList<Comision> Comisiones = DC.getAll();
    %>

</head>
	


<body>
	<div id="header"></div>

	<form class="needs-validation" action="InscribirseMateria" method="post">
		
		<div class="container">
		  	<div class="py-5 text-center">
		       	<h1 class="text-primary"><strong>Inscripcion Materias</strong></h1>
		  	</div>
		</div>
		
		<div class="table-responsive">
			<table class="table table-hover table-striped tableFixHead">
			  <colgroup span="3"></colgroup>
			  <thead>
			    <tr id="encabezado">
			      	<th scope="col"><p>ID</p></th>
			      	<th scope="col"><p>AÑO</p></th>
	
			      	<th scope="col"><p align="center">REGULARES</p></th>
			    	<th scope="col"><p align="center">APROBADAS</p></th>
			    	<th scope="col"><p align="center">PARA RENDIR</p></th>
			      	<th scope="col"><p>MATERIA</p></th>
			      	<th scope="col"><p>CURSADO</p></th>
			      	<th scope="col"><p>ACCIONES</p></th>
			    </tr>
			  </thead>
			  
	
			  
			  <tbody>
			  <% for (Materia MS:Materias) {%>
			    <tr id="row">
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
				      <a type="submit" class="btn btn-primary" id="<%=MS.getIdMateria()%>" href="InscripcionComision/new?Materia=<%=MS.getIdMateria()%>">Inscribirse<i class="far fa-eye"></i></a>
			      </td>
			    </tr>
			    
			  <%}%>
			  </tbody>
			</table>    

		</div>
		
		<hr class="mb-4">
	  		
		<div class="row justify-content-center">
			<div class="col-3">
		    	<button class="btn btn-primary btn-lg btn-block" name="BtnVolver" value = "Volver">Volver al Menu</button>
		    </div>
	    </div>
    
    </form>
	
	<div id="footer"></div>
	
	
</body>
</html>