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
             <h4 class="title"><i class="fa fa-bed" aria-hidden="true"></i> 휴학 신청 </h4>
             
             <hr style="boder: 1px solid black">
             
              <form class="form-horizontal" action="insertStuOff.stu" method="post" onsubmit="return check();">
           			 <div style="margin-left:300px;">
			             <label for="stuId"><b>학번 :</b> ${loginStu.stuId} </label> &nbsp;&nbsp;
			             
			             <label for="stuName"><b>이름 :</b> ${loginStu.stuName}  </label>&nbsp;&nbsp;
		             
           		 	</div>
              
            	<div class="tile-body">
                
                <div class="form-group row" style="margin-top:30px;">
                  <label class="control-label col-md-3">휴학구분</label>
                  <div class="col-md-3">
                    <select  class="form-control" id="offCategory" name="offCategory">
						<option value="일반">일반</option>
						<option value="군">군</option>
					</select>
                  </div>
                </div>
                
                 <div class="form-group row">
                  <label class="control-label col-md-3">휴학학기수</label>
                  <div class="col-md-3">
	                    <select  class="form-control" id="offSemCnt" name="offSemCnt">
							<option value=1>1</option>
							<option value=2>2</option>
						</select>
                  </div>
                </div>
                
                 <div class="form-group row">
                  <label class="control-label col-md-3">휴학학기</label>
                  <div class="col-md-4">
	                    <input class="form-control" type="text" id="offSem" name="offSem" readonly>
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">신청일자</label>
                  <div class="col-md-4">
                    	<input class="form-control" type="date" id="offDay" name="offDay" readonly>
                  </div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">휴학사유</label>
                  <div class="col-md-8">
	                   <textarea class="form-control" rows="5" id="offReason" name="offReason" required></textarea>
                  </div>
                </div>
              
                
            </div>
            <div class="tile-footer">
                
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                  <button class="btn btn-primary" type="submit">신청</button>
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
    	    
    	  
    	    //휴학 신청한 월이 현재연도.03 ~ 현재연도.08까지 이면 현재연도 + 2학기 / 그외에는 내년 + 1학기 부터 휴학시작학기
	    	  var year = new Date().getFullYear();
	    	  var nextYear = year + 1 ;
	    	  
	    	  var start = year +"-"+"03-01";
	    	  var end = year +"-"+"08-31";
    	  
	    	  if(start<day && end>day) {
	    		  $('#offSem').val(year + "-2학기");
	    	  } else {
	    		  $('#offSem').val(nextYear + "-1학기");
	    	  }
    	})
    	
    	function check(){
	    	var stuId = $("#stuId").val();
	    	var flag = true; 
	    	
		   	$.ajax({
				url: "offCount.stu",
				dataType:"json",
				async : false,
				success: function(count){
					console.log(count);
					 if(count != 0) {
						  var str = ' <div class="alert alert-dismissible alert-danger">' 
				        		+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
				        		+ ' <strong>확인!</strong> 휴학 신청 중인 내역이 있습니다. '
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