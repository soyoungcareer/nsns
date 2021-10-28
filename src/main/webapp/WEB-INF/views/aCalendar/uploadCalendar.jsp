<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   
  </head>
  <body class="app sidebar-mini">
   <!-- 일반 학생 로그인시 보이는 메뉴바 -->
	<%--<jsp:include page="cSMenubar.jsp"/> --%> 
	
	<!-- 관리자 로그인시 보이는 메뉴바 -->
	<jsp:include page="cAMenubar.jsp"/>  
    
    <main class="app-content">
    
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 학사일정 관리</h1>
        </div>
       <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><a href="#" style="color: #222d32;"><i class="fa fa-sign-out fa-4x" aria-hidden="true"></i><div>나가기</div></a></li>
        </ul>
      </div>
      
      <div class="row">
      
        <div class="col-md-4">
          <div class="tile">
            <div class="tile-title-w-btn" style="margin-top:20px;" >
              <h4 class="title" style="margin-left:50px"><i class="fa fa-calendar-plus-o" aria-hidden="true"></i> 학사일정 등록 </h4>
            </div>
			
			<div class="tile-body">
			
              <form id="uploadCalendar" action="insert.ca" method="get" onsubmit="return chekcDate();">
                <div class="form-group row" style="margin-top:40px;">
                  <label class="control-label col-md-5" style="margin-left:50px;">일정명</label>
                  <div class="col-md-5">
                    <input class="form-control" type="text" id="title" name="title" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">시작일자</label>
                  <div class="col-md-5">
                    <input class="form-control" id="start" name="start" type="text" required>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-5" style="margin-left:50px;">마지막일자</label>
                  <div class="col-md-5">
                    <input class="form-control" id="end" name="end" type="text" required>
                  </div>
                </div>
              
                 <div class="form-group row">
                   <label class="control-label col-md-5" style="margin-left:50px;">배경색</label>
	                   <div class="col-md-5"> 
	                    <select class="form-control" id="backgroundColor" name ="backgroundColor">
							<option value="#c4dbdb" style="color:#c4dbdb;">#c4dbdb</option>
							<option value="#63e6be" style="color:#63e6be;">#63e6be</option>
							<option value="#74c0fc" style="color:#9775fa;">#74c0fc</option>
	                    </select>
	                  </div>
                  </div>
                  
            <div class="tile-footer" style="margin-top:30px;">
              <div class="row">
              	<div class="col-md-3 ">
                  <button id="submitBtn" class="btn btn-primary" type="submit">등록</button>
              	</div>
              </div>
            </div>
            </form>
            </div>
            </div>
          </div>
          
          <!-- 학사일정 확인 리스트 -->
           <div class="col-md-8">
            <div class="tile">
            <div class="tile-title-w-btn" style="margin-top:20px;">
              <h4 class="title"><i class="fa fa-file-text-o" aria-hidden="true"></i> 학사일정 리스트 </h4>
            </div>
            <div id="sampleTable_wrapper" class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
            	<div class="col-sm-12 col-md-6">
	                <div class="dataTables_length" >
	               
						<select name="selectYear" id="selectYear" aria-controls="sampleTable" class="form-control form-control-sm" style="width: 100px">
							<c:forEach items="${ yearList }" var="year">
								<option value="${year}">${year}년</option>
							</c:forEach>
						</select>
						
						<select name="selectMonth" id="selectMonth" aria-controls="sampleTable" class="form-control form-control-sm" style="width: 90px" id="selectMonth">
								<option value="%">전체</option>
								<option value="1">1월</option>
								<option value="2">2월</option>
								<option value="3">3월</option>
								<option value="4">4월</option>
								<option value="5">5월</option>
								<option value="6">6월</option>
								<option value="7">7월</option>
								<option value="8">8월</option>
								<option value="9">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
						</select>
					</div>
				</div>
			</div>
           <table class="table table-hover table-bordered" id="calendarTable" style="margin-top:10px;">
				<thead>
						<tr>
							<th>번호</th>
							<th>일정명</th>
							<th>시작일</th>
							<th>마지막일</th>
						</tr>
					</thead>
					
					<tbody>
						
					</tbody>
			</table>
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
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/bootstrap-notify.min.js"></script>
    <script type="text/javascript" src="resources/bootstrap/docs/js/plugins/sweetalert.min.js"></script>
    
  	<c:if test="${!empty message}">
   		<script>
			$.notify({
		  		title: "update : ",
		  		message: "${message}",
		  		icon: 'fa fa-check' 
		  	},{
		  		type: "info"
		  	});
		</script>
    </c:if>
    
    <script type="text/javascript">
      $('#start').datepicker({
    	  	format : "yyyy/mm/dd",
      		autoclose: true,
      		todayHighlight: true
      });
      
      $('#end').datepicker({
    	  	format : "yyyy/mm/dd",
      		autoclose: true,
      		todayHighlight: true
      });
      
     
      //유효성 체크 - 시작날짜보다  마지막날짜가 앞설 수 없다 !! 
      function chekcDate() {
    	  
    	  if ($('#start').val() >  $('#end').val()) {
              alert('마지막 일자가 앞설 수 없습니다.');
              $('#end').select();
              return false;
          }
    	  
          return true
      }
      
       $(function(){
    	  var year = new Date().getFullYear();
     	  $("#selectYear").val(year).prop("selected", true); //올해가 기본적으로 셋팅
     	  
     		 var sYear = $("select[name=selectYear]").val();
     	 	 var sMonth = $("select[name=selectMonth]").val();
     	 
    		$("select").change(function(){
    			var sYear =   $("select[name=selectYear]").val();
    			var sMonth =  $("select[name=selectMonth]").val();
    			
    			callEvents(sYear, sMonth);
    		})
    		
    		callEvents(sYear, sMonth);
 		});

  
       function callEvents(sYear, sMonth) {
    	   $.ajax({
				url: "calendar.li",
				data: {
					sYear: sYear,
					sMonth : sMonth
				},
				dataType:"json",
				success: function(list){
					console.log(list);
					
					if(list.length != 0){
						$("#calendarTable > tbody").empty();
					
						var str = '';
						
						$.each(list, function(i){
							str += '<tr>'+'<td>'+
							list[i].acId + '</td><td>'+
              	 	 		list[i].title + '</td><td>'+
              		 		list[i].start + '</td><td>'+
              		 		list[i].end + '</td>'+
              				'&nbsp;<td style="padding: 0px; padding-top: 5px"><button class="btn btn-danger btn-sm" type="button" style="margin-left:10px" onclick="deleteEvents();"> 삭제</button></td>'
              				+ '</tr>'
       					});
							$("#calendarTable").append(str); 
						
						} else if(list.length == 0) {
							
	 						$("#calendarTable > tbody").empty();
	 						
	 						var str = '<tbody><tr>'+
	 						'<td colspan="4" style="text-align:center;">'
	 						+ "조회된 학사일정 리스트가 없습니다." + '</td>' 
	 						+ '</tr></<tbody>'
	 						$("#calendarTable").append(str); 
						}
				},
				error:function(){
					console.log("Ajax 통신 실패");
				}
			});
       }
       
   
       
       
       function deleteEvents(){
    	   for(let i = 1; i<calendarTable.rows.length; i++){
    		   let acId = calendarTable.rows[i].cells[0].innerText;
    		   location.href="delete.ca?acId="+ acId;
    	   }
       }
       
    
    </script>

  </body>
</html>