<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청 관리자</title>
</head>
<body>
 <jsp:include page="lectRegisterMenubarAdmin.jsp"/> 
	<main class="app-content">
		<div class="app-title">
			<div class="div">
			<h1><i class="fa fa-pencil fa-lg" aria-hidden="true" style="margin-right: 10px;"></i>수강신청</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/subModifyList.adm" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>
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
					<form action="searchRegAdmin.reg" class="row">
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
					                    
					                    
										<!-- <tr>
											<td><a
												href="lectRegisterEdit.reg">FA831</a></td>
											<td>응용수학</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
											<td>김교수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">수강신청</button></td>
										</tr>
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
													<li class="page-item"><a class="page-link" href="registerAdmin.reg?currentPage=${ pi.currentPage-1 }">«</a></li>
												</c:if>
												<c:if test="${ !empty search }">
													<c:url var="searchUrl" value="searchRegAdmin.reg">
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
														<li class="page-item"><a class="page-link" href="registerAdmin.reg?currentPage=${ p }">${ p }</a></li>
													</c:if>
													<c:if test="${ !empty search }">
														<c:url var="searchUrl" value="searchRegAdmin.reg">
															<c:param name="currentPage" value="${ p }"/>
															<c:param name="condition1" value="${ condition1 }"/>
															<c:param name="condition2" value="${ condition2 }"/>
															<c:param name="search" value="${ search }"/>
														</c:url>
														<li class="page-item"><a class="page-link" href="${ searchUrl }">${ p }</a></li>
													</c:if>
						                		</c:when>
						                		<c:otherwise>
						                			<li class="page-item active"><a class="page-link" href="registerAdmin.reg?currentPage=${ p }">${ p }</a></li>
						                		</c:otherwise>
						                	</c:choose>
					                    </c:forEach>
					                    <c:choose>
					                		<c:when test="${ pi.currentPage ne pi.maxPage }">
					                			<c:if test="${ empty search }">
													<li class="page-item"><a class="page-link" href="registerAdmin.reg?currentPage=${ pi.currentPage+1 }">»</a></li>
												</c:if>
												<c:if test="${ !empty search }">
													<c:url var="searchUrl" value="searchRegAdmin.reg">
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
	</main>



	<script type="text/javascript">
		$("#sampleTable1 tbody tr td").click(function() {
			var subCode = $(this).parent().children().eq(0).text();
			location.href="lectRegAdmin.reg?subCode="+subCode;
		});
		
	</script>
	

</body>
</html>