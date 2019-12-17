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
		<title>Perfil tallerista</title>
		
		
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
								          <p class="lead mb-5 text-white-50">Peril tallerista </p>
							        </div>
						      </div>
					  		
					    </div>
				  </header>

  <!-- Page Content -->
  <div class="container">
  
  		<h1 class="text-primary">Peril tallerista</h1>
  		
  		<div class="row justify-content-center align-items-center h-100">
        	<div class="col-12 col-sm-11 col-md-8 col-lg-5">    
	        	<div class="card">
					  <div class="card-header bg-dark">
							<h2 class="text-warning h5 font-weight-bold mt-0 mb-0">
                                ${instructor.name }
                            </h2>
					  </div>
					  <div class="card-body">					  						
						  <ul class="list-group list-group-flush">
						  		<li class="list-group-item font-weight-bold">TALLERES</li>
							  	<c:forEach var="workshop" items="${workshops}">
							    	<li class="list-group-item">${workshop.title}</li>
		                        </c:forEach>
						  </ul>
				      </div>
					  <div class="card-footer">
                            <p class="small text-secondary">
                                ${instructor.email }
                            </p>
                      </div>
				</div>
        	     
	                
        	</div>
    	</div>
    
       		
  		<sec:authorize access="hasAnyRole('ADMIN','SECRETARIO')">
	  		<div class="row">
	  			<div class="col-md-4 mb-5">
		        	<a class="btn btn-primary btn-lg mt-3" href="${pageContext.request.contextPath }/talleres">Volver &raquo;</a>
	  			</div>
	  		</div>
  		</sec:authorize>
  </div>
	


</body>

</html>
