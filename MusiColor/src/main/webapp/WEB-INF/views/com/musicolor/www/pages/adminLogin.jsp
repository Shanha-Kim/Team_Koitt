<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head> 
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS & theme -->
<link rel="stylesheet" href="/css/bootstrap-lux.css" />
<link rel="stylesheet" href="/css/bootstrap.custom.css" />
<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Login</title>

</head>

<body class="bg-primary">
	<jsp:include page="adminNav.jsp" flush="false" />
    
	<c:if test="${empty AID}">
		<div class="container" id="main">
			<div class="card text-white bg-primary mb-" style="max-width:40rem;">
				<div class="card-header">Login</div>
		
				<form method="POST" action="/adminLoginProc.mr">
					<div class="card-body">
						<h4 class="card-title" style="margin-bottom: 30px;">THIS IS ADMIN LOGIN PAGE</h4>
	          
						<div class="form-group">
							<label for="id">ID</label>
							<input name="m_id" type="text" class="form-control" id="id" placeholder="Enter Your ID">
							<small id="emailHelp" class="form-text text-muted">We'll never share your ID with anyone else.</small>
						</div>
						
						<div class="form-group" style="margin-bottom: 20px;">
							<label for="pw">Password</label>
							<input name="m_pw" type="password" class="form-control" id="pw" placeholder="Password">
						</div>

						<br>
						<button type="submit" class="btn btn-black btn-block">로그인</button>
					</div> 
				</form>
			</div>
	    </div>  
	</c:if>
	<c:if test="${not empty AID}">
		<div align="center">
			<div class="card text-white bg-primary mb-3" style="max-width: 40rem; margin-top: 20rem;">
				<div class="card-body">
					<h4 class="card-title" style="">${AID}님은 이미 로그인하셨습니다.</h4>
					<button id="goToMain" type="button" class="btn btn-black" style="width: 100%; display: inline;">메인으로</button>
				</div>
			  </div>
		</div>
	</c:if>
    

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  	<script type="text/javascript">
	$(document).ready(function(){
		$('#goToMain').click(function() {
			$(location).attr('href', '/admin.mr');
		})
	}); 
	</script>
</body>
</html>