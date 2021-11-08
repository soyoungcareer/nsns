<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	        <div class="col-md-8">
	           
	            <div class="tile">
	            	<div class="tile-title-w-btn" style="margin-top:20px;">
	              		<h4 class="title"><i class="fa fa-exclamation-circle" aria-hidden="true"></i> 상태조회안내 </h4>
	           		</div>
	           		
	           		<hr style="border:1px solid black">
	           		<div style="margin-left:30px;">
		            	<p><b>신청현황 :</b> 교수 승인 대기중, 관리자 승인 대기중, 승인 완료 </p>
	
						<p><b>담당자 :</b> 담당교수, 관리자명으로 신청 현황에 따라 나타난다.</p>
						
						<p><b>상태 : </b> 처리중, 완료</p>
					</div>
					<hr style="border:1px solid black">
	          </div>
	        </div>
         	
         	 
         
           <div class="col-md-8">
           
            <div class="tile">
            	<div class="tile-title-w-btn" style="margin-top:20px;">
              		<h4 class="title"><i class="fa fa-server" aria-hidden="true"></i> 상담신청 내역 </h4>
           		</div>
            	
           	<table class="table table-hover table-bordered" id="statusTable" style="margin-top:10px;">
				<thead>
						<tr>
							<th>신청번호</th>
							<th>신청내역</th>
							<th>신청현황</th>
							<th>상태</th>
						</tr>
					</thead>
					
					<tbody>
					
					</tbody>
			</table>
				
			
          </div>
        </div>
        </div>
    </main>
    
    <!-- 휴학 모달 -->
    <div class="modal fade" id="sampleModalPopup1" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-md">
					<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">휴학신청내역</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

	               <!-- Modal Body -->
	               <div class="modal-body" id="sampleModalBody1">
	                
	               </div>
	               
				  <!-- Modal footer -->
					<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>								
											
				</div>
			</div>
		</div>
		
    	<!-- 자퇴 모달 -->
        <div class="modal fade" id="sampleModalPopup2" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-md">
					<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">자퇴신청내역 상세조회</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

	               <!-- Modal Body -->
	               <div class="modal-body"  id="sampleModalBody2">
	                  
	               </div>
				  <!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
						</div>								
					</div>
				</div>
		</div>
         
	<script>    		
			$(function(){
				$.ajax({
					url: "stuStsPro.stu",
					dataType:"json",
					success: function(list){
						console.log(list);
						var str = '';
						
						if(list.length != 0){
							$.each(list, function(i){
								str += '<tr>'+'<td>'+
								list[i].applicationNo + '</td><td>'+
								list[i].stsCategory + '</td><td>'+
								list[i].stsProcess + '</td><td>'+
								list[i].stsComplete + '</td>'
	              				+ '</tr>'
	       					});
							
						}  else {
							
							str += '<tr>'
								+  '<th colspan="4" style="text-align:center">' + "조회되는 신청 내역이 없습니다." +'</th></tr>'
									
										
						}
						
						$("#statusTable tbody").append(str); 
					},
					error:function(){
						console.log("Ajax 통신 실패");
					}
				});
			});
			
	
    		$(document).on("click", "#statusTable >tbody > tr >td", function(event) {
    			
    			let cat = $(this).parent().children().eq(1).text(); 
    			let appNo = $(this).parent().children().eq(0).text();
    			let stsPro =  $(this).parent().children().eq(2).text();
    			
    			if(cat == "휴학") {
    				$(".modal-body").empty();
    				
    				
    				$.ajax({
    					url: "stuOff.stu",
    					dataType:"json",
    					data : { appNo :appNo },
    					success: function(obj){
    						
    						var str1 = '';
    						var str2 =	'<div class="form-group row">'
    									+ '<table class="table table-bordered " id="offStsTable " style="margin-top:10px;">'
										+ '<thead><tr><th>신청현황</th><th>기타</th></tr></thead>'
									
    									
    					if(obj != null) {

							str1 +=  '<div class="form-group row">'+'<label class="control-label col-md-3"> 휴학구분 </label>'+'<div class="col-md-5">'
								+'<input class="form-control" type="text" value="'+ obj.offCategory +'" readonly>'+'</div>'+'</div>'
								+'<div class="form-group row">' + '<label class="control-label col-md-3">신청일자</label>' + '<div class="col-md-5">'
								+'<input class="form-control" type="text" value="'+ obj.offDate +'"readonly>'+'</div>'+'</div>'
								+'<div class="form-group row">' + '<label class="control-label col-md-3">휴학학기수</label>' + '<div class="col-md-5">'
								+'<input class="form-control" type="text" value="'+ obj.offSemCnt +'" readonly>'+'</div>'+'</div>'
								+'<div class="form-group row">' + '<label class="control-label col-md-3">휴학 시작 학기</label>' + '<div class="col-md-5">'
								+'<input class="form-control" type="text" value="'+ obj.offSem +'" readonly>'+'</div>'+'</div>'
								+ '<div class="form-group row">' + '<label class="control-label col-md-3">휴학사유</label>' + '<div class="col-md-8">'
								+ '<textarea class="form-control" rows="4" readonly>'+obj.offReason+'</textarea>'+'</div>'+'</div>'
    								
    							
    								if(stsPro == '교수승인대기'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+"교수 승인 대기중" + '</td><td>'
    									+'<button class="btn btn-danger btn-sm" type="button" onclick="deleteOff('+obj.applicationNo+')">신청취소</button>' + '</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    		              				
    								} else if(stsPro == '관리자승인대기'){
    		              					str2 += '<tbody> <tr>'+'<td>'+
    										+ "관리자 승인 대기중" + '</td><td>'
    										+ "해당 신청은 취소가 불가합니다. 관리자에게 문의해주세요"+'</td>'
    		              					+ '</tr>'+'</tbody> </table> </div>'
    		    						
    		    						
    								} else if(stsPro == '승인완료'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+ "승인 완료" + '</td><td>'
    									+ "이미 신청이 완료된 건입니다. 관리자에게 문의해주세요" +'</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    		              				
    								} else if(stsPro == '반려'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+ "반려" + '</td><td>'
    									+ "해당 신청이 반려되었습니다. 관리자에게 문의해주세요" +'</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    								}
    								
    					}
										
							$('#sampleModalBody1').append(str1+str2);
    						//$('#sampleModalBody').html(str2);
    				
    					},
    					error:function(){
    						console.log("Ajax 통신 실패");
    					}
    				});
    				$("#sampleModalPopup1").modal();
    				
    				
    			} else { //자퇴 모달 띄우기
					$(".modal-body").empty();
    				
    				$.ajax({
    					url: "stuDo.stu",
    					dataType:"json",
    					data : { appNo :appNo },
    					success: function(obj){
    						
    						var str1 = '';
    						var str2 =	'<div class="form-group row">'
    									+ '<table class="table table-bordered " id="doStsTable " style="margin-top:10px;">'
										+ '<thead><tr><th>신청현황</th><th>기타</th></tr></thead>'
    									
    					if(obj != null) {
    						str1 +=  '<div class="form-group row">' + '<label class="control-label col-md-3">신청일자</label>' + '<div class="col-md-5">'
							+'<input class="form-control" type="text" value="'+ obj.doDate  +'" readonly>'+'</div>'+'</div>'
							+ '<div class="form-group row">' + '<label class="control-label col-md-3">자퇴사유</label>' + '<div class="col-md-8">'
							+ '<textarea class="form-control" rows="4" readonly>'+obj.doReason+'</textarea>'+'</div>'+'</div>'
    					
    								
    								if(stsPro == '교수승인대기'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+"교수 승인 대기중" + '</td><td>'
    									+'<button class="btn btn-danger btn-sm" type="button" onclick="deleteDo('+obj.applicationNo+')">신청취소</button>' + '</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    		              				
    								} else if(stsPro == '관리자승인대기'){
    									str2 += '<tbody> <tr>'+'<td>'+
    										+ "관리자 승인 대기중" + '</td><td>'
    										+ "해당 신청은 취소가 불가합니다. 관리자에게 문의해주세요"+'</td>'
    		              					+ '</tr>'+'</tbody> </table> </div>'
    		    						
    								} else if(stsPro == '승인완료'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+ "승인 완료" + '</td><td>'
    									+ "이미 신청이 완료된 건입니다. 관리자에게 문의해주세요" +'</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    		              				
    								}  else if(stsPro == '반려'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+ "반려" + '</td><td>'
    									+ "해당 신청이 반려되었습니다. 관리자에게 문의해주세요" +'</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    								}
    								
    								
    					}
										
							$('#sampleModalBody2').append(str1+str2);
    						
    				
    					},
    					error:function(){
    						console.log("Ajax 통신 실패");
    					}
    				});
    				$("#sampleModalPopup2").modal(); 
    			}
    			
    		});
    		
    		function deleteOff(appNo){
    			
    			location.href="/deleteOff.stu?appNo="+appNo;
    			
    		}
			
    		function deleteDo(appNo){
    			
    			location.href="/deleteDo.stu?appNo="+appNo;
    			
    		}
			
			
    </script>
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>


  </body>
</html>