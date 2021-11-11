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
    <!-- <title>Vali Admin - Free Bootstrap 4 Admin Template</title> -->
    <title>메뉴바</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
  </head>
  <body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="">낙성대학교</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>

      <!-- Navbar Right Menu-->
      <ul class="app-nav">
        
        <li class="dropdown"><a class="app-nav__item" href="#" data-toggle="dropdown" aria-label="Open Profile Menu">
        <i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i></a>
          <ul class="dropdown-menu settings-menu dropdown-menu-right">
            <li><a class="dropdown-item"  href="registerAdmin.reg"> <i class="fa fa-pencil-square-o fa-lg" aria-hidden="true"></i>수강신청</a></li>
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
            <li><a class="dropdown-item" href="logout.adm"><i class="fa fa-sign-out fa-lg"></i> 로그아웃</a></li>
          </ul>
        </li>
      </ul>
    </header>
    <!-- Sidebar menu-->
    <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user">
      <!-- <img class="app-sidebar__user-avatar" src="https://s3.amazonaws.com/uifaces/faces/twitter/jsa/48.jpg" alt="User Image"> -->
        <div>
          <p class="app-sidebar__user-name"> &nbsp;&nbsp; admin <br> &nbsp;&nbsp;낙성대학교 관리자</p>
        </div>
      </div>
      <ul class="app-menu">
       
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-check-square-o"></i><span class="app-menu__label">강의 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="subModifyList.adm"><i class="icon fa fa-circle-o"></i> 강의 신청 내역</a></li>
            <!-- <li><a class="treeview-item" href="" target="_blank" rel="noopener"><i class="icon fa fa-circle-o"></i> Font Icons</a></li> -->
            <li><a class="treeview-item" href="subAllList.adm"><i class="icon fa fa-circle-o"></i> 전체 강의 조회</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-address-card"></i><span class="app-menu__label">교수 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="prfEnrollForm.adm"><i class="icon fa fa-circle-o"></i> 교수 계정 등록</a></li>
            <li><a class="treeview-item" href="prfList.adm"><i class="icon fa fa-circle-o"></i> 교수 계정 조회</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-address-card-o"></i><span class="app-menu__label">학생 관리</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="stuEnrollForm.adm"><i class="icon fa fa-circle-o"></i> 학생 계정 등록</a></li>
            <li><a class="treeview-item" href="stuList.adm"><i class="icon fa fa-circle-o"></i> 학생 계정 조회</a></li>
            <li><a class="treeview-item" href="stuOffStaList.adm"><i class="icon fa fa-circle-o"></i> 학적 변경 휴학</a></li>
            <li><a class="treeview-item" href="stuStaList.adm"><i class="icon fa fa-circle-o"></i> 학적 변경 자퇴</a></li>
          </ul>
        </li>
        
        <li class="treeview"><a class="app-menu__item" href="#" data-toggle="treeview"><i class="app-menu__icon fa fa-file-text"></i><span class="app-menu__label">강의 평가</span><i class="treeview-indicator fa fa-angle-right"></i></a>
          <ul class="treeview-menu">
            <li><a class="treeview-item" href="LectEvQ.adm"><i class="icon fa fa-circle-o"></i> 강의 평가 등록</a></li>
            
          </ul>
        </li>
        
        <li><a class="app-menu__item" href="list.ntc"><i class="app-menu__icon fa fa-bullhorn"></i><span class="app-menu__label">공지사항</span></a></li>
      </ul>
    </aside>
   
        <div class="col-md-6">
          <!-- <div class="tile">
            <h3 class="tile-title">Support Requests</h3>
            <div class="embed-responsive embed-responsive-16by9">
              <canvas class="embed-responsive-item" id="pieChartDemo"></canvas>
            </div> -->
          </div>
      
      
    <!-- Essential javascripts for application to work-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap/docs/js/popper.min.js"></script>
    <script src="resources/bootstrap/docs/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap/docs/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/chart.js"></script>
    <script type="text/javascript">
      var data = {
      	labels: ["January", "February", "March", "April", "May"],
      	datasets: [
      		{
      			label: "My First dataset",
      			fillColor: "rgba(220,220,220,0.2)",
      			strokeColor: "rgba(220,220,220,1)",
      			pointColor: "rgba(220,220,220,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(220,220,220,1)",
      			data: [65, 59, 80, 81, 56]
      		},
      		{
      			label: "My Second dataset",
      			fillColor: "rgba(151,187,205,0.2)",
      			strokeColor: "rgba(151,187,205,1)",
      			pointColor: "rgba(151,187,205,1)",
      			pointStrokeColor: "#fff",
      			pointHighlightFill: "#fff",
      			pointHighlightStroke: "rgba(151,187,205,1)",
      			data: [28, 48, 40, 19, 86]
      		}
      	]
      };
      var pdata = [
      	{
      		value: 300,
      		color: "#46BFBD",
      		highlight: "#5AD3D1",
      		label: "Complete"
      	},
      	{
      		value: 50,
      		color:"#F7464A",
      		highlight: "#FF5A5E",
      		label: "In-Progress"
      	}
      ]
      
      var ctxl = $("#lineChartDemo").get(0).getContext("2d");
      var lineChart = new Chart(ctxl).Line(data);
      
      var ctxp = $("#pieChartDemo").get(0).getContext("2d");
      var pieChart = new Chart(ctxp).Pie(pdata);
    </script>
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>