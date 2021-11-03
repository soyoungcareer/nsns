<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   
  </head>
  <body class="app sidebar-mini">
  
	<jsp:include page="../student/studentMenubar.jsp"/>  
    
    
    <main class="app-content">
      <div class="app-title">
        	<div>
          		 <h1><i class="fa fa-address-card-o"></i> 학생상태</h1>
        	</div>
       </div>
        
      
      <div class="row">
        
        <div class="col-md-5">
        	<div class="bs-component">
             
            </div>
            
          	<div class="tile">
             <h4 class="title"><i class="fa fa-window-close-o" aria-hidden="true"></i> 자퇴 신청 </h4>
             
             <hr style="boder: 1px solid black">
             
              <form id="stuDoForm" class="form-horizontal" action="insertStuDo.stu" method="post" onsubmit="return checkDo();">
              	 	<div style="margin-left:300px;">
			             <label for="stuId"><b>학번 :</b> ${loginStu.stuId} </label> &nbsp;&nbsp;
			             
			             <label for="stuName"><b>이름 :</b> ${loginStu.stuName}  </label>&nbsp;&nbsp;
		             
           		 	</div>
           			 
           		
            	<div class="tile-body">
                
                <div class="form-group row" style="margin-top:30px;">
                  <label class="control-label col-md-3">담당교수</label>
                  <div class="col-md-3">
                   		<input  class="form-control" type="text" value="박기주" id="profName" name="profName" readonly>
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">신청일자</label>
                  <div class="col-md-4">
                    	<input class="form-control" type="date" id="offDay" name="offDay" readonly>
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">자퇴사유</label>
                  <div class="col-md-8">
	                   <textarea class="form-control" rows="5" id="doReason" name="doReason" placeholder="(100자 제한)" required></textarea>
                  </div>
                </div>
              
                
            </div>
            <div class="tile-footer">
                
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                  <button class="btn btn-primary" type="submit" id="submitBtn">신청</button>
                </div>
              </div>
            </div>
            
            </form>
          </div>
        </div>
     
      </div>
    </main>
    
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/select2.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/dropzone.js"></script>
    

    <script>
    
    
    $(function(){ 
		//신청일에 현재 날짜 고정시키기!
		var day = new Date().toISOString().substring(0, 10);
	    $('#offDay').val(day);
	     
	});
    
  

	  $('textarea').on('keydown', function() {
	        if($(this).val().length > 100) {
	        	
	            $(this).val($(this).val().substring(0, 100));
	            
	            var str = ' <div class="alert alert-dismissible alert-danger">'
					+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
					+ ' <strong>확인!</strong> 자퇴사유는 100자를 넘어갈 수 없습니다. '
					+ ' </div> '

				$('.bs-component').empty();
				$('.bs-component').append(str);
				
				$('#submitBtn').prop('disabled', false);
	            
	        } else {
	        	
	        	$('#submitBtn').prop('disabled', true);
	        }
	    });
	
	 function checkDo() {
	    var stuId = $("#stuId").val();
		var flag = true; 
  	  	
		$.ajax({
				url: "DoCount.stu",
				dataType:"json",
				data : { stuId :stuId },
				async : false,
				success: function(count){
					console.log(count);
					 if(count != 0) {
						  var str = ' <div class="alert alert-dismissible alert-danger">' 
				        		+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
				        		+ ' <strong>확인!</strong> 자퇴 신청 중인 내역이 있습니다. '
				        		+ ' </div> '
				        				
				        		$('.bs-component').empty();
				        		$('.bs-component').append(str);
				        		
				        	flag = false;
				  		}
				},
				error:function(){
					console.log("Ajax 통신 실패");
				}
			});
		
	   	return flag;
	 } 
	</script>

  </body>
</html>