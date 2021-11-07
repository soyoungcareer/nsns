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
        
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="row">
              <div class="col-lg-6">
                <form>
                	
                  <div class="form-group">
	                <label class="ntcTitle">제목</label>
	                <input class="form-control" id="ntcTitle" name="ntcTitle" type="text" value="${ n.ntcTitle }" readonly>
                  </div>

                  <div class="form-group">
                    <label for="ntcCategory">분류</label>
                    <input class="form-control" id="ntcCategory" name="ntcCategory" type="hidden" value="${ n.ntcCategory }" readonly>
                    <c:choose>
                    	<c:when test="${ n.ntcCategory == 91 }">
                    		<input class="form-control" value="전체">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 92 }">
                    		<input class="form-control" value="학사">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 93 }">
                    		<input class="form-control" value="학생">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 1 }">
                    		<input class="form-control" value="경제학">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 2 }">
                    		<input class="form-control" value="국어국문">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 3 }">
                    		<input class="form-control" value="철학">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 4 }">
                    		<input class="form-control" value="호텔경영">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 5 }">
                    		<input class="form-control" value="시각디자인">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 6 }">
                    		<input class="form-control" value="역사학">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 7 }">
                    		<input class="form-control" value="정보통신">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 8 }">
                    		<input class="form-control" value="연극영화">
                  		</c:when>
                  		<c:when test="${ n.ntcCategory == 99 }">
                    		<input class="form-control" value="교양">
                  		</c:when>
                  		<c:otherwise>
                  			<input class="form-control" value="기타">
                  		</c:otherwise>
                  </c:choose>
                  </div>
                  <div class="form-group">
                    <label for="ntcContent">내용</label>
                    <textarea class="form-control" id="ntcContent" rows="3" style="resize:none" readonly>${n.ntcContent }</textarea>
                    <img src="${ pageContext.servletContext.contextPath }/resources/upload_files/${n.changeName}">
                  </div>
                  
                  <div class="form-group"> 
                    	
                    	
                  		<c:if test="${ !empty n.originName }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${n.changeName}" download="${ n.originName }">${ n.originName }</a>
                        					
                        </c:if>
                        <c:if test="${ empty n.originName }">
                        	첨부파일이 없습니다.
                        </c:if>
                  </div>
                  
                </form>
              </div>
              
            </div>
            
            <!-- <c:if test="${ loginUser.userId eq b.boardWriter }"> -->
	            <div align="center">
	                <button class="btn btn-primary" onclick="postFormSubmit(1);">수정하기</button>
	                <button class="btn btn-secondary" onclick="postFormSubmit(2);">삭제하기</button>
	            </div>
	            
	            <form id="postForm" action="" method="post">
					<input type="hidden" name="bno" id="bno" value="${n.ntcNo }">
					<input type="hidden" name="fileName" value="${ n.changeName }"> 
				</form>
				<script>
					function postFormSubmit(num){
						var postForm = $("#postForm");
						
						if(num == 1){
							postForm.attr("action", "updateForm.ntc");
						}else{
							postForm.attr("action", "delete.ntc");
						}
						postForm.submit();
					}
				</script>
            <!-- </c:if> -->
            
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