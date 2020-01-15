<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS & theme -->
    <link rel="stylesheet" href="/css/bootstrap-lux.css" />
    <link rel="stylesheet" href="/css/bootstrap.custom.css" />

    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <title>index</title>
  </head>

  <body class="bg-primary">
    <jsp:include page="nav.jsp" flush="false" />

    <div class="container" id="main">
      <!-- content1 -->
      <c:forEach var="data" items="${LIST}" varStatus="num">
      <div class="card mb-3 bg-primary mb-5 emo-${data.b_emotion }">
        <h3 class="card-header" style="display:flex; justify-content:space-between;"><span><img class="profile" src="/profile/${data.sname }" /><a class="link" href="/profilelist.mr?m_id=${data.m_id}">${data.m_id}</span></a><span></span><span class="postmodi my-auto"  data-buser="${data.m_id}" data-bno="${data.b_no}">···</span></h3>
        <!-- video -->
        <div class="youtube">
          <iframe src="https://www.youtube.com/embed/${data.y_link }" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
        </div>
        <!-- body -->
        <div class="card-body pb-0">
          <span class="ml-auto">
          	<input class="bno" type="hidden" data="${data.b_no}">
          	<i class="heart far fa-heart"></i> 
          	<span>${data.b_like } likes</span>
          </span>
          <h6 class="card-subtitle text-muted mb-2 mt-2">${data.s_title}</h6>
          <p class="card-text">
          	${data.b_body }
          </p>
        </div>
        <!-- comment -->
        <ul id="${data.b_no}a" class="list-group list-group-flush" data="${data.b_no}">
          <c:forEach var="comment" items="${data.comt}">
            <li class="list-group-item pt-0 pb-1 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="${comment.c_no }" data-user="${comment.c_mid }" ><strong>${comment.c_mid} </strong> ${comment.c_body} </span><span></span><span class="comtmodi my-auto">···</span></li>
          </c:forEach>
        </ul>
        <div class="card-footer">
          <div class="pt-3">
            <input class="bno" type="hidden" data="${data.b_no}">
            <input id="${data.b_no }" class="comment-write-dark" type="text" placeholder="댓글을 입력해주세요" />
          </div>
        </div>
      </div>
	  </c:forEach>
	  <c:if test="${empty LIST}">
	  <table class="table table-sm">
  		<thead>
    	  <tr>
     	    <h4 style="color:aliceblue; text-align:center;">팔로우가 없어요!</h4>	
   		  </tr>
 		</thead>
 	  </table>
	  </c:if>
	</div>
	<!-- modal 신고, 삭제 -->
    <div class="modal" id="myModal1">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-primary rounded">
          <!-- Modal body -->
          <div id="delproc" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center" style="color:white;"> 삭제 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" style="color:white;"> 취소 </h4>
          </div>
        </div>
      </div>
    </div>
    <div class="modal" id="myModal2">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-primary rounded">
          <!-- Modal body -->
          <div id="decproc" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center " style="color:white;"> 신고 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" style="color:white;"> 취소 </h4>
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
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function(){
	//  
	
	//세션 ID 저장===========================================================================================
	var sid = '${SID}';
    //좋아요 누르기===========================================================================================
	var bno = 1;
	$(document).on("click", '.heart', function() {
		bno = $(this).prev().attr("data");
		var span = $(this).next();
		$.ajax({
			url : "/likeProc.mr",
			type : "post",
			dataType : "json",
			data : {
				b_no : bno,
				m_id : sid
			},
			success : function(data){
				span.html('<strong> ' + data.b_like + " likes</strong>");
			},
			error : function(){
				alert('### 통신 에러 ###');
			}
		});
	});
	
	//댓글기능===========================================================================================
	//댓글 삭제, 신고버튼
	var cno=0;
	var cuser = '';
	$(document).on("click", '.comtmodi', function(e) {
		e.stopImmediatePropagation();
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
		$(document).on("click", '#decproc', function(e) {
			e.stopImmediatePropagation();
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
	
	//댓글메인=========================================================================
	var upno = 1;
	var upid = '';
	$(document).on("click", '.thiscomt', function() {
		upno = $(this).attr('data-cno');
		upno = Number(upno);
		upid = $(this).attr('data-user');
		bno = $(this).parent().parent().attr("data");
		$("#"+bno).val(upid+" ");
	});
	
	$(document).on("keyup", '.comment-write-dark', function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			bno = $(this).prev().attr("data");
			var cbody = $(this).val();
			if(cbody == ""){
				return;
			}
			var comt = $("#"+bno+"a");
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
				success : function(vo){
					comt.html("");
					for(var i=0 in vo){
						if(vo[i].c_upid == null){
							comt.append('<li class="list-group-item pt-0 pb-1 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'" ><strong>'+vo[i].c_mid+'</strong> '+vo[i].c_body+'</span>'
									   +'<span></span>'
									   +'<span class="comtmodi my-auto">···</span>'
									   +'</li>');
						}else{
							comt.append('<li class="list-group-item pt-0 pb-1 active"  style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  ><strong>'+vo[i].c_mid+'</strong> <i>'+vo[i].c_upid+'</i> '+vo[i].c_body+'</span>'
									   +'<span></span>'
									   +'<span class="comtmodi my-auto">···</span>'
									   +'</li>');
						}
					}
					
					$("#"+bno).val("");
					upno = 1;
					upid = '';
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
		}
	});
	
	//포스트 신고,삭제============================================================
	$(document).on("click", '.postmodi', function(e) {
		e.stopImmediatePropagation();
		var thispost = $(this).parent().parent();
		var buser = $(this).attr("data-buser");
		bno = $(this).attr("data-bno");
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
					thispost.remove();
					alert("삭제가 완료되었습니다.");
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
	
	// 무한스크롤===========================================================================================
	var rno = 1;
	var isEnd = false;
	$(window).off().scroll(function(e){
		e.stopImmediatePropagation();
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();
        
        
        // scrollbar의 thumb가 바닥 전 1px까지 도달 하면 리스트를 가져온다.
        if( scrollTop + windowHeight + 1 > documentHeight ){
        	//너무 짧은시간에 무한스크롤 중복발동 방지
            setTimeout(listplus(), 1000);
        }
    });
	var listplus = function(){
        if(isEnd == true){
            return;
        }
        
        // renderList 함수에서 html 코드를 보면 <li> 태그에 data-no 속성이 있는 것을 알 수 있다.
        // ajax에서는 data- 속성의 값을 가져오기 위해 data() 함수를 제공.
        rno += 5;
        $.ajax({
            url:"/plusListFeed.mr",
            type: "post",
            dataType: "json",
            data : {
				rno : rno
			},
            success: function(vo){
                // 가져온 데이터가 8개 이하일 경우 무한 스크롤 종료
                var length = vo.length;
                if( length < 5 ){
                    isEnd = true;
                }
                var resultlist = '';
				for(var i=0; i<length; i++){
   					resultlist+='<div class="card mb-3 bg-primary mb-5 emo-'+vo[i].b_emotion+'">';
					resultlist+='<h3 class="card-header"><img class="profile" src="/profile/'+vo[i].sname+'" />'+vo[i].m_id+'</h3>';
					resultlist+='<div class="youtube">';
					resultlist+='<iframe src="https://www.youtube.com/embed/'+vo[i].y_link+'" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
					resultlist+='</div>';
					resultlist+='<div class="card-body pb-0">';
					resultlist+='<span class="ml-auto">';
					resultlist+='<input class="bno" type="hidden" data="'+vo[i].b_no+'">';
					resultlist+='<i class="heart far fa-heart"></i>';
					resultlist+='<span> '+vo[i].b_like+' likes</span></span>';
					resultlist+='<h6 class="card-subtitle text-muted mb-2 mt-2">'+vo[i].s_title+'</h6>';
					resultlist+='<p class="card-text">'+vo[i].b_body+'</p>';
					resultlist+='</div>';
					resultlist+='<ul id="'+vo[i].b_no+'a" class="list-group list-group-flush" data="'+vo[i].b_no+'">';
					//댓글
					for(var j=0; j<vo[i].comt.length; j++){
						resultlist+='<li class="list-group-item pt-0 pb-1 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo[i].comt[j].c_no+'" data-user="'+vo[i].comt[j].c_mid+'" ><strong>'+vo[i].comt[j].c_mid+' </strong> '+vo[i].comt[j].c_body+' </span><span></span><span class="comtmodi">···</span></li>';
					}
					resultlist+='</ul>';
					resultlist+='<div class="card-footer">';
					resultlist+='<div class="pt-3">';
					resultlist+='<input class="bno" type="hidden" data="'+vo[i].b_no+'">';
					resultlist+='<input id="'+vo[i].b_no+'" class="comment-write-dark" type="text" placeholder="댓글을 입력해주세요" />';
					resultlist+='</div></div></div>';
				}
   				$('#main').append(resultlist);
            }
        });
    }
  })
  </script>
  </body>
</html>
