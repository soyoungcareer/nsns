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
    <title>Form Samples - Vali Admin</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>
   
   <main class="app-content">
     
      <div class="row">
      
        <div class="col-md-5">
        
        	<div class="bs-component">
             
            </div>
          <div class="tile">
             <h4 class="title"> 비밀번호 변경 </h4>
             
             <hr style="boder: 1px solid black">
             
              <form class="form-horizontal" id="chgPWForm">
           			 
            	<div class="tile-body">
                
                <div class="form-group row">
                  <label class="control-label col-md-3">변경할 비밀번호 : </label>
                  <div class="col-md-4">
                    	<input class="form-control" type="password" id="stuPwd" name="stuPwd">
                  </div>
                </div>
                
                  
                <div class="form-group row">
                  <label class="control-label col-md-3">비밀번호 확인 : </label>
                  <div class="col-md-4">
                    	<input class="form-control" type="password" id="checkPW" name="checkPW">
                  </div>
                </div>
                
                
            </div>
            <div class="tile-footer">
                
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                  <button class="btn btn-primary" type="button" onclick="change();">변경</button>
                </div>
              </div>
            </div>
            
            </form>

          </div>
        </div>
       
      </div>
    </main>
        
        
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
    <script>
    
   

	function change(){
    	
		if($('#stuPwd').val() != $('#checkPW').val()){
			var str = ' <div class="alert alert-dismissible alert-danger">' 
    			+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
    			+ ' <strong>확인!</strong> 비밀번호가 일치하지 않습니다. '
    			+ ' </div> '
    			
    			$('.bs-component').empty();
    			$('.bs-component').append(str);
    			
		} else {
			$.ajax({
			       type: "POST",
			       url: "changePW.stu",
			       data: { stuPwd : $('#stuPwd').val()},      

			         success: function(result) {
			        	 
			        	if(result > 0) {
			        		
			        		swal({
					      		title: "비밀번호 변경 성공",
					      		type: "success",
					      		confirmButtonText: "확인",
					      		closeOnConfirm: false
					      	}, function(isConfirm) {
					      		if (isConfirm) {
					      			window.close(); 
					      		}
					      	});
			        	} 
			        	
			        }, error: function() {
			        	
			          alert("Ajax 연결 실패");
			       }

			});
		}
		
	}
		
 
    </script>
   
  </body>
  
    
</html>