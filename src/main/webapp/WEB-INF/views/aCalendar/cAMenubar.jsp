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
    <title>낙성대학교</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <style>
  .fc-time{ display: none; }
  </style>
  <body class="app sidebar-mini">
    <!-- Navbar-->
    <header class="app-header"><a class="app-header__logo" href="${ pageContext.servletContext.contextPath }/subModifyList.adm">낙성대학교</a>
      <!-- Sidebar toggle button--><a class="app-sidebar__toggle" href="#" data-toggle="sidebar" aria-label="Hide Sidebar"></a>
      <!-- Navbar Right Menu-->
      
    </header>
    <!-- Sidebar menu-->
     <div class="app-sidebar__overlay" data-toggle="sidebar"></div>
    <aside class="app-sidebar">
      <div class="app-sidebar__user">
         <div style="margin-left:10px;">
          <p class="app-sidebar__user-name">admin</p>
          <p class="app-sidebar__user-designation">낙성대학교 관리자</p>
        </div>
      </div>
   	<ul class="app-menu">
   	    <li><a class="app-menu__item" href="calendar.ca" ><i class="app-menu__icon fa fa-calendar"></i><span class="app-menu__label">학사일정</span></a></li>
        <li><a class="app-menu__item" href="upload.ca"><i class="app-menu__icon fa fa-edit"></i><span class="app-menu__label">학사일정 관리</span></a></li>
      </ul>
    </aside>
</body>
    <!-- Essential javascripts for application to work-->
    <script src="resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
    <script src="resources/bootstrap/docs/js/popper.min.js"></script>
    <script src="resources/bootstrap/docs/js/bootstrap.min.js"></script>
    <script src="resources/bootstrap/docs/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/moment.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/jquery-ui.custom.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.3/dist/fullcalendar.min.js"></script>
</html>