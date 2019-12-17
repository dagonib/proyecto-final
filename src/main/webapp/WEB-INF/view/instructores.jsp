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
		<title>Talleristas</title>
		
		
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
								          <p class="lead mb-5 text-white-50"> Administración de talleristas </p>
							        </div>
						      </div>
						      			        
					  		<div class="row">		  			
					  			<div class="col-md-6">
						        	<a class="btn btn-outline-info boton-white btn-lg" href="${pageContext.request.contextPath }/talleres">Administrar Talleres</a>
					  			</div>
						      	<div class="col-md-6">
						        	<a class="btn btn-outline-info boton-white btn-lg" href="${pageContext.request.contextPath }/inscritos">Administrar Inscritos</a>
					  			</div>
					  		</div>
					  		
					    </div>
				  </header>

  <!-- Page Content -->
  <div class="container">
  
  		<sec:authorize access="hasRole('SECRETARIO')">
	  		<div class="row">
		      	<div class="col-md-4 mb-5">
		        	<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath }/secretario/addinstructor">Nuevo &raquo;</a>
	  			</div>
	  		</div>
  		</sec:authorize>
  		
   		<div class="row">
   			<div class="col-md-12 mb-5">
   			
   				 <table class="table table-striped">
							
					<tr>
						<th>Id</th>
						<th>Nombre</th>
						<th>Email</th>
						<th>Teléfono</th>
						<th>DNI</th>
						<th>Acciones</th>
					</tr>
					
					<c:forEach var="instructor" items="${instructors }">
						
						<c:url var="linkEditar" value="/secretario/updateinstructor">
							<c:param name="idinstructor" value="${instructor.idinstructor }" />
						</c:url>
						<c:url var="linkBorrar" value="/admin/deleteinstructor">
							<c:param name="idinstructor" value="${instructor.idinstructor }" />
						</c:url>
						
						<tr>
							<td>${instructor.idinstructor}</td>
							<td>${instructor.name}</td>
							<td>${instructor.email}</td>
							<td>${instructor.telephone}</td>
							<td>${instructor.dni}</td>	
							<td>
								<sec:authorize access="hasRole('SECRETARIO')">
									<a href="${linkEditar}" class="btn btn-success btn-sm">Editar</a>
								</sec:authorize>
						
								<sec:authorize access="hasRole('ADMIN')">	
									<a href="${linkBorrar}" onclick="if(!confirm('¿Está seguro?')) return false"
								   class="btn btn-danger btn-sm">Borrar</a>
								</sec:authorize>
							</td>			
						</tr>
					
					</c:forEach>
					
				</table>
   			
   			</div>
   		</div>
   		
  		<sec:authorize access="hasAnyRole('ADMIN','SECRETARIO')">
	  		<div class="row">
	  			<div class="col-md-4 mb-5">
		        	<a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath }/talleres">Inicio &raquo;</a>
	  			</div>
	  		</div>
  		</sec:authorize>
  </div>
	


</body>

</html>
