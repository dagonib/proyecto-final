<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!-- 2.Formulario -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 3.Mensaje de error. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

	<head>
	
		<meta charset="ISO-8859-1">
		<title>Login</title>
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
		
	</head>
	
	<body>
		
			

		
		<div class="container">
			<div class="d-flex justify-content-center h-100">
				<div class="card">
					<div class="card-header">
						<h3>Iniciar Sesión</h3>
					</div>
					<div class="card-body">
						<form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-user"></i></span>
								</div>
								<input type="text" class="form-control" placeholder="Usuario" name="username">
								
							</div>
							<div class="input-group form-group">
								<div class="input-group-prepend">
									<span class="input-group-text"><i class="fas fa-key"></i></span>
								</div>
								<input type="password" class="form-control" placeholder="Contraseña" name="password">
							</div>
							<div class="form-group">
								<input type="submit" value="Login" class="btn float-right login_btn">
							</div>
						</form:form>
						
					</div>
						<c:if test="${param.error!=null}">
							<div class="alert alert-danger">
								<strong>Error: </strong>
								Nombre o contraseña incorrectos.
							</div>
						</c:if>
								
						<c:if test="${param.logout!=null}">
							<div class="alert alert-warning">
								<strong>Salir: </strong>
								Ha salido del sistema.
							</div>
						</c:if>
					<div class="card-footer">
						<div class="d-flex justify-content-center">
							<a href="${pageContext.request.contextPath}/" class="btn btn-outline-primary">
								Inicio
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	
	</body>

</html>