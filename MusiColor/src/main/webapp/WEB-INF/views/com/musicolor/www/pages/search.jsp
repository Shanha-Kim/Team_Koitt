<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<title>searchbefore</title>
<link rel="stylesheet" href="/css/bootstrap.custom.css" >
<link rel="stylesheet" href="/css/bootstrap-lux.css" >
<link rel="stylesheet" href="/css/random.css" >
<!-- Font Awesome 5 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
 
 <body class="bg-primary">
    <jsp:include page="nav.jsp" flush="false" />
	
    <div class="container" id="main">
      <form id="search_frm" class="form-inline my-lg-0" method="post" action="/searchAfter.mr">
      	<input id="search_key" class="form-control col-sm text-center" type="text" placeholder="Search" name="key_main">
      	<input id="search_tab" type="hidden" name="key_tab">
      	<input id="search_rno" type="hidden" name="b_vno" value=1>
      </form>
      <!-- 감정 선택 버튼 -->
      <div class="btn-group btn-block mb-2" role="group" aria-label="Basic example" id="tab">
        <button id="All" type="button" class="btn btn-primary text-muted" >All</button>
        <button id="Song" type="button" class="btn btn-primary text-muted" >Song</button>
        <button id="Artist" type="button" class="btn btn-primary text-muted" >Artist</button>
        <button id="User" type="button" class="btn btn-primary text-muted" >User</button>
        <button id="Hashtag" type="button" class="btn btn-primary text-muted" >Hashtag</button>
      </div>
	
      <div class="text-center mb-3" id="refresh">
        <a class="badge badge-pill badge-danger hover">REFRESH THIS PAGE</a>
      </div>
      <!-- 앨범 이미지 -->
      <div class="row" id="blist">
      	<c:forEach var="data" items="${LIST}">
        <div class="col-4 big-square">
          <div class="square small-${data.b_emotion}" id="${data.b_no}">
          	<div class="half-square" style=" height:100%;"><img class="album" src="/album/${data.sname}" /></div>
			<p class="half-square text-center align-middle" style="background-color:rgba(0, 0, 0, 0.5); bottom:0; color:white;">@${data.m_id}</p>
          </div>
        </div>
		</c:forEach>
      </div>
	</div>
    <!-- modal, content detail -->
    <div class="modal" id="myModal">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-primary">
          <!-- Modal body -->
          <div class="modal-body">
            <div class="row">
              <!-- Modal left, 일정 크기 이상 작아지면 안보이는 유튜브 -->
              <div class="col desktop-youtube" style="padding: 10px; border-right: 1px solid #282828;">
                <div style="height: 25%; width:100%;"></div>
                <div class="youtube text-left" style="height: 50%; width:100%;">
                  <iframe id="ylink1"  src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div> 
              </div>
              <!-- Modal right -->
              <div class="col text-left" style="padding: 10px;">
                <h3 class="card-header" style="padding: 10px; display:flex; justify-content:space-between;"><span id="mid" ></span><span></span><span class="postmodi my-auto">···</span></h3>
                <!-- 일정 크기 이상 작아지면 보이는 유튜브-->
                <div class="youtube mobile-youtube mb-3">
                  <iframe id="ylink2" src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div>
                <div class="card-body" style="padding: 0px;">
                  <span class="ml-auto"><i id="heart" class="far fa-heart"></i><span id="blike"></span></span>
                  <h6 id="stitle" class="card-subtitle text-muted mb-2 mt-2"></h6>
                  <div class="body-scroll mb-3">
                    <p id="bbody" class="card-text">
                    </p>
                  </div>
                </div>
                <!-- comment -->
                <div class="bg-primary comment-scroll">
                  <ul id="comt" class="list-group list-group-flush p-0 m-p">
<!--                     <li data-cno="100000000001"  data-user="rmccuish5" class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">USERNAME</strong> Cras justo odio</li> -->
                  </ul>
                </div>
                <div class="pt-3">
                  <input id="c_body" class="comment-write-dark" type="text" placeholder="댓글을 입력해주세요" />
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
          <div id="delproc" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center" > 삭제 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" > 취소 </h4>
          </div>
        </div>
      </div>
    </div>
    <div class="modal" id="myModal2">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-light rounded">
          <!-- Modal body -->
          <div id="decproc" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center "> 신고 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" > 취소 </h4>
          </div>
        </div>
      </div>
    </div>
    <div class="modal" id="myModal3">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-light rounded">
          <!-- Modal body -->
          <div id="delproc2" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center" > 삭제 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" > 취소 </h4>
          </div>
        </div>
      </div>
    </div>
    <div class="modal" id="myModal4">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-light rounded">
          <!-- Modal body -->
          <div id="decproc2" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center "> 신고 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" > 취소 </h4>
          </div>
        </div>
      </div>
    </div>
    
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	//세션 ID 저장===========================================================================================
	var sid = '<c:out value="${SID}"/>';
	
	//리프레쉬버튼===========================================================================================
	$('#refresh').click(function(){
		$(location).attr("href", "/searchBefore.mr");
	});
	
	//댓글, 글 삭제, 신고처리================================================================================
	$(document).on("click", '.comtmodi', function() {
		var thiscomt = $(this).parent();
		cno = $(this).prev().prev().attr("data-cno");
		cuser = $(this).prev().prev().attr("data-user");
		if(cuser == sid){
			$('#myModal1').modal("show");
		}else{
			$('#myModal2').modal("show");
		}
		
		//삭제로직
		$(document).on("click", '#delproc', function() {
			$.ajax({
				url : "/delComt.mr",
				type : "post",
				dataType : "json",
				data : {
					c_no : cno
				},
				success : function(vo){
					thiscomt.remove();
					alert("삭제가 완료되었습니다.");
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
			$('#myModal1').modal("hide");
		});
		//신고로직
		$(document).on("click", '#decproc', function() {
			$.ajax({
				url : "/decComt.mr",
				type : "post",
				dataType : "json",
				data : {
					c_no : cno,
					c_mid : sid
				},
				success : function(vo){
					alert("신고가 완료되었습니다.");
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
			$('#myModal2').modal("hide");
		});
	});
	$(document).on("click", '.out1', function() {
		$('#myModal1').modal("hide");
		$('#myModal2').modal("hide");
	});
	
	//포스트 상세보기===========================================================================================
	
	var bno = "";
	$(document).on("click", '.square', function(e) {
		e.stopImmediatePropagation();
		var thispost = $(this).parent();
		bno = $(this).attr('id');
		$("#c_body").val("");
		$("#comt").html("");
		
		$('#myModal').modal("show");
		$.ajax({
			url : "/showDetail.mr",
			type : "post",
			dataType : "json",
			data : {
				b_no : bno
			},
			success : function(vo){
				$('#mid').html('<img id="psname" class="profile"  /><a class="link" href="/profilelist.mr?m_id='+vo.m_id+'">'+vo.m_id+'</a>');
// 				$('#mid').html('<img id="psname" class="profile"  />'+vo.m_id);
				$('#bbody').html(vo.b_body);
				$('#blike').html('<strong> ' + vo.b_like + ' likes</strong>');
				$('#stitle').html(vo.s_title);
				$('#psname').attr("src", "/profile/" + vo.sname);
				$('#ylink1').attr("src", "https://www.youtube.com/embed/" + vo.y_link);
				$('#ylink2').attr("src", "https://www.youtube.com/embed/" + vo.y_link);
				for(var i=0 in vo.comt){
					if(vo.comt[i].c_upid == null){
						$('#comt').append('<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"><strong class="user">'+vo.comt[i].c_mid+'</strong> '+vo.comt[i].c_body+'</span><span></span><span class="comtmodi my-auto">···</span></li>');
					}else{
						$('#comt').append('<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"><strong class="user">'+vo.comt[i].c_mid+'</strong> <i>'+vo.comt[i].c_upid+'</i> '+vo.comt[i].c_body+'</span><span></span><span class="comtmodi my-auto">···</span></li>');
					}
				} 
				
				//좋아요 누르기===========================================================================================
				$(document).on("click", '#heart', function(e) {
					e.stopImmediatePropagation();
					$.ajax({
						url : "/likeProc.mr",
						type : "post",
						dataType : "json",
						data : {
							b_no : bno,
							m_id : sid
						},
						success : function(data){
							$('#blike').html('<strong> ' + data.b_like + " likes</strong>");
						},
						error : function(){
							alert('### 통신 에러 ###');
						}
					});
				});
				
				//댓글기능===========================================================================================
				var upno = 1;
				var upid = '';
				$(document).on("click", '.thiscomt', function(e) {
					e.stopImmediatePropagation();
					upno = $(this).attr('data-cno');
					upno = Number(upno);
					upid = $(this).attr('data-user');
					$("#c_body").val(upid+" ");
				});
				
				$(document).on("keyup", '#c_body', function(e) {
					e.stopImmediatePropagation();
					if(e.keyCode == 13){
						e.preventDefault();
						e.stopImmediatePropagation();
						var cbody = $('#c_body').val();
						if(cbody == ""){
							return;
						}
						$.ajax({
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
							success : function(vo2){
								$('#comt').html("");
								for(var i=0 in vo2){
									if(vo2[i].c_upid == null){
										$('#comt').append('<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo2[i].c_no+'" data-user="'+vo2[i].c_mid+'"><strong class="user">'+vo2[i].c_mid+'</strong> '+vo2[i].c_body+'</span><span></span><span class="comtmodi my-auto">···</span></li>');
									}else{
										$('#comt').append('<li class="list-group-item pt-0 pb-1 pl-0 ml-0 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo2[i].c_no+'" data-user="'+vo2[i].c_mid+'"><strong class="user" >'+vo2[i].c_mid+'</strong> <i>'+vo2[i].c_upid+'</i> '+vo2[i].c_body+'</span><span></span><span class="comtmodi my-auto">···</span></li>');
									}
								}
								
								$("#c_body").val("");
								upno = 1;
								upid = '';
							},
							error : function(){
								alert('### 통신 에러 ###');
							}
						});
					}
				});
				
				//포스트 신고,삭제=================================
				$(document).on("click", '.postmodi', function(e) {
					e.stopImmediatePropagation();
					buser = vo.m_id;
					if(buser == sid){
						$('#myModal3').modal("show");
					}else{
						$('#myModal4').modal("show");
					}
					
					//삭제로직
					$(document).on("click", '#delproc2', function(e) {
						e.stopImmediatePropagation();
						$.ajax({
							url : "/delPost.mr",
							type : "post",
							dataType : "json",
							data : {
								b_no : bno
							},
							success : function(vo3){
								alert("삭제가 완료되었습니다.");
								$('#myModal').modal("hide");
								thispost.remove();
							},
							error : function(){
								alert('### 통신 에러 ###');
							}
						});
						$('#myModal3').modal("hide");
					});
					//신고로직
					$(document).on("click", '#decproc2', function(e) {
						e.stopImmediatePropagation();
						$.ajax({
							url : "/decPost.mr",
							type : "post",
							dataType : "json",
							data : {
								b_no : bno,
								m_id : sid
							},
							success : function(vo3){
								alert("신고가 완료되었습니다.");
							},
							error : function(){
								alert('### 통신 에러 ###');
							}
						});
						$('#myModal4').modal("hide");
					});
				});
				$(document).on("click", '.out1', function() {
					$('#myModal3').modal("hide");
					$('#myModal4').modal("hide");
				});
			},
			error : function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	//검색시 탭 반영 ===========================================================================================
	var tabmenu="";
	$('#tab').each(function(){
		var tab = $(this).children("button")
		tab.click(function(){
			tab.removeClass("selected");
			tab.removeClass("text-muted");
			tab.addClass("text-muted");
			$(this).removeClass("text-muted");
			$(this).addClass("selected");
			tabmenu = $(this).text();
		});
	});
	
	//검색 엔터===============================================================================================
	$("#search_key").keydown(function(e){
		e.stopImmediatePropagation();
		if(e.keyCode == 13){
			e.preventDefault();
			if(tabmenu==""){
				tabmenu="All";
			}
			$('#search_tab').val(tabmenu);	
			$("#search_frm").submit();
		}
	});
	//검색전에 누른 tab 유지
	tabmenu = '<c:out value="${tabnow}"/>'+"";
	if(tabmenu==""){
		tabmenu = "All";
	}
	var tab = $('#tab').children('button');
	tab.removeClass("selected");
	tab.removeClass("text-muted");
	tab.addClass("text-muted");
	$('#'+tabmenu).removeClass("text-muted");
	$('#'+tabmenu).addClass("selected");
	
	//검색 프리뷰
// 	$("#search_key").keyup(function(e){
// 		$('#myModal1').modal("show");
// 		$.ajax({
// 			url : "/preView.mr",
// 			type : "post",
// 			dataType : "json",
// 			data : {
// 				b_no : bno
// 			},
// 			success : function(vo){
// 				alert("success");
// 				$('#mid').append(vo.m_id);
// 				$('#bbody').html(vo.b_body);
// 				$('#blike').append("<strong>" + vo.b_like + "likes</strong>");
// 				$('#stitle').html(vo.s_title);
// 				$('#psname').attr("src", "/profile/" + vo.sname);
// 				$('#ylink1').attr("src", "https://www.youtube.com/embed/" + vo.y_link);
// 				$('#ylink2').attr("src", "https://www.youtube.com/embed/" + vo.y_link);
// 			},
// 			error : function(){
// 				alert('### 통신 에러 ###');
// 			}
// 		});
// 	});
	
	// 검색 후 무한스크롤===========================================================================================
	var rno = 1;
	var isEnd = false;
	// 무한스크롤은 검색 후에만 적용
	forscroll = '<c:out value="${forscroll}"/>';
	if(forscroll == "yes"){
		$(window).off().scroll(function(e){
			e.stopImmediatePropagation();
			var $window = $(this);
			var scrollTop = $window.scrollTop();
			var windowHeight = $window.height();
			var documentHeight = $(document).height();
	        
	//         console.log("documentHeight:" + documentHeight + " | scrollTop:" + scrollTop + " | windowHeight: " + windowHeight );
	        
	        // scrollbar의 thumb가 바닥 전 1px까지 도달 하면 리스트를 가져온다.
	        if( scrollTop + windowHeight + 1 > documentHeight ){
	        	//너무 짧은시간에 무한스크롤 중복발동 방지
	            setTimeout(listplus(), 1000);
	        }
	    });
	}
	var listplus = function(){
        if(isEnd == true){
            return;
        }
        
        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
        rno += 9;
        $.ajax({
            url:"/plusList.mr",
            type: "post",
            dataType: "json",
            data : {
				r_no : rno
			},
            success: function(vo){
                // 가져온 데이터가 8개 이하일 경우 무한 스크롤 종료
                var length = vo.length;
                if( length < 9 ){
                    isEnd = true;
                }
                var resultlist = ''; 
				for(var i=0; i<length; i++){
					resultlist+='<div class="col-4 big-square">';
					resultlist+='<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].b_no+'"><div class="half-square" style=" height:100%;">';
					resultlist+='<img class="album" src="/album/'+vo[i].sname+'" /></div>';
					resultlist+='<p class="half-square text-center align-middle" style="background-color:rgba(0, 0, 0, 0.5); bottom:0; color:white;">@'+vo[i].m_id+'</p>';
					resultlist+='</div></div>';
				}
   				$('#blist').append(resultlist);
//        			if(length>=4 && length<7){
//        				resultlist+='<div class="row">';
//    					for(var i=0; i<3; i++){
//    						resultlist+='<div class="col-4 big-square">';
//    						resultlist+='<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].b_no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
//    						resultlist+='</div>';
//    					}
//    					resultlist+='</div>';
//    					resultlist+='<div class="row">';
//    					for(var i=3; i<length; i++){
//    						resultlist+='<div class="col-4 big-square">';
//    						resultlist+='<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
//    						resultlist+='</div>';
//    					}
//    					resultlist+='</div>';
//    					$('#main').append(resultlist);
//        			}
//        			if(length>=7){
//        				resultlist+='<div class="row">';
//    					for(var i=0; i<3; i++){
//    						resultlist+='<div class="col-4 big-square">';
//    						resultlist+='<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
//    						resultlist+='</div>';
//    					}
//    					resultlist+='</div>';
//    					resultlist+='<div class="row">';
//    					for(var i=3; i<6; i++){
//    						resultlist+='<div class="col-4 big-square">';
//    						resultlist+='<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
//    						resultlist+='</div>';
//    					}
//    					resultlist+='</div>';
//    					resultlist+='<div class="row">';
//    					for(var i=6; i<length; i++){
//    						resultlist+='<div class="col-4 big-square">';
//    						resultlist+='<div class="square small-'+vo[i].b_emotion+'" id="'+vo[i].no+'"><img class="album" src="/album/'+vo[i].sname+'" /></div>';
//    						resultlist+='</div>';
//    					}
//    					resultlist+='</div>';
//    					$('#main').append(resultlist);
//        			}
            }
        });
    }
})
	
</script>
   
</body>
</html>