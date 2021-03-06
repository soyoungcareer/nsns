<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
<title>낙성대학교</title>
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
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<h3 class="tile-title">강의개설/수정/삭제 신청목록</h3>
							</div>
							<div class="row">
								<p>
									※${ loginPrf.profName }교수님이 신청하신 내역입니다.<br>
									※관리자 승인 후 신청내역이 반영됩니다.
								</p>
							</div>
							<br>
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="sampleTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead class="tableInfo">
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1" style="width: 70px;">신청일자</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">신청형태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">이수구분</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">교과목명</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 30px;">학점</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의형태</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 40px;">강의시간</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">강의계획서</th>
												<th tabindex="0" rowspan="1" colspan="1" style="width: 50px;">승인상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty reqSub}">
													<tr><td colspan="10">신청내역이 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty reqSub}">
													<c:forEach var="reqSub" items="${reqSub}">
														<tr role="row">
															<td><fmt:formatDate pattern="yyyy년MM월dd일" value="${reqSub.reqDate}"/></td>
															<td>
																<c:if test="${reqSub.reqType eq 'C' }"><c:out value="개설"/></c:if>
																<c:if test="${reqSub.reqType eq 'E' }"><c:out value="수정"/></c:if>
																<c:if test="${reqSub.reqType eq 'D' }"><c:out value="삭제"/></c:if>
															</td>
															<td>
																<c:if test="${reqSub.subDivs eq '1'}"><c:out value="전공"/></c:if>
																<c:if test="${reqSub.subDivs eq '2'}"><c:out value="교양"/></c:if>
															</td>
															<td>${reqSub.subTitle}</td>
															<td>${reqSub.subCredit}학점<td>
																<c:if test="${reqSub.subType eq '1'}"><c:out value="집체"/></c:if>
																<c:if test="${reqSub.subType eq '2'}"><c:out value="온라인"/></c:if>
															</td>
															<td>${reqSub.subTime}</td>
															<td>
																<c:if test="${ empty reqSub.attOrigin }">
																	첨부파일 없음
																</c:if>
																<c:if test="${ !empty reqSub.attOrigin }">
																	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ reqSub.attChange }" 
																		download="${ reqSub.attOrigin }"><button class="btn badge badge-pill badge-warning" type="button">${ reqSub.attOrigin }</button></a>
																</c:if>
															</td>
															<td>
																<c:if test="${reqSub.status eq 'Y'}"><c:out value="승인완료"/></c:if>
																<c:if test="${reqSub.status eq 'N'}"><c:out value="승인대기중"/></c:if>
															</td>
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
				                			<li class="page-item"><a class="page-link" href="profLectureReq.pr?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="profLectureReq.pr?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="profLectureReq.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="profLectureReq.pr?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </ul>
				            </div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
</body>
</html>