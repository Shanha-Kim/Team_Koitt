<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS & theme -->
<link rel="stylesheet" href="/css/bootstrap.custom.css">
<link rel="stylesheet" href="/css/bootstrap-lux.css">

<!-- Font Awesome 5 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>bfMainView</title>
</head>

<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />

	<div class="container" id="main">

	<h1 class="text-muted text-center mb-3">EXPRESS YOUR FEELINGS</h1>
	<h1 class="text-muted text-center mb-5">WITH A SONG</h1>
	
		<!-- chart -->

		<div class="bd-example" style="background: #111111;">
			<div id="carouselExampleCaptions" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#carouselExampleCaptions" data-slide-to="0"
						class="active"></li>
					<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
				</ol>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="carousel-caption d-none d-md-block"></div>
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th>CHART</th>
									<th>ALBUM</th>
									<th>VOCAL</th>
									<th>YOUTUBE</th>
									<th>SONG</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="list" value="0" />
								<c:forEach var="data" items="${LIST}" varStatus="status" end="4">
									<tr>
										<td class="align-middle">${status.index + 1}</td>
										<td class="align-middle"><img
											src="/album/${data.a_sname}" width="50px"></td>
										<td class="align-middle">${data.v_name}</td>
										<td class="align-middle"><a
											href="https://www.youtube.com/watch?v=${data.y_link}"><i
												class="fab fa-youtube white"></i></a></td>
										<td class="align-middle">${data.s_title}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
					<div class="carousel-item">
						<div class="carousel-caption d-none d-md-block"></div>
						<table class="table table-hover text-center">
							<thead>
								<tr>
									<th>CHART</th>
									<th>VOCAL</th>
									<th>SONG</th>
								</tr>
							</thead>
							<tbody>
								<c:set var="list" value="0" />
								<c:forEach var="data" items="${LIST2}" varStatus="status"
									end="4">
									<tr>
										<td class="align-middle">${status.count}</td>

										<td class="align-middle">${data}</td>
										<td class="align-middle">${LIST3.get(status.index)}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>



				</div>
				<br>
				<br>
				<br>
				<a class="carousel-control-prev" href="#carouselExampleCaptions"
					role="button" data-slide="prev"> <span class="sr-only">Previous</span>
				</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
					role="button" data-slide="next"> <span class="sr-only">Next</span>
				</a>
			</div>
		</div>
	</div>









	<!-- Modal	
<button type="button" class="btn btn-outline-success" data-toggle="modal" data-target="#exampleModal">and more...</button>

<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">MUSICOLOR</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        로그인이 필요합니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <c:if test="${empty SID}">
        <button type="button" id="login" class="btn btn-primary">로그인</button>
        </c:if>
      </div>
    </div>
  </div>
</div>	
    </div>-->



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	<script type="text/javascript">
		$(function() {
			$('#login').click(function() {
				$(location).attr('href', '/login.mr');
			});
		});
	</script>
</body>
</html>