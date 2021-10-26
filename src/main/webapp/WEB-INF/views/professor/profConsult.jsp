<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
			<!-- <p>Sample forms</p> -->
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
                <tbody>
                	<c:choose>
						<c:when test="${empty conList}">
							<tr><td colspan="4">상담신청 내역이 없습니다.</td></tr>
						</c:when>
						<c:when test="${!empty conList}">
							<c:forEach var="conList" items="${conList}">
								<tr>
				                    <td>
				                      <div class="animated-checkbox">
				                        <label>
				                          <input type="checkbox"><span class="label-text"> </span>
				                        </label>
				                      </div>
				                    </td>
				                    <td><a href="read-mail.html"><c:out value="${ conList.stuId }"/></a></td>
				                    <td class="mail-subject"><b><c:out value="${ conList.conCategory }"/></b></td>
				                    <td>수신시각 표시</td>
			                	</tr>
							</c:forEach>
						</c:when>
					</c:choose>
                </tbody>
              </table>
            </div>
            
            <div class="text-right"><span class="text-muted mr-2">Showing 1-15 out of 60</span>
              <div class="btn-group">
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-chevron-left"></i></button>
                <button class="btn btn-primary btn-sm" type="button"><i class="fa fa-chevron-right"></i></button>
              </div>
            </div>
          </div>
			
			</div>
		</div>
    </div>
    </main>
</body>
</html>