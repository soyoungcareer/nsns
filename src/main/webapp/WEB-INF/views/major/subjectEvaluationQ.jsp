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
    <title>낙성대학교 강의 평가</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  
  <body class="app sidebar-mini">
    <jsp:include page="../admin/adminMenubar.jsp" />
    
    <main class="app-content">
    
      <div class="app-title">
        <div>
          <h1><i class="fa fa-th-list"></i> 강의 평가</h1>
        </div>
           
      </div>
      
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
            <form id="subjectEvQForm" action="subEvQ.adm" method="post">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead align="center">
                    <tr>
                      <th>항목</th>
                      <th>학년도</th>
                      <th>학기</th>
                      <th>등록</th>
                    </tr>
                  </thead>
                  <tbody align="center">
                    <!-- <c:forEach items="${ questionList }" var="ql"> -->
	                    <tr>
	                        <td>
	                        	<input type="text" id="question" name="question" placeholder="글자 수 최대 1000byte" required>
	                        </td>
	                        <td>
	                        	<input type="text" id="year" name="year" required>
	                        </td>
	                        <td>
	                        	<input type="text" id="semester" name="semester" required>
	                        	<input type="hidden" id="lectRegNum" name="lectRegNum">
	                        	<input type="hidden" id="stuId" name="stuId">
	                        </td>
	                        <td>
	                        	<button class="btn btn-primary">항목 등록</button>
	                        </td>
	                    </tr>
                    <!-- </c:forEach> -->
                  </tbody>
                </table>       
              </div>
              
              <div>
              	<button class="btn btn-primary" type="submit">등록</button>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div> 
            
    </main>
    
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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