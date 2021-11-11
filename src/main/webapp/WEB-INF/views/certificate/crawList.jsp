<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>낙성대학교</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/>
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1></h1>
				<p></p>
			</div>
		</div>
			<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>일간 채용 TOP
			</h2>
		</div>
		<div class="tile mb-4" >
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
								<label>카테고리 : &nbsp;&nbsp;&nbsp;
								<select id="categoryTable" name="sampleTable_length" aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px">
										<option value="0" <c:if test="${ categoryTable eq 0 }">selected</c:if>>전체</option>
										<option value="1" <c:if test="${ categoryTable eq 1 }">selected</c:if>>${depart.deptName}</option>
								</select>
								</label>
							</div>
						</div>
								<div class="col-sm-12" style="margin-top: 10px">
									<div class="table-responsive">
										<table class="table table-hover table-bordered"
											id="volTable" >
											<thead>
												<tr style="background: #222d32; color: white;">
													<th style="width: 55px">번호</th>
													<th>기업명</th>
													<th>제목</th>
													<th>조건</th>
												</tr>
											</thead>
											<tbody>

												<c:forEach items="${ top }" var="top" varStatus="num">
												<tr>
													<td>${ num.index+1 } </td>
													<td><a href="https://www.jobkorea.co.kr/${ top.chref }">${ top.company }</a></td>
													<td><a href="https://www.jobkorea.co.kr/${ top.href }">${ top.title }</a></td>
													<td>${ top.opt1 } | ${ top.opt2 }  | ${ top.opt3 }  | ${ top.opt4 }</td>
												</tr>
											</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					
	</main>
	<script type="text/javascript">
	$("#categoryTable").change(function() {
		if($(this).val()==0){
			location.href="crawMain.cer"
		}else{
			location.href="crawSearch.cer"
		}
	})
	</script>
</body>
</html>