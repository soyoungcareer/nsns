<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<head>
<style>
@media printthis {
  #noprint { display:none; }
}
</style>
<meta charset="UTF-8">
<title>졸업증명서 출력</title> 
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/>
	<!-- 추가 -->
	<main class="app-content" >
		<div class="app-title" >
			<div class="div" >
			</div>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>졸업증명서
			</h2>
			  <c:if test = "${ !empty graduation}">
			<div class="col-6 text-right" style="padding-right: 0px"><input type="button"class="btn btn-primary" onclick="window.print();" value='Print'></input></div>
			</c:if>
			
		</div>
		<div id="printthis">
		<div class="tile mb-4" <c:if test = "${ empty graduation}"> style="height:300px " </c:if>>
			<div class="page-header">
			<h5 class="row col-sm-12 col-md-12" style="text-align: justify;">제 ${ graduation.gradNo } 회</h5>
				<div class="row">
					<div class="col-lg-12" style="float: none; margin:0 auto;">
						<div class="row d-print-none mt-2">
						<!--  <a href="https://blog.naver.com/haskim0716n/221731707051">여기서 찾아서 작성1</a>&nbsp;&nbsp;&nbsp;
						<a href="https://m.blog.naver.com/haskim0716n/221935976433">여기서 찾아서 작성2</a>-->
              </div>
					</div>
				</div>
				<c:if test = "${ empty graduation}">
				<h2 class="bs-component" style="text-align: center; line-height: 200px"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 졸업 기준을 모두 충족하여야 졸업증명서 발급이 가능합니다.  </h2>
			</c:if>
			<div></div>
				<c:if test = "${ !empty graduation}">
				<div class="row col-sm-12 col-md-12" style="float: none; margin:0 auto;">
					<h1 style="color: #222d32; float: none; margin:0 auto; margin-top: 20px;margin-bottom: 50px;">졸&nbsp;&nbsp;&nbsp; 업&nbsp;&nbsp;&nbsp; 증&nbsp;&nbsp;&nbsp; 명&nbsp;&nbsp;&nbsp; 서</h1>
				</div>
				<div class="row col-sm-12 col-md-12" style="height: 50px">
				</div>
				<div class="form-group row">
						<div class="col-md-3 text-justify"></div>
						<h5 class="col-md-2 text-justify" style="text-align: justify;">성명&nbsp;&nbsp; : </h5>
						<div class="col-md-6">
							<h5 class="col-md-12">${ graduation.stuName}</h5>
						</div>
						<div class="col-md-2"></div>
				</div>
				<div class="form-group row">
						<div class="col-md-3 text-justify"></div>
						<h5 class="col-md-2 text-justify" style="text-align: justify;">학번&nbsp;&nbsp; : </h5>
						<div class="col-md-6">
							<h5 class="col-md-12">${ graduation.stuId}</h5>
						</div>
						<div class="col-md-2"></div>
				</div>
				<div class="form-group row">
						<div class="col-md-3 text-justify"></div>
						<h5 class="col-md-2 text-justify" style="text-align: justify;">대학&nbsp;&nbsp; : </h5>
						<div class="col-md-6">
							<h5 class="col-md-12">낙성 대학교</h5>
						</div>
						<div class="col-md-2"></div>
				</div>
				<div class="form-group row">
						<div class="col-md-3 text-justify"></div>
						<h5 class="col-md-2 text-justify" style="text-align: justify;">학과&nbsp;&nbsp; : </h5>
						<div class="col-md-6">
							<h5 class="col-md-12">${ graduation.deptTitle}학과</h5>
						</div>
						<div class="col-md-2"></div>
				</div>
				<div class="form-group row">
						<div class="col-md-3 text-justify"></div>
						<h5 class="col-md-2 text-justify" style="text-align: justify;">주민번호&nbsp;&nbsp; : </h5>
						<div class="col-md-6">
							<h5 class="col-md-12">${fn:split(graduation.ssn,'-')[1]}&nbsp; - &nbsp;* * * * * * * </h5>
						</div>
						<div class="col-md-2"></div>
				</div>
				<div class="form-group row">
						<div class="col-md-3 text-justify"></div>
						<h5 class="col-md-2 text-justify" style="text-align: justify;">졸업일자&nbsp;&nbsp; : </h5>
						<div class="col-md-6">
							<h5 class="col-md-12"><fmt:formatDate value="${graduation.gradDate}" pattern="yyyy년  MM월  dd일 "/></h5>
						</div>
						<div class="col-md-2"></div>
				</div>
				<div class="row col-sm-12 col-md-12" style="height: 30px">
				</div>
						<h2 class="bs-component" style="text-align: center; line-height: 100px">위의 사실을 증명합니다.</h2>
						
						  <c:set var="now" value="<%=new java.util.Date()%>" />
				<h5 class="bs-component"  style="text-align: center; "><fmt:formatDate value="${ now}" pattern="yyyy년  MM월  dd일 "/>
				<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/printFor.png"
								style="margin-right: 20px;"></img></h5>
				<div class="row col-sm-12 col-md-12" style="height: 30px">
				</div>
			</c:if>
			</div>
		</div>
		</div>
	</main>
	<script type="text/javascript">
	 <script>
	$("#printBu").on("click", (function() {
		let printHtml = $("#printthis").html();
		let win = window.open('','_blank',"fullscreen");
		win.document.write("<html><head></head><body>");
		win.document.write(printHtml);
		win.document.write("</body></html>");
		win.document.close();
		win.focus();
		win.print();
		win.close();
	});
	</script>

	
</body>
</html>