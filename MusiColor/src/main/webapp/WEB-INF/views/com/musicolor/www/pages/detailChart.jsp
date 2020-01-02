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
<link rel="stylesheet" href="/www/css/bootstrap-lux.css">
<link rel="stylesheet" href="/www/css/bootstrap.custom.css">
<link href="/www/css/random.css" rel="stylesheet" type="text/css">


<!-- Font Awesome 5 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>Detail chart</title>
</head>

<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />

	<div class="container" id="main">
		<!-- card -->
		<div class="card mb-3 bg-primary mb-5" id="sad">
			<h3 class="card-header">hot 10</h3>
			<!-- video -->
			<div class="youtube">
				<iframe width="1012" height="506"
					src="https://www.youtube.com/embed/aAkMkVFwAoo" frameborder="0"
					allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<!-- body -->
			<div class="card-body pb-0">


				<div>
					<ul class="pagination pagination-lg">
						<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a>
						</li>
						<li class="page-item active"><a class="page-link" href="#">1</a>
						</li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#">4</a></li>
						<li class="page-item"><a class="page-link" href="#">5</a></li>
						<li class="page-item"><a class="page-link" href="#">6</a></li>
						<li class="page-item"><a class="page-link" href="#">7</a></li>
						<li class="page-item"><a class="page-link" href="#">8</a></li>

						<li class="page-item"><a class="page-link" href="#">&raquo;</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-4 big-square">
				<div class="square small-angry">
					<img class="album" src="/www/img/christmas-4689129_640.jpg" />
				</div>
			</div>
			<div class="col-4 big-square">
				<div class="square small-sad">
					<img class="album" src="/www/img/christmas-4689129_640.jpg" />
				</div>
			</div>
			<div class="col-4 big-square">
				<div class="square small-happy">
					<img class="album" src="/www/img/christmas-4689129_640.jpg" />
				</div>
			</div>

		</div>

		<!-- 정렬 기준 탭 -->
		<div class="btn-group btn-block mb-5" role="group">
			<button type="button" class="btn btn-primary text-muted" id="btn-0">ALL</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-1">사랑</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-2">기쁨</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-3">평온</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-4">슬픔</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-5">분노</button>
		</div>

		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>CHART</th>
					<th>ALBUM</th>
					<th>VOCAL</th>
					<th>SONG</th>
					<th>YOUTUBE</th>
				</tr>
			</thead>
			<tbody>
				<c:set var="list" value="0" />
				<c:forEach var="data" items="${LIST}" varStatus="status">
					<tr>
						<td class="align-middle">${status.index + 1}</td>
						<td class="align-middle"><img
							src="/www/album/${data.a_sname}" width="80px"></td>
						<td class="align-middle">${data.v_name}</td>
						<td class="align-middle">${data.s_title}</td>
						<td class="align-middle"><a
							href="https://www.youtube.com/watch?v=${data.y_link}"><i
								class="fab fa-youtube white"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
      $(function() {
    	  
    	/* 버튼 이벤트 */
    	var scode = '${CODE}';
  		if(scode == 1){
  			$('#btn-1').removeClass('text-muted');
  			$('#btn-1').addClass('selected');
  		} else if(scode == 2){
  			$('#btn-2').removeClass('text-muted');
  			$('#btn-2').addClass('selected');
  		} else if(scode == 3){
  			$('#btn-3').removeClass('text-muted');
  			$('#btn-3').addClass('selected');
  		} else if(scode == 4){
  			$('#btn-4').removeClass('text-muted');
  			$('#btn-4').addClass('selected');
  		} else if(scode == 5){
  			$('#btn-5').removeClass('text-muted');
  			$('#btn-5').addClass('selected');
  		} else {
  			$('#btn-0').removeClass('text-muted');
  			$('#btn-0').addClass('selected');
  		}
  		
  		/* 버튼 페이지 이동 */
        $("#btn-0").click(function(){
        	$(location).attr("href", "/www/detailChart.mr");
        })
        
        $("#btn-1").click(function(){
        	$(location).attr("href", "/www/detailChartSeleced.mr?b_emotion=1");
        })
        
        $("#btn-2").click(function(){
        	$(location).attr("href", "/www/detailChartSeleced.mr?b_emotion=2");
        })
        
        $("#btn-3").click(function(){
        	$(location).attr("href", "/www/detailChartSeleced.mr?b_emotion=3");
        })
        
        $("#btn-4").click(function(){
        	$(location).attr("href", "/www/detailChartSeleced.mr?b_emotion=4");
        })
        
        $("#btn-5").click(function(){
        	$(location).attr("href", "/www/detailChartSeleced.mr?b_emotion=5");
        })
      })
	</script>
</body>
</html>
