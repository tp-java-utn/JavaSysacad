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
		<link href="Styles/floating-labels.css" rel="stylesheet">
	</head>
	
	<body >
		<form class = "form-signin" action="Login" method="post">
			<div class="text-center mb-4">
				<img class="mb-4" src="pngs/login.png" height="150" width="150">
				<h1 class="h3 mb-3 font-weight-normal">Login UTN</h1>
				<p> Sistema de autogestión alumnos de la Universidad Tecnológica Nacional Facultad Regional Rosario</p>
			</div>
			
			<div class="form-label-group">
				<input name="user"  type = "text" class="form-control" placeholder = "Legajo" required autofocus/>
				<label for="user">Legajo</label>
			</div>
			<p class="text-danger">
				<% 
				String error1 = (String)request.getAttribute("errorUser");
				if(error1 != null)
				{
					out.println(error1);
				}
				%>
			</p>
			
			
			<div class="form-label-group">
				<input name="password" type="password" class="form-control" placeholder = "Contraseña" required/>
				<label for="password">Contraseña</label>
			</div>
			<p class="text-danger">
				<% 
				String error2 = (String)request.getAttribute("errorPass");
				if(error2 != null)
				{
					out.println(error2);
				}
				%>
			</p>
			
			<div class="checkbox mb-3">
			    <label>
			      <input type="checkbox" value="remember-me"> Recordar legajo
			    </label>
		    </div>
		    
			<input type = "submit" value = "Login" class="btn btn-lg btn-primary btn-block">
			<p>¿Olvidaste tu contraseña? <a href="https://caniuse.com/#feat=css-placeholder-shown">presiona aqui</a></p>

		</form>
	</body>
</html>