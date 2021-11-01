<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>낙성대학교 - 온라인강의</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/bootstrap/docs/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/bootstrap/docs/css/styles.css" rel="stylesheet" />
<!-- Main CSS-->

<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.8.1/video-js.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/video.js/7.8.1/video.min.js"></script>


</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="lecMove.me">낙성대학교</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Page content-->
	<div class="container">
		<button type="button" class="btn btn-default btn-lg" onclick="location.href='lecMoves.me?no=${l.regNo}'">
  <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span> 뒤로
</button>
		<div class="text-center mt-5">
			<video width="1280" height="720" controls  src="resources/upload_files/${l.changeName}"
					type="video/mp4" id="video">


			</video>
<span class="glyphicon glyphicon-menu-left"></span>

		</div>
	</div>

	<br>
	<br>
	<br>



	<div class="container">

			</button>
		<div class="text-center mt-5">
			<h4>댓글</h4>
			<table id="replyArea" class="table" align="center">
				<thead>
					<tr>
						<th colspan="2" style="width: 75%"><textarea
								class="form-control" id="replyContent" rows="2"
								style="resize: none; width: 100%"></textarea></th>
						<th style="vertical-align: middle"><button
								class="btn btn-secondary" id="addReply">등록하기</button></th>


					</tr>
					<tr>
						<td colspan="3">댓글 (<span id="rcount">0</span>)
						</td>
					</tr>
				</thead>
				<tbody>

				</tbody>
			</table>
		</div>
		<br> <br>
	</div>
	<script>
		
		var video = document.querySelector("#video");
		
		var TotalTime;
		console.log("asd1");
		video.addEventListener("loadedmetadata", function() {
			 video.currentTime = ${l.time};
			TotalTime = video.duration;
			TotalTime = Math.ceil(TotalTime);
			console.log(TotalTime);
			console.log("asd");
		});

		$(function(){
			selectReplyList();
			
			$("#addReply").click(function(){
	    		var bno = ${l.listNo};
				var a = ${id};
				if($("#replyContent").val().trim().length != 0){
					
					$.ajax({
						url:"rinsertt.bo",
						type:"post",
						data:{replyContent:$("#replyContent").val(),
							  refbNo:bno,
							  replyWriter:a},
						success:function(result){
							if(result > 0){
								$("#replyContent").val("");
								selectReplyList();
								
							}else{
								alert("댓글등록실패");
							}
						},error:function(){
							console.log("댓글 작성 ajax 통신 실패");
						}
					});
					
				}else{
					alert("댓글등록하셈");
				}
				
			});
		});
		
		function selectReplyList(){
			var bno = ${l.listNo};
			$.ajax({
				url:"rlistt.bo",
				data:{bno:bno},
				type:"get",
				success:function(list){
					$("#rcount").text(list.length);
					
					var value="";
					$.each(list, function(i, obj){
						
						if(20193019 == obj.replyWriter){
							value += "<tr style='background:#EAFAF1'>";
						}else{
							value += "<tr>";
						}
						
						value += "<th>" + obj.replyWriter + "</th>" + 
									 "<td>" + obj.replyContent + "</td>" + 
									 "<td>" + obj.createDate + "</td>" +
							 "</tr>";
					});
					$("#replyArea tbody").html(value);
				},error:function(){
					console.log("댓글 리스트조회용 ajax 통신 실패");
				}
			});
		}
	     
		setInterval(function() {
			var no = ${l.listNo};
			var times = video.currentTime;
			times = Math.ceil(times);
			console.log(times);

			$
					.ajax({
						url : "lectime.me",
						type : "post",
						data : {
							times : times,
							TotalTime : TotalTime,
							no : no

						},
						async : false,
						success : function(data) {

						},
						error : function(request, status, error) {
						
						}

					});

		}, 6000);
	</script>




	

</body>
</html>
