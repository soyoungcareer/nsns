<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수강신청</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/> 
	<main class="app-content">
		<div class="app-title">
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>이의 신청 현황
			</h2>
		</div>
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">

						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-hover table-bordered" id="gradeObjectList">
									<thead>
										<tr>
											<th>년도 학기</th>
											<th>강의코드</th>
											<th>교과목명</th>
											<th>계열</th>
											<th>학점</th>
											<th>등급</th>
											<th>이의신청</th>
										</tr>
									</thead>
									<tbody>
										
											<c:forEach items="${ objList }" var="obj">
						                    <tr>
						                        <td>${ obj.lectRegister.year } 년 ${ obj.lectRegister.semester } 학기</td>
						                        <td>${ obj.subject.subCode }</td>
						                        <td>${ obj.subject.subTitle }</td>
						                        <td>${ obj.department.deptTitle }</td>
						                        <td>${ obj.subject.subCredit }</td>
						                        <c:choose>
											         <c:when test = "${obj.grade.gradeResult>=95}">
											            <td>A+</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=90 and obj.grade.gradeResult<95}">
											             <td>A</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=85 and obj.grade.gradeResult<90}">
											             <td>B+</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=80 and obj.grade.gradeResult<85}">
											             <td>B</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=75 and obj.grade.gradeResult<80}">
											             <td>C+</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=70 and obj.grade.gradeResult<75}">
											             <td>C</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=65 and obj.grade.gradeResult<70}">
											             <td>D+</td>
											         </c:when>
											         <c:when test = "${obj.grade.gradeResult>=60 and obj.grade.gradeResult<65}">
											             <td>D</td>
											         </c:when>
											         <c:when test = "${empty obj.grade.gradeResult}">
											             <td>미정</td>
											         </c:when>
											         <c:otherwise>
											             <td>F</td>
											         </c:otherwise>
											      </c:choose>
											          	<th style="padding: 0px; padding-top: 5px"><button
														class="btn btn-primary" type="button"
														style="margin-left: 10px;" id="addObejct"
														class="addObejct">신청확인</button></th>
						                    </tr>
					                    </c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<div class="modal fade" id="gradeObjDetailModal">
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
					<div class="modal-body" id="objDeModal">
					
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-dismiss="modal">확인</button>
					</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
var subCode;
var date;
	$(document).on("click","#gradeObjectList tbody tr th:nth-last-child(1) button",function(){//이의신청 모달 팝업
		subCode = $(this).parent().parent().children().eq(1).text();
		date = $(this).parent().parent().children().eq(0).text();
		$.ajax({
			url:"obDetail.ob",
			type:"post",
			data:{subCode:subCode, 
				date:date},
			success:function(objDe){
				$("#objDeModal").html("");
				$("#gradeObjDetailModal").modal('show');
				var value="";
				value +='<div class="form-group row">' +
						'<label class="control-label col-md-2">교과목명</label>'+
						'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" name="subTitle" disabled value="'+objDe.subject.subTitle+'">'+
						'</div>'+
						'<label class="control-label col-md-2">강의코드</label>'+
						'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" name="subCode" disabled value="'+objDe.subject.subCode+'">'+
						'</div>'+
						'</div>' +
						 '<div class="form-group row">' +
						 '<label class="control-label col-md-2">년도학기</label>'+
							'<div class="col-md-4">'+
								'<input class="form-control col-md-12" type="text"  disabled value="'+objDe.lectRegister.year+' 년   '+objDe.lectRegister.semester+' 학기">'+
							'</div>'+
							'<label class="control-label col-md-2">교수명</label>'+
							'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+objDe.professor.profName+'">'+
							'</div>'+
							'</div>'+
							'<div class="form-group row">' +
							 '<label class="control-label col-md-2">등급 </label>'+
								'<div class="col-md-4">'
								if(objDe.grade.gradeResult>=95){
									value +='<input class="form-control col-md-12" type="text" disabled value="A+">'
							      }else if(objDe.grade.gradeResult>=90 && objDe.grade.gradeResult<95){
							    	value +='<input class="form-control col-md-12" type="text" disabled value="A">'
							      }else if(objDe.grade.gradeResult>=85 && objDe.grade.gradeResult<90){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="B+">'
							      }else if(objDe.grade.gradeResult>=80 && objDe.grade.gradeResult<85){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="B">'
							      }else if(objDe.grade.gradeResult>=75 && objDe.grade.gradeResult<80){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="C+">'
							      }else if(objDe.grade.gradeResult>=70 && objDe.grade.gradeResult<75){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="C">'
							      }else if(objDe.grade.gradeResult>=65 && objDe.grade.gradeResult<70){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="D+">'
							      }else if(objDe.grade.gradeResult>=60 && objDe.grade.gradeResult<65){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="D">'
							      }else if(typeof objDe.grade.gradeResult== "undefined"){
								    	value +='<input class="form-control col-md-12" type="text" disabled value="미정">'
							      } else{
							            value +='<input class="form-control col-md-12" type="text" disabled value="F">'
							      }
								value +='</div>'+
							'<label class="control-label col-md-2">학점 </label>'+
							'<div class="col-md-4">'+
							'<input class="form-control col-md-12" type="text" disabled value="'+objDe.grade.gradeCredit+' / 4.5">'+
							'</div>'+
							'</div>'+
							'<div class="form-group row">'+
							'<label class="control-label col-md-2">이의 제목</label>'+
							'<div class="col-md-10">'+
								'<input class="form-control col-md-12" type="text" disabled name="objTitle"  id="objTitle" value="'+objDe.gradeObject.title+'">'+
							'</div>'+
						'</div>'+
						'<div class="form-group row">'+
							'<label class="control-label col-md-2">이의 내용</label>'+
							'<div class="col-md-10">'+
								'<textarea class="form-control" rows="6" placeholder="" disabled name="objContent" id="objContent" style="resize: none;">'+objDe.gradeObject.content+'</textarea>'+
								'</div>'+
								'</div>'+
								'<div class="form-group row">'+
								'<label class="control-label col-md-2">상태</label>'+
								'<div class="col-md-10">'+
									'<input class="form-control col-md-12" type="text" disabled value="'+objDe.gradeObject.status+'" style="color: red;">'+
								'</div>'+
							'</div>'+
							'<div class="form-group row">'+
								'<label class="control-label col-md-2">답변 사유</label>'+
								'<div class="col-md-10">'
								if(typeof objDe.gradeObject.reason =='undefined'){
							value+=		'<input class="form-control col-md-12" type="text" disabled value="">'
								}else{
									value+=	'<input class="form-control col-md-12" type="text" disabled value="'+objDe.gradeObject.reason+'">'
								}
								value+=	'</div>'+
									'</div>'  
				$("#objDeModal").html(value);
			}
		});    
	});
</script>
</body>
</html>