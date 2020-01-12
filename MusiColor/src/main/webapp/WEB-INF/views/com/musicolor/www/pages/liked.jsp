<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>searchbefore</title>
<link rel="stylesheet" href="/css/bootstrap.custom.css">
<link rel="stylesheet" href="/css/bootstrap-lux.css">
<link rel="stylesheet" href="/css/random.css">
<!-- Font Awesome 5 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->


</head>
<body class="bg-primary">
	<jsp:include page="nav.jsp" flush="false" />

	<div class="container" id="main">

<br>

	<button type="button" id="backbtn" class="btn btn-info"
		style="width: 100px; display: inline;">뒤로가기</button>
<br>



		<h1 class="text-muted text-center" id="explain">the post you
			press 'like's</h1>

		<!-- 앨범 이미지 -->
		 <!-- 앨범 이미지 -->
      <div class="row">
      	<c:forEach var="data" items="${LIKELIST}">
        <div class="col-4 big-square">
          <div class="square small-${data.b_emotion}" id="${data.b_no}">
          	<div class="half-square" style=" height:100%;"><img class="album" src="/album/${data.sname}" /></div>
			<p class="half-square text-center align-middle" style="background-color:rgba(0, 0, 0, 0.5); bottom:0; color:white;">@${SID}</p>
          </div>
        </div>
		</c:forEach>
      </div>
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
								<iframe id="ylink1" src="" frameborder="0"
									allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
									allowfullscreen></iframe>
							</div>
						</div>
						<!-- Modal right -->
						<div class="col text-left" style="padding: 10px;">
							<h3 id="mid" class="card-header" style="padding: 10px;"></h3>
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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$(function() {
			//세션 ID 저장===========================================================================================
			var sid = "${SID}";

			//포스트 상세보기===========================================================================================

			var bno = "";
			$('.square')
					.click(
							function() {
								bno = $(this).attr('id');
								$("#c_body").val("");
								$("#comt").html("");

								$('#myModal1').modal("show");
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
																		'<li data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'
																				+ vo.comt[i].c_mid
																				+ '</strong> '
																				+ vo.comt[i].c_body
																				+ '</li>');
													} else {
														$('#comt')
																.append(
																		'<li data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'
																				+ vo.comt[i].c_mid
																				+ '</strong> <i>'
																				+ vo.comt[i].c_upid
																				+ '</i> '
																				+ vo.comt[i].c_body
																				+ '</li>');
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
																'.list-group-item',
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
																							vo) {
																						$(
																								'#comt')
																								.html(
																										"");
																						for ( var i = 0 in vo) {
																							if (vo[i].c_upid == null) {
																								$(
																										'#comt')
																										.append(
																												'<li data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'
																														+ vo[i].c_mid
																														+ '</strong> '
																														+ vo[i].c_body
																														+ '</li>');
																							} else {
																								$(
																										'#comt')
																										.append(
																												'<li data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'
																														+ vo[i].c_mid
																														+ '</strong> <i>'
																														+ vo[i].c_upid
																														+ '</i> '
																														+ vo[i].c_body
																														+ '</li>');
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
											},
											error : function() {
												alert('### 통신 에러 ###');
											}
										});
							});

			// 검색 후 무한스크롤===========================================================================================
			var rno = 1;
			var isEnd = false;
			// 무한스크롤은 검색 후에만 적용
			forscroll = '<c:out value="${forscroll}"/>';
			if (forscroll == "yes") {
				$(window).scroll(function() {
					var $window = $(this);
					var scrollTop = $window.scrollTop();
					var windowHeight = $window.height();
					var documentHeight = $(document).height();

					// scrollbar의 thumb가 바닥 전 20px까지 도달 하면 리스트를 가져온다.
					if (scrollTop + windowHeight + 20 > documentHeight) {
						//너무 짧은시간에 무한스크롤 중복발동 방지
						setTimeout(listplus(), 1000);
					}
				});
			}
			var listplus = function() {
				if (isEnd == true) {
					return;
				}
				// renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
				// ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
				rno += 9;
				$
						.ajax({
							url : "/plusList.mr",
							type : "post",
							dataType : "json",
							data : {
								b_vno : rno
							},
							success : function(vo) {
								// 가져온 데이터가 8개 이하일 경우 무한 스크롤 종료
								var length = vo.length;
								if (length < 9) {
									isEnd = true;
								}
								var resultlist = '';
								if (length < 4) {
									resultlist += '<div class="row">';
									for (var i = 0; i < length; i++) {
										resultlist += '<div class="col-4 big-square">';
										resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].b_no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
										resultlist += '</div>';
									}
									resultlist += '</div>';
									$('#main').append(resultlist);
								}
								if (length >= 4 && length < 7) {
									resultlist += '<div class="row">';
									for (var i = 0; i < 3; i++) {
										resultlist += '<div class="col-4 big-square">';
										resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].b_no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
										resultlist += '</div>';
									}
									resultlist += '</div>';
									resultlist += '<div class="row">';
									for (var i = 3; i < length; i++) {
										resultlist += '<div class="col-4 big-square">';
										resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
										resultlist += '</div>';
									}
									resultlist += '</div>';
									$('#main').append(resultlist);
								}
								if (length >= 7) {
									resultlist += '<div class="row">';
									for (var i = 0; i < 3; i++) {
										resultlist += '<div class="col-4 big-square">';
										resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
										resultlist += '</div>';
									}
									resultlist += '</div>';
									resultlist += '<div class="row">';
									for (var i = 3; i < 6; i++) {
										resultlist += '<div class="col-4 big-square">';
										resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
										resultlist += '</div>';
									}
									resultlist += '</div>';
									resultlist += '<div class="row">';
									for (var i = 6; i < length; i++) {
										resultlist += '<div class="col-4 big-square">';
										resultlist += '<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
										resultlist += '</div>';
									}
									resultlist += '</div>';
									$('#main').append(resultlist);
								}
							}
						});
			}
			
			 
			$('#backbtn').click(function() {
				$(location).attr('href', '/profilelist.mr?m_id='+sid);
			}); 
			
		})
	</script>

</body>
</html>