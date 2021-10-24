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
          <h1><i class="fa fa-comments"></i> 상담</h1>
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
		            	<p><b>신청현황 :</b> 교수 승인 대기중, 승인 완료, 반려</p>
	
						<p><b>상담현황 :</b> 완료, 진행중 </p>
						
						<p><b>교수 승인 대기 중인 신청 내역에 한해서만 취소가 가능하다.</b></p>
					</div>
					<hr style="border:1px solid black">
	          </div>
	        </div>
         	
         	 
         
           <div class="col-md-8">
           
            <div class="tile">
            	<div class="tile-title-w-btn" style="margin-top:20px;">
              		<h4 class="title"><i class="fa fa-server" aria-hidden="true"></i> 상담신청 내역 </h4>
           		</div>
            	
           	<table class="table table-hover table-bordered" id="consultTable" style="margin-top:10px;">
				<thead>
						<tr>
							<th>상담번호</th>
							<th>신청현황</th>
							<th>상담현황</th>
						</tr>
					</thead>
					
					<tbody>
						
					</tbody>
			</table>
				
			
          </div>
        </div>
        </div>
    </main>
    
     <div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1">
			<div class="modal-dialog modal-md">
					<div class="modal-content">
					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">신청내역 상세조회</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

	               <!-- Modal Body -->
	               <div class="modal-body" id="sampleModalBody">
	              
								
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
					url: "conStsPro.con",
					dataType:"json",
					success: function(list){
						console.log(list);
						var str = '';
						
						if(list.length != 0){
							$.each(list, function(i){
								str += '<tr>'+'<td>'+
								list[i].conNo + '</td><td>'+
								list[i].conProcess + '</td><td>'+
								list[i].conCompleted + '</td>'
								 + '</tr>'
		          				
		   					});
							
						} 
						
						$("#consultTable tbody").append(str); 
					},
					error:function(){
						console.log("Ajax 통신 실패");
					}
				});
			});
	
	
	
    		$(document).on("click", "#consultTable >tbody > tr >td", function(event) {
    			
    			let conNo = $(this).parent().children().eq(0).text(); 
    			let conPro = $(this).parent().children().eq(1).text(); 
    			
    		
    				
    				$.ajax({
    					url: "selectCon.con",
    					dataType:"json",
    					data : { conNo :conNo },
    					
    					success: function(obj){
    						
    						var str1 = '';
    						
    						var str2 =	'<div class="form-group row">'
    									+ '<table class="table table-bordered " id="consultStatus" style="margin-top:10px;">'
										+ '<thead><tr><th>신청현황</th><th>기타</th></tr></thead>'
									
    									
    					if(obj != null) {
    						
							str1 +=  '<div class="form-group row"> <label class="control-label col-md-3">상담구분</label>'+'<div class="col-md-5">'
								+ '<input class="form-control" type="text" value="'+ obj.conCategory  +'" readonly>'+'</div>'+'</div>'
								+ '<div class="form-group row">  <label class="control-label col-md-3">희망날짜</label>' + '<div class="col-md-5">'
								+ '<input class="form-control" type="text" value="'+ obj.conDate  +'" readonly>'+'</div>'+'</div>'
								+ '<div class="form-group row">' + '<label class="control-label col-md-3">상담사유</label>' + '<div class="col-md-8">'
								+ '<textarea class="form-control" rows="4" readonly>'+obj.conReason+'</textarea>'+'</div>'+'</div>'
    								
    							
    								if(conPro == '교수승인대기중'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+"교수 승인 대기중" + '</td><td>'
    									+'<button class="btn btn-danger btn-sm" type="button">신청취소</button>' + '</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    		              				
    								} else if(stsPro == '승인완료'){
    									str2 += '<tbody> <tr>'+'<td>'+
    										+ "승인 완료" + '</td><td>'
    										+ '</td>'
    		              					+ '</tr>'+'</tbody> </table> </div>'
    		    						
    								} else if(stsPro == '반려'){
    									str2 += '<tbody> <tr>'+'<td>'
    									+ "반려" + '</td><td>'+obj.rejectReason
    									+ '</td>'
    		              				+ '</tr>'+'</tbody> </table> </div>'
    								}
    								
    					} else {
							
							str += '<tr>'
								+  '<th colspan="3" style="text-align:center">' + "조회되는 신청 내역이 없습니다." +'</th></tr>'
									
										
						}
										
							$('#sampleModalBody').html(str1+str2);
    				
    					},
    					error:function(){
    						console.log("Ajax 통신 실패");
    					}
    				});
    				$("#sampleModalPopup").modal();
    				
    		});
    </script>
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>


  </body>
</html>