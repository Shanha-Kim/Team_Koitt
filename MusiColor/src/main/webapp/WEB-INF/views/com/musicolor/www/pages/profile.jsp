	<%@ page language="java" contentType="text/html; charset=UTF-8"
		pageEncoding="UTF-8"%>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>개인 프로필 페이지</title>
	
	    <!-- Bootstrap CSS & theme -->
	    
	    <link rel="stylesheet" href="/www/css/bootstrap-lux.css">
	    <link rel="stylesheet" href="/www/css/bootstrap.custom.css">
	
	    <!-- Font Awesome 5 -->
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<script type="text/javascript" src="/www/js/jquery-3.4.1.min.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		$('#profile').click(function(){
		$(location).attr('href','/www/musiccolor/profconfig.mr');
			
		});
		
	});
	
	</script>
	<style>
	body {
	}
	
	 button{
	 
	 margin-top :130px;
	
	 }
	 .col{
	 position:relative;
	 
	 width:350px;
	 height :300px;		
	 margin-top : -180px;
	 margin-left : 500px;
	 }
	 
	 
	.imgBox{
	width:150px;
	height:150px;
	border:1px solid white;
	margin-left :250px;
	margin-top :100px;
	}
	.imgBox img{
	width :100%;
	height :100%;
	}
	 		
	}
	header{
	  border:1px solid white;
	  margins-top:20px;
	  margin :0 auto;
	 }
	 header * {
	 position : relative;
	 }
	 
	 .pro{
	  position :absolute;
	 margin-top : -90px;
	 
	 }
	 .textbox{
	 	
	 margin-top :-80px;
	 margin-left :600px;
	 
	 
	 
	 	}
	  h6{
	 
	 color: white;
	 
	 }
	 .imggride{
	 justify-content: space-between;
	 position:relative;
	 max-width:960px;
	 max-height:350px;
	 margin:0 auto;
	 
	 }
	 .imggride img{
	 
	 padding :10px;	
	 width:300px;
	 height:300px;
	 }
	</style>
	
	</head>
	<body class="bg-primary">
		<nav class="navbar navbar-expand-sm navbar-dark bg-primary fixed-top">
			<a class="navbar-brand ml-5" href="#"><h3 class="logo">musicolor</h3></a>
	
			<ul class="nav navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-search f-20"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-random f-20"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-cloud-upload-alt f-20"></i></a></li>
				<li class="nav-item"><a class="nav-link" href="#"><i
						class="fas fa-user f-20"></i></a></li>
			</ul>
		</nav>
	
	
	
	
	
		<header>
		<div class="imgBox">
		<img src="/www/upload/logo.jpg">		
		</div>
				<div class="col">
				<div class="pro">
		
					<button type="button" id="profile" class="btn btn-info">프로필 편집 </button></div>
					<button type="button" class="btn btn-warning">게시물 </button>
					<button type="button" class="btn btn-secondary">팔로워</button>
					<button type="button" class="btn btn-success">팔로잉 </button>
			</div>
			<div class="textbox">
			
			</div>
		</header>
		<div class="imggride">
		
		<c:forEach var="data" items="${LIST}">
		 <img src="/upload/${data.sname}"> 
		
		</c:forEach>
		
		</div>
		
		
	</body>
	</html>