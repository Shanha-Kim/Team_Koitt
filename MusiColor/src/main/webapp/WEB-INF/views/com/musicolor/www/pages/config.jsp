<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>프로필 수정 페이지</title>
	<link rel="stylesheet" href="/css/bootstrap-lux.css">
	<link rel="stylesheet" href="/css/bootstrap.custom.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
	<style>
		.box {
			justify-content: space-between;
			width: 350px;
			height: 700px;
			margin: 0 auto;
			margin-top: 100px;
		}

		img {
			width: 100px;
			height: 110px;
		}
	</style>


</head>

<body class="bg-primary">
<jsp:include page="nav.jsp" flush="false" />

	<form action="/profilepic.mr" method="post" enctype="multipart/form-data" style="display: none;" id="fileup-frm">
	 	<input type="file" name="sFile" id="fileup"> 
	</form>
	
	<form action="/profiletext.mr" method="post" id="textup-frm" >
	<input type="text" name="m_id" value="${SID}">
		<div class="container" id="main">
			<div class="card text-white bg-primary mb-" style="max-width: 40rem;">

				<button type="button" id="backbtn" class="btn btn-info"
						style="width:100px; display: inline;">뒤로가기</button>
						
				<div class="card-header">프로필 편집</div>
				
				<div class="card-body">
					<h4 class="card-title" style= "margin-bottom: 30px;">사용자 ID</h4>
					<div class="imgbox text-center">
						
						<img src="/profile/${s_name}" alt="noimage" class="profIn" id="profImg">
						
						<p></p>
						<button type="button" class="btn btn-info" style="padding: 0px; width: 135px; height: 25px;"
							name="sFile" id="myBtn"> 프로필 사진 바꾸기</button>
					</div>
					<p></p>
					<div class="form-group">
						<label for="realname">닉네임</label> <input type="text" class="form-control" name="m_name"
							id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Your Name">
					</div>
					<br>
					<div class="form-group">
						<label for="username">소개글</label> <input type="text" class="form-control" name="m_about"
							id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter your introduction">
					</div>
					<br>
					<div class="card-header">개인 정보 </div>
					<div class="form-group">
						<label for="exampleInputEmail1">E-mail</label> <input type="email" class="form-control" name="m_email"
							id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Your E-mail">
					</div>
					<br>
					<div class="form-group">
						<label for="exampleInputEmail1">Tel</label> <input type="text" class="form-control" name="m_tel"
							id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter Your Phone Number">
					</div>

					<div class="configtextbox text-center">
						<button type="submit"  class="btn btn-info" id="conform" style="width: 40%; display: inline;">회원정보 수정</button>
						<br>

						<div class="card-header">계정을 일시적으로 비활성화 하고 싶습니까?</div>
						<button type="button" id="tembtn" class="btn btn-info"
						style="width: 40%; display: inline;">계정을 일시적으로 비활성화</button>
					</div>
				</div>
			</div>
		</div>
	</form>


	<div class="modal" id="myModal">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">Music color</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body text-center">
					<h4>프로필 사진 바꾸기</h4>
					<br>
					<button class="btn btn-primary btn-block" id="addpic" name="sFile">사진 업로드</button>
					<button class="btn btn-danger btn-block" id="deletepic">현재 사진 삭제</button>
					<button class="btn btn-secondary btn-block" data-dismiss="modal" aria-label="Close">취소</button>

				</div>
			</div>
		</div>
	</div>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		/* $(function(){
		 $('.profile').click(function(){
		 $(location).attr('href','');
		
		 });
		
		 });	
		 */
		$(function () {
			var sid='${SID}';
			$("#myBtn").click(function () {
				$("#myModal").modal("show");
			});
			
			$('#backbtn').click(function(){
			$(location).attr('href',"/profilelist.mr?m_id="+sid);	
			});
			
			$("#addpic").click(function(e){
				e.preventDefault();
				$("#fileup").click();
				$("#fileup").change(function(e){
					alert("첨부가 완료 되었습니다.");
					$(".close").click();
					$("#fileup-frm").submit();
					var tmp = URL.createObjectURL(e.target.files[0]);
		          	$('#profImg').attr('src', tmp);
				});
			});
			
			$('#fileup').change(function (e){
	          
			});
			
	/* 	
		$('#fileup-frm').submit();

		});
		 $(function(){
			
			 
			 
		 });
		  */
		  
		/*   
		  $("#conform").click(function(){
			 $(location).attr('href','/profilelist.mr'); 
		  });
		   */
		  
		  
		  $("#tembtn").click(function(){
			alert("계정이 비활성화 되었습니다.")
			$(location).attr('href','/lock.mr');
		  });
	  });
		 
</script>
</body>

</html>