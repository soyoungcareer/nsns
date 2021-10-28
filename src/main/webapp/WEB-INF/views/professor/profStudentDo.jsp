<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.ArrayList, com.kh.spring.major.vo.Subject"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int count = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교(교수) - 학적변동 승인</title>
</head>
<body>
	<jsp:include page="menubarProf.jsp"/>
 
	<main class="app-content">
		<div class="app-title">
			<div>
				<h1>
					<i class="fa fa-edit"></i> 학생 관리
				</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
				<li class="breadcrumb-item">학생 관리</li>
				<li class="breadcrumb-item"><a href="profStudentDo.pr">학적변동 승인</a></li>
			</ul>
		</div>
		
		<div class="container-fluid">
			<div class="tile">
				<div class="tile-body">
					<div class="table-responsive">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
								<h3 class="tile-title">자퇴신청 목록</h3>
							</div>
							<div class="row">
								<div class="col-sm-12">
									<table
										class="table table-hover table-bordered dataTable no-footer"
										id="sampleTable" role="grid"
										aria-describedby="sampleTable_info">
										<thead>
											<tr role="row">
												<th class="sorting_asc" tabindex="0"
													aria-controls="sampleTable" rowspan="1" colspan="1"
													aria-sort="ascending"
													aria-label="Name: activate to sort column descending"
													style="width: 80px;">NO</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Office: activate to sort column ascending"
													style="width: 57.475px;">학생이름</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Start date: activate to sort column ascending"
													style="width: 60.375px;">신청일자</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Position: activate to sort column ascending"
													style="width: 130.762px;">학적상태</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">자퇴사유</th>
												<th class="sorting" tabindex="0" aria-controls="sampleTable"
													rowspan="1" colspan="1"
													aria-label="Salary: activate to sort column ascending"
													style="width: 52.9125px;">승인상태</th>
											</tr>
										</thead>
										<tbody>
											<c:choose>
												<c:when test="${empty doList}">
													<tr><td colspan="6">자퇴신청 내역이 없습니다.</td></tr>
												</c:when>
												<c:when test="${!empty doList}">
													<c:forEach var="doList" items="${doList}">
														<tr role="row">
															<td class="sorting_1"><%= count++ %></td>
															<td><c:out value="${doList.stuName}"/></td>
															<td><c:out value="${doList.doDate}"/></td>
															<td><c:out value="${doList.stuStatus}"/></td>
															<td><c:out value="${doList.doReason}"/></td>
															<td><c:out value="${doList.status}"/></td>
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
				                			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage-1 }">Previous</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                	
				                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				                    	<c:choose>
					                		<c:when test="${ pi.currentPage ne p }">
				                    			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ p }">${ p }</a></li>
					                		</c:when>
					                		<c:otherwise>
					                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
					                		</c:otherwise>
					                	</c:choose>
				                    </c:forEach>
				                    
				                    <c:choose>
				                		<c:when test="${ pi.currentPage ne pi.maxPage }">
				                			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:when>
				                		<c:otherwise>
				                			<li class="page-item disabled"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage+1 }">Next</a></li>
				                		</c:otherwise>
				                	</c:choose>
				                </ul>
				            </div>
							
							
							<div class="row">
								<label class="control-label col-md-3">
					              <input type="checkbox"><span class="label-text">승인</span>
					            </label>
					            <label class="control-label col-md-3">
					              <input type="checkbox"><span class="label-text">반려</span>
					            </label>
								<div class="form-group row">
				                  <label class="control-label col-md-3">반려사유</label>
				                  <div class="col-md-8">
				                    <input class="form-control" type="text" placeholder="반려사유 입력">
				                  </div>
				                </div>
				                <div class="form-group col-md-4 align-self-end">
				                  <input type="button" class="btn btn-primary" type="button" onclick="" value="저장"/>
				                </div>
			                </div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</main>
</body>
</html>