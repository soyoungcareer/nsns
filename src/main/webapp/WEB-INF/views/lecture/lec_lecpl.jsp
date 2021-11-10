<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>낙성대학교 - 온라인강의</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="resources/bootstrap/docs/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/bootstrap/docs/css/styles.css" rel="stylesheet" />
<style>
 .col-md-6{
 	margin : 0 auto;
 }
 input{
 	margin-top : 20px;
 }
 h3{
 	margin-top : 60px;
 }

</style>
</head>
<body>
	<!-- Responsive navbar-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container">
			<a class="navbar-brand" href="lecMove.me">낙성대학교</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">교수용</a></li>
					<li class="nav-item"><a class="nav-link" href="#">/a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="navbarDropdown" href="#"
						role="button" data-bs-toggle="dropdown" aria-expanded="false"></a>
						<ul class="dropdown-menu dropdown-menu-end"
							aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><hr class="dropdown-divider" /></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
  <div class="col-md-6">
          <div class="tile">
            <h3 class="tile-title">강의 입력</h3>
            <div class="tile-body">
              <form class="form-horizontal" action="lecinsert.me"  method="post" enctype="multipart/form-data">
                <div class="form-group row">
                  <label class="control-label col-md-3">LECTURE_NAME</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" placeholder="LECTURE_NAME" id="name" name="name">
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-3">WEEK</label>
                  <div class="col-md-8">
                    <input class="form-control col-md-8" type="text" placeholder="WEEK" id="week" name="week">
                  </div>
                </div>
               
               <input type="hidden" id="no" name="no" value="${no }">
                 
               
                <div class="form-group row">
                  <label class="control-label col-md-3">INSERT LECTURE</label>
                  <div class="col-md-8">
                    <input class="form-control" type="file"  name="uploadFile" id="uploadFile">
                  </div>
                
                </div>
                  <button class="btn btn-primary" type="submit"><i class="fa fa-fw fa-lg fa-check-circle"></i>Insert</button>&nbsp;&nbsp;&nbsp;<a class="btn btn-secondary" href="lecMoves.me?no=${no}&id='1'"><i class="fa fa-fw fa-lg fa-times-circle"></i>Cancel</a>
              
              </form>
            </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                </div>
              </div>
            </div>
          </div>
        </div>
	

</body>
</html>
