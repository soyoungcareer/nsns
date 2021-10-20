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
							<th>담당자</th>
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
						<h4 class="modal-title">휴학신청내역 상세조회</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

	               <!-- Modal Body -->
	               <div class="modal-body">
	                   <div class="form-group row">
	                  <label class="control-label col-md-3">휴학구분</label>
	                  <div class="col-md-5">
	                    <input class="form-control" type="text" value="진로" readonly>
	                  </div>
	                </div>
	                
	                <div class="form-group row">
	                  <label class="control-label col-md-3">신청일자</label>
	                  <div class="col-md-5">
	                    <input class="form-control" type="text" value="2021/09/30" readonly>
	                  </div>
	                </div>
	                
	                
	                <div class="form-group row">
	                  <label class="control-label col-md-3">휴학학기수</label>
	                  <div class="col-md-5">
	                    <input class="form-control" type="text" value="1" readonly>
	                  </div>
	                </div>
	                
	                <div class="form-group row">
	                  <label class="control-label col-md-3">휴학학기</label>
	                  <div class="col-md-5">
	                    <input class="form-control" type="text" value="2021-02" readonly>
	                  </div>
	                </div>
	                
	                <div class="form-group row">
	                  <label class="control-label col-md-3">휴학사유</label>
	                  <div class="col-md-8">
	                    <textarea class="form-control" rows="4">몸과 마음이 지쳐서 휴학합니다.</textarea>
	                  </div>
	                </div>
                
	                <div class="form-group row">
					     <table class="table table-bordered " id="consultStatus" style="margin-top:10px;">
								<thead>
									<tr>
										<th>신청현황</th>
										<th>기타</th>
									</tr>
								</thead>
								
								<tbody>
								
									<tr>
										<td>교수 승인 대기중</td>
										<td><button class="btn btn-danger btn-sm" type="button">신청취소</button></td>
									</tr>
									
									<tr>
										<td>관리자 승인 대기중</td>
										<td></td>
									</tr>
									
									<tr>
										<td>승인 완료</td>
										<td></td>
									</tr>
									
								</tbody>
							</table>
						</div>
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
	               <div class="modal-body">
	                   <div class="form-group row">
	                  <label class="control-label col-md-3">담당교수</label>
	                  <div class="col-md-5">
	                    <input class="form-control" type="text" value="유재석" readonly>
	                  </div>
	                </div>
	                
	                <div class="form-group row">
	                  <label class="control-label col-md-3">신청일자</label>
	                  <div class="col-md-5">
	                    <input class="form-control" type="text" value="2021/09/30" readonly>
	                  </div>
	                </div>
	                
	                <div class="form-group row">
	                  <label class="control-label col-md-3">자퇴사유</label>
	                  <div class="col-md-8">
	                    <textarea class="form-control" rows="4">학교 너무 싫어서</textarea>
	                  </div>
	                </div>
                
	                <div class="form-group row">
					     <table class="table table-bordered " id="consultStatus" style="margin-top:10px;">
								<thead>
									<tr>
										<th>신청현황</th>
										<th>기타</th>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td>교수 승인 대기중</td>
										<td><button class="btn btn-danger btn-sm" type="button">신청취소</button></td>
									</tr>
									
									<tr>
										<td>관리자 승인 대기중</td>
										<td></td>
									</tr>
									
									
									<tr>
										<td>승인</td>
										<td></td>
									</tr>
									
									
									
								</tbody>
							</table>
						</div>
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
					url: "stuOffPro.stu",
					dataType:"json",
					success: function(list){
						
						var str = '';
						
						if(list.length != 0){
							
							$.each(list, function(i){
								if(list[i].)
								str += '<tr>'+'<td>'+
								stuOff[i].applicationNo + '</td><td>'+
								"휴학" + '</td><td>'+
								stuOff[i].stsProcess + '</td><td>'+
								stuOff[i].stsAdm + '</td><td>'+
								stuOff[i].stsComplete + '</td>'+
	              				+ '</tr>'
	       					});
							
						} 
						
						if(stuDo.length != 0){
								$.each(stuDo, function(i){
									str += '<tr>'+'<td>'+
									stuDo[i].applicationNo + '</td><td>'+
									"자퇴" + '</td><td>'+
									stuDo[i].stsProcess + '</td><td>'+
									stuDo[i].stsAdm + '</td><td>'+
									stuDo[i].stsComplete + '</td>'+
		              				+ '</tr>'
		       					});
						}
						$("#statusTable").append(str); 
					},
					error:function(){
						console.log("Ajax 통신 실패");
					}
				});
			});
			
	
    		$(document).on("click", "#consultTable >tbody > tr >td", function(event) {
    			
    			let cat = $(this).parent().children().eq(1).text(); //휴학인지 자퇴인지 카테고리를 가져온다. 
    			
    			if(cat == "휴학") {
    				$("#sampleModalPopup1").modal(); 
    				
    			} else {
    				$("#sampleModalPopup2").modal(); 
    			}
    			
    		});
			
			
			
    </script>
    
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>


  </body>
</html>