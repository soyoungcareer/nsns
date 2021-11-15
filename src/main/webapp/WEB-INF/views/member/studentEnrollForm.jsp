<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
    <jsp:include page="../admin/adminMenubar.jsp" />
      
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-address-card-o"></i> 학생 관리</h1>
        </div>
        
      </div>
      <div class="row">
        <div class="col-lg-10" style="float:none; margin:0 auto;">
          <div class="tile">
            <h3 class="tile-title">학생 계정 등록</h3>
            <div class="tile-body">  
              <form id="studentEnrollForm" action="insertStu.adm" method="post">
                <div class="form-group">
                  <label class="control-label">이름</label>
                  <input class="form-control" type="text" id="stuName" name="stuName" required>
                </div>
                <div class="form-group">
                  <label class="control-label">비밀번호</label>
                  <input class="form-control" type="text" id="stuPwd" name="stuPwd" required placeholder="주민번호 뒷자리">
                </div>
                
                <div class="form-group">
                  <label class="control-label">주민번호</label>
                  <input class="form-control" type="text" id="ssn" name="ssn" required>
                </div>
                <div class="form-group">
                  <label class="control-label">이메일</label>
                  <input class="form-control" type="email" id="email" name="email">
                </div>
                <div class="form-group">
                  <label class="control-label">연락처</label>
                  <input class="form-control" type="text" id="phone" name="phone">
                </div>
                
                <div class="form-group">
                    <label for="stuName">학과</label>
                    <select class="form-control" id="deptCode" name="deptCode" required>
                      <option value=1>경제학</option>
                      <option value=2>국어국문</option>
                      <option value=3>철학</option>
                      <option value=4>호텔경영</option>
                      <option value=5>시각디자인</option>
                      <option value=6>역사학</option>
                      <option value=7>정보통신</option>
                      <option value=8>연극영화</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                  <label class="control-label">학번 생성 (자동)</label>
                  <input class="form-control" type="text" id="stuId" name="CreateStuId" required>
                </div>
                
                <script>
                	document.getElementById('stuId').value=new Date().getFullYear().toString(); 
                </script>

                <div class="form-group">
                  <label class="control-label">담당교수</label>
                  <input class="form-control" type="text" id="profId" name="profId" required>
                </div>
                
                <div class="tile-footer" align="center">
              		<button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>등록</button>
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