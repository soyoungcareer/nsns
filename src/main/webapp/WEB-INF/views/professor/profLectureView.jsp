<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head> 
	<meta charset="UTF-8">
	<title>낙성대학교</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		/* 수정할 강의코드 넘기기 */
		$(document).on("click", "#subTable tbody tr td:nth-last-child(2) input", function(){
			var subCode = $(this).parent().parent().children().eq(2).text();
			location.href="lectEditInfoLoad.pr?subCode="+subCode;
		});
		
		/* 삭제할 강의코드 넘기기 */
		$(document).on("click", "#subTable tbody tr td:nth-last-child(1) input", function(){
			var subCode = $(this).parent().parent().children().eq(2).text();
			location.href="lectDelInfoLoad.pr?subCode="+subCode;
		});
	</script>
	
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-briefcase"></i> 강의 관리
				</h1>
			</div>
			<!-- <ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">강의 관리</li>
				<li class="breadcrumb-item"><a href="profLectureDetail.pr">강의목록 조회</a></li>
			</ul> -->
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<h3 class="tile-title">강의목록</h3>
							</div>
							<div class="row">
								<p>
									※${ loginPrf.profName }교수님이 담당하신 강의목록입니다.
								</p>
							</div>
							<br>
							
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="subTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead class="tableInfo">
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">학년도</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">학기</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의코드</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">교과목명</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">이수구분</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">학점</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 80px;">강의실</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의시간</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의형태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 80px;">강의계획서</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">수정</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">삭제</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty subList}">
													<tr><td colspan="11">개설된 강의가 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty subList}">
													<c:forEach var="subList" items="${subList}">
														<tr role="row">
															<td>${subList.subYear}</td>
															<td>${subList.subSmst}</td>
															<td>${subList.subCode}</td>
															<td>${subList.subTitle}</td>
															<td>
																<c:if test="${subList.subDivs eq '1'}"><c:out value="전공"/></c:if>
																<c:if test="${subList.subDivs eq '2'}"><c:out value="교양"/></c:if>
															</td>
															<td>${subList.subCredit}</td>
															<td>
																<c:if test="${fn:substring(subList.subClass,0,1) eq '1'}"><c:out value="강감찬관 ${fn:substring(subList.subClass,1,4)}호"/></c:if>
																<c:if test="${fn:substring(subList.subClass,0,1) eq '2'}"><c:out value="별관 ${fn:substring(subList.subClass,1,4)}호"/></c:if>
															</td>
															<td>${subList.subTime}</td>
															<td>
																<c:if test="${subList.subType eq '1'}"><c:out value="집체"/></c:if>
																<c:if test="${subList.subType eq '2'}"><c:out value="온라인"/></c:if>
															</td>
															<td>
											                  	<c:if test="${ empty subList.originName }">
																	첨부파일 없음
																</c:if>
																<c:if test="${ !empty subList.originName }">
																	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ subList.changeName }" 
																		download="${ subList.originName }"><button class="btn badge badge-pill badge-primary" type="button">${ subList.originName }</button></a>
																</c:if>
											                </td>
											                <td><input type="button" class="btn btn-warning" id="editBtn" value="수정"/></td>
											                <td><input type="button" class="btn btn-danger" id="delBtn" value="삭제"/></td>
														</tr>
													</c:forEach>
												</c:when>
											</c:choose>
										</tbody>
									</table>
								</div>
							</div>
							
							<!-- 페이징 처리 -->
							<div id="pagingArea">
				                <ul class="pagination">
				                	<c:choose>
				                		<c:when test="${ pi.currentPage ne 1 }">
				                			<li class="page-item"><a class="page-link" href="profLectureDetail.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="profLectureDetail.pr?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="profLectureDetail.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="profLectureDetail.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </ul>
				            </div>
							
<%-- 							<div class="row">
				                <div class="form-group col-md-4 align-self-end">
				                  <input type="button" class="btn btn-warning" onclick="location.href='<%=contextPath%>/lectEditInfoLoad.pr'" value="강의수정"/>
				                  <input type="button" class="btn btn-warning" id="editBtn" onclick="" value="강의수정"/>
				                  <input type="button" class="btn btn-danger" onclick="location.href='<%=contextPath%>/lectDelInfoLoad.pr'" value="강의삭제"/>
				                  <input type="button" class="btn btn-danger" onclick="" value="강의삭제"/>
				                </div>
			                </div> --%>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
</body>
</html>