<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>낙성대학교</title>
</head>
<body>
<jsp:include page="lectRegisterMenubarAdmin.jsp"/> 
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1><i class="fa fa-pencil fa-lg" aria-hidden="true" style="margin-right: 10px;"></i>수강신청</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/subModifyList.adm" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>강의 설명
			</h2>
		</div>
		 <form class="form-horizontal" id="updateForm" method="post" action="" enctype="multipart/form-data">
		<div class="tile mb-4" >
			<div class="page-header">
				<div class="row">
				</div>

				<div class="col-md-12">
            <div class="tile-body">
                <div class="form-group row">
	                  <label class="control-label col-md-2" >교과목명</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text" id="subTitle" name="subTitle" value="${reDetail.subject.subTitle}">
	                  </div>
	                  <label class="control-label col-md-2">강의코드</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text"  value="${reDetail.subject.subCode}" disabled>
	                    <input type="hidden"  value="${reDetail.subject.subCode}"  id="subCode" name="subCode">
                    </div>
                </div>
                <div class="form-group row">
	                   <label class="control-label col-md-2">교수명</label>
	                  <div class="col-md-4">
	                    <select name="profId" aria-controls="sampleTable" class="form-control col-md-12" id="profId">
							<c:forEach items="${ proList }" var="prof">
								<option value="${prof.profId}" <c:if test="${ reDetail.professor.profName eq prof.profName }">selected</c:if>>${prof.profName}</option>
							</c:forEach>
						</select>
	                  </div>
	                  <label class="control-label col-md-2">이수구분</label>
	                  <div class="col-md-4">
	                      <select class="form-control" id="exampleSelect1" id="subDivs" name="subDivs">
		                       <option value=1 <c:if test="${reDetail.subject.subDivs eq 1}">selected</c:if>>전공필수</option>
		                       <option value=2 <c:if test="${reDetail.subject.subDivs eq 2}">selected</c:if>>교양필수</option>
	                      </select>
                    	</div>
                    </div>
                <div class="form-group row">
	                   <label class="control-label col-md-2">계열</label>
	                  <div class="col-md-4">
	                    <select name="deptCode" aria-controls="sampleTable" class="form-control col-md-12" id="deptCode">
							<c:forEach items="${ departList }" var="depart">
								<option value="${depart.deptCode}" <c:if test="${ reDetail.department.deptCode eq depart.deptCode }">selected</c:if>>${depart.deptTitle}</option>
							</c:forEach>
						</select>
	                  </div>
	                  <label class="control-label col-md-2">강의 형태</label>
	                  <div class="col-md-4">
	                      <select class="form-control" id="subType" name="subType">
		                      <option value="1" <c:if test="${ reDetail.subject.subType eq 1 }"> selected</c:if> >현장 강의</option>
		                      <option value="2" <c:if test="${ reDetail.subject.subType eq 2 }"> selected</c:if> >온라인 강의</option>
	                      </select>
                    	</div>
                    </div>
                <div class="form-group row">
                    <label class="control-label col-md-2">강의실</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text" value="${reDetail.subject.subClass}" id="subClass" name="subClass">
	                  </div>
	                  <label class="control-label col-md-1">시간</label>
	                  <div class="col-md-1" style="padding: 0px">
	                  <select class="form-control col-md-12" id="day" name="day">
	                  	<option value="월" <c:if test="${ fn:substring(reDetail.subject.subTime,0,1) eq '월' }"> selected</c:if> >월</option>
	                  	<option value="화" <c:if test="${ fn:substring(reDetail.subject.subTime,0,1) eq '화' }"> selected</c:if> >화</option>
	                  	<option value="수" <c:if test="${ fn:substring(reDetail.subject.subTime,0,1) eq '수' }"> selected</c:if> >수</option>
	                  	<option value="목" <c:if test="${ fn:substring(reDetail.subject.subTime,0,1) eq '목' }"> selected</c:if> >목</option>
	                  	<option value="금" <c:if test="${ fn:substring(reDetail.subject.subTime,0,1) eq '금' }"> selected</c:if> >금</option>
	                  </select>
                    	</div>
                    	<div class="col-md-2" style="padding-left: 15px; padding-right: 0px">
	                  <select class="form-control col-md-12" id="start" name="start">
	                  	<option value="1" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 1 }"> selected</c:if> >1교시</option>
	                  	<option value="2" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 2 }"> selected</c:if> >2교시</option>
	                  	<option value="3" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 3 }"> selected</c:if> >3교시</option>
	                  	<option value="4" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 4 }"> selected</c:if> >4교시</option>
	                  	<option value="5" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 5 }"> selected</c:if> >5교시</option>
	                  	<option value="6" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 6 }"> selected</c:if> >6교시</option>
	                  	<option value="7" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 7 }"> selected</c:if> >7교시</option>
	                  	<option value="8" <c:if test="${ fn:substring(reDetail.subject.subTime,1,2) eq 8 }"> selected</c:if> >8교시</option>
	                  </select>
                    	</div>
						<c:if test="${fn:length(reDetail.subject.subTime)<=3 }">
							<div class="col-md-2" style="padding-left: 15px; padding-right: 0px">
	                  	<select class="form-control col-md-12" id="end" name="end">
	                  	<option value="1" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 1 }"> selected</c:if> >1교시</option>
	                  	<option value="2" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 2 }"> selected</c:if> >2교시</option>
	                  	<option value="3" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 3 }"> selected</c:if> >3교시</option>
	                  	<option value="4" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 4 }"> selected</c:if> >4교시</option>
	                  	<option value="5" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 5 }"> selected</c:if> >5교시</option>
	                  	<option value="6" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 6 }"> selected</c:if> >6교시</option>
	                  	<option value="7" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 7 }"> selected</c:if> >7교시</option>
	                  	<option value="8" <c:if test="${ fn:substring(reDetail.subject.subTime,2,3) eq 8 }"> selected</c:if> >8교시</option>
	                  </select>
                    	</div>
						</c:if>
						<c:if test="${fn:length(reDetail.subject.subTime)>3 }">
							<div class="col-md-2" style="padding-left: 15px; padding-right: 0px">
	                  	<select class="form-control col-md-12" id="end" name="end">
	                  	<c:forEach var="i" begin="3" end="11">
	                  	<c:if test="${fn:length(reDetail.subject.subTime) eq i+1 }">
	                  	<option value="1" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 1 }"> selected</c:if> >1교시</option>
	                  	<option value="2" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 2 }"> selected</c:if> >2교시</option>
	                  	<option value="3" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 3 }"> selected</c:if> >3교시</option>
	                  	<option value="4" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 4 }"> selected</c:if> >4교시</option>
	                  	<option value="5" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 5 }"> selected</c:if> >5교시</option>
	                  	<option value="6" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 6 }"> selected</c:if> >6교시</option>
	                  	<option value="7" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 7 }"> selected</c:if> >7교시</option>
	                  	<option value="8" <c:if test="${ fn:substring(reDetail.subject.subTime,i,i+1) eq 8 }"> selected</c:if> >8교시</option>
	                  	</c:if>
	                  	</c:forEach>
	                  	
	                  </select>
                    	</div>
						</c:if>
                    </div>
                <div class="form-group row">
                  <label class="control-label col-md-2">강의 계획서</label>
                  <div class="col-md-8">
                    <input class="form-control" type="file" id="upfile" name="reUploadFile">
                     <c:if test="${!empty reDetail.subject.originName}">
	                                         <div style="margin-top: 10px" class="attch">현재 파일 : ${ reDetail.subject.originName } </div>
	                            <input type="hidden" name="changeName" value="${ reDetail.subject.changeName }">
	                            <input type="hidden" name="originName" value="${ reDetail.subject.originName }">
                            </c:if>
                            <c:if test="${empty reDetail.subject.originName}">
	                                         <div style="margin-top: 10px" class="attch"></div>
                            </c:if>
                  </div>
                  <div ><a class="btn btn-danger" href="#" style="margin-right: 10px" id="deleteAtt"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제하기</a>
                </div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-2">강의 평점</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text" readonly value="${ reDetail.evaluation } / 5.0" id="evaluation" name="evaluation">
	                  </div>
	                  <label class="control-label col-md-2">학점</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text" value="${reDetail.subject.subCredit}" id="subCredit" name="subCredit">
                    	</div>
                   </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                <a class="btn btn-primary" href="#"  onclick="postFormSubmit(1);" ><i class="fa fa-fw fa-lg fa-check-circle"></i>저장하기</a>&nbsp;&nbsp;&nbsp;
                  <a class="btn btn-danger" href="#" onclick="postFormSubmit(2);"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제하기</a>
                </div>
              </div>
            </div>
            </div>
          </div>
        </div>
			</div>
			 </form>
	</main>
	<script>
		function postFormSubmit(num){
			var postForm = $("#updateForm");
						
			if(num == 1){
					postForm.attr("action", "updateAdmin.reg");
					postForm.submit(); 
				}else{
					postForm.attr("action", "deleteAd.reg");
					postForm.submit(); 
				}
		}
			 $("#start").on("change", function() {
					if($(this).val()>$("#end").val()){
						alert("시작교시가 끝교시보다 커서 설정할수 없습니다.");
						$(this).val("${ fn:substring(reDetail.subject.subTime,1,2)}");
						if(${fn:length(reDetail.subject.subTime)}>3){
							$("#end").val("${ fn:substring(reDetail.subject.subTime,3,4)}");
						}else{
							$("#end").val("${ fn:substring(reDetail.subject.subTime,2,3)}");
						}
					}
					})
			$("#end").on("change", function() {
					if($(this).val()<$("#start").val()){
						alert("끝교시가 시작교시보다 작아 설정할수 없습니다.");
						$("#start").val("${ fn:substring(reDetail.subject.subTime,1,2)}");
						if(${fn:length(reDetail.subject.subTime)}>3){
							$(this).val("${ fn:substring(reDetail.subject.subTime,3,4)}");
						}else{
							$(this).val("${ fn:substring(reDetail.subject.subTime,2,3)}");
						}
						}
					})
					
					
					
		 $("#deleteAtt").on("click", function() {
			var origin=$("input[name='originName']").val();
			var subCode=$("#subCode").val();
			 $.ajax({
				url:"deleteAtt.reg",
				type:"post",
				async: false, 
				data:{subCode:subCode, 
					origin:origin},
				success:function(result){
					if(result>0){
						$(".attch").text("");
					}else{
						alert("삭제할 파일이 존재하지 않습니다.")
					}
					
				},error:function(){
					console.log("수강신청 ajax 통신 실패");
				}
			});   
		});		
		</script>
</body>
</html>