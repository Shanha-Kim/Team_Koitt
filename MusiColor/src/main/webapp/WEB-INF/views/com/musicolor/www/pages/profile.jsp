
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>개인 프로필 페이지</title>

<!-- Bootstrap CSS & theme -->

<link rel="stylesheet" href="/www/css/bootstrap-lux.css">
<link rel="stylesheet" href="/www/css/bootstrap.custom.css">
<link rel="stylesheet" href="/www/css/random.css">

<style>
body {
	
}

button {
	margin-top: 130px;
}

.col {
	position: relative;
	width: 350px;
	height: 300px;
	margin-top: -180px;
	margin-left: 500px;
}

.imgBox {
	width: 150px;
	height: 150px;
	border: 1px solid white;
	margin-left: 250px;
	margin-top: 100px;
}

.imgBox img {
	width: 100%;
	height: 100%;
}

}
header {
	border: 1px solid white;
	margins-top: 20px;
	margin: 0 auto;
}

header * {
	position: relative;
}

.pro {
	position: absolute;
	margin-top: -90px;
}

h6 {
	color: white;
}

.imggride {
	justify-content: space-between;
	position: relative;
	margin: 0 auto;
}

.imggride img {
	padding: 10px;
	width: 300px;
	height: 300px;
}

.menubar {
	margin-top: -50px;
	margin-left: 400px;
	margin-bottom: 100px;
}

#logo {
	width: 200px;
	height: 150px;
	margin-top: 100px;
}

.main {
	height: auto;
}

.textbox {
	margin-top: 10px;
	padding: 10px;
}

#profile {
	padding: 15px;
}

.blur {
	filter: blur(8px);
	-webkit-filter: blur(8px);
}

.modal-header {
	
}

.click1 {
	background-color: blue;
}

.click2 {
	background-color: white;
}

.modal {
	text-align: center;
	padding: 0 !important;
}

.modal:before {
	content: '';
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	margin-right: -4px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	overflow-y: initial !important
}

.modal-body {
	height: 100%;
	overflow-y: auto;
}

/* 
  #fw2button {
  top: 20%;
  width:600px;
  height:750px;
  margin-top: 50px;
} */
</style>

</head>
<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />
	<div class="container menubar">
		<div class="row">
			<div class="col-1"></div>
			<div class="col-10 main">
				<div class="contant">

					<br>
					<img src="/www/upload/${VO.sname}" id="logo">

					<div class="menubar">
						<button type="button" id="profile" class="btn btn-info"
							style="display: block;">프로필 편집</button>
							<br>
						<button type="button" class="btn btn-warning">게시물 :
							${CNT}</button>
						<button type="button" id="fw1btn" class="btn btn-secondary">팔로워
							: ${CNT1}</button>
						<button type="button" id="fw2btn" class="btn btn-success">팔로우
							: ${CNT2}</button>
						<button type="button" id="likedbtn" class="btn btn-danger">내가
							좋아요한 게시물</button>

						<button type="button" class="btn btn-outline-secondary"
							id="unlock" data-id="${ISSHOW}">계정을 다시 활성화</button>

					</div>
				</div>
				<div class="textbox">
					<div class="form-group">
						<label class="control-label" for="disabledInput">자기소개 한 줄
						</label> <input disabled="" class="form-control" id="disabledInput"
							type="text" value="${IVO.m_about}">
					</div>
				</div>
				<hr>

				<!-- 				<div class="imggride"> -->
				<%-- 					<c:forEach var="data" items="${LIST}"> --%>
				<%-- 						<img src="/www/upload/${data.sname}"> --%>
				<%-- 					</c:forEach> --%>
				<!-- 				</div> -->


			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<div class="container menubar" id="main">
		<!-- 앨범 이미지 -->
		<div class="row">
			<c:forEach var="data" items="${LIST}" begin="0" end="2">
				<div class="col-4 big-square">
					<div class="square small-${data.b_emotion}" id="${data.b_no}">
						<img class="album" src="/www/album/${data.sname}" />
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="row">
			<c:forEach var="data" items="${LIST}" begin="3" end="5">
				<div class="col-4 big-square">
					<div class="square small-${data.b_emotion}" id="${data.b_no}">
						<img class="album" src="/www/album/${data.sname}" />
					</div>
				</div>
			</c:forEach>
		</div>

		<div class="row">
			<c:forEach var="data" items="${LIST}" begin="6" end="8">
				<div class="col-4 big-square">
					<div class="square small-${data.b_emotion}" id="${data.b_no}">
						<img class="album" src="/www/album/${data.sname}" />
					</div>
				</div>
			</c:forEach>
		</div>

		<!-- modal, content detail -->
		<div class="modal" id="myModal1">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content bg-primary">
					<!-- Modal body -->
					<div class="modal-body">
						<div class="row">
							<!-- Modal left, 일정 크기 이상 작아지면 안보이는 유튜브 -->
							<div class="col desktop-youtube"
								style="padding: 10px; border-right: 1px solid #282828;">
								<div style="height: 25%; width: 100%;"></div>
								<div class="youtube text-left" style="height: 50%; width: 100%;">
									<iframe src="https://www.youtube.com/embed/4l2jpzPDtuQ"
										frameborder="0"
										allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
										allowfullscreen></iframe>
								</div>
							</div>
							<!-- Modal right -->
							<div class="col text-left" style="padding: 10px;">
								<h3 class="card-header" style="padding: 10px;">
									<img class="profile" src="/www/img/profile1.jpg" />USERNAME
								</h3>
								<!-- 일정 크기 이상 작아지면 보이는 유튜브-->
								<div class="youtube mobile-youtube mb-3">
									<iframe src="https://www.youtube.com/embed/4l2jpzPDtuQ"
										frameborder="0"
										allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
										allowfullscreen></iframe>
								</div>
								<div class="card-body" style="padding: 0px;">
									<span class="ml-auto"><i class="far fa-heart"></i> <strong>5
											likes</strong></span>
									<h6 class="card-subtitle text-muted mb-2 mt-2">Dua Lipa -
										New Rules</h6>
									<div class="body-scroll mb-3">
										<p class="card-text">Lorem Ipsum is simply dummy text of
											the printing and typesetting industry. Lorem Ipsum has been
											the industry's standard dummy text ever since the 1500s, when
											an unknown printer took a galley of type and scrambled it to
											make a type specimen book. It has survived not only five
											centuries, but also the leap into electronic typesetting,
											remaining essentially unchanged. It was popularised in the
											1960s with the release of Letraset sheets containing Lorem
											Ipsum passages, and more recently with desktop publishing
											software like Aldus PageMaker including versions of Lorem
											Ipsum.</p>
									</div>
								</div>
								<!-- comment -->
								<div class="bg-primary comment-scroll">
									<ul class="list-group list-group-flush p-0 m-p">
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Cras justo odio</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Dapibus ac facilisis in</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Vestibulum at eros</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Cras justo odio</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Dapibus ac facilisis in</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Vestibulum at eros</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Cras justo odio</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Dapibus ac facilisis in</li>
										<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong>USERNAME</strong>
											Vestibulum at eros</li>
									</ul>
								</div>
								<form class="pt-3" method="POST" action="#">
									<input class="comment-write-dark" type="text"
										placeholder="댓글을 입력해주세요" />
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">계정 활성화</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>계정을 다시 활성화 시키겠습니까?</h4>
					<br>
					<button class="btn btn-primary btn-block" id="unlock2">확인</button>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>

				</div>
			</div>
		</div>
	</div>

	<!-- 팔로워 버튼  모달창 -->
	<div class="modal" id="fw1button">
		<div class="modal-dialog" role="document" style="width: 44%;">
			<div class="modal-content" style="overflow: scroll; height: 400px;">
				<div class="modal-header">
					<h5 class="modal-title">팔로워 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<span aria-hidden="true">&times;</span>

					<div class="canslebtn"></div>
				</div>
				<div class="modal-body">


					<c:forEach var="data" items="${LIST1}">
						<div class="d-flex">
							<!-- 이미지 박스 -->
							<div class="" id="${data.m_id}"
								style="width: 50px; height: 50px; overflow: hidden; position: relative; display: inline-block; border-radius: 50%;">
								<!-- 이미지 -->
								<img class="" src="/www/profile/${data.m_name}"
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;" />
							</div>
							<!-- 아이디, 버튼 영역 -->
							<div style="display: inline-block; width: 100%;">
								<span class="fname1">${data.m_id}</span>
								<c:if test="${data.m_isban == 0}">
									<button type="button" class="canslebtn1 click1"
										style="background-color: blue; float: right;">팔로우</button>
								</c:if>
								<c:if test="${data.m_isban == 1}">
									<button type="button" class="canslebtn1 click2"
										style="float: right;">팔로우</button>
								</c:if>
								<c:if test="${data.m_isban == 2}">
									<button type="button" class="canslebtn1 click2"
										style="float: right;">팔로우</button>
								</c:if>
							</div>
						</div>
					</c:forEach>
					<br>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 	팔로잉 모달창 -->
	<div class="modal" id="fw2button">
		<div class="modal-dialog" role="document" style="width: 44%;">
			<div class="modal-content" style="overflow: scroll; height: 400px;">
				<div class="modal-header">
					<h5 class="modal-title">팔로잉 목록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close"></button>
					<span aria-hidden="true">&times;</span>

					<div class="canslebtn"></div>
				</div>
				<div class="modal-body">
					<c:forEach var="data" items="${LIST2}">
						<div class="d-flex">
							<!-- 이미지 박스 -->
							<div class="" id="${data.m_id}"
								style="width: 50px; height: 50px; overflow: hidden; position: relative; display: inline-block; border-radius: 50%;">
								<!-- 이미지 -->
								<img class="" src="/www/profile/${data.m_name}"
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;" />
							</div>
							<!-- 아이디, 버튼 영역 -->
							<div style="display: inline-block; width: 100%;">
								<span class="fname2">${data.m_id}</span>

								<button type="button" class="canslebtn2"
									style="background-color: white; float: right;">팔로우</button>
							</div>
						</div>
					</c:forEach>
					<br>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->


	<!-- Font Awesome 5 -->
	<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->
	<!--  <script type="text/javascript" src="/www/js/jquery-3.4.1.min.js"></script>  -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$(document)
									.ready(
											function() {
												$('head')
														.append(
																'<style type="text/css">.modal .modal-body {max-height: '
																		+ ($(
																				'body')
																				.height() * .8)
																		+ 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');
											});

							var sid = '<c:out value="${SID}"/>';

							var isshow = $("#unlock").attr('data-id');
							if (isshow == 'Y') { /* 계정활성화 되었을때 */

								$("#unlock").css('display', 'none');
								$('#main').removeClass('blur');

							} else {

								$('#unlock').css('display', 'block');
								$('#main').addClass('blur');

							}
							$('#profile').click(function() {
								$(location).attr('href', '/www/profconfig.mr');

							});

							$('#likedbtn').click(function() {
								$(location).attr('href', '/www/likedlist.mr');

							});

							$('.profIn')
									.change(
											function(e) {
												var tmp = URL
														.createObjectURL(e.target.files[0]);
												$('#profImg').attr('src', tmp);
											});

							$("#unlock").click(function() {
								$('#myModal').modal();

							});

							$('#unlock2').click(function() {
								$(location).attr('href', '/www/unlock.mr');
							});

							$("#fw1btn").click(function() {
								$('#fw1button').modal();
							});

							$("#fw2btn").click(function() {
								$('#fw2button').modal();
							});

						});

		//1.팔로워 ajax
		var sid = '<c:out value="${SID}"/>';

		$(document).on("click", '.canslebtn1', function() {
			var f_name = $(this).prev().html();

			console.log(sid + f_name);

			$.ajax({

				url : "/www/followercheck.mr",
				type : "post",
				dataType : "json",
				data : {
					m_id : sid,
					m_name : f_name
				},

				success : function(vo) {
					alert("성공했습니다");
					var now = $(this).attr("class");
					var idx = now.indexOf(' ');
					var now2 = now.substring(idx + 1);

					if (now2 == 'click1') {
						$(this).removeClass('click1');
						$(this).addClass('click2');

					} else {
						$(this).removeClass('click2');
						$(this).addClass('click1');

					}

				},
				error : function() {
					alert('### 통신 에러 ###');
				}
			});
		});

		//팔로잉 ajax

		var sid = '<c:out value="${SID}"/>';

		$(document).on("click", '.canslebtn2', function() {
			var f_name = $(this).prev().html();

			console.log(sid + f_name);

			$.ajax({
				url : "/www/followercheck.mr",
				type : "post",
				dataType : "json",
				data : {
					m_id : sid,
					m_name : f_name
				},
				success : function(vo) {

					alert("성공했습니다.");
					/* 	
						var now1 = $(this).attr("class");
						 
							var idx1= now1 indexOf(' ');
							var now3= now1.substring(idx1+1);
							
							if(now3 == 'click2' ){
						
								var now3 =$("click1");
								$(this).removeclass('click2');
								$(this).addclass('click1');
						 	
							}else{
									
									$(this).removeclass('click1');
									$(this).addclass('click2');
									
								}
					 */

				},
				error : function() {
					alert('### 통신 에러 ###');
				}
			});

		});
	</script>
	<script>
		$(function() {
			$(".square").click(function() {
				$("#myModal1").modal("show") //앨범 이미지 누르면 모달창 열림
			})
		});
	</script>

</body>
</html>