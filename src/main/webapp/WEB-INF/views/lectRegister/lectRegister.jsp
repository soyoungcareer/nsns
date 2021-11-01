<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
 <jsp:include page="lectRegisterMenubar.jsp"/> 
 <!-- 추가 -->
	<main class="app-content">
		<div class="app-title">
			<div class="div">
			<h1><i class="fa fa-pencil fa-lg" aria-hidden="true" style="margin-right: 10px;"></i>수강신청</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>수강신청
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<form action="searchReg.reg" class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length" style="padding-left: 15px">
								<label>이수구분 : &nbsp;&nbsp;&nbsp;
									<select name="condition1" aria-controls="sampleTable"
										class="form-control form-control-sm" style="width: 100px" id="condition1">
											<option value="0" >전체</option>
											<option value="1" >전공필수</option>
											<option value="2" >교양필수</option>
									</select>
								</label> 
								<label style="margin-left: 30px">학과 : &nbsp;&nbsp;&nbsp;
									<select name="condition2" aria-controls="sampleTable"
										class="form-control form-control-sm" style="width: 120px" id="condition2">
											<option value="0">전체</option>
										<c:forEach items="${ departList }" var="depart">
											<option value="${depart.deptCode}" <c:if test="${ condition2 eq depart.deptCode }">selected</c:if>>${depart.deptTitle}</option>
										</c:forEach>
									</select>
								</label>
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="sampleTable_filter" class="dataTables_filter" style="padding-right: 15px">
								<label>강의 명 : 
									<input type="search" class="form-control form-control-sm"
										aria-controls="sampleTable" name="search" value="${ search }">
								</label>
									<button class="btn btn-primary btn-sm" type="submit"
									style="margin-left: 10px;">조 회</button>
							</div>
						</div>
						</form>
				<script>
					$(function(){
						switch('${condition1}'){
						case "0" : $("#condition1 option").eq(0).attr("selected", true); break;
						case "1" : $("#condition1 option").eq(1).attr("selected", true); break;
						case "2" : $("#condition1 option").eq(2).attr("selected", true); break; 
						}
					})
				</script>
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-hover table-bordered" id="sampleTable1">
									<thead>
										<tr>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>이수구분</th>
											<th>강의시간</th>
											<th>교수명</th>
											<th>수강신청</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ sublist }" var="Sub">
						                    <tr>
						                        <td>${ Sub.subject.subCode }</td>
						                        <td>${ Sub.subject.subTitle }</td>
						                        
						                        <td>${ Sub.department.deptTitle }</td>
						                        <td>${ Sub.subject.subCredit }</td>
						                        <c:if test="${ Sub.subject.subDivs eq 1 }">
					                        	<td>전공필수</td>
						                        </c:if>
						                        <c:if test="${ Sub.subject.subDivs eq 2 }">
						                        <td>교양필수</td>
						                        </c:if>
						                        <td>${ Sub.subject.subTime }</td>
						                        <td>${ Sub.professor.profName }</td>
						                        <th style="padding: 0px; padding-top: 5px">
						                         <button class="btn btn-primary addRegister" type="button"
														style="margin-left: 10px;" id="addRegister">수강신청</button></th>
						                         <%-- <c:forEach items="${ arlist }" var="ar">
						                       		<c:if test="${ar.subject.subCode eq Sub.subject.subCode}">
						                        	  <script type="text/javascript">
						                        		$(".addRegister").attr("disabled", true);
						                        	  	$(".addRegister").text("신청완료");
							                          </script> -->
													</c:if>

						                        	  <%-- <c:if test="${ar.subject.subCode eq Sub.subject.subCode}">
						                        	  <script type="text/javascript">
						                        		$(".addRegister").attr("disabled", true);
						                        	  	$(".addRegister").text("신청완료");
						                        	  	//$(".addRegister").removeAttr("class");
						                        	  	//$(".addRegister").addClass("btn");
						                        	  </script>
						                        	  </c:if>
						                        	  <c:if test="${ar.subject.subCode ne Sub.subject.subCode}">
						                        	  <script type="text/javascript">
						                        		$(".addRegister").attr("disabled", false);
						                        	  	$(".addRegister").text("수강신청");
						                        	  	//$(".addRegister").removeAttr("class");
						                        	  	//$(".addRegister").addClass("btn");
						                        	  </script>
						                        	  </c:if> 
						                        </c:forEach>--%>
						                    </tr>
					                    </c:forEach>
					                    
					                    
										<!--
										<tr>
										테스트 연결 서버
											우선 LectRegisterController로 연결 
											<td><a
												href="evaluation.ev">강의평가 페이지</a></td>
											<td><a
												href="gradeObject.obj">이의신청 페이지</a></td>
											<td><a
												href="credit.reg">학점조회 페이지</a></td> 
												CertificateController로 연결 
											<td><a
												href="graduation.cer">졸업증명서 페이지</a></td>
											<td><a
												href="certificate.cer">자격증/봉사활동</a></td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">수강신청</button></td>
										</tr> -->
									</tbody>
								</table>
							</div>
							<!-- 페이징바! -->
							<div class="row" style="justify-content: center;">
								<div class="col-lg-6" style="justify-content: center;">
									<div>
										<ul class="pagination" style="justify-content: center;">
											<c:choose>
					                		<c:when test="${ pi.currentPage ne 1 }">
						                		<c:if test="${ empty search }">
													<li class="page-item"><a class="page-link" href="register.reg?currentPage=${ pi.currentPage-1 }">«</a></li>
												</c:if>
												<c:if test="${ !empty search }">
													<c:url var="searchUrl" value="searchReg.reg">
														<c:param name="currentPage" value="${pi.currentPage-1 }"/>
														<c:param name="condition1" value="${ condition1 }"/>
														<c:param name="condition2" value="${ condition2 }"/>
														<c:param name="search" value="${ search }"/>
													</c:url>
													<li class="page-item"><a class="page-link" href="${ searchUrl }">«</a></li>
												</c:if>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">«</a></li>
					                		</c:otherwise>
					                	</c:choose>
					                	
					                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					                    	<c:choose>
						                		<c:when test="${ pi.currentPage ne p }">
					                    			<c:if test="${ empty search }">
														<li class="page-item"><a class="page-link" href="register.reg?currentPage=${ p }">${ p }</a></li>
													</c:if>
													<c:if test="${ !empty search }">
														<c:url var="searchUrl" value="searchReg.reg">
															<c:param name="currentPage" value="${ p }"/>
															<c:param name="condition1" value="${ condition1 }"/>
															<c:param name="condition2" value="${ condition2 }"/>
															<c:param name="search" value="${ search }"/>
														</c:url>
														<li class="page-item"><a class="page-link" href="${ searchUrl }">${ p }</a></li>
													</c:if>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item active"><a class="page-link" href="register.reg?currentPage=${ p }">${ p }</a></li>
						                		</c:otherwise>
						                	</c:choose>
					                    </c:forEach>
					                    <c:choose>
					                		<c:when test="${ pi.currentPage ne pi.maxPage }">
					                			<c:if test="${ empty search }">
													<li class="page-item"><a class="page-link" href="register.reg?currentPage=${ pi.currentPage+1 }">»</a></li>
												</c:if>
												<c:if test="${ !empty search }">
													<c:url var="searchUrl" value="searchReg.reg">
														<c:param name="currentPage" value="${pi.currentPage+1  }"/>
														<c:param name="condition1" value="${ condition1 }"/>
														<c:param name="condition2" value="${ condition2 }"/>
														<c:param name="search" value="${ search }"/>
													</c:url>
													<li class="page-item"><a class="page-link" href="${ searchUrl }">»</a></li>
												</c:if>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">»</a></li>
					                		</c:otherwise>
					                	</c:choose>
										</ul>
									</div>
								</div>
							</div>
							<!-- 페이징바! -->
						</div>
					</div>
				</div>
			</div>
			<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>담긴 시간표
			</h2>
		</div>
		<div class="tile mb-4">
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
							</div>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="sampleTable_filter" class="dataTables_filter">
							</div>
						</div>

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive" id="registerTable">
								<table class="table table-hover table-bordered">
									<thead>
										<tr>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>이수구분</th>
											<th>강의시간</th>
											<th>교수명</th>
											<th>삭제</th>
										</tr>
									</thead>
									<tbody>
								
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<div class="modal fade" id="registerDe">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>강의 설명
					</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="gradeObjNewPop.obj" method="post">
					<!-- Modal Body -->
					<div class="modal-body">
						
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	  <script type="text/javascript">
	  function selectRegList(){
			$.ajax({
				url:"selectReg.reg",
				type:"get",
				dataType: 'json',
				success:function(reglist){
					var value="";
					$.each(reglist, function(i, obj){
						
							value += "<tr>"+
									 "<td>" + obj.subject.subCode + "</td>" + 
									 "<td>" + obj.subject.subTitle + "</td>" + 
									 "<td>" + obj.department.deptTitle + "</td>" +
									 "<td>" + obj.subject.subCredit + "</td>"
									 
									if(obj.subject.subDivs==1){
							value +="<td>전공필수</td>" 
				                      }else{
				            value +="<td>교양필수</td>"
				                        }
									 
							value +="<td>" + obj.subject.subTime + "</td>" +
									 "<td>" + obj.professor.profName + "</td>" +
									 "<th style='padding: 0px; padding-top: 5px'>"+"<button" +
										" class='btn btn-danger' type='button'"+
											"style='margin-left: 10px;'>수강취소</button>"+"</th>"+
									 
							 		"</tr>";
						
					});
					$("#registerTable tbody").html(value);
				},
			     error:function(){
			         alert("수강신청한 과목 로딩 실패"); 
			        }
			});
	  }
	</script> 
	<script type="text/javascript">
		$("#sampleTable1 tbody tr td").click(function() {
			var subCode = $(this).parent().children().eq(0).text();
			$.ajax({
				url:"registerDe.reg",
				type:"post",
				data:{subCode:subCode},
				success:function(reDetail){
					$(".modal-body").html("");
					$("#registerDe").modal('show');
					var value="";
					value +='<div class="form-group row">' +
							'<label class="control-label col-md-2">교과목명</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.subject.subTitle+'">'+
							'</div>'+
							'<label class="control-label col-md-2">강의코드</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.subject.subCode+'">'+
							'</div>'+
							'</div>'+
							'<div class="form-group row">' +
							'<label class="control-label col-md-2">교수명</label>'+
							'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.professor.profName+'">'+
							'</div>'+
							'<label class="control-label col-md-2">이수구분</label>'+
							'<div class="col-md-4">'
									if(reDetail.subject.subDivs==1){
					value +='<input class="form-control col-md-12" type="text" disabled value="전공필수">'
			                      }else{
			        value +='<input class="form-control col-md-12" type="text" disabled value="교양필수">'
			              }
					value +='</div>'+
							'</div>'+
							'<div class="form-group row">' +
							'<label class="control-label col-md-2">강의실</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.subject.subClass+'">'+
							'</div>'+
							'<label class="control-label col-md-2">강의 시간</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.subject.subTime+'">'+
							'</div>'+
							'</div>'+
							'<div class="form-group row">' +
							'<label class="control-label col-md-2">강의 형태</label>'+
							'<div class="col-md-4">'
								if(reDetail.subject.subType==1){
						value +='<input class="form-control col-md-12" type="text" disabled value="현장 강의">'
				                      }else{
				        value +='<input class="form-control col-md-12" type="text" disabled value="온라인 강의">'
				              }
						value +='</div>'+
							'<label class="control-label col-md-2">학과</label>'+
							'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.department.deptTitle+'">'+
							'</div>'+
							'</div>'+
							'<div class="form-group row">' +
							'<label class="control-label col-md-2">평점</label>'+
							'<div class="col-md-4">'
								if(reDetail.evaluation==0){
								value +='<input class="form-control col-md-12" type="text" disabled value="평가 점수가 없습니다." style="color:red;">'
						                      }else{
						        value +='<input class="form-control col-md-12" type="text" disabled value="'+reDetail.evaluation+' / 5.0" style="color:red;">'
						              }
								value +='</div>'+
							'<label class="control-label col-md-2">학점</label>'+
							'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+reDetail.subject.subCredit+' 학점">'+
							'</div>'+
							'</div>'+
							
							'<div class="form-group row">' +
							'<label class="control-label col-md-2">계획서</label>'+
							'<div class="col-md-10">'
								
								 if(reDetail.subject.originName!=""&&typeof reDetail.subject.originName != "undefined"){
						value += '<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/'+reDetail.subject.changeName+'"'+
		                        												'download='+reDetail.subject.originName+'>'+reDetail.subject.originName+'</a>'
								 }else{
							value +='<input class="form-control col-md-12" type="text" disabled value="첨부파일이 없습니다." style="color:red;">'
								 } 
							value +='</div>'+
							'</div>'
							/*나중에 파일 연결 필요!! a 태그로 다운로드 되도록 설정 필요*/
					$(".modal-body").html(value);
				},
			     error:function(){
			         alert("수강신청 상세 화면 모달 로딩 실패"); 
			        }
			});
		});
		
		function checkRegister(subCode) {
			var check=true;
			  $.ajax({
					url:"reCheck.reg",
					type:"post",
					async: false,
					data:{subCode:subCode},
					success:function(lect){
						if(lect!=null){
							check=false;
						}
					},error:function(){
						console.log("수강신청 과목체크1 ajax 통신 실패");
						check=false;
					}
				});
			  return check;
		}
		function checkCredit(subCredit) {
			var check=true;
			  $.ajax({
					url:"checkCredit.reg",
					type:"post",
					async: false,
					data:{},
					success:function(countCredit){
						if(subCredit==2){
							if(countCredit>18){
								
								check=false;
							}
						}else if(subCredit==3){
							if(countCredit>17){
								check=false;
							}
						}
					},error:function(){
						console.log("수강신청 과목체크2 ajax 통신 실패");
						check=false;
					}
				});
			  return check;
		}
		function checkDate(subCode) {
			var check=true;
			  $.ajax({
					url:"checkDate.reg",
					type:"post",
					async: false,
					data:{subCode:subCode},
					success:function(result){
						if(result==-1){
							
						}else{
							check=false;
						}
					},error:function(){
						console.log("수강신청 과목체크3 ajax 통신 실패");
						check=false;
					}
				});
			  return check;
		}
	</script>
	
	<script>
	$(function(){
		selectRegList();
	});
	$("#sampleTable1 tbody tr button").click(function() { //수강신청 추가
		var subCode = $(this).parent().parent().children().eq(0).text();
		var title = $(this).parent().parent().children().eq(1).text();
		var subCredit = $(this).parent().parent().children().eq(3).text();
		if(confirm('수강 신청하시겠습니까?')){
			if(checkRegister(subCode)){
				if(checkCredit(subCredit)){
					if(checkDate(subCode)){
				$.ajax({
					url:"reInsert.reg",
					type:"post",
					async: false, //이렇게 안해주면 무조건 실행... 시바... 
					data:{subCode:subCode},
					success:function(result){
						if(result > 0){
							$("#registerTable tbody").val("");
							alert(title+"가 수강신청 되었습니다.");
							selectRegList();
						}else{
							alert("수강신청 실패");
						}
					},error:function(){
						console.log("수강신청 ajax 통신 실패");
					}
				});
					}else{
						alert("이미 수강 신청한 과목과 시간이 일치합니다. 다시한번 확인해 주세요");
					}
				}else{
					alert("수강 신청한 과목의 학점이 20학점 초과입니다. 다시한번 확인해 주세요");
				}
			}else{
				alert("이미 수강신청한 과목입니다.");
			}
					
		}else{
			alert("수강신청 취소되었습니다.");
		}
	});
	
	</script>
	<script type="text/javascript">
	$(document).on("click","#registerTable tbody tr button",function(){//수강신청 삭제- 동적테이블 부분이라 클릭이벤트 이렇게 걸음
		selectRegList();
		var subCode = $(this).parent().parent().children().eq(0).text();
			$.ajax({
				url:"reDelete.reg",
				type:"post",
				data:{subCode:subCode},
				success:function(result){
					if(result > 0){
						$("#registerTable tbody").val("");
						selectRegList();
						
					}else{
						alert("수강신청 삭제 실패");
					}
				},error:function(){
					console.log("수강신청 삭제 ajax 통신 실패");
				}
			}); 
	});
	
	</script>
</body>
</html>