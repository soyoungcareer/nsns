<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적조회페이지</title>
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
								style="margin-right: 10px;"></img>성적 조회
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<form action="gradeSearch.eval" class="row">
						<div class="col-sm-12 col-md-6">
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
								<table class="table table-hover table-bordered" id="gradeTable">
									<thead>
										<tr style="background: #222d32; color: white;">
											<th>년도학기</th>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>등급</th>
											<th>이의신청</th>
											<th>강의평가</th>
										</tr>
									</thead>
									<tbody>
									<c:if test="${ empty arlist }">
											<tr >
											<td colspan="8">
											<h2 class="bs-component" style="text-align: center; line-height: 100px"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 해당 자료가 없습니다. </h2>
											<script type="text/javascript">
												$("#gradeTable").removeClass("table-hover");
											</script>
											</td>
												</tr>
											</c:if>
									<c:if test="${ !empty arlist }">
										<c:forEach items="${ arlist }" var="ar">
						                    <tr>
						                        <td>${ ar.lectRegister.year } 년 ${ ar.lectRegister.semester } 학기</td>
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
											     <c:set var="now" value="<%=new java.util.Date()%>" />
												<c:set var="sysYear"><fmt:formatDate value="${now}" pattern="yyyy" /></c:set> 
												<c:set var="sysM"><fmt:formatDate value="${now}" pattern="MM" /></c:set> 
												   <c:choose>
											         <c:when test = "${sysM<9 and sysM>2}">
											            <c:set var="seme" value="1"></c:set>
											         </c:when>
											         <c:otherwise>
											             <c:set var="seme" value="2"></c:set>
											         </c:otherwise>
											      </c:choose>
											      <c:choose>
											         <c:when test = "${sysYear==ar.lectRegister.year and  seme==ar.lectRegister.semester}">
											         <c:if test = "${ ar.countObj eq 0}">
											          	<th style="padding: 0px; padding-top: 5px"><button
														class="btn btn-primary" type="button"
														style="margin-left: 10px;" id="addObejct"
														class="addObejct">신청하기</button></th>
														</c:if>
														<c:if test = "${ar.countObj!=0 }">
														<th style="padding: 0px; padding-top: 5px"><button
														class="btn btn-secondary" type="button"
														style="margin-left: 10px;" id="addObejct" disabled
														class="addObejct">신청완료</button></th>
														</c:if>
									
														<c:if test = "${ar.countEval!=0}">
														<th style="padding: 0px; padding-top: 5px" id="evaluation"><button
														class="btn btn-primary" type="button"
														style="margin-left: 10px;">신청하기</button></th>
														</c:if>
														<c:if test = "${ar.countEval eq 0}">
														<th ></th>
														</c:if>
											         </c:when>
											         <c:otherwise>
											         	 <td></td>
											             <td></td>
											         </c:otherwise>
											      </c:choose>   
						                    </tr>
					                    </c:forEach>
					                    </c:if>
											<!-- <tr>
											<td rowspan="5"><a
											href="lectRegisterEdit.reg">FA831</a></td>
											<td>FA831</td>
											<td>응용수학</td>
											<td>기계공학</td>
											<td>3</td>
											<td>전공필수</td>
											<td style="padding: 0px; padding-top: 5px"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;" id="gradeObjPop"
													data-toggle="modal" data-target="#gradeObjModal">신청하기</button></td>
											<td style="padding: 0px; padding-top: 5px" id="evaluation"><button
													class="btn btn-primary" type="button"
													style="margin-left: 10px;">신청하기</button></td>
										</tr>
										 -->
									</tbody>
								</table>
							</div>
						</div>
						
						<div class="col-sm-12" style="margin-top: 10px;">
							<div class="table-responsive" >
								<table class="table table-bordered" id="sampleTable"  style="text-align: center;">
									<thead>
										<tr>
											<th style="background: #222d32; color: white; width: 16%">취득 학점</th>
											<c:if test="${ !empty cCredit }">
											<td >${cCredit.allC}</td>
											</c:if>
											<c:if test="${ empty cCredit }">
											<td >0</td>
											</c:if>
											<th style="background: #222d32; color: white; width: 16%">평균 학점</th>
											<c:choose>
											         <c:when test = "${ empty cCredit.avgCredit or cCredit.avgCredit==0.0}">
											            <td >미정</td>
											         </c:when>
											         <c:otherwise>
											             <td><fmt:formatNumber type="number"  pattern="0.00"  value= "${ cCredit.avgCredit} " /></td>
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
	<div class="modal fade" id="gradeObjModal">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>이의 신청
					</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

					<!-- Modal Body -->
					<div class="modal-body" id="objecModal">
					
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" id="objSubmit">제출하기</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
			</div>
		</div>
	</div>
	 <form id="postForm" action="gradeObjAddPop.obj" method="post"> 
					<input type="hidden" name="title" value="">
					<input type="hidden" name="content" value=""> 
					<input type="hidden" name="subCode" value="">
					<input type="hidden" name="date" value=""> 
	</form>
	<div class="modal fade" id="gradeAboutModal">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h2 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>성적 확인
					</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

					<!-- Modal Body -->
					<div class="modal-body" id="modelAbout">

					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	$("#gradeTable tbody tr td").click(function() {//성적 상세보기
		var subCode = $(this).parent().children().eq(1).text();
		var date = $(this).parent().children().eq(0).text();
		$.ajax({
			url:"gradeDe.ev",
			type:"post",
			data:{subCode:subCode,
				date:date},
			success:function(grDetail){
				$("#modelAbout").html("");
				$("#gradeAboutModal").modal('show');
				var value="";
				value +='<div class="form-group row">' +
						'<label class="control-label col-md-2">교과목명</label>'+
						'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.subject.subTitle+'">'+
						'</div>'+
						'<label class="control-label col-md-2">강의코드</label>'+
						'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.subject.subCode+'">'+
						'</div>'+
						'</div>' +
						'<div class="form-group row">' +
						'<label class="control-label col-md-2">학과</label>'+
						'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.department.deptTitle+'">'+
						'</div>'+
						'<label class="control-label col-md-2">교수명</label>'+
						'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.professor.profName+'">'+
						'</div>'+
						'</div>'+
						 '<div class="form-group row">' +
						 '<label class="control-label col-md-2">년도학기</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.lectRegister.year+' 년   '+grDetail.lectRegister.semester+' 학기">'+
							'</div>'+
						'<label class="control-label col-md-2">학점</label>'+
						'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.subject.subCredit+'  학점">'+
						'</div>'+
						'</div>'+
						'<div class="form-group row">' +
						 '<label class="control-label col-md-2">중간 점수</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.grade.midExam+' / 25">'+
							'</div>'+
						'<label class="control-label col-md-2">기말 점수</label>'+
						'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.grade.finExam+' / 25">'+
						'</div>'+
						'</div>'+
						'<div class="form-group row">' +
						 '<label class="control-label col-md-2">출석 점수</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.grade.attendance+' / 25">'+
							'</div>'+
						'<label class="control-label col-md-2">과제 점수</label>'+
						'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.grade.assignment+' / 25">'+
						'</div>'+
						'</div>'+
						'<div class="form-group row">' +
						 '<label class="control-label col-md-2">등급 </label>'+
							'<div class="col-md-4">'
							if(grDetail.grade.gradeResult>=95){
								value +='<input class="form-control col-md-12" type="text" disabled value="A+">'
						      }else if(grDetail.grade.gradeResult>=90 && grDetail.grade.gradeResult<95){
						    	value +='<input class="form-control col-md-12" type="text" disabled value="A">'
						      }else if(grDetail.grade.gradeResult>=85 && grDetail.grade.gradeResult<90){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="B+">'
						      }else if(grDetail.grade.gradeResult>=80 && grDetail.grade.gradeResult<85){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="B">'
						      }else if(grDetail.grade.gradeResult>=75 && grDetail.grade.gradeResult<80){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="C+">'
						      }else if(grDetail.grade.gradeResult>=70 && grDetail.grade.gradeResult<75){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="C">'
						      }else if(grDetail.grade.gradeResult>=65 && grDetail.grade.gradeResult<70){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="D+">'
						      }else if(grDetail.grade.gradeResult>=60 && grDetail.grade.gradeResult<65){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="D">'
						      }else if(typeof grDetail.grade.gradeResult== "undefined"){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="미정">'
						      } else{
						            value +='<input class="form-control col-md-12" type="text" disabled value="F">'
						      }
							value +='</div>'+
						'<label class="control-label col-md-2">학점 </label>'+
						'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.grade.gradeCredit+' / 4.5">'+
						'</div>'+
						'</div>'
				$("#modelAbout").html(value);
			},
		     error:function(){
		         alert("수강신청 상세 화면 모달 로딩 실패"); 
		        }
		}); 
	});
	
		$("#evaluation").click(function() {
			location.href="evaluation.ev";
		});
	</script>
	<script type="text/javascript">
	var subCode;
	var date;
	$(document).on("click","#gradeTable tbody tr th:nth-last-child(2) button",function(){//이의신청 모달 팝업
		subCode = $(this).parent().parent().children().eq(1).text();
		date = $(this).parent().parent().children().eq(0).text();
			$.ajax({
				url:"gradeDe.ev",
				type:"post",
				data:{subCode:subCode, 
					date:date},
				success:function(grDetail){
					$("#objecModal").html("");
					$("#gradeObjModal").modal('show');
					var value="";
					value +='<div class="form-group row">' +
							'<label class="control-label col-md-2">교과목명</label>'+
							'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="hidden" id="gradeNo" name="gradeNo" disabled value="'+grDetail.grade.gradeNo+'">'+
								'<input class="form-control col-md-12" type="text" name="subTitle" disabled value="'+grDetail.subject.subTitle+'">'+
							'</div>'+
							'<label class="control-label col-md-2">강의코드</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" name="subCode" disabled value="'+grDetail.subject.subCode+'">'+
							'</div>'+
							'</div>'+
							 '<div class="form-group row">' +
							 '<label class="control-label col-md-2">년도학기</label>'+
								'<div class="col-md-4">'+
									'<input class="form-control col-md-12" type="text"  disabled value="'+grDetail.lectRegister.year+' 년   '+grDetail.lectRegister.semester+' 학기">'+
								'</div>'+
								'<label class="control-label col-md-2">교수명</label>'+
								'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.professor.profName+'">'+
								'</div>'+
								'</div>'+
								'<div class="form-group row">' +
								 '<label class="control-label col-md-2">등급 </label>'+
									'<div class="col-md-4">'
									if(grDetail.grade.gradeResult>=95){
										value +='<input class="form-control col-md-12" type="text" disabled value="A+">'
								      }else if(grDetail.grade.gradeResult>=90 && grDetail.grade.gradeResult<95){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="A">'
								      }else if(grDetail.grade.gradeResult>=85 && grDetail.grade.gradeResult<90){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="B+">'
								      }else if(grDetail.grade.gradeResult>=80 && grDetail.grade.gradeResult<85){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="B">'
								      }else if(grDetail.grade.gradeResult>=75 && grDetail.grade.gradeResult<80){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="C+">'
								      }else if(grDetail.grade.gradeResult>=70 && grDetail.grade.gradeResult<75){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="C">'
								      }else if(grDetail.grade.gradeResult>=65 && grDetail.grade.gradeResult<70){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="D+">'
								      }else if(grDetail.grade.gradeResult>=60 && grDetail.grade.gradeResult<65){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="D">'
								      }else if(typeof grDetail.grade.gradeResult== "undefined"){
									    	value +='<input class="form-control col-md-12" type="text" disabled value="미정">'
								      } else{
								            value +='<input class="form-control col-md-12" type="text" disabled value="F">'
								      }
									value +='</div>'+
								'<label class="control-label col-md-2">학점 </label>'+
								'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text" disabled value="'+grDetail.grade.gradeCredit+' / 4.5">'+
								'</div>'+
								'</div>'+
								'<div class="form-group row">'+
								'<label class="control-label col-md-2">이의 제목</label>'+
								'<div class="col-md-10">'+
									'<input class="form-control col-md-12" type="text" name="objTitle"  id="objTitle">'+
								'</div>'+
							'</div>'+
							'<div class="form-group row">'+
								'<label class="control-label col-md-2">상세 내용</label>'+
								'<div class="col-md-10">'+
									'<textarea class="form-control" rows="6" placeholder="" name="objContent" id="objContent" style="resize: none;"></textarea>'+
									'</div>'+
									'</div>'
					$("#objecModal").html(value);
				}
			});  
	});
	
	$(document).on("click","#gradeTable tbody tr th:nth-last-child(1) button",function(){//강의 평가 가기
		subCode = $(this).parent().parent().children().eq(1).text();
		date = $(this).parent().parent().children().eq(0).text();
		location.href="evaluation.ev?subCode="+subCode+"&date="+date;
	});
	
	$(document).on("click","#objSubmit",function(){
		var title = $("#objTitle").val();
		var content = $("#objContent").val();
		$("input[name='title']").val(title);
		$("input[name='content']").val(content);
		$("input[name='subCode']").val(subCode);
		$("input[name='date']").val(date);
		
		$("#postForm").submit();
	});
	</script>
</body>
</html>