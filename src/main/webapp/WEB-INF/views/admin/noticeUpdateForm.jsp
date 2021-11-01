<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta name="description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <!-- Twitter meta-->
    <meta property="twitter:card" content="summary_large_image">
    <meta property="twitter:site" content="@pratikborsadiya">
    <meta property="twitter:creator" content="@pratikborsadiya">
    <!-- Open Graph Meta-->
    <meta property="og:type" content="website">
    <meta property="og:site_name" content="Vali Admin">
    <meta property="og:title" content="Vali - Free Bootstrap 4 admin theme">
    <meta property="og:url" content="http://pratikborsadiya.in/blog/vali-admin">
    <meta property="og:image" content="http://pratikborsadiya.in/blog/vali-admin/hero-social.png">
    <meta property="og:description" content="Vali is a responsive and free admin theme built with Bootstrap 4, SASS and PUG.js. It's fully customizable and modular.">
    <title>낙성대학교 공지사항</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body class="app sidebar-mini">
    <jsp:include page="adminMenubar.jsp" />
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-edit"></i> 공지사항</h1>
          
        </div>
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">공지사항</li>
          <li class="breadcrumb-item"><a href="#">공지사항 수정</a></li>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="row">
              <div class="col-lg-6">
                <form id="noticeUpdateForm" method="post" action="update.ntc" enctype="multipart/form-data">
                	<!-- <table style="width:300px">
                		<tr>
                			<td><label class="control-label">제목</label></td>
                			<td class="form-control">${ n.ntcTitle }</td>
                			<!-- <td><input class="form-control" type="text" placeholder="글자 수 제한 255Byte" value="${ n.ntcTitle }" maxlength="255" readonly></td>
                		</tr>
                		<tr>
                			<td></td>
                		</tr>
                		<tr>
                			<td></td>
                		</tr>
                		<tr>
                			<td></td>
                		</tr>
                		<tr>
                			<td>수정날짜(작성날짜 외)</td>
                		</tr>
                	</table> -->
                  <!-- form all -->
                  <input type="hidden" name="ntcNo" value="${ n.ntcNo }">
                  <div class="form-group">
	                <label class="control-label">제목</label>
	                <input class="form-control" type="text" id="ntcTitle" name="ntcTitle" placeholder="글자 수 제한 255byte" value="${ n.ntcTitle }" maxlength="255" required>
                  </div>
					<!-- 에러 시 name -->
                  <div class="form-group">
                    <label for="ntcCategory">분류</label>
                    <select class="form-control" id="ntcCategory" name="ntcCategory">
                      <option value=91>전체</option>
                      <option value=92>학사</option>
                      <option value=93>학생</option>
                      <option value=1>경제학</option>
                      <option value=2>국어국문</option>
                      <option value=3>철학</option>
                      <option value=4>호텔경영</option>
                      <option value=5>시각디자인</option>
                      <option value=6>역사학</option>
                      <option value=7>정보통신</option>
                      <option value=8>연극영화</option>
                      <option value=99>교양</option>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="ntcContent">내용</label>
                    <textarea class="form-control" id="ntcContent" name="ntcContent" rows="3" placeholder="글자수 제한 3500byte" style="resize:none">${n.ntcContent }</textarea>
                  </div>
                  
                  <div class="form-group"> 
                    
                    <input class="form-control-file" type="file" id="attachment" name="reUploadFile" aria-describedby="fileHelp">
                            <c:if test="${ !empty n.originName }">
	                                                               현재 파일 : ${ n.originName } <br>
	                            <input type="hidden" name="changeName" value="${ n.changeName }">
	                            <input type="hidden" name="originName" value="${ n.originName }">
                            </c:if>
                            
                  </div>
                  
                  <div class="tile-footer">
		            <!-- admin button -->
		              <button class="btn btn-primary" type="submit">수정하기</button>
		              <button type="button" class="btn btn-secondary" onclick="javascript:history.go(-1);">취소하기</button>
		            </div>
                  
                </form>
              </div>
              
            </div>
            
          </div>
        </div>
      </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Google analytics script-->
    <script type="text/javascript">
      if(document.location.hostname == 'pratikborsadiya.in') {
      	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      	})(window,document,'script','//www.google-analytics.com/analytics.js','ga');
      	ga('create', 'UA-72504830-1', 'auto');
      	ga('send', 'pageview');
      }
    </script>
  </body>
</html>