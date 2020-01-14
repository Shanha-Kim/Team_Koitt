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

<link rel="stylesheet" href="/css/bootstrap-lux.css">
<link rel="stylesheet" href="/css/bootstrap.custom.css">
<link rel="stylesheet" href="/css/random.css">

<style>
body {
	
}

button {
	margin-top: 130px;
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

.member {
	display: inline-block;
	position: relative;
	margin-top: 160px;
}

#logo {
	width: 200px;
	height: 150px;
	margin-top: 60px;
}

.main {
	height: auto;
}

.textbox {
	margin-top: 80px;
	padding: 150px;
}

#profile {
	padding: 15px;
}

.blur {
	filter: blur(8px);
	-webkit-filter: blur(8px);
}

.imglogobox {
	display: flex;
	float: right;
}

.modal-header {
	
}

.click1 {
	background-color: blue;
}

.click2 {
	background-color: white;
}

.colorimg {
	border: 6px solid transparent;
	border-radius: 50%;
	background-image: linear-gradient(white, white),
		radial-gradient(circle at top left, #11998e, #191919, #38ef7d);
	background-origin: border-box;
	background-clip: content-box, border-box;
	display: inline-block;
}

.idtext {
	margin-top: 80px;
}

/* 버튼 테두리 색깔 넣기  */
.small-1 {
	border: 4px solid transparent;
	border-image: linear-gradient(235deg, #ee9ca7, #191919, #ffdde1);
	border-image-slice: 1;
}

.small-2 {
	border: 4px solid transparent;
	border-image: linear-gradient(235deg, #fb872b, #191919, #d9e021);
	border-image-slice: 1;
}

.small-3 {
	border: 4px solid transparent;
	border-image: linear-gradient(235deg, #11998e, #191919, #38ef7d);
	border-image-slice: 1;
}

.small-4 {
	border: 4px solid transparent;
	border-image: linear-gradient(235deg, #24c6dc, #191919, #514a9d);
	border-image-slice: 1;
}

.small-5 {
	border: 4px solid transparent;
	border-image: linear-gradient(235deg, #ff5e62, #191919, #b20a2c);
	border-image-slice: 1;
}


</style>

</head>
<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />


	<div class="idtext">
		<p>
		<h1 class="text-muted text-center" id="explain">${ID} profile
			page's</h1>
		<p class="mb-0">
			<a href="#" class="alert-link"></a>
		</p>

	</div>

	<div class="container menubar">
		<div class="row">

			<div class="col-1"></div>
			<div class="col-10 main">

				<div class="imglogobox">
					<img class="colorimg"
						style="border-radius: 100%; width: 20%; height: 20%; margin-right: 50px;"
						src="/profile/${VO.sname}" id="logo"> <br>
					<div class="member">
						<div class="form-group" id="newbar">
							<c:if test="${ID == SID}">
								<button type="button" id="profile"
									class="btn btn-primary text-muted "
									style="border: 4px solid transparent; border-image: linear-gradient(235deg, #ee9ca7, #191919, #ffdde1); border-image-slice: 1;">프로필
									편집</button>
							</c:if>
							<br>
							<div class="btn-group btn-block mb-5">
								<button type="button" class="btn btn-primary text-muted"
									style="border: 4px solid transparent; border-image: linear-gradient(235deg, #fb872b, #191919, #d9e021); border-image-slice: 1;">
									게시물
									: ${CNT}</button>
								<button type="button" id="fw1btn"
									class="btn btn-primary text-muted"
									style="border: 4px solid transparent; border-image: linear-gradient(235deg, #11998e, #191919, #38ef7d); border-image-slice: 1;">
									팔로워
									: ${CNT2}</button>
								<button type="button" id="fw2btn"
									class="btn btn-primary text-muted"
									style="border: 4px solid transparent; border-image: linear-gradient(235deg, #24c6dc, #191919, #514a9d); border-image-slice: 1;">
									팔로우
									: ${CNT1}</button>

								<c:if test='${SID != ID}'>
									<c:if test='${NYCK != "Y"}'>
										<button type="button" id="yesfollow"
											class="btn btn-primary text-muted" data="${ID}" style="border: 4px solid transparent; border-image: linear-gradient(235deg, #ff5e62, #191919, #b20a2c); border-image-slice: 1;">팔로우하기
										</button>
									</c:if>
									<c:if test='${NYCK == "Y" }'>
										<button type="button" id="nofollow"
											class="btn btn-primary text-muted" data="${ID}">
											팔로우취소</button>
									</c:if>
								</c:if>

								<c:if test="${ID == SID}">
									<button type="button" id="likedbtn"
										class="btn btn-primary text-muted"
										style="border: 4px solid transparent; border-image: linear-gradient(235deg, #ff5e62, #191919, #b20a2c); border-image-slice: 1;">내가
										좋아요한 게시물</button>
								</c:if>
								<button type="button" class="btn btn btn-primary text-muted"
									id="unlock" data-id="${ISSHOW}">계정을 다시 활성화</button>
							</div>
						</div>
					</div>
				</div>
				<br>
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
				<%-- 						<img src="/upload/${data.sname}"> --%>
				<%-- 					</c:forEach> --%>
				<!-- 				</div> -->
			</div>
			<div class="col-1"></div>
		</div>
	</div>

	<div class="container menubar" id="main" style="margin-top: -100px">
		<!-- 앨범 이미지 -->
		<div class="row">
			<c:forEach var="data" items="${LIST}">
				<div class="col-4 big-square">
					<div class="square small-${data.b_emotion}" id="${data.b_no}">
						<div class="half-square" style="height: 100%;">
							<img class="album" src="/album/${data.sname}" />
						</div>
						<p class="half-square text-center align-middle"
							style="background-color: rgba(0, 0, 0, 0.5); bottom: 0; color: white;">@${SID}</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>


	<!-- 계정 활성화 모달 창  -->
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
	<div class="modal" id="fw1button" style="margin-top: 200px;">
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
							<div class="othersprofile" id="${data.m_id}"
								style="width: 50px; height: 50px; overflow: hidden; position: relative; display: inline-block; border-radius: 50%;">
								<!-- 이미지 -->
								<img class="" src="/profile/${data.m_name}"
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;" />
							</div>
							<!-- 아이디, 버튼 영역 -->
							<div style="display: inline-block; width: 100%;">
								<a href="/profilelist.mr?m_id=${data.m_id}" data="${data.m_id}">
									<span class="fname1">${data.m_id}</span>
								</a>
								<c:if test="${data.m_isban eq 0}">
									<button type="button" class="canslebtn1 click1"
										style="float: right;">팔로우</button>
								</c:if>

								<c:if test="${data.m_isban ne 0}">
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
	<div class="modal" id="fw2button" style="margin-top: 200px;">
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
								<img class="" src="/profile/${data.m_name}"
									style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; object-fit: cover;" />
							</div>
							<!-- 아이디, 버튼 영역 -->
							<div style="display: inline-block; width: 100%;">
								<a href="/profilelist.mr?m_id=${data.m_id}" data="${data.m_id}">
									<span class="fname2">${data.m_id}</span>
								</a>
								<c:if test="${data.m_isban eq 0}">
									<button type="button" class="canslebtn2 click1"
										style="float: right;">팔로우</button>
								</c:if>
								<c:if test="${data.m_isban ne 0}">
									<button type="button" class="canslebtn2 click2"
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
	<!-- 팔로워 취소 확인 모달창 -->
	<div class="modal" id="followccheck" style="margin-top: 200px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Music color</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>팔로워를 취소 하겠습니까?</h4>
					<br>
					<button class="btn btn-primary btn-block" id="fcansle">확인</button>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>

				</div>
			</div>
		</div>
	</div>
	<!-- 팔로워 다시 걸기 확인 모달창  -->
	<div class="modal" id="followacheck" style="margin-top: 200px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Music color</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4 id="addid"></h4>
					<br>
					<button class="btn btn-primary btn-block" id="addagin">확인</button>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>

				</div>
			</div>
		</div>
	</div>



	<!-- 상대방 홈페이지에서 팔로워 걸기 모달창  -->

	<div class="modal" id="othersaddfollow" style="margin-top: 200px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Music color</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>팔로워를 추가 하겠습니까?</h4>
					<br>
					<button class="btn btn-primary btn-block" id="yesconform">확인</button>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>

				</div>
			</div>
		</div>
	</div>

	<!-- 상대방 홈페이지에서 팔로워 취소하기 모달창 -->
	<div class="modal" id="otherscanslefollow" style="margin-top: 200px;">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Music color</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>팔로워를 취소 하겠습니까?</h4>
					<br>
					<button class="btn btn-primary btn-block" id="noconform">확인</button>
					<button class="btn btn-secondary btn-block" data-dismiss="modal"
						aria-label="Close">취소</button>

				</div>
			</div>
		</div>
	</div>



	<!-- modal, content detail -->
	<div class="modal" id="myModal0">
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
								<iframe id="ylink1" src="" frameborder="0"
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
						</div>
						<!-- Modal right -->
						<div class="col text-left" style="padding: 10px;">
							<h3 class="card-header"
								style="padding: 10px; display: flex; justify-content: space-between;">
								<span id="mid"></span><span></span><span
									class="postmodi my-auto">···</span>
							</h3>
							<!-- 일정 크기 이상 작아지면 보이는 유튜브-->
							<div class="youtube mobile-youtube mb-3">
								<iframe id="ylink2" src="" frameborder="0"
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
							<div class="card-body" style="padding: 0px;">
								<span class="ml-auto"><i id="heart" class="far fa-heart"></i><span
									id="blike"></span></span>
								<h6 id="stitle" class="card-subtitle text-muted mb-2 mt-2"></h6>
								<div class="body-scroll mb-3">
									<p id="bbody" class="card-text"></p>
								</div>
							</div>
							<!-- comment -->
							<div class="bg-primary comment-scroll">
								<ul id="comt" class="list-group list-group-flush p-0 m-p">
									<!--                     <li data-cno="100000000001"  data-user="rmccuish5" class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">USERNAME</strong> Cras justo odio</li> -->
								</ul>
							</div>
							<div class="pt-3">
								<input id="c_body" class="comment-write-dark" type="text"
									placeholder="댓글을 입력해주세요" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- modal 신고, 삭제 -->
	<div class="modal" id="myModal1">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content bg-light rounded">
				<!-- Modal body -->
				<div id="delproc" class="modal-body"
					style="border-bottom: 0.5px solid black;">
					<h5 class="text-center">
						삭제
						</h4>
				</div>
				<div class="modal-body">
					<h5 class="text-center out1">
						취소
						</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal2">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content bg-light rounded">
				<!-- Modal body -->
				<div id="decproc" class="modal-body"
					style="border-bottom: 0.5px solid black;">
					<h5 class="text-center ">
						신고
						</h4>
				</div>
				<div class="modal-body">
					<h5 class="text-center out1">
						취소
						</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal3">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content bg-light rounded">
				<!-- Modal body -->
				<div id="delproc2" class="modal-body"
					style="border-bottom: 0.5px solid black;">
					<h5 class="text-center">
						삭제
						</h4>
				</div>
				<div class="modal-body">
					<h5 class="text-center out1">
						취소
						</h4>
				</div>
			</div>
		</div>
	</div>
	<div class="modal" id="myModal4">
		<div class="modal-dialog modal-dialog-centered modal-lg">
			<div class="modal-content bg-light rounded">
				<!-- Modal body -->
				<div id="decproc2" class="modal-body"
					style="border-bottom: 0.5px solid black;">
					<h5 class="text-center ">
						신고
						</h4>
				</div>
				<div class="modal-body">
					<h5 class="text-center out1">
						취소
						</h4>
				</div>
			</div>
		</div>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->


	<!-- Font Awesome 5 -->
	<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" /> -->
	<!--  <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>  -->

	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script>
		var f_name = '';
		var sid = '${SID}';

		function setFname(data) {
			f_name = data;
		}

		$(function() {

			$('head')
					.append(
							'<style type="text/css">.modal .modal-body {max-height: '
									+ ($('body').height() * .8)
									+ 'px;overflow-y: auto;}.modal-open .modal{overflow-y: hidden !important;}</style>');

			var isshow = $("#unlock").attr('data-id');
			if (isshow == 'Y') { /* 계정활성화 되었을때 */

				$("#unlock").css('display', 'none');
				$('#main').removeClass('blur');

			} else {

				$('#unlock').css('display', 'block');
				$('#main').addClass('blur');

			}
			$('#profile').click(function() {
				$(location).attr('href', '/profconfig.mr');

			});

			$('#likedbtn').click(function() {
				$(location).attr('href', '/likedlist.mr');

			});

			$('.profIn').change(function(e) {
				var tmp = URL.createObjectURL(e.target.files[0]);
				$('#profImg').attr('src', tmp);
			});

			$("#unlock").click(function() {
				$('#myModal').modal();

			});

			$('#unlock2').click(function() {
				$(location).attr('href', '/unlock.mr');
			});

			$("#fw1btn").click(function() {
				$('#fw1button').modal();
			});

			$("#fw2btn").click(function() {
				$('#fw2button').modal();
			});

			$("#nofollow").click(function() {
				$('#otherscanslefollow').modal();

			});

			$(".click1").click(function() {
				var thisbtn = $(this);
				$("#followccheck").modal();
				var tmp = $(this).prev().attr("data");

				var amu1 = $(this).attr('class');

				// 팔로잉 cansle ajax

				$(document).on("click", "#fcansle", function() {
					setFname(tmp);
					var sid = '${SID}';
					$.ajax({
						url : "/followercheck.mr",
						type : "post",
						dataType : "json",
						data : {
							m_id : sid,
							m_name : f_name
						},
						success : function(vo) {
							$('#followccheck').modal("hide");

							var idx1 = amu1.indexOf(' ');
							var now3 = amu1.substring(idx1 + 1);

							if (now3 == 'click2') {
								thisbtn.removeClass('click2');
								thisbtn.addClass('click1');
							} else {
								thisbtn.removeClass('click1');
								thisbtn.addClass('click2');
							}
						},
						error : function() {
							alert('### 통신 에러 ###');
						}
					});
				});
			});

			$(".click2").click(function() {
				var itm = $(this);
				/* alert('### a : ' + itm.siblings().eq(0).attr('data')); */
				var getid = $(this).prev().attr("data");

				var thisbtn1 = $(this);
				$("#addid").text(getid + "님을 팔로워로 추가하시겠습니까?");
				$("#followacheck").modal();

				var amu = $(this).attr('class');

				// 팔로워 add & cansle ajax

				$(document).on("click", "#addagin", function() {
					setFname(getid);
					var sid = '${SID}';

					$.ajax({

						url : "/followercheck.mr",
						type : "post",
						dataType : "json",
						data : {
							m_id : sid,
							m_name : f_name
						},

						success : function(vo) {
							$('#followacheck').modal("hide");

							var idx = amu.indexOf(' ');
							var now2 = amu.substring(idx + 1);
							if (now2 == 'click1') {
								thisbtn1.removeClass('click1');
								thisbtn1.addClass('click2');
							} else {
								thisbtn1.removeClass('click2');
								thisbtn1.addClass('click1');
							}
						},
						error : function() {
							alert('### 통신 에러 ###');
						}
					});
				});

			});

			/* 	========================================================================================= */
			/* 상대방 홈페이지에서 팔로워 추가 ajax */

			$("#yesfollow")
					.click(
							function() {
								$('#othersaddfollow').modal();
								var getid = $(this).attr("data");
								$(document)
										.on(
												"click",
												"#yesconform",
												function() {
													var sid = '${SID}';
													setFname(getid);

													$
															.ajax({
																url : "/followercheck.mr",
																type : "post",
																dataType : "json",
																data : {
																	m_id : sid,
																	m_name : f_name
																},
																success : function(
																		vo) {
																	$(
																			"#othersaddfollow")
																			.modal(
																					"hide");
																	$(
																			"#yesfollow")
																			.remove();
																	$("#newbar")
																			.append(
																					'<button type="button" id="nofollow" class="btn btn-black" data="'+f_name+'">팔로우취소</button>');
																},
																error : function() {
																	alert('### 통신 에러 ###');
																}
															});
												});
							});

			/* 상대방 홈페이지에서 팔로잉 취소 ajax */

			$(document)
					.on(
							"click",
							"#noconform",
							function() {
								var f_name = '${ID}';
								$
										.ajax({
											url : "/otheresfollowcansle.mr",
											type : "post",
											dataType : "json",
											data : {
												m_id : sid,
												m_name : f_name
											},
											success : function(vo) {
												$("#otherscanslefollow").modal(
														"hide");
												$("#nofollow").remove();
												$("#newbar")
														.append(
																'<button type="button" id="yesfollow" class="btn btn-black" data="'+f_name+'">팔로우하기</button>');
											},
											error : function() {
												alert('### 통신 에러 ###');
											}
										});
							});

			//무한스크롤===========================================================================================
			var rno = 1;
			var isEnd = false;
			$(window).off().scroll(function() {
				var $window = $(this);
				var scrollTop = $window.scrollTop();
				var windowHeight = $window.height();
				var documentHeight = $(document).height();

				// scrollbar의 thumb가 바닥 전 1px까지 도달 하면 리스트를 가져온다.
				if (scrollTop + windowHeight + 1 > documentHeight) {
					//너무 짧은시간에 무한스크롤 중복발동 방지
					setTimeout(listplus(), 1000);
				}
			});
			var listplus = function() {
				if (isEnd == true) {
					return;
				}

				// renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
				// ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
				rno += 9;
				$
						.ajax({
							url : "/plusprofile.mr",
							type : "post",
							dataType : "json",
							data : {
								rno : rno
							},
							success : function(vo) {
								// 가져온 데이터가 8개 이하일 경우 무한 스크롤 종료
								var length = vo.length;
								if (length < 9) {
									isEnd = true;
								}
								var resultlist = '';
								resultlist += '<div class="row">';
								for (var i = 0; i < length; i++) {
									resultlist += '<div class="col-4 big-square">';
									resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].b_no+'"><div class="half-square" style=" height:100%;">';
									resultlist += '<img class="album" src="/album/'+vo[i].sname+'" /></div>';
									resultlist += '<p class="half-square text-center align-middle" style="background-color:rgba(0, 0, 0, 0.5); bottom:0; color:white;">@'
											+ vo[i].m_id + '</p>';
									resultlist += '</div></div>';
								}
								resultlist += '</div>';
								$('#main').append(resultlist);
							}
						});
			}

			//포스트 상세보기===========================================================================================

			var bno = "";
			$(document)
					.on(
							"click",
							'.square',
							function() {
								var thispost = $(this);
								bno = $(this).attr('id');
								console.log(bno);
								$("#c_body").val("");
								$("#comt").html("");

								$('#myModal0').modal('show');

								$
										.ajax({
											url : "/showDetail.mr",
											type : "post",
											dataType : "json",
											data : {

												b_no : bno
											},

											success : function(vo) {
												$('#mid').html(
														'<img id="psname" class="profile"  />'
																+ vo.m_id);
												$('#bbody').html(vo.b_body);
												$('#blike')
														.html(
																'<strong> '
																		+ vo.b_like
																		+ ' likes</strong>');
												$('#stitle').html(vo.s_title);
												$('#psname').attr("src",
														"/profile/" + vo.sname);
												$('#ylink1').attr(
														"src",
														"https://www.youtube.com/embed/"
																+ vo.y_link);
												$('#ylink2').attr(
														"src",
														"https://www.youtube.com/embed/"
																+ vo.y_link);

												for ( var i = 0 in vo.comt) {
													if (vo.comt[i].c_upid == null) {
														$('#comt')
																.append(
																		'<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"><strong class="user">'
																				+ vo.comt[i].c_mid
																				+ '</strong> '
																				+ vo.comt[i].c_body
																				+ '</span><span></span><span class="comtmodi my-auto">···</span></li>');
													} else {
														$('#comt')
																.append(
																		'<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"><strong class="user">'
																				+ vo.comt[i].c_mid
																				+ '</strong> <i>'
																				+ vo.comt[i].c_upid
																				+ '</i> '
																				+ vo.comt[i].c_body
																				+ '</span><span></span><span class="comtmodi my-auto">···</span></li>');
													}
												}

												//좋아요 누르기===========================================================================================
												$('#heart')
														.click(
																function(e) {
																	e
																			.preventDefault();
																	$
																			.ajax({
																				url : "/likeProc.mr",
																				type : "post",
																				dataType : "json",
																				data : {
																					b_no : bno,
																					m_id : sid
																				},
																				success : function(
																						data) {
																					$(
																							'#blike')
																							.html(
																									'<strong> '
																											+ data.b_like
																											+ " likes</strong>");
																				},
																				error : function() {
																					alert('### 통신 에러 ###');
																				}
																			});
																});

												//댓글기능===========================================================================================
												var upno = 1;
												var upid = '';
												$(document)
														.on(
																"click",
																'.thiscomt',
																function() {
																	upno = $(
																			this)
																			.attr(
																					'data-cno');
																	upno = Number(upno);
																	upid = $(
																			this)
																			.attr(
																					'data-user');
																	$("#c_body")
																			.val(
																					upid
																							+ " ");
																});

												$("#c_body")
														.keyup(
																function(e) {
																	if (e.keyCode == 13) {
																		e
																				.preventDefault();
																		e
																				.stopImmediatePropagation();
																		var cbody = $(
																				'#c_body')
																				.val();
																		if (cbody == "") {
																			return;
																		}
																		$
																				.ajax({
																					url : "/comtWrite.mr",
																					type : "post",
																					dataType : "json",
																					data : {
																						c_bno : bno,
																						c_mid : sid,
																						c_body : cbody,
																						c_upno : upno,
																						c_upid : upid
																					},
																					success : function(
																							vo2) {
																						$(
																								'#comt')
																								.html(
																										"");
																						for ( var i = 0 in vo2) {
																							if (vo2[i].c_upid == null) {
																								$(
																										'#comt')
																										.append(
																												'<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo2[i].c_no+'" data-user="'+vo2[i].c_mid+'"><strong class="user">'
																														+ vo2[i].c_mid
																														+ '</strong> '
																														+ vo2[i].c_body
																														+ '</span><span></span><span class="comtmodi my-auto">···</span></li>');
																							} else {
																								$(
																										'#comt')
																										.append(
																												'<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo2[i].c_no+'" data-user="'+vo2[i].c_mid+'"><strong class="user" >'
																														+ vo2[i].c_mid
																														+ '</strong> <i>'
																														+ vo2[i].c_upid
																														+ '</i> '
																														+ vo2[i].c_body
																														+ '</span><span></span><span class="comtmodi my-auto">···</span></li>');
																							}
																						}

																						$(
																								"#c_body")
																								.val(
																										"");
																						upno = 1;
																						upid = '';
																					},
																					error : function() {
																						alert('### 통신 에러 ###');
																					}
																				});
																	}
																});

												//포스트 신고,삭제=================================
												$(document)
														.on(
																"click",
																'.postmodi',
																function() {
																	buser = vo.m_id;
																	if (buser == sid) {
																		$(
																				'#myModal3')
																				.modal(
																						"show");
																	} else {
																		$(
																				'#myModal4')
																				.modal(
																						"show");
																	}

																	//삭제로직
																	$(document)
																			.on(
																					"click",
																					'#delproc2',
																					function() {
																						$
																								.ajax({
																									url : "/delPost.mr",
																									type : "post",
																									dataType : "json",
																									data : {
																										b_no : bno
																									},
																									success : function(
																											vo3) {
																										thispost
																												.remove();
																									},
																									error : function() {
																										alert('### 통신 에러 ###');
																									}
																								});
																						$(
																								'#myModal3')
																								.modal(
																										"hide");
																					});

																	//신고로직
																	$(document)
																			.on(
																					"click",
																					'#decproc2',
																					function() {
																						$
																								.ajax({
																									url : "/decPost.mr",
																									type : "post",
																									dataType : "json",
																									data : {
																										b_no : bno,
																										m_id : sid
																									},
																									success : function(
																											vo3) {
																										alert("신고가 완료되었습니다.");
																									},
																									error : function() {
																										alert('### 통신 에러 ###');
																									}
																								});
																						$(
																								'#myModal4')
																								.modal(
																										"hide");
																					});
																});
												$(document)
														.on(
																"click",
																'.out1',
																function() {
																	$(
																			'#myModal3')
																			.modal(
																					"hide");
																	$(
																			'#myModal4')
																			.modal(
																					"hide");
																});
											},
											error : function() {
												alert('### 통신 에러 ###');
											}
										});
							});
		});
	</script>
</body>
</html>