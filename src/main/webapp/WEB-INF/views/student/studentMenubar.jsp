<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>Vali Admin - Free Bootstrap 4 Admin Template</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="${ pageContext.servletContext.contextPath }">낙성대학교</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      <ul class="app-nav">

      	<!-- <li class="calendar">
         <a class="calendar-link" href="calendar.ca" style="color: white;">학사일정</a>

      수강신청 페이지 확인용
       <li class="register">
         <a class="register-link" href="register.reg" style="color: white;">수강신청</a>
        </li>
         -->

		<li class="register">
         <a class="register-link" href="chat.do" style="color: white;">채팅</a>
        </li>
        
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-headphones fa-lg" aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="javascript:void(window.open('lecMove.me?id=20193019'))"> <i class="fa fa-headphones fa-lg" aria-hidden="true"></i>온라인 강의실</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="register.reg"> <i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i>수강신청</a></li>
          </ul>
        </li>
          <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-archive fa-lg"  aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="facMove.me"> <i class="fa fa-archive fa-lg" aria-hidden="true"></i>시설물대여</a></li>
          </ul>
        </li>
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-calendar-o fa-lg"  aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="calendar.ca"> <i class="fa fa-calendar-o fa-lg" aria-hidden="true"></i>학사일정</a></li>
          </ul>
        </li>
        <!-- User Menu-->
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu"><i class="fa fa-user fa-lg"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item" href="stuinfo.st"><i class="fa fa-user fa-lg"></i>내 정보 확인</a></li>
            <li><a class="dropdown-item" href="logout.stu"><i class="fa fa-sign-out fa-lg"></i> 로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user">
        <div style="margin-left:10px;">
          <p class="app-sidebar__user-name">John Doe</p>
          <p class="app-sidebar__user-designation">Frontend Developer</p>
        </div>
      </div>
      <ul class="app-menu"> 
        <li><a class="app-menu__item" href="subject.li"><i class="app-menu__icon fa fa-book"></i><span class="app-menu__label">수강과목</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-pencil"></i><span class="app-menu__label">성적</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="grade.gra"><i class="icon fa fa-circle-o"></i> 성적 조회</a></li>
            <li><a class="treeview-item" href="gradeObject.obj"><i class="icon fa fa-circle-o"></i> 이의 신청 확인</a></li>
          </ul>
        </li>
        <li><a class="app-menu__item" href="credit.reg"><i class="app-menu__icon fa fa-th-list"></i><span class="app-menu__label">이수학점</span></a></li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-address-card-o"></i><span class="app-menu__label">학생상태</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="stuStatusPage.stu"><i class="icon fa fa-circle-o"></i> 신청내역</a></li>
            <li><a class="treeview-item" href="stuOffPage.stu"><i class="icon fa fa-circle-o"></i> 휴학신청</a></li>
            <li><a class="treeview-item" href="stuBackPage.stu"><i class="icon fa fa-circle-o"></i> 복학신청</a></li>
            <li><a class="treeview-item" href="stuDoPage.stu"><i class="icon fa fa-circle-o"></i> 자퇴신청</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-certificate"></i><span class="app-menu__label">증명서</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="graduation.cer"><i class="icon fa fa-circle-o"></i> 졸업증명서</a></li>
            <li><a class="treeview-item" href="certificate.cer"><i class="icon fa fa-circle-o"></i> 자격증/봉사활동</a></li>
            <li><a class="treeview-item" href="crawMain.cer"><i class="icon fa fa-circle-o"></i> 취업</a></li>
          </ul>
        </li>
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-comments"></i><span class="app-menu__label">상담</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="consultStatusPage.con"><i class="icon fa fa-circle-o"></i> 신청내역</a></li>
            <li><a class="treeview-item" href="applyPage.con"><i class="icon fa fa-circle-o"></i> 상담신청</a></li>
          </ul>
        </li>
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
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/sweetalert.min.js"></script>
    
  	<c:if test="${!empty message}">
   		<script>
			$.notify({
		  		title: "",
		  		message: "${message}",
		  		icon: 'fa fa-check' 
		  	},{
		  		type: "info"
		  	});
		</script>
    </c:if>

  </body>
</html>