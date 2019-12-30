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
    <link rel="stylesheet" href="/www/css/random.css" />

    <!-- Font Awesome 5 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

    <title>random</title>
  </head>

  <body class="bg-primary">
    <jsp:include page="nav.jsp" flush="false" />

    <div class="container" id="main">
      <h1 class="text-muted text-center" id="explain">YOU LOOK SO EMO</h1>
      <!-- 감정 선택 버튼 -->
      <div class="btn-group btn-block mb-5" role="group">
        <button type="button" class="btn btn-primary text-muted" id="btn-0">ALL</button>
        <button type="button" class="btn btn-primary text-muted" id="btn-1">사랑</button>
        <button type="button" class="btn btn-primary text-muted" id="btn-2">기쁨</button>
        <button type="button" class="btn btn-primary text-muted" id="btn-3">평온</button>
        <button type="button" class="btn btn-primary text-muted" id="btn-4">슬픔</button>
        <button type="button" class="btn btn-primary text-muted" id="btn-5">분노</button>
      </div>

      <!-- 앨범 이미지 -->
      <div class="row">
      	<c:forEach var="data" items="${LIST}" begin="0" end="2">
        <div class="col-4 big-square">
          <div class="square small-${data.b_emotion}" id="${data.b_no}"><img class="album" src="/www/album/${data.sname}" /></div>
        </div>
		</c:forEach>
      </div>

      <div class="row">
      	<c:forEach var="data" items="${LIST}" begin="3" end="5">
        <div class="col-4 big-square">
          <div class="square small-${data.b_emotion}" id="${data.b_no}"><img class="album" src="/www/album/${data.sname}" /></div>
        </div>
		</c:forEach>
      </div>

      <div class="row">
      	<c:forEach var="data" items="${LIST}" begin="6" end="8">
        <div class="col-4 big-square">
          <div class="square small-${data.b_emotion}" id="${data.b_no}"><img class="album" src="/www/album/${data.sname}" /></div>
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
              <div class="col desktop-youtube" style="padding: 10px; border-right: 1px solid #282828;">
                <div style="height: 25%; width:100%;"></div>
                <div class="youtube text-left" style="height: 50%; width:100%;">
                  <iframe id="ylink1"  src="" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                </div> 
              </div>
              <!-- Modal right -->
              <div class="col text-left" style="padding: 10px;">
                <h3 id="mid" class="card-header" style="padding: 10px;">
                </h3>
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
        	$(location).attr("href", "/www/random.mr");
        })
        
        $("#btn-1").click(function(){
        	$(location).attr("href", "/www/randomseleced.mr?b_emotion=1");
        })
        
        $("#btn-2").click(function(){
        	$(location).attr("href", "/www/randomseleced.mr?b_emotion=2");
        })
        
        $("#btn-3").click(function(){
        	$(location).attr("href", "/www/randomseleced.mr?b_emotion=3");
        })
        
        $("#btn-4").click(function(){
        	$(location).attr("href", "/www/randomseleced.mr?b_emotion=4");
        })
        
        $("#btn-5").click(function(){
        	$(location).attr("href", "/www/randomseleced.mr?b_emotion=5");
        })
        
        /* 게시물 상세보기 */
        var bno = "";
    	$('.square').click(function(){
    		bno = $(this).attr('id');
    		$("#c_body").val("");
    		$("#comt").html("");
    		
    		$('#myModal1').modal("show");
    		$.ajax({
    			url : "/www/showDetail.mr",
    			type : "post",
    			dataType : "json",
    			data : {
    				b_no : bno
    			},
    			success : function(vo){
    				$('#mid').html('<img id="psname" class="profile"  />'+vo.m_id);
    				$('#bbody').html(vo.b_body);
    				$('#blike').html('<strong> ' + vo.b_like + " likes</strong>");
    				$('#stitle').html(vo.s_title);
    				$('#psname').attr("src", "/www/profile/" + vo.sname);
    				$('#ylink1').attr("src", "https://www.youtube.com/embed/" + vo.y_link);
    				$('#ylink2').attr("src", "https://www.youtube.com/embed/" + vo.y_link);
    				for(var i=0 in vo.comt){
    					if(vo.comt[i].c_upid == null){
    						$('#comt').append('<li data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'+vo.comt[i].c_mid+'</strong> '+vo.comt[i].c_body+'</li>');
    					}else{
    						$('#comt').append('<li data-cno="'+vo.comt[i].c_no+'" data-user="'+vo.comt[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'+vo.comt[i].c_mid+'</strong> <i>'+vo.comt[i].c_upid+'</i> '+vo.comt[i].c_body+'</li>');
    					}
    				} 
    				
    				//좋아요 누르기
    				$('#heart').click(function(e){
    					e.preventDefault();
    					$.ajax({
    						url : "/www/likeProc.mr",
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
    				
    				//댓글기능
    				var upno = 1;
    				var upid = '';
    				$(document).on("click", '.list-group-item', function() {
    					upno = $(this).attr('data-cno');
    					upno = Number(upno);
    					upid = $(this).attr('data-user');
    					$("#c_body").val(upid+" ");
    				});
    				$("#c_body").keyup(function(e){
    					if(e.keyCode == 13){
    						e.preventDefault();
    						setTimeout(function(){}, 500);
    						var cbody = $('#c_body').val();
    						if(cbody == ""){
    							return;
    						}
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
    								$('#comt').html("");
    								for(var i=0 in vo){
    									if(vo[i].c_upid == null){
    										$('#comt').append('<li data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'+vo[i].c_mid+'</strong> '+vo[i].c_body+'</li>');
    									}else{
    										$('#comt').append('<li data-cno="'+vo[i].c_no+'" data-user="'+vo[i].c_mid+'"  class="list-group-item pt-0 pb-1 pl-0 ml-0 active"><strong class="user">'+vo[i].c_mid+'</strong> <i>'+vo[i].c_upid+'</i> '+vo[i].c_body+'</li>');
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
    			},
    			error : function(){
    				alert('### 통신 에러 ###');
    			}
    		});
    	});
      })
    </script>
  </body>
</html>
