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
      <div class="card mb-3 bg-primary mb-5">
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
            <li data-cno="${comment.c_no }" data-user="${comment.c_mid }" class="list-group-item pt-0 pb-1 active"><strong>${comment.c_mid} </strong> ${comment.c_body}</li>
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

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  $(function(){
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
	
	var upno = 1;
	var upid = '';
	$(document).on("click", '.list-group-item', function() {
		upno = $(this).attr('data-cno');
		upno = Number(upno);
		upid = $(this).attr('data-user');
		bno = $(this).parent().attr("data");
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
							comt.append('<li data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  class="list-group-item pt-0 pb-1 active"><strong class="user">'+vo[i].c_mid+'</strong> '+vo[i].c_body+'</li>');

						}else{
							comt.append('<li data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  class="list-group-item pt-0 pb-1 active"><strong class="user">'+vo[i].c_mid+'</strong> <i>'+vo[i].c_upid+'</i> '+vo[i].c_body+'</li>');
							
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
