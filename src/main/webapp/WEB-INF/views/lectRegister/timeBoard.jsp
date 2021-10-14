<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
</head>
<body>
 <jsp:include page="lectRegisterMenubar.jsp"/>
	<main class="app-content">
	      <div class="app-title">
	        <div class="div">
	          <h1></h1>
	          <p></p>
	        </div>
	        <ul class="app-breadcrumb breadcrumb">
	          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
	          <li class="breadcrumb-item"><a href="#">나가기</a></li>
	        </ul>
	      </div>
	      <!-- Buttons-->
	      <div class="tile mb-4">
	        <div class="page-header">
	          <div class="row">
	            <div class="col-lg-12">
	              <h2 class="mb-3 line-head" id="buttons"> 
	              <img class="menu-bar-2" src="${ pageContext.servletContext.contextPath }/resources/images/bar.png" style="margin-right: 10px; "></img>시간표</h2>
	            </div>
	          </div>
	        </div>
	          </div>
	    </main>
</body>
</html>