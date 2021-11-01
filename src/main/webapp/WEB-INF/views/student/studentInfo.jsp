<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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

        
        <div class="col-md-8">
          <div class="tab-content">
              <div class="tile user-settings">
                <h4 class="line-head" style="color:gray;"><i class="fa fa-pencil-square-o" aria-hidden="true"> 학생의 개인정보 수정은 이메일, 전화번호, 주소만  가능합니다.</i></h4>
                <form action="updateStudent.stu" method="post" id="studentInfoForm">
                  <div class="row mb-4">
                    <div class="col-md-3">
                      <label>이름</label>
                      <input class="form-control" type="text" id="stuName"  name="stuName" value="${student.stuName}" readonly>
                    </div>
                    <div class="col-md-3">
                      <label>학번</label>
                      <input class="form-control" type="text" id="stuId" name="stuId" value="${student.stuId}" readonly>
                    </div>
                      <div class="col-md-3">
	                      <label>전공</label>
	                      <input class="form-control" type="text" id="deptName" name="deptName" value="${student.deptName}" readonly>
	                    </div>
	                    <div class="col-md-3">
	                      <label>담당 교수</label>
	                      <input class="form-control" type="text" id="proName" name="proName" value="${student.proName}" readonly>
	                    </div>
                    </div>
                   
                
                  <div class="row mb-5">
                  <div class="col-md-3">
                      <label>학적상태</label>
                      <input class="form-control" type="text"  id="stuStatus" name="stuStatus"  value="${student.stuStatus}"  readonly>
                    </div>
                    <div class="col-md-3">
                      <label>수강학점</label>
                      <input class="form-control" type="number" id="stuCredit" name="stuCredit"  value="${student.stuCredit}" readonly>
                    </div>
                    <div class="col-md-6">
                      <label>주민번호</label>
                      <input class="form-control" type="text"  id="ssn" name="ssn" value="${student.ssn}" readonly>
                    </div>
                  </div>
                    
                   <div class="row mb-4">
                    <div class="clearfix"></div>
	                    <div class="col-md-5 mb-4">
	                      <label>이메일</label>
	                      <input class="form-control" type="email"  id="email" name="email" value="${student.email}">
	                    </div> 
                    </div>
                    
                     <div class="row mb-4">
                		<div class="clearfix"></div>
		                  <div class="col-md-5 mb-4">
		                      <label>전화번호</label>
		                      <input class="form-control" type="tel" id="phone" name="phone" value="${student.phone}">
		                  </div>
                      </div>
                      
                    <div class="row mb-4">
	                    <div class="clearfix"></div>
	                    <div class="col-md-8 mb-4">
	                      <label>주소</label>
	                      <input class="form-control" type="text"  id="address" name="address" value="${student.address}"> 
	                    </div>
                    </div>
                    
                  <div class="row mb-8">
                     <div class="col-md-3 mb-5">
                      <button class="btn btn-primary" type="submit">정보수정</button> 
	                  </div>
                   </div>
                </form>
                <hr style="border: 0.5px solid gray; margin-bottom:30px">
                <div class="row mb-4">
	                    <div class="clearfix"></div>
	                    <div class="col-md-8 mb-4">
	                      <label><b>비밀번호 변경을 위해서는 이메일 인증이 필요합니다.</b></label>&nbsp;&nbsp;
	                      <button class="btn btn-warning btn-sm" type="button" id="chgBtn">이메일 인증</button>
	                    </div>
                 </div>
        </div>
      </div>
      </div>
    </main>
   

  </body>
  <script>
	//전화번호 자동 (-) 추가
	$("#studentInfoForm input[name=phone]").on("keyup", function() { 
	    $(this).val($(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-")); 
	 });
	
	$("#chgBtn").click(function(){
		
		//인증할 메일 전송하고 
		var email = $("#email").val();
		
		  $.ajax({
		        type:"GET",
		        
		        url:"mailCheck?email=" + email,
		        		
		        success: function(data){
		        	
		        	console.log(data);
		        	
		        	var windowUrl = 'email.em';

		        	var windowName = '이메일 인증' ;

		        	var popupWindow = window.open(windowUrl, windowName, "top=200px, left=300px, height=350px, width=450px, resizable=no")

		        			출처: https://jinstale.tistory.com/111 [HINARI]");
		        	
		        	
					var popupForm = document.popupForm;
		        	
		        	popupForm = document.createElement("form");

		        	popupForm.setAttribute("name", "popupForm");

		        	popupForm.setAttribute("method", "post");

		        	popupForm.setAttribute("action", "email.em");

		        	var input = document.createElement('input');

		        	input.setAttribute("type", "hidden");

		        	input.setAttribute("name", "data");

		        	input.setAttribute("value", data);

		            popupForm.appendChild(input);

		            popupForm.target = windowName;

		        	document.body.appendChild(popupForm);

		        	popupForm.data.value = data;

		        	popupForm.submit();

		        },
				error:function(e){
					alert("이메일 전송이 실패했습니다.");
				}
		    });
		
	})
	



  
  </script>
</html>
