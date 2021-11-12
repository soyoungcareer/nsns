<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	
<!DOCTYPE html>
<html lang="en">
<head>
<meta name="description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<!-- Twitter meta-->
<meta property="twitter:card" content="summary_large_image">
<meta property="twitter:site" content="@pratikborsadiya">
<meta property="twitter:creator" content="@pratikborsadiya">
<!-- Open Graph Meta-->
<meta property="og:type" content="website">
<meta property="og:site_name" content="Vali Admin">
<meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
<meta property="og:url"
	content="http://pratikborsadiya.in/blog/vali-admin">
<meta property="og:image"
	content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
<meta property="og:description"
	content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
<title>FAC</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Main CSS-->
<link rel="stylesheet" type="text/css"
	href="resources/bootstrap/docs/css/main.css">
<!-- Font-icon css-->
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="app sidebar-mini">
	<!-- 추가 -->
	<!-- Navbar-->
	<header class="app-header">
		<a class="app-header__logo"
			href="${ pageContext.servletContext.contextPath }">낙성대학교</a>
		<!-- Sidebar toggle button-->
		<a class="app-sidebar__toggle" href="#" data-toggle="sidebar"
			aria-label="Hide Sidebar"></a>
		<!-- Navbar Right Menu-->
		<ul class="app-nav">
			<li class="registerAdmin"></li>

		</ul>
	</header>
	<!-- Sidebar menu-->
	<div class="app-sidebar__overlay" data-toggle="sidebar"></div>
	<aside class="app-sidebar">
		<div class="app-sidebar__user">
			<div style="margin-left: 10px">
				    <c:if test="${not empty loginStu }">
         	 <p class="app-sidebar__user-name">${loginStu.stuName }</p>
          	<p class="app-sidebar__user-designation">학번 : ${loginStu.stuId }</p>
         </c:if>
         
          <c:if test="${not empty loginAdm }">
                 <p class="app-sidebar__user-name">admin</p>
          <p class="app-sidebar__user-designation">낙성대학교 관리자</p>
         </c:if>
			</div>
		</div>
	<c:if test="${position eq 'student'}">
		<ul class="app-menu">
			<li><a class="app-menu__item" href="facMove.me"><i
					class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">대여목록</span></a></li>
			</c:if>

			<c:if test="${position eq 'student'}">
				<li><a class="app-menu__item" href="facMovess.me"><i
						class="app-menu__icon fa fa-laptop"></i><span
						class="app-menu__label">MY대여</span></a></li>
			</c:if>
			<c:if test="${position eq 'admin'}">

				<li><a class="app-menu__item" href="facMovesss.me"><i
						class="app-menu__icon fa fa-pie-chart"></i><span
						class="app-menu__label">관리자확인</span></a></li>
			</c:if>
			<c:if test="${position eq 'admin'}">

				<li><a class="app-menu__item" href="facMovessss.me"><i
						class="app-menu__icon fa fa-pie-chart"></i><span
						class="app-menu__label">관리목록</span></a></li>
			</c:if>


		</ul>
	</aside>

 
   
  
	<!-- Essential javascripts for application to work-->
	<script src="resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
	<script src="resources/bootstrap/docs/js/popper.min.js"></script>
	<script src="resources/bootstrap/docs/js/bootstrap.min.js"></script>
	<script src="resources/bootstrap/docs/js/main.js"></script>
	<!-- The javascript plugin to display page loading on top-->
	<script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
	<!-- Page specific javascripts-->
	<script type="text/javascript"
		src="resources/bootstrap/docs/js/plugins/chart.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/docs/js/plugins/select2.min.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/docs/js/plugins/bootstrap-datepicker.min.js"></script>
	<script type="text/javascript"
		src="resources/bootstrap/docs/js/plugins/bootstrap-notify.min.js"></script>
</body>
</html>