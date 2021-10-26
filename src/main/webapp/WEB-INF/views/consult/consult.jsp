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
          		<h1><i class="fa fa-comments" aria-hidden="true"></i> 상담</h1>
        	</div>
       </div>
        
      
      <div class="row">
        <div class="col-md-5">
        	<div class="bs-component">
             
            </div>
          
          <div class="tile">
              <h4 class="title"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>  상담 신청 </h4>
           
             <hr style="boder: 1px solid black">
      
             
              <form class="form-horizontal" id="consultForm" action="insert.con" method="post" onsubmit="return check()">
             	 <div style="margin-left:300px;">
		             <label for="stuId"><b>학번 :</b> 20190321 </label> &nbsp;&nbsp;
		             <input type="hidden" id="stuId" name="stuId" value="20190321">
		             
		             <label for="stuName"><b>이름 :</b> 유재석  </label>&nbsp;&nbsp;
		             <input type="hidden" id="stuName" name="stuName" value="유재석">
		             
           		 </div>
              
            	<div class="tile-body">
                
                <div class="form-group row" style="margin-top:30px;">
                  <label class="control-label col-md-3"> 상담구분 </label> 
		                <div class="col-md-3">
		                    <select  class="form-control" id="conCategory" name="conCategory">
									<option value="일반">일반</option>
									<option value="진로">진로</option>
							</select>
						</div>
				</div>
                
                
                <div class="form-group row" >
                  <label class="control-label col-md-3">희망일자</label>
	                  	<div class="col-md-4">
	                    	<input class="form-control" id="conD" name="conD" type="text" required>
	                  	</div>
                </div>
                
                <div class="form-group row">
                  <label class="control-label col-md-3">상담사유</label>
                  <div class="col-md-8">
	                    <textarea class="form-control" id="exampleTextarea" rows="5" id="conReason" name="conReason"></textarea>
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
    
    <script type="text/javascript">
    
      
      $('#conD').datepicker({
    	  	format : "yyyy-mm-dd",
      		autoclose: true,
      		todayHighlight: true
      });
      
      //유효성 체크 
  	function check() {
    	  var stuId = $("#stuId").val();
    	  var flag = true;
    	  $.ajax({
				url: "consultCount.con",
				dataType:"json",
				data : { stuId :stuId },
				async : false,
				success: function(count){
					console.log(count);
					  if(count != 0) {
						  var str = ' <div class="alert alert-dismissible alert-danger">' 
				        		+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
				        		+ ' <strong>확인!</strong> 상담신청 중인 내역이 있습니다. '
				        		+ ' </div> '
				        				
				        		$('.bs-component').empty();
				        		$('.bs-component').append(str);
				        		flag = false;
				        		
				  		} else {
				  		  var today = getTimeStamp();
						    
					    	if (today >  $('#conD').val()) {
						        		
						               var str = ' <div class="alert alert-dismissible alert-danger">' 
						        		+ ' <button class="close" type="button" data-dismiss="alert">×</button>'
						        		+ ' <strong>확인!</strong> 신청일 이전의 날짜에는 상담을 신청할 수 없습니다. '
						        		+ ' </div> '
						        				
						        		$('.bs-component').empty();
						        		$('.bs-component').append(str);
						        		
						        flag = false;
					    	}
				  			
				  		}
					  
				},
				error:function(){
					console.log("Ajax 통신 실패");
				}
			});
    	  
    	  return flag;
   	}
      
      
      function getTimeStamp() {

    	    var d = new Date();
    	    var s =
    	        leadingZeros( d.getFullYear(), 4) + '-' +
    	        leadingZeros( d.getMonth() + 1, 2) + '-' +
    	        leadingZeros( d.getDate(), 2);

    	    return s;
    	}

    	function leadingZeros(n, digits) {

    	    var zero = '';
    	    n = n.toString();

    	    if (n.length < digits) {
    	        for (i = 0; i < digits - n.length; i++)
    	            zero += '0';
    	    }
    	    return zero + n;
    	}
    	
    </script>

  </body>
</html>