<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<!-- Bootstrap CSS & theme -->
<link rel="stylesheet" href="/css/bootstrap-lux.css" />
<link rel="stylesheet" href="/css/bootstrap.custom.css" />
<link rel="stylesheet" href="/css/upload.css" />

<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<title>upload</title>
</head>

<body>
	<jsp:include page="nav.jsp" flush="false" />

	<form method="post" action="boardIn.mr" id="boardIn">
		<div class="container bg-primary" id="main">
			<div class="row form-group ml-2 mr-2">
				<div class="col custom-control custom-radio text-center">
					<input type="radio" id="love" name="b_emotion" class="custom-control-input" checked="" value="1" />
					<label class="custom-control-label" for="love">사랑</label>
				</div>
				<div class="col custom-control custom-radio text-center">
					<input type="radio" id="happy" name="b_emotion" class="custom-control-input" value="2" />
					<label class="custom-control-label" for="happy">기쁨</label>
				</div>
				<div class="col custom-control custom-radio text-center">
					<input type="radio" id="peaceful" name="b_emotion" class="custom-control-input" value="3" />
					<label class="custom-control-label" for="peaceful">평온</label>
				</div>
				<div class="col custom-control custom-radio text-center">
					<input type="radio" id="sad" name="b_emotion" class="custom-control-input" value="4" />
					<label class="custom-control-label" for="sad">슬픔</label>
				</div>
				<div class="col custom-control custom-radio text-center">
					<input type="radio" id="angry" name="b_emotion" class="custom-control-input" value="5" />
					<label class="custom-control-label" for="angry">분노</label>
				</div>
			</div>

			<div class="input-group">
				<input name="keywords" type="text" class="form-control bg-primary" id="keywords" placeholder="음악 제목을 입력해주세요" />
				<div class="input-group-append">
					<button class="btn btn-black" type="button" id="searchSong">SEARCH</button>
				</div>
			</div>

			<div class="row mb-3">
				<textarea class="form-control bg-primary" id="b_body" name="b_body" rows="10" placeholder="WRITE" style="resize: none;" ></textarea>
			</div>

			<input name="m_id" type="hidden" id="m_id" value="${SID}">
			<input name="b_sno" type="hidden" id="b_sno">
			<input name="b_vno" type="hidden" id="b_vno">
			<input name="b_yno" type="hidden" id="b_yno">
			<input name="b_ano" type="hidden" id="b_ano">

			<div class="row mb-3 d-flex justify-content-center">
				<button type="button" class="btn btn-black btn-block" id="boardWriteProc">WRITE</button>
			</div>
		</div>
	</form>

	<!-- first modal, search music -->
	<div class="modal" id="myModal1" data-toggle="modal">
		<div class="modal-dialog modal-lg">
			<div class="modal-content bg-primary">
				<!-- Modal body -->
				<div class="modal-body">
					<h1 class="white text-center mt-3 mb-3">SEARCH MUSIC</h1>
					<table class="table-sm table-hover white text-center" id="searchTable">
						<thead>
							<tr>
								<th style="width: 20%;">ALBUM</th>
								<th style="width: 20%;">VOCAL</th>
								<th style="width: 50%;">SONG</th>
								<th style="width: 5%;">LINK</th>
								<th style="width: 5%;">BUG</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="text-center">
						<button type="button" class="btn btn-black btn-block" id="more">찾으시는 노래가 없나요?</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<form id="addMusic" method="POST" action="/musicUpdate.mr" enctype="multipart/form-data">
		<!-- second modal, music add -->
		<div class="modal" id="myModal2" data-toggle="modal">
			<div class="modal-dialog">
				<div class="modal-content bg-primary">
					<!-- Modal body -->
					<div class="modal-body">
						<h1 class="white text-center mt-3 mb-3">ADD MUSIC</h1>
						<div class="text-white bg-primary mb-3">
							<label for="v_name">VOCAL</label>
							<div class="input-group">
								<input id="s_vno" type="hidden" name="s_vno" value="">
								<input name="v_name" type="text" class="form-control" id="v_name" placeholder="가수 이름을 입력해주세요" />
								<div class="input-group-append">
									<button class="btn btn-black" type="button" id="vocalSearch">Button</button>
								</div>
							</div>

							<div class="form-group">
								<label for="s_title">SONG</label>
								<input name="s_title" type="text" class="form-control" id="s_title" placeholder="노래 이름을 입력해주세요" />
							</div>
							<div class="form-group">
								<label for="y_link">YOUTUBE</label>
								<input name="y_link" type="text" class="form-control" id="y_link" placeholder="유튜브 링크를 입력해주세요" />
							</div>
							<div class="form-group">
								<label for="sFile">ALBUM COVER</label>
								<input name="sFile" type="file" class="form-control-file" id="sFile"/>
							</div>
							<div class="text-center mt-5">
								<button type="submit" type="button" class="btn btn-black btn-block" id="add">등록</button>
								<input type="hidden" name="id" id="id" value="${SID}">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- third modal, search music -->
	<div class="modal" id="myModal3" data-toggle="modal">
		<div class="modal-dialog">
			<div class="modal-content bg-primary">
				<!-- Modal body -->
				<div class="modal-body">
					<h1 class="white text-center mt-3 mb-3">SEARCH VOCAL</h1>
					<table class="table-sm table-hover white text-center" id="vocalResultTable">
						<thead>
							<tr>
								<th style="width: 20%;">원하시는 가수 이름을 클릭해주세요</th>
							</tr>
						</thead>
						<tbody>
						</tbody>
					</table>
					<div class="text-center">
						<input type="hidden" name="vocalResult" id="vocalResult" value="">
						<button type="button" class="btn btn-black btn-block" id="vocalUpdate">
							찾는 가수가 목록에 없나요?<br>새로운 가수로 등록하기
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- fourth modal, bug report -->
	<div class="modal" id="myModal4" data-toggle="modal">
		<div class="modal-dialog">
			<div class="modal-content bg-primary">
				<!-- Modal body -->
				<div class="modal-body">
					<form method="POST" action="" id="reportForm">
					<input type="hidden" name="id" value="${SID}">
					<input type="hidden" name="r_problem" id="r_problem" value="">
						<h1 class="white text-center mt-3 mb-3">BUG REPORT</h1>
						<p class="text-center mb-5">musicolor 는 회원들의 적극적인 참여로 운영됩니다.<br>신고해주시면 운영자 확인 후 처리하겠습니다.</p>
						  	<h4 class="white text-center">어떤 항목이 잘못되었나요?</h4>
							<div class="row form-group ml-2 mr-2 white">
								<div class="col custom-control custom-radio text-center">
									<input type="radio" name="r_kind" class="custom-control-input" value="album" id="album"/>
									<label class="custom-control-label" for="album">ALBUM</label>
								</div>
								<div class="col custom-control custom-radio text-center">
									<input type="radio" name="r_kind" class="custom-control-input" value="vocal" id="vocal"/>
									<label class="custom-control-label" for="vocal">VOCAL</label>
								</div>
								<div class="col custom-control custom-radio text-center">
									<input type="radio" name="r_kind" class="custom-control-input" value="song" id="song"/>
									<label class="custom-control-label" for="song">SONG</label>
								</div>
								<div class="col custom-control custom-radio text-center">
									<input type="radio" name="r_kind" class="custom-control-input" value="youtube" id="youtube"/>
									<label class="custom-control-label" for="youtube">YOUTUBE</label>
								</div>
							</div>
						  
						  <h4 class="white text-center ml-2 mr-2 mt-5">자세한 신고 내용을 작성해주세요.</h4>
						  <div class="form-group mb-5">
						  	<input type="text" class="w-100" name="r_detail" id="r_detail">
						  </div>
						<button type="button" class="btn btn-black btn-block" id="report">
							신고 제출
						</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		$(function() {
			/* 감정 라디오 클릭시 배경색 전환
			$('input[type=radio][name=b_emotion]').change(function() {
			    if (this.value == '1') {
			        alert("Allot Thai Gayo Bhai");
			    }
			    else if (this.value == '2') {
			        alert("배경색 전환");
			        $("body").attr("id","sadbody");
			    }
			    else if (this.value == '3') {
			        alert("Transfer Thai Gayo");
			    }
			    else if (this.value == '4') {
			        alert("Transfer Thai Gayo");
			    }
			    else if (this.value == '5') {
			        alert("Transfer Thai Gayo");
			    }
			});*/
			
			/* 노래 제목 검색 */
			$("#searchSong").click(function() {
				$("#myModal1").modal("show");
				
				var keywords = $('#keywords').val();

								$.ajax({
									url : "/searchSong.mr",
									type : "post",
									dataType : "json",
									data : {
										keywords : keywords
									},
									success : function(data) {
										$('#searchTable > tbody').html('');
										
										for ( var i = 0 in data) {
											$('#searchTable').append('<tr id="' + data[i].s_no + '"><td><img src="/album/'
												+ data[i].a_sname
												+ '" width="50"></td><td class="vocal">'
												+ data[i].v_name
												+ '</td><td class="song">'
												+ data[i].s_title
												+ '</td><td><a href="https://www.youtube.com/watch?v='
												+ data[i].y_link
												+ '" target="_blank"><i class="fab fa-youtube white"></i></a>'
												+'</td><td id="' 
												+ data[i].s_no
												+ '" class="bug"><i class="fas fa-bug white"></i>'
												+ '<input type="hidden" name="savevno" id="savevno' + data[i].s_no + '" value="' + data[i].s_vno + '">'
												+ '<input type="hidden" name="savevno" id="saveno' + data[i].s_no + '" value="' + data[i].s_no + '">'
												+ '<input type="hidden" name="savevno" id="saveyno' + data[i].s_no + '" value="' + data[i].y_no + '">'
												+ '<input type="hidden" name="savevno" id="saveano' + data[i].s_no + '" value="' + data[i].s_ano + '">'
												+ '</td></tr>');
											}
									},
									error : function() {
										alert('### 통신에러 ###');
											}
								});
							});
		    
			/* 검색한 노래 정보 삽입 */
			$(document).off().on("click", "#searchTable .song", function() {
				$("#myModal1").modal("hide");
				
				var keywords = $(this).text();
				var id = $(this).parent().attr('id');
				
				var savevno = parseInt($('#savevno' + id).val());
				var saveno = parseInt($('#saveno' + id).val());
				var saveyno = parseInt($('#saveyno' + id).val());
				var saveano = parseInt($('#saveano' + id).val());

				$('#keywords').val(keywords);
				$('#b_sno').val(saveno);
				$('#b_vno').val(savevno);
				$('#b_yno').val(saveyno);
				$('#b_ano').val(saveano);
			})
			
			/* bug 신고 */
		    $(document).on("click", "#searchTable .bug", function() {
		    	var tmp = parseInt($(this).attr('id'));
		    	
		    	$("#myModal1").modal("hide");
		    	$("#myModal4").modal("show");
		    	
		    	$('#r_problem').val(tmp);
		    })
		    
		    /* bug 신고 접수 */
		   $('#report').click(function(){
		    	var queryString = $("#reportForm").serialize();
		    	 
		        $.ajax({
		            type : "post",
		            url : "/reportProc.mr",
		            data : queryString,
		            dataType : "json",
		            success : function(data) {
		            	if (data == 1) {
		                	alert('신고 접수 완료');
		                	$("#myModal4").modal("hide");
		                	$('#r_detail').val("");
		                	$("#album").prop('checked', false); 
		                	$("#song").prop('checked', false); 
		                	$("#vocal").prop('checked', false); 
		                	$("#youtube").prop('checked', false); 
		                	
		            	}
		            },
		            error: function() {
		            	alert('### 통신 에러 ###');
		            }
		        });
		    })

			/* 노래 추가 창 진입 */
			$("#more").click(function() {
				$("#myModal1").modal("hide");
				$("#myModal2").modal("show");
			});

			/* 보컬 검색 */
			$("#vocalSearch").click(function() {
				var vocal = $('#v_name').val();
				$.ajax({
					url : "/vocalSearch.mr",
					type : "post",
					dataType : "json",
					data : {
						v_name : vocal
					},
					success : function(data) {
						$('#vocalResultTable > tbody').html('');
						
						for ( var i = 0 in data) {
							$('#vocalResultTable').append(
								'<tr><td id="' + data[i].s_vno + '">'
								+ data[i].v_name
								+ '</td></tr>');
						}
					},
					error : function() {
						alert('### 통신에러 ###');
					}
				});

				$("#myModal2").modal("hide");
				$("#myModal3").modal("show");
				$('#vocalResult').val(vocal);
			});

			/* 보컬 추가 준비 */
			$(document).on("click", "#vocalResultTable tr td", function() {
				var vocal = $(this).text();
				var vocalNo = $(this).attr('id');
				
				$("#myModal3").modal("hide");
				$("#myModal2").modal("show");

				$('#v_name').val(vocal);
				$('#s_vno').val(vocalNo);
			});

			/* 보컬 추가 */
			$('#vocalUpdate').click(function() {
					
				var vocal = $('#vocalResult').val();
				$.ajax({
					url : "/vocalUpdate.mr",
					type : "post",
					dataType : "json",
					data : {
						v_name : vocal
					},
					success : function(data) {
						$("#myModal3").modal("hide")
						$("#myModal2").modal("show")

						$('#v_name').val(data.v_name);
						$('#s_vno').val(data.s_vno);
					},
					error : function() {
						alert('### 통신 에러 ###');
					}
				});
			});
			
			/* 게시물 작성 */
			$('#boardWriteProc').click(function() {
				/* 폼 항목 모두 채웠는지 확인 */
				if($("#m_id").val() == "") {
					alert("정상 로그인 되지 않은 사용자입니다.");
					$(location).attr("href", "/bfMain.mr");
					return false;
				};
				
				if($("#keywords").val() == "") {
					alert("노래를 입력해주세요.");
					return false;
				};
				
				if($("#b_sno").val() == "") {
					alert("노래를 검색 후 입력해주세요.");
					return false;
				};
				
				if($("#b_body").val() == "") {
					alert("게시물 내용을 입력해주세요.");
					return false;
				};
				
				
				$('#boardIn').submit();
			});
			
			/* 파일 업로드 비동기 처리 */
			$('#add').click(function(){
				/* 폼 항목 모두 채웠는지 확인 */
				if($("#id").val() == "") {
					alert("정상 로그인 되지 않은 사용자입니다.");
					$(location).attr("href", "/bfMain.mr");
					return false;
				};
				
				if($("#v_name").val() == "") {
					alert("가수를 입력해주세요.");
					return false;
				};
				
				if($("#s_vno").val() == "") {
					alert("가수를 검색 후 입력해주세요.");
					return false;
				};
				
				if($("#s_title").val() == "") {
					alert("노래를 입력해주세요.");
					return false;
				};
				
				if($("#y_link").val() == "") {
					alert("유튜브를 입력해주세요.");
					return false;
				};
				
				if($("#sFile").val() == "") {
					alert("앨범을 첨부해주세요.");
					return false;
				};
				
				
		        event.preventDefault();

		        var form = $('#addMusic')[0];

		        var data = new FormData(form);

		        $("#add").prop("disabled", true);

		        $.ajax({
		            type: "POST",
		            enctype: 'multipart/form-data',
		            url: "/musicUpdate.mr",
		            data: data,
		            processData: false,
		            contentType: false,
		            cache: false,
		            timeout: 600000,
		            success: function (data) {
			   			$("#myModal2").modal("hide");
						
						$('#keywords').val(data.s_title);
						$('#b_sno').val(data.s_no);
						$('#b_vno').val(data.s_vno);
						$('#b_yno').val(data.y_no);
						$('#b_ano').val(data.s_ano);
						
		                $("#btnSubmit").prop("disabled", false);

		            },
		            error: function (e) {
		                alert("ERROR : ", e);
		                $("#btnSubmit").prop("disabled", false);

		            }
		        });
			});
		});
	</script>
</body>
</html>
