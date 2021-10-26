<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이수학점조회</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/> 
	<main class="app-content">
		<div class="app-title">
			<div class="div">
			</div>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>이수학점 조회
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<form action="creditSearch.eval" class="row">
						<div class="col-sm-12 col-md-6" >
							<div class="dataTables_length" id="sampleTable_length" style="padding-left: 15px">
								<label>년도 : &nbsp;&nbsp;&nbsp;
								<select name="condition1"
									aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px" id="condition1">
										<option value="0">전체</option>
										<c:forEach items="${ yearList }" var="y">
											<option value="${y.year}" <c:if test="${ condition1 eq y.year }">selected</c:if>>${y.year}년</option>
										</c:forEach>
								</select>
								</label> <label style="margin-left: 10px">학기 : &nbsp;&nbsp;&nbsp;
								<select name="condition2" aria-controls="sampleTable"
									class="form-control form-control-sm" id="condition2">
										<option value="0">전체</option>
										<c:forEach items="${ seList }" var="se">
											<option value="${se.semester}" <c:if test="${ condition2 eq se.semester }">selected</c:if>>${se.semester}학기</option>
										</c:forEach>
								</select>
								</label>
								<button class="btn btn-primary btn-sm" type="submit"
									style="margin-left: 15px; padding-left: 15px; padding-right: 15px">조 &nbsp;&nbsp;회</button>
							</div>
						</div>
						</form>
						<div class="col-sm-12 col-md-6">
						</div>

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-hover table-bordered" id="creditTable">
									<thead>
										<tr style="background: #222d32; color: white;">
											<th>년도학기</th>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>등급</th>
											<th>이수구분</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ arlist }" var="ar">
						                    <tr>
						                        <td>${ ar.lectRegister.year } 년도  ${ ar.lectRegister.semester } 학기</td>
						                        <td>${ ar.subject.subCode }</td>
						                        <td>${ ar.subject.subTitle }</td>
						                        <td>${ ar.department.deptTitle }</td>
						                        <td>${ ar.subject.subCredit }</td>
						                        <c:choose>
											         <c:when test = "${ar.grade.gradeResult>=95}">
											            <td>A+</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=90 and ar.grade.gradeResult<95}">
											             <td>A</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=85 and ar.grade.gradeResult<90}">
											             <td>B+</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=80 and ar.grade.gradeResult<85}">
											             <td>B</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=75 and ar.grade.gradeResult<80}">
											             <td>C+</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=70 and ar.grade.gradeResult<75}">
											             <td>C</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=65 and ar.grade.gradeResult<70}">
											             <td>D+</td>
											         </c:when>
											         <c:when test = "${ar.grade.gradeResult>=60 and ar.grade.gradeResult<65}">
											             <td>D</td>
											         </c:when>
											         <c:when test = "${empty ar.grade.gradeResult}">
											             <td>미정</td>
											         </c:when>
											         <c:otherwise>
											             <td>F</td>
											         </c:otherwise>
											      </c:choose>
											   	 <c:if test="${ ar.subject.subDivs eq 1 }">
					                        	<td>전공필수</td>
						                        </c:if>
						                        <c:if test="${ ar.subject.subDivs eq 2 }">
						                        <td>교양필수</td>
						                        </c:if>
						                    </tr>
					                    </c:forEach>
										<!-- <tr>
											<td rowspan="5"><a
												href="lectRegisterEdit.reg">FA831</a></td>
											<td>FA831</td>
											<td>응용수학</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td>월123</td>
										</tr> -->
										
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="col-sm-12" style="margin-top: 10px;">
							<div class="table-responsive" >
								<table class="table table-bordered" id="sampleTable"  style="text-align: center;">
									<thead>
										<tr>
											<th style="background: #222d32; color: white; width: 16%">전공 필수</th>
											<td style=" width: 16%">${cCredit.majorC} / 50</td>
											<th style="background: #222d32; color: white; width: 16%">교양 필수</th>
											<td style=" width: 16%">${cCredit.elseC} / 20</td>
											<th style="background: #222d32; color: white; width: 16%">취득 학점</th>
											<td style="width: 16%">${cCredit.allC}</td>
										</tr>
									</thead>
								</table>
							</div>
						</div>
						
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable" style="text-align: center;">
									<thead>
										<tr>
											<th style="background: #222d32; color: white; width: 16%">평균 학점</th>
											<c:choose>
											         <c:when test = "${ empty cCredit.avgCredit or cCredit.avgCredit==0.0}">
											            <td style=" width: 16%">미정</td>
											         </c:when>
											         <c:otherwise>
											             <td style=" width: 16%">${ cCredit.avgCredit}</td>
											         </c:otherwise>
											</c:choose>
											<th style="background: #222d32; color: white; width: 16%">등급</th>
											<c:choose>
											         <c:when test = "${cCredit.gradeRe>=95}">
											            <td style=" width: 16%">A+</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=90 and cCredit.gradeRe<95}">
											             <td style=" width: 16%">A</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=85 and cCredit.gradeRe<90}">
											             <td style=" width: 16%">B+</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=80 and cCredit.gradeRe<85}">
											             <td style=" width: 16%">B</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=75 and cCredit.gradeRe<80}">
											             <td style=" width: 16%">C+</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=70 and cCredit.gradeRe<75}">
											             <td style=" width: 16%">C</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=65 and cCredit.gradeRe<70}">
											             <td style=" width: 16%">D+</td>
											         </c:when>
											         <c:when test = "${cCredit.gradeRe>=60 and cCredit.gradeRe<65}">
											             <td style=" width: 16%">D</td>
											         </c:when>
											         <c:when test = "${empty cCredit.gradeRe}">
											             <td style=" width: 16%">미정</td>
											         </c:when>
											         <c:otherwise>
											             <td style=" width: 16%">F</td>
											         </c:otherwise>
											</c:choose>
											<th style="background: #222d32; color: white; width: 16%">졸업가능여부</th>
											<c:choose>
											         <c:when test = "${cCredit.majorC>=50 and cCredit.elseC>=20}">
											            <td style=" width: 16%; color: red;">졸업 가능</td>
											         </c:when>
											         <c:otherwise>
											             <td style=" width: 16%; color: red;">졸업 불가</td>
											         </c:otherwise>
											</c:choose> 
										</tr>
									</thead>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
	</main>
</body>
</html>