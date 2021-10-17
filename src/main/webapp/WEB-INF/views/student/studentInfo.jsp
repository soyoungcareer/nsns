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
    <title>User Profile - Vali Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
	<jsp:include page="studentMenubar.jsp"/>
	
    <main class="app-content">
    	<div class="app-title">
        	<div>
          		<h1><i class="fa fa-user-circle-o" aria-hidden="true"></i> 학생정보</h1>
        	</div>
      	</div>

        
        <div class="col-md-8" >
          <div class="tab-content">
              <div class="tile user-settings">
                <h4 class="line-head" style="color:gray;"><i class="fa fa-pencil-square-o" aria-hidden="true"> 학생의 개인정보 수정은 이메일, 전화번호, 주소만  가능합니다.</i></h4>
                <form>
                  <div class="row mb-4">
                    <div class="col-md-3">
                      <label>이름</label>
                      <input class="form-control" type="text"  value="유재석" readonly>
                    </div>
                    <div class="col-md-3">
                      <label>학번</label>
                      <input class="form-control" type="text" value="20143309" readonly>
                    </div>
                      <div class="col-md-3">
	                      <label>전공</label>
	                      <input class="form-control" type="text" value="시각디자인" readonly>
	                    </div>
	                    <div class="col-md-3">
	                      <label>담당 교수</label>
	                      <input class="form-control" type="text" value="이효리" readonly>
	                    </div>
                    </div>
                   
                
                  <div class="row mb-5">
                  <div class="col-md-3">
                      <label>학적상태</label>
                      <input class="form-control" type="text"  value="재학중" readonly>
                    </div>
                    <div class="col-md-3">
                      <label>수강학점</label>
                      <input class="form-control" type="text"  value="30" readonly>
                    </div>
                    <div class="col-md-3">
                      <label>입학연도</label>
                      <input class="form-control" type="text"  value="2021-03-07" readonly>
                    </div>
                    <div class="col-md-3">
                      <label>주민번호</label>
                      <input class="form-control" type="text" value="940312-1075318" readonly>
                    </div>
                  </div>
                    
                   
                   <div class="row mb-4">
                    <div class="clearfix"></div>
	                    <div class="col-md-5 mb-4">
	                      <label>이메일</label>
	                      <input class="form-control" type="text">
	                    </div>
	                    
	                    
                    </div>
                    
                     <div class="row mb-4">
                		<div class="clearfix"></div>
		                  <div class="col-md-5 mb-4">
		                      <label>전화번호</label>
		                      <input class="form-control" type="text">
		                  </div>
                      </div>
                      
                    <div class="row mb-4">
	                    <div class="clearfix"></div>
	                    <div class="col-md-8 mb-4">
	                      <label>주소</label>
	                      <input class="form-control" type="text">
	                    </div>
                    </div>
                    
                    
                  <div class="row mb-4">
                    <div class="col-md-10"> </div>
                      <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i> 수정하기 </button>
                  </div>
                </form>
        
        </div>
      </div>
    </main>
   

  </body>
</html>