<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS & theme -->
  <link rel="stylesheet" href="/css/bootstrap-lux.css">
  <link rel="stylesheet" href="/css/bootstrap.custom.css">

  <!-- Font Awesome 5 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

  <title>frame</title>
  
</head>

<body class="bg-primary">

  <!-- nav -->
  <nav class="navbar navbar-expand-sm navbar-dark bg-primary fixed-top">
  	<c:if test="${empty SID}">
    	<a class="navbar-brand" href="/bfMain.mr"><p class="logo">musicolor</p></a>
    </c:if>
  	<c:if test="${not empty SID}">
    	<a class="navbar-brand" href="/feed.mr"><p class="logo">musicolor</p></a>
    </c:if>
    
    <ul class="nav navbar-nav ml-auto">
    	<c:if test="${empty SID}">
    	<li class="nav-item">
          <a class="nav-link" href="/login.mr"><i class="fas fa-sign-in-alt f-20"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/join.mr"><i class="fas fa-user-plus f-20"></i></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="/adminLogin.mr"><i class="fas fa-sync-alt f-20"></i></i></a>
      </li>
      </c:if>
      <c:if test="${not empty SID}">
    	<li class="nav-item">
        <a class="nav-link" href="/searchBefore.mr"><i class="fas fa-search f-20"></i></a>
    	</li>
    	<li class="nav-item">
        <a class="nav-link" href="/detailChart.mr"><i class="fas fa-chart-line f-20"></i></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/random.mr"><i class="fas fa-random f-20"></i></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="/upload.mr"><i class="fas fa-cloud-upload-alt f-20"></i></a>
        </li>
      <li class="nav-item">
        <a class="nav-link" href="/profilelist.mr?m_id=${SID}"><i class="fas fa-user f-20"></i></a>
      </li>
      <li class="nav-item">
          <a class="nav-link" href="/logout.mr"><i class="fas fa-sign-in-alt fa-rotate-180 f-20"></i></a>
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