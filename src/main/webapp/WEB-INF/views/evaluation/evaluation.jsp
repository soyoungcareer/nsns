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
			</div>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>강의평가
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row col-sm-12 col-md-12" style="float: none; margin:0 auto;">
					<h1 style="color: #222d32; float: none; margin:0 auto; margin-top: 20px;">강의 평가서</h1>
				</div>
				<div class="row col-sm-12 col-md-12" style="float: none; margin:0 auto;">
					<h2 style="float: none; margin:0 auto; margin-top: 10px; margin-bottom: 30px">
					<!-- 날짜 설정 -->
					<c:set var="today" value="<%=new java.util.Date()%>" />
					<c:set var="ye"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set> 
					<c:set var="loop_flag" value="false" />
					<c:forEach items="${ evalList }" var="eval" varStatus="eNum">
					<c:if test="${not loop_flag }">
				        <c:if test="${eval.year eq ye }">
				         (  ${ eval.year }  학년도 제  ${ eval.semester }  학기 ) 
				            <c:set var="loop_flag" value="true" />
				        </c:if>
				    </c:if>
					</c:forEach>
					</h2>
					
				</div>
				<div class="card mb-3 text-black bg-light">
	                <div class="card-body">
	                  <blockquote class="card-blockquote">
	                    <p>이 강의 평가서는 앞으로 좀 더 나은 강의를 위해 필요한 정보를 얻기 위한 것 입니다. 낙성대는 학생여러분께 더 나은 교육을 제공하기 위해 수업에 대한 강의 평가 조사를 실시 하고 있습니다.
		                    본 조사를 통해 학생분들의 의견을 수렴하고 적극 검토하여 더 나은 교육을 제공하기 위한 기초자료로 활용하고자 합니다. 바쁘시더라도 잠시 시간을 내어 적극적인 협조와 참여 부탁드리며,
		                     여러분이 평가한 결과는 다른 목적으로는 쓰이지 않을 것이니 각각의 질문에 대하여 솔직하고 진지하게 답하여 주시기 바랍니다.  
						</p>
	                    <footer>답변은 <b>( 1 ) 매우 그렇지 않다, ( 2 ) 그렇지 않다, ( 3 ) 그저 그렇다, ( 4 ) 그렇다, ( 5 ) 매우 그렇다.</b> 중 하나를 선택하여 주십시오.
	                    </footer>
	                  </blockquote>
	                </div>
               </div>
				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
						<form id="evaluationList" action="insertEval.ev"  method="post">
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable">
									<thead>
										<tr style="background: #222d32; color: white;">
											<th style="width: 7%">번호</th>
											<th >질문항목</th>
											<th style="width: 5%">1점</th>
											<th style="width: 5%">2점</th>
											<th style="width: 5%">3점</th>
											<th style="width: 5%">4점</th>
											<th style="width: 5%">5점</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ evalList }" var="eval" varStatus="eNum">
						                    <tr>
						                    	<td>${ eNum.index+1 }</td>
						                        <td>${ eval.question }</td>
											    <td><input type="radio" value="1" name="evalList[${ eNum.index}].grade" id="grade${ eNum.index+1 }1">
												<label for="grade${ eNum.index+1 }1">1</label> </td>
												<td><input type="radio" value="2" name="evalList[${ eNum.index }].grade" id="grade${ eNum.index+1 }2">
													<label for="grade${ eNum.index+1 }2">2</label></td>
												<td><input type="radio" value="2" name="evalList[${ eNum.index }].grade" id="grade${ eNum.index+1 }3" checked>
													<label for="grade${ eNum.index+1 }3">3</label></td>
												<td><input type="radio" value="4" name="evalList[${ eNum.index }].grade" id="grade${ eNum.index+1 }4">
													<label for="grade${ eNum.index+1 }4">4</label></td>
												<td><input type="radio" value="5" name="evalList[${ eNum.index }].grade" id="grade${ eNum.index+1 }5">
													<label for="grade${ eNum.index+1 }5">5</label></td>
						                    </tr>
						                     <input type="hidden" name="evalList[${ eNum.index }].evalNum" value="${ eval.lectEvaNo }">
						                     <input type="hidden" name="evalList[${ eNum.index }].lectNum" value="${ eval.lectRegNo }">
						                     <input type="hidden" name="evalList[${ eNum.index }].stuId" value="${ loginStu.stuId }"><!-- 세션 아이디로 수정 필요 -->
					                    </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						
						<div >
		                <div class="col-md-12" style="float: none; margin:0 auto;">
		                <a class="btn btn-secondary" href="#" onclick="history.go(-1)" ><i class="fa fa-fw fa-lg fa-times-circle"></i>뒤로가기</a>&nbsp;&nbsp;&nbsp;
		                  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>저장하기</button>&nbsp;&nbsp;&nbsp;
		                </div>
		            </div>
		            </form>
					</div>
				</div>
			</div>
	</main>
</body>
</html>