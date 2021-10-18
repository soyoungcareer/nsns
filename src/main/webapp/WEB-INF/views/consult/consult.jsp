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
      
      <div class="row" style="align:center">
      
        <div class="col-md-5">
        
          <div class="tile">
          
          <div class="tile-title"  style="margin-left:30px">
              <h4 class="title"><i class="fa fa-paper-plane-o" aria-hidden="true"></i>  상담 신청 </h4>
          </div>
          
            <hr style="border:1px solid black">
            
            
            <div class="row">
              <div class="col-md-11">
                <form id="consultApply" action="insert.con" method="post" onsubmit="return chekcDate();">
                
                <div style="margin-left:150px;">
		             <label for="stuId"><b>학번 :</b> 20143309 </label> &nbsp;&nbsp;
		             <input type="hidden" id="stuId" name="stuId" value="20143309">
		             
		             <label for="stuName"><b>이름 :</b> 유재석  </label>&nbsp;&nbsp;
		             <input type="hidden" id="stuName" name="stuName" value="유재석">
		             
		             <label for="major"><b>전공 :</b> 시각디자인학과</label>
		             <input type="hidden" id="major" name="major" value="시각디자인학과">
           		 </div>
           		 
	               	<div class="form-group row" style="margin-left:30px; margin-top:20px">
		                   		<label> 상담구분 </label> 
		                   		<div class="col-md-6">
		                    		<select  class="form-control" id="conCategory" name="conCategory">
										<option value="normal">일반</option>
										<option value="career">진로</option>
									</select>
								</div>
					</div>
                  
	                <div class="form-group row" style="margin-left:30px">
	                  	<label >희망일자</label>
	                  	<div class="col-md-6">
	                    	<input class="form-control" id="conDate" name="conDate" type="text" required>
	                  	</div>
	                </div>
                
	                 <div class="form-group" style="margin-left:30px">
	                    <label for="exampleTextarea">상담사유</label>
	                    <textarea class="form-control" id="exampleTextarea" rows="5" id="conReason" name="conReason"></textarea>
	                 </div>
	                 
	                 <div class="tile-footer" style="margin-left:30px">
			            <button class="btn btn-primary" type="submit">신청</button>
			         </div>
                </form>
              </div>
          
            </div>
            
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
    
      
      $('#conDate').datepicker({
    	  	format : "yyyy/mm/dd",
      		autoclose: true,
      		todayHighlight: true
      });
  
      
      //유효성 체크 
      function chekcDate() {
    	  
    	  var today = getTimeStamp();
    	  
    	  console.log(today);
    	  
    	  if (today >  $('#conDate').val()) {
    		  
              alert('신청일 이전의 날짜에는 상담을 신청할 수 없습니다.');
              
              $('#conDate').select();
              
              return false;
          }
    	  
          return true
      }
      
      function getTimeStamp() {

    	    var d = new Date();
    	    var s =
    	        leadingZeros( d.getFullYear(), 4) + '/' +
    	        leadingZeros( d.getMonth() + 1, 2) + '/' +
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