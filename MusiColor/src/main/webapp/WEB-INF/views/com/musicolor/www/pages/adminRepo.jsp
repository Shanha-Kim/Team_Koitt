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
<link rel="stylesheet" href="/www/css/random.css" />

<!-- Font Awesome 5 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<title>admin repo</title>
</head>

<body class="bg-primary">
	<jsp:include page="adminNav.jsp" flush="false" />

	<div class="container" style="margin-top: 100px;">
		<div class="btn-group btn-block mb-5" role="group">
			<button type="button" class="btn btn-primary text-muted" id="btn-0">ALL</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-1">N</button>
			<button type="button" class="btn btn-primary text-muted" id="btn-2">Y</button>
		</div>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>NO</th>
					<th>REPORTER</th>
					<th>PROBLEM</th>
					<th>KIND</th>
					<th>DETAIL</th>
					<th>Y/N</th>
					<th>DATE</th>
					<th>ADMIN</th>
					<th>PROCESSING</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="data" items="${LIST}">
					<tr>
						<td class="rno">${data.r_no}</td>
						<td>${data.id}</td>
						<td>${data.song}</td>
						<td class="kind">${data.r_kind}</td>
						<td class="detail">${data.r_detail}</td>
						<td>${data.r_isokay}</td>
						<td>${data.r_date}</td>
						<td>${data.adid}</td>
						<td>
							<button type="button" class="btn btn-black processing"
								id="${data.r_problem}">EDIT</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<!-- processing modal -->
	<form id="repoUpdate" method="POST" action="/www/repoUpdate.mr"
		enctype="multipart/form-data">
		<div class="modal" id="modal">
			<div class="modal-dialog">
				<div class="modal-content bg-primary">
					<!-- Modal body -->
					<div class="modal-body">
						<h1 class="white text-center mt-3 mb-3">EDIT</h1>
						<div class="text-white bg-primary mb-3">
							<div class="alert alert-dismissible alert-danger">
								<h4 class="alert-heading" id="repoKind"></h4>
								<p class="mb-0" id="repoDetail"></p>
								<input type="hidden" name="r_no" id="r_no">
							</div>

							<div class="form-group">
								<label for="s_title">VOCAL</label> <input name="v_name"
									type="text" class="form-control" id="v_name" /> <input
									name="s_vno" id="s_vno" type="hidden">
							</div>

							<div class="form-group">
								<label for="s_title">SONG</label> <input name="s_title"
									type="text" class="form-control" id="s_title" /> <input
									name="s_no" id="s_no" type="hidden">
							</div>
							<div class="form-group">
								<label for="y_link">YOUTUBE</label> <input name="y_link"
									type="text" class="form-control" id="y_link" /> <input
									name="y_no" id="y_no" type="hidden">
							</div>
							<div class="form-group">
								<label for="sFile">ALBUM COVER</label> <input name="sFile"
									type="file" class="form-control-file" id="sFile" /> <img
									id="sname" src="" width="100" class="mt-3"> <input
									type="hidden" value="1" id="check" name="check"> <input
									name="a_sname" id="a_sname" type="hidden"> <input
									name="s_ano" id="s_ano" type="hidden">
							</div>
							<div class="text-center mt-5">
								<button type="submit" type="button"
									class="btn btn-black btn-block" id="edit">변경</button>
								<input type="hidden" name="id" id="id" value="${AID}">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			/* 버튼 이벤트 */
	    	var scode = '${CODE}';
	  		if(scode == 'N'){
	  			$('#btn-1').removeClass('text-muted');
	  			$('#btn-1').addClass('selected');
	  		} else if(scode == 'Y'){
	  			$('#btn-2').removeClass('text-muted');
	  			$('#btn-2').addClass('selected');
	  		} else {
	  			$('#btn-0').removeClass('text-muted');
	  			$('#btn-0').addClass('selected');
	  		}
	  		
	  		/* 버튼 페이지 이동 */
	        $("#btn-0").click(function(){
	        	$(location).attr("href", "/www/adminrepo.mr");
	        })
	        
	        $("#btn-1").click(function(){
	        	$(location).attr("href", "/www/adminrepoSelected.mr?r_isokay=N");
	        })
	        
	        $("#btn-2").click(function(){
	        	$(location).attr("href", "/www/adminrepoSelected.mr?r_isokay=Y");
	        })
	        
	        /* 편집창 진입 */
			$('.processing').click(
					function() {
						var sno = $(this).attr('id');
						var rno = $(this).parent().parent().children('.rno')
								.text();
						var kind = $(this).parent().parent().children('.kind')
								.text();
						var detail = $(this).parent().parent().children(
								'.detail').text();

						$("#modal").modal("show");

						$("#r_no").val(rno);
						$("#repoKind").html(kind);
						$("#repoDetail").html(detail)

						$.ajax({
							url : "/www/repoDetail.mr",
							type : "post",
							dataType : "json",
							data : {
								sno : sno
							},
							success : function(data) {
								$('#v_name').val(data.v_name);
								$('#s_vno').val(data.s_vno);

								$('#s_title').val(data.s_title);
								$('#s_no').val(data.s_no);

								var sname = "/www/album/" + data.a_sname;
								$('#sname').attr('src', sname);
								$('#a_sname').val(data.a_sname);
								$('#s_ano').val(data.s_ano);

								$('#y_link').val(data.y_link);
								$('#y_no').val(data.y_no);

							},
							error : function() {
								alert('### 통신에러 ###');
							}
						});
					});
			
	  		/* 파일 미리보기 변경 */
			$('#sFile').change(function(e) {
				var tmp = URL.createObjectURL(e.target.files[0]);
				$('#sname').attr('src', tmp);
			});

	  		/* 신고 내용 처리 */
			$('#edit').click(function() {
				var fileCheck = $("#sFile").val();

				event.preventDefault();

				if (!fileCheck) {
					$('#check').val(0);
					/* 파일 업로드가 존재하지 않는 경우 */
					var queryString = $("#repoUpdate").serialize();

					$.ajax({
						type : "post",
						url : "/www/repoUpdate.mr",
						data : queryString,
						dataType : "json",
						success : function(data) {
							$("#modal").modal("hide");

							if (data == 1) {
								alert("수정을 완료했습니다.");
							} else {
								alert("수정을 실패했습니다. 다시 시도해주세요.");
							}
							location.reload();
						},
						error : function() {
							alert('### 통신 에러 ###');
						}
					});
				} else {
					/* 파일 업로드가 존재하는 경우*/
					var form = $('#repoUpdate')[0];

					var data = new FormData(form);

					$("#add").prop("disabled", true);

					$.ajax({
						type : "POST",
						enctype : 'multipart/form-data',
						url : "/www/repoUpdate.mr",
						data : data,
						processData : false,
						contentType : false,
						cache : false,
						timeout : 600000,
						success : function(data) {
							$("#modal").modal("hide");

							if (data == 1) {
								alert("파일 포함 수정을 완료했습니다.");
							} else {
								alert("파일 포함 수정을 실패했습니다. 다시 시도해주세요.");
							}
							$("#edit").prop("disabled", false);
							location.reload();
						},
						error : function(e) {
							alert("ERROR : ", e);
							$("#edit").prop("disabled", false);

						}
					});

				}
			})

		})
	</script>

</body>
</html>