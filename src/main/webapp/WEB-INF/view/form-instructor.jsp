<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<!-- 2.Formulario -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- 4.Mostrar roles de usuario -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- 3.Mensaje de error. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>

	<head>
	
		<meta charset="ISO-8859-1">
		<title>Form Talleristas</title>
		
		
		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
		
		<!-- jQuery library -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		
		<!-- Popper JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		
		<!-- Latest compiled JavaScript -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
		
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/business-frontpage.css">
		
		<style>
			.error { color: red; }
		</style>	
		
	</head>
	
	<body>
			<!-- Navigation -->
			  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
			    <div class="container">
			      <a class="navbar-brand" href="${pageContext.request.contextPath}/">AVV Torre Roja</a>
			      <div class="collapse navbar-collapse">
			        <ul class="navbar-nav ml-auto">
			          <li class="nav-item active">
			             <div>
						      <p class="nav-usuario">
						      Usuario: 
						      <sec:authentication property="principal.username"></sec:authentication>
						      </p>
						      <form:form action="${pageContext.request.contextPath }/logout" method="POST">
							
									<button type="submit" class="btn btn-light">Salir</button>
							
							  </form:form>
					     </div>
			          </li>		          
			        </ul>
			      </div>
			    </div>
			  </nav>
				      
				      
			  <!-- Header -->
				  <header class="bg-primary py-5 mb-5">
				    <div class="container h-100">
				      <div class="row h-100 align-items-center">
				        <div class="col-lg-12">
				          <h1 class="display-4 text-white mt-5 mb-2">AVV Torre Roja</h1>
				          <p class="lead mb-5 text-white-50">
				         Formulario de tallerista
				         </p>
				        </div>
				      </div>
				    </div>
				  </header>

  <!-- Page Content -->
  <div class="container">
  		
   		<div class="row">
   			<div class="col-md-8 mb-5">
   			
   				 <form:form action="saveinstructor" modelAttribute="instructor" method="post">
   				 	<form:hidden path="idinstructor" />
   				 	
   				 	<div class="input-group mb-3">
						  <div class="input-group-prepend">
						   	 	<span class="input-group-text" id="basic-addon1">Nombre</span>
						  </div>
						  <form:input type="text" path="name" class="form-control" placeholder="Nombre" aria-label="Nombre" aria-describedby="basic-addon1" />
					</div>
					
					<div class="input-group mb-3">
						  <div class="input-group-prepend">
						   	 	<span class="input-group-text" id="basic-addon1">Email</span>
						  </div>
						  <form:input type="text" path="email" class="form-control" placeholder="Email" aria-label="Email" aria-describedby="basic-addon1" />
					</div>					
					<div class="input-group mb-3">
						  <div class="input-group-prepend">
							<form:errors path="email" cssClass="error" />
						 </div>
					</div> 
					
					<div class="input-group mb-3">
						  <div class="input-group-prepend">
						   	 	<span class="input-group-text" id="basic-addon1">Teléfono</span>
						  </div>
						  <form:input type="text" path="telephone" class="form-control" placeholder="Teléfono" aria-label="Teléfono" aria-describedby="basic-addon1" />
					</div>					
					<div class="input-group mb-3">
						  <div class="input-group-prepend">
							<form:errors path="telephone" cssClass="error" />
						 </div>
					</div> 
					
					<div class="input-group mb-3">
						  <div class="input-group-prepend">
						   	 	<span class="input-group-text" id="basic-addon1">DNI</span>
						  </div>
						  <form:input type="text" path="dni" class="form-control" placeholder="DNI" aria-label="DNI" aria-describedby="basic-addon1" />
					</div>				
					<div class="input-group mb-3">
						  <div class="input-group-prepend">
							<form:errors path="dni" cssClass="error" />
						 </div>
					</div> 
					
					<input type="submit" value="Guardar" class="btn btn-success" />
   				 </form:form>
   			
   			</div>
   		</div>
   		
  		<sec:authorize access="hasAnyRole('ADMIN','SECRETARIO')">
	  		<div class="row">
	  			<div class="col-md-4 mb-5">
		        	<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath }/instructores">Volver &raquo;</a>
	  			</div>
	  		</div>
  		</sec:authorize>
  </div>
	


</body>

</html>