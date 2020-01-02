<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

    <!-- Bootstrap CSS & theme -->
    <link rel="stylesheet" href="/www/css/bootstrap-lux.css" />
    <link rel="stylesheet" href="/www/css/bootstrap.custom.css" />

    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <title>index</title>
  </head>

  <body class="bg-primary">
    <jsp:include page="nav.jsp" flush="false" />

    <div class="container" id="main">
      <!-- content1 -->
      <c:forEach var="data" items="${LIST}" varStatus="num">
      <div class="card mb-3 bg-primary mb-5 angry">
        <h3 class="card-header"><img class="profile" src="/www/profile/${data.sname }" />${data.m_id}</h3>
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
            <li class="list-group-item pt-0 pb-1 active" style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="${comment.c_no }" data-user="${comment.c_mid }" ><strong>${comment.c_mid} </strong> ${comment.c_body} </span><span></span><span class="comtmodi">···</span></li>
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
	<!-- modal, content detail -->
    <div class="modal" id="myModal1">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content bg-primary rounded-lg">
          <!-- Modal body -->
          <div id="delcomt" class="modal-body" style="border-bottom:0.5px solid black;">
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
        <div class="modal-content bg-primary rounded-lg">
          <!-- Modal body -->
          <div id="deccomt" class="modal-body" style="border-bottom:0.5px solid black;">
          	<h5 class="text-center " style="color:white;"> 신고 </h4>
          </div>
          <div class="modal-body">
          	<h5 class="text-center out1" style="color:white;"> 취소 </h4>
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
	var bno = 1;
    //좋아요 누르기===========================================================================================
	$('.heart').click(function(e){
		e.preventDefault();
		bno = $(this).prev().attr("data");
		var span = $(this).next();
		$.ajax({
			url : "/www/likeProc.mr",
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
		$(document).on("click", '#delcomt', function() {
			$.ajax({
				url : "/www/delComt.mr",
				type : "post",
				dataType : "json",
				data : {
					c_no : cno
				},
				success : function(vo){
					thiscomt.remove();
				},
				error : function(){
					alert('### 통신 에러 ###');
				}
			});
			$('#myModal1').modal("hide");
		});
		//신고로직
		$(document).on("click", '#deccomt', function() {
			$('#myModal2').modal("hide");
			
		});
	});
	$(document).on("click", '.out1', function() {
		$('#myModal1').modal("hide");
		$('#myModal2').modal("hide");
	});
	
	
	//댓글메인
	var upno = 1;
	var upid = '';
	$(document).on("click", '.thiscomt', function() {
		upno = $(this).attr('data-cno');
		upno = Number(upno);
		upid = $(this).attr('data-user');
		bno = $(this).parent().parent().attr("data");
		$("#"+bno).val(upid+" ");
	});
	
	$(".comment-write-dark").keyup(function(e){
		if(e.keyCode == 13){
			e.preventDefault();
			bno = $(this).prev().attr("data");
			var cbody = $(this).val();
			if(cbody == ""){
				return;
			}
			var comt = $("#"+bno+"a");
			$.ajax({
				url : "/www/comtWrite.mr",
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
									   +'<span class="comtmodi">···</span>'
									   +'</li>');
						}else{
							comt.append('<li class="list-group-item pt-0 pb-1 active"  style="display:flex ;justify-content:space-between;"><span class="thiscomt" data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  ><strong>'+vo[i].c_mid+'</strong> <i>'+vo[i].c_upid+'</i> '+vo[i].c_body+'</span>'
									   +'<span></span>'
									   +'<span class="comtmodi">···</span>'
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
  })
  </script>
  </body>
</html>
