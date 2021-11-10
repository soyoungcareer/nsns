<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

    <title>낙성대학교</title>
  </head>
  
  <body>
    <section class="material-half-bg">
      <div class="cover"></div>
    </section>
    <section class="login-content">
      <div style="float:left;">
        <!-- <h1>낙성대학교</h1> class="logo"-->
        <img src="resources/bootstrap/docs/images/nakseongLogowhite.png" width="200px" height="200px" style="margin-bottom:20px;"> 
      </div>
      
      <div class="login-box"  style="margin-bottom:20px;">
      
        <form id="loginForm" name="loginCheck" action="login.ber" class="login-form" method="post"><!-- action="login.ber"  -->
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
          </div>
          <div class="form-group">
            <label class="control-label">비밀번호</label>
            <input class="form-control" type="password" id="userPwd" name="userPwd">
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
            <button class="btn btn-primary btn-block" onclick="loginAlert();"><i class="fa fa-sign-in fa-lg fa-fw"></i>로그인</button>
          </div>
        </form>
        
        
      </div>
    </section>
    
    <script>
    	function loginAlert(){
    		var formCh = document.loginCheck;
    		if(!formCh.userId.value){
    			alert("직번/교번을 입력하세요.");
    			formCh.userId.focus();
    			return false;
    		}
    		if(!formCh.userPwd.value){
    			alert("비밀번호를 입력하세요.");
    			formCh.userPwd.focus();
    			return false;
    		}
    		
    		//formCh.action = "login.ber";
    		formCh.submit();
    	}
    </script>
    				
    				
    <script>
	$(function(){
    boom();
    
    function boom(){
		var bno = "a";
		$.ajax({
			url:"boom.me",
			data:{bno:bno},
			type:"get",
			success:function(data){
				console.log("!@#");
			
			},error:function(){
				console.log("댓글 리스트조회용 ajax 통신 실패");
			}
		});
	}
    
	});
	

    
    </script>
    
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