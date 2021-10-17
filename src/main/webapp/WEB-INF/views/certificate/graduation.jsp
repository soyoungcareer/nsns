<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>졸업증명서 출력</title> 
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/>
	<main class="app-content" >
		<div class="app-title" >
			<div class="div" >
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="#" style="color: #222d32;"><i class="fa fa-sign-out fa-4x" aria-hidden="true"></i><div>나가기</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>졸업증명서
			</h2>
			<div class="col-6 text-right" style="padding-right: 0px"><a class="btn btn-primary" href="javascript:window.print();" target="_blank"><i class="fa fa-print"></i> Print</a></div>
		</div>
		
		<div class="tile mb-4" style="height:300px ">
			<div class="page-header">
				<div class="row">
					<div class="col-lg-12">
						<div class="row d-print-none mt-2">
						<!--  <a href="https://blog.naver.com/haskim0716n/221731707051">여기서 찾아서 작성1</a>&nbsp;&nbsp;&nbsp;
						<a href="https://m.blog.naver.com/haskim0716n/221935976433">여기서 찾아서 작성2</a>-->
              </div>
					</div>
				</div>
				<h2 class="bs-component" style="text-align: center; line-height: 200px"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 졸업 기준을 모두 충족하여야 졸업이 가능합니다.  </h2>
			</div>
		</div>
	</main>
</body>
</html>