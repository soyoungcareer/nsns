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
             <h4 class="title"> 이메일 인증 </h4>
             
             <hr style="boder: 1px solid black">
             
           			 
            	<div class="tile-body">
                
                <div class="form-group row">
                  <label class="control-label col-md-3">인증 번호 : </label>
                  <div class="col-md-4"> 
                    <input class="form-control col-md-8" type="text" name="checkNum" id="checkNum">
                  </div>
                </div>
                
                
            </div>
            <div class="tile-footer">
                
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                   <button class="btn btn-primary" type="button" id="checkBtn">인증확인</button>
                </div>
              </div>
            </div>
            
           

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
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/sweetalert.min.js"></script>
    <!-- Page specific javascripts-->
    
   
  </body>
  
    <script>
    $("#checkBtn").click(function(){
    	
    	var data = ${data}
    	
    	var checkNum = $("#checkNum").val();
    	
    	if(data == checkNum){
    		
    		alt();
    	
    	} else {
    		
    		 var str = ' <div class="alert alert-dismissible alert-danger">' 
	        		+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
	        		+ ' <strong>확인!</strong> 인증번호를 다시 한번 더 확인해 주세요.'
	        		+ ' </div> '
	        				
	        		$('.bs-component').empty();
	        		$('.bs-component').append(str);
	        		$("#checkNum").select();
    	}
    	
    })
    
    		function alt(){
    		 	swal({
		      		title: "인증번호 일치",
		      		text: "비밀번호를 변경하시겠습니까?",
		      		type: "success",
		      		showCancelButton: true,
		      		confirmButtonText: "예",
		      		cancelButtonText: "아니오",
		      		closeOnConfirm: false,
		      		closeOnCancel: false
		      	}, function(isConfirm) {
		      		if (isConfirm) {
		      			window.open('inputPw.stu', '비밀번호 변경', "top=200px, left=300px, height=450px, width=450px");
		      			window.close(); 
		      		} else {
		      			
		      			window.close(); 
		      		}
		      	});
    		}
    
    		
    
    </script>
</html>