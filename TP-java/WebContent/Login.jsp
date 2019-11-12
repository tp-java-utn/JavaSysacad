<html>
	<head>
		<meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	    <title>Login - UTN</title>
	    <link rel="shortcut icon" type="image/png" href="pngs/login.png">
	    
	    
		<Link href="Styles/bootstrap.min.css" rel="stylesheet" />
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
	    
	    <script type="text/javascript">
    	function submitForm(met) {
    		document.myForm.action=met;
    		//document.getElementById("myFrom").submit();
        }
    	</script>
    	
		<link href="Styles/floating-labels.css" rel="stylesheet">
	</head>
	
	<body >
		<form class = "form-signin" id="myForm" name="myForm" action="Login" method="post">
			<div class="text-center mb-4">
				<img class="mb-4" src="pngs/login.png" height="150" width="150">
				<h1 class="h3 mb-3 font-weight-normal">Login UTN</h1>
				<p> Sistema de autogesti�n de la Universidad Tecnol�gica Nacional - Facultad Regional Rosario</p>
			</div>
			
			<div class="form-label-group">
				<input name="user"  type = "text" class="form-control" placeholder = "Legajo" required pattern="[0-9 ]{4,10}" required
				        	title = "El Tama�o minimo es de 4 y el maximo de 10 digitos" autofocus/>
				<label for="user">Legajo</label>
			</div>

			
			
			<div class="form-label-group">
				<input name="password" type="password" class="form-control" placeholder = "Contrase�a" maxlength="20" required
				        	title = "El Tama�o minimo es de 4 y el maximo de 20"/>
				<label for="password">Contrase�a</label>
			</div>

			
			<div class="checkbox mb-3">
			    <label>
			      <input type="checkbox" value="remember-me"> Recordar legajo
			    </label>
		    </div>
		    
			<input type = "submit" value = "Login" class="btn btn-lg btn-primary btn-block">
			<div class="text-center mb-4">
			<p>�No tienes cuenta? <a href="NewAlumnos.jsp">Registrate aqui</a>
			</div>
		</form>
	</body>
</html>