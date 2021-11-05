<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- //no mapping 에러 : 부트스트랩 경로 가져오기 -->
    <!-- <c:set var = "path" value="${pageContext.request.contextPath}" /> -->
    
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>낙성대학교 학사행정시스템</title>
  </head>
  
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div style="float:left;">
        <!-- <h1>낙성대학교</h1> class="logo"-->
        <h2 style="color:white;"><img alt="낙성대학교" src="resources/upload_files/nsLogo.png" width="50" height="50" style="margin-bottom:15px;"> &nbsp;&nbsp; 낙성대학교</h2>
      	<!-- <img alt="낙성대학교" src="resources/upload_files/nsLogo.png" width="80" height="80" style="float:left;"> -->  	
      </div>
      
      
      <div class="login-box">
      
        <form id="loginForm" class="login-form" action="login.ber" method="post">
          <h4 class="login-head">로그인</h4>
          <div class="login-position">         	
          	<input id="stuLogin" type="radio" name="position" value="student" />
          	<label for="stuLogin">학생</label>
          	
          	<input id="prfLogin" type="radio" name="position" value="professor" />
          	<label for="prfLogin">교수</label>
          	
          	<input id="admLogin" type="radio" name="position" value="admin" />
          	<label for="admLogin">관리자</label>
          </div>
          
          <div class="form-group">
            <label class="control-label">학번/교번</label>
            <input class="form-control" type="text" id="userId" name="userId">
            <!-- <input class="form-control" type="text" id="admId" name="admId" placeholder="admin">
            <input class="form-control" type="hidden" id="stuId" name="stuId" placeholder="student">
            <input class="form-control" type="text" id="profId" name="profId" placeholder="professor"> -->
          </div>
          <div class="form-group">
            <label class="control-label">비밀번호</label>
            <input class="form-control" type="password" id="userPwd" name="userPwd">
            <!-- <input class="form-control" type="password" id="admPwd" name="admPwd" placeholder="admin">
            <input class="form-control" type="hidden" id="stuPwd" name="stuPwd" placeholder="student">
            <input class="form-control" type="password" id="profPwd" name="profPwd" placeholder="professor"> -->
          </div>
          <div class="form-group">
            <div class="utility">
              <div class="animated-checkbox">
                <!-- <label>
                  <input type="checkbox"><span class="label-text">Stay Signed in</span>
                </label> -->
              </div>
              <!-- <p class="semibold-text mb-2">계정 분실 시 학사팀 문의</p> -->
            </div>
          </div>
          <div class="form-group btn-container">
            <button class="btn btn-primary btn-block"><i class="fa fa-sign-in fa-lg fa-fw"></i>로그인</button>
          </div>
        </form>
        
        
      </div>
    </section>
    				
    
    <!-- Essential javascripts for application to work-->
    <script src="${pageContext.request.contextPath}/resources/bootstrap/docs/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/docs/js/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/docs/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap/docs/js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <script type="text/javascript">
      // Login Page Flipbox control
      $('.login-content [data-toggle="flip"]').click(function() {
      	$('.login-box').toggleClass('flipped');
      	return false;
      });
    </script>
  </body>
</html>