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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<%--아이콘 --%>
<script src="https://kit.fontawesome.com/70f5e54b83.js"
	crossorigin="anonymous"></script>
<style>
.container{
float:left;
margin-left : 150px;

}
.weather{
float:right;
margin-right : 80px;	

}


</style>


</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="lecMove.me?no=1">낙성대학교</a>
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
						role="button" data-bs-toggle="dropdown" aria-expanded="false">학생용</a>
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
	

		<div class="text-center mt-5">
			<h1>Online lecture at Nakseong University.</h1>
			<p class="lead"></p>
			<p>학습중인 과정</p>
		</div>
	</div>

	<div class="container">

		<c:forEach items="${ list }" var="l">
			<table class="table table-hover table-bordered" id="sampleTable">
				<thead>
					<tr>
						<th>년도</th>
						<th>학과명</th>
						<th>교수명</th>
						<th>강의명</th>
					</tr>
				<tbody>

					<tr
						onclick="location.href='lecMoves.me?no=${l.lecNo}&id=${l.stuId }'">
						<td width="20%">${l.lecYear }-${l.lecTer}</td>
						<td width="20%">${ l.deptTitle }</td>
						<td width="30%">${ l.proName }</td>
						<td width="30%">${ l.lecTitle }</td>

					</tr>

				</tbody>
			</table>
		</c:forEach>
	</div>
	
	<div class="weather" border="3px">
	<div>
	<div style="display: inline-block">
		<div class="CurrIcon"></div>
		<div class="CurrTemp"></div>
		<div class="City"></div>

	</div>
		<div style="display: inline-block">
		<div class="CurrIcon1"></div>
		<div class="CurrTemp1"></div>
		<div class="City1"></div>
	</div>
		</div>
	
	
	<div>
	<div style="display: inline-block">
		<div class="CurrIcon2"></div>
		<div class="CurrTemp2"></div>
		<div class="City2"></div>

	</div>
		<div style="display: inline-block">
		<div class="CurrIcon3"></div>
		<div class="CurrTemp3"></div>
		<div class="City3"></div>
	</div>
		</div>
	
	
	
	<div>
	<div style="display: inline-block">
		<div class="CurrIcon4"></div>
		<div class="CurrTemp4"></div>
		<div class="City4"></div>

	</div>
		<div style="display: inline-block">
		<div class="CurrIcon5"></div>
		<div class="CurrTemp5"></div>
		<div class="City5"></div>
	</div>
		</div>
	
	
	</div>
	


	<script>
		$(document)
				.ready(
						function() {
							let weatherIcon = {
								'01' : 'fas fa-sun',
								'02' : 'fas fa-cloud-sun',
								'03' : 'fas fa-cloud',
								'04' : 'fas fa-cloud-meatball',
								'09' : 'fas fa-cloud-sun-rain',
								'10' : 'fas fa-cloud-showers-heavy',
								'11' : 'fas fa-poo-storm',
								'13' : 'far fa-snowflake',
								'50' : 'fas fa-smog'
							};

							var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=ed92eb07a97fa82702ef5ff5d1c3352b";
							$
									.ajax({
										url : apiURI,
										dataType : "json",
										type : "GET",
										async : "false",
										success : function(resp) {
										

											var $Icon = (resp.weather[0].icon)
													.substr(0, 2);
											var $Temp = Math
													.floor(resp.main.temp  - 273.15)
													+ 'º';
											var $city = resp.name;
											$('.CurrIcon')
													.append(
															'<i class="' + weatherIcon[$Icon] +'"></i>');
											$('.CurrTemp').prepend($Temp);
											$('.City').append($city);

										}

									});
							
							var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Busan&appid=ed92eb07a97fa82702ef5ff5d1c3352b";

							$
							.ajax({
								url : apiURI,
								dataType : "json",
								type : "GET",
								async : "false",
								success : function(resp) {
								

									var $Icon = (resp.weather[0].icon)
											.substr(0, 2);
									var $Temp = Math
											.floor(resp.main.temp  - 273.15)
											+ 'º';
									var $city = resp.name;
									$('.CurrIcon1')
											.append(
													'<i class="' + weatherIcon[$Icon] +'"></i>');
									$('.CurrTemp1').prepend($Temp);
									$('.City1').append($city);

								}

							});
							
							
							var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Sokcho&appid=ed92eb07a97fa82702ef5ff5d1c3352b";

							$
							.ajax({
								url : apiURI,
								dataType : "json",
								type : "GET",
								async : "false",
								success : function(resp) {
								

									var $Icon = (resp.weather[0].icon)
											.substr(0, 2);
									var $Temp = Math
											.floor(resp.main.temp  - 273.15)
											+ 'º';
									var $city = resp.name;
									$('.CurrIcon2')
											.append(
													'<i class="' + weatherIcon[$Icon] +'"></i>');
									$('.CurrTemp2').prepend($Temp);
									$('.City2').append($city);

								}

							});
							
							
							var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Jeju&appid=ed92eb07a97fa82702ef5ff5d1c3352b";

							$
							.ajax({
								url : apiURI,
								dataType : "json",
								type : "GET",
								async : "false",
								success : function(resp) {
									

									var $Icon = (resp.weather[0].icon)
											.substr(0, 2);
									var $Temp = Math
											.floor(resp.main.temp  - 273.15)
											+ 'º';
									var $city = resp.name;
									$('.CurrIcon3')
											.append(
													'<i class="' + weatherIcon[$Icon] +'"></i>');
									$('.CurrTemp3').prepend($Temp);
									$('.City3').append($city);

								}

							});
							
							var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Pohang&appid=ed92eb07a97fa82702ef5ff5d1c3352b";

							$
							.ajax({
								url : apiURI,
								dataType : "json",
								type : "GET",
								async : "false",
								success : function(resp) {
									
									var $Icon = (resp.weather[0].icon)
											.substr(0, 2);
									var $Temp = Math
											.floor(resp.main.temp  - 273.15)
											+ 'º';
									var $city = resp.name;
									$('.CurrIcon4')
											.append(
													'<i class="' + weatherIcon[$Icon] +'"></i>');
									$('.CurrTemp4').prepend($Temp);
									$('.City4').append($city);

								}

							});
							
							var apiURI = "http://api.openweathermap.org/data/2.5/weather?q=Paju&appid=ed92eb07a97fa82702ef5ff5d1c3352b";

							$
							.ajax({
								url : apiURI,
								dataType : "json",
								type : "GET",
								async : "false",
								success : function(resp) {
							

									var $Icon = (resp.weather[0].icon)
											.substr(0, 2);
									var $Temp = Math
											.floor(resp.main.temp  - 273.15)
											+ 'º';
									var $city = resp.name;
									$('.CurrIcon5')
											.append(
													'<i class="' + weatherIcon[$Icon] +'"></i>');
									$('.CurrTemp5').prepend($Temp);
									$('.City5').append($city);

								}

							});
						});
	</script>


</body>
</html>
