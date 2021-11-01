<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>낙성대학교(교수) - 상담관리</title>
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
			<li class="breadcrumb-item"><a href="profConsult.pr">상담 관리</a></li>
		</ul>
	</div>
	
	<div class="container-fluid">
		<div class="tile">
			<h3 class="tile-title">상담 관리</h3>
			<div class="tile-body">
				<div class="tile">
            <div class="mailbox-controls">
              <div class="animated-checkbox">
                <label>
                  <input type="checkbox"><span class="label-text"></span>
                </label>
              </div>
              <div class="btn-group">
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-trash-o"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-reply"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-share"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-refresh"></i></button>
              </div>
            </div>
            <div class="table-responsive mailbox-messages">
              <table class="table table-hover">
              	<thead>
              		<tr>
	              		<th>상담번호</th>
	              		<th>구분</th>
	              		<th>학생이름</th>
	              		<th>희망일자</th>
              		</tr>
              	</thead>
                <tbody>
                	<c:choose>
						<c:when test="${empty conList}">
							<tr><td colspan="4">상담신청 내역이 없습니다.</td></tr>
						</c:when>
						<c:when test="${!empty conList}">
							<c:forEach var="conList" items="${conList}">
								<tr>
				                    <!-- <td>
				                      <div class="animated-checkbox">
				                        <label>
				                          <input type="checkbox"><span class="label-text"> </span>
				                        </label>
				                      </div>
				                    </td> -->
				                    <td>${ conList.conNo }</td>
				                    <td>${ conList.conCategory }</td>
				                    <td class="mail-subject"><b>${ conList.student.stuName }</b></td>
				                    <td><fmt:formatDate pattern="yyyy년MM월dd일 HH:mm" value="${ conList.conDate }"/></td>
			                	</tr>
							</c:forEach>
						</c:when>
					</c:choose>
                </tbody>
              </table>
            </div>
            
            
          <!-- The Modal -->
		  <div class="modal fade" id="myModal">
		    <div class="modal-dialog">
		      <div class="modal-content">
		      <form action="profObjCheck.pr">
		        <!-- Modal Header -->
		        <div class="modal-header">
		          <h4 class="modal-title">상담신청 상세조회</h4>
		          <button type="button" class="close" data-dismiss="modal">×</button>
		        </div>
		        
		        <!-- Modal body -->
		        <div class="modal-body" id="modalBody">
		        	
		        </div>
		        
		        <!-- Modal footer -->
		        <div class="modal-footer">
		          <button class="btn btn-primary" type="submit" id="saveObjCheck">저장</button>
		          <button class="btn btn-secondary" type="button" data-dismiss="modal">닫기</button>
		        </div>
		       </form>
		      </div>
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
            
          </div>
			
			</div>
		</div>
    </div>
    </main>
</body>
</html>