<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS & theme -->
  <link rel="stylesheet" href="/www/css/bootstrap-lux.css">
  <link rel="stylesheet" href="/www/css/bootstrap.custom.css">

  <!-- Font Awesome 5 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

  <title>frame</title>
  
</head>

<body class="bg-primary">

  <!-- nav -->
  <nav class="navbar navbar-expand-sm navbar-dark bg-primary fixed-top">
    <a class="navbar-brand" href="/www/admin.mr"><p class="adminlogo">ADMIN</p></a>
    
    <ul class="nav navbar-nav ml-auto">
    <c:if test="${empty AID}">
    	<li class="nav-item">
          <a class="nav-link" href="/www/adminLogin.mr"><i class="fas fa-sign-in-alt f-20"></i></a>
      </li>
      </c:if>
      <c:if test="${not empty AID}">
	      <li class="nav-item align-self-center">
	      	관리자 ${AID} 님
	      </li>
    	<li class="nav-item">
        <a class="nav-link" href="#"><i class="fas fa-chart-area f-20"></i></a>
    	</li>
    	<li class="nav-item">
        <a class="nav-link" href="/www/adminrepo.mr"><i class="fas fa-flag f-20"></i></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="/www/adminLogout.mr"><i class="fas fa-sign-in-alt fa-rotate-180 f-20"></i></a>
      </li>
      </c:if>
    </ul>
  </nav>
  <!-- Optional JavaScript -->
  <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>