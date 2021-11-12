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
    <title>낙성대학교</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Main CSS-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/bootstrap/docs/css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  
  <body class="app sidebar-mini">
    <c:if test="${not empty loginAdm }">
    	<jsp:include page="adminMenubar.jsp" />
    </c:if>
    <c:if test="${not empty loginPrf }">
      	<jsp:include page="noticeMenubar.jsp" />
    </c:if>
    <c:if test="${not empty loginStu }">
      	<jsp:include page="noticeMenubar.jsp" />
    </c:if>
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-bullhorn"></i> 공지사항</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <c:if test="${not empty loginStu }">
          	<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/stuinfo.st" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>   		
          </c:if>
          <c:if test="${not empty loginPrf }">
          	<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }/profMypage.pr" style="color: #222d32;margin-left: 4px"><i class="fa fa-sign-out fa-3x" aria-hidden="true"></i><div>나가기</div></a></li>   		
          </c:if>
        </ul>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead align="center">
                    <tr>
                      <th>번호</th>
                      <th>분류</th>
                      <th>제목</th>
                      <th>조회수</th>
                      <th>날짜</th>
                    </tr>
                  </thead>
                  <tbody align="center">
                  	<c:if test="${ empty list }">
                  		<tr>
                  			<td colspan=5>공지사항이 존재하지 않습니다.</td>
                  		</tr>
                  	</c:if>
                    <c:forEach items="${ list }" var="n">
	                    <tr>
	                        <td>${ n.ntcNo }</td>
	                        <td>
	                        	<c:choose>
			                    	<c:when test="${ n.ntcCategory == 91 }">
			                    		전체
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 92 }">
			                    		학사
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 93 }">
			                    		학생
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 1 }">
			                    		경제학
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 2 }">
			                    		국어국문
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 3 }">
			                    		철학
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 4 }">
			                    		호텔경영
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 5 }">
			                    		시각디자인
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 6 }">
			                    		역사학
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 7 }">
			                    		정보통신
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 8 }">
			                    		연극영화
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 99 }">
			                    		교양
			                  		</c:when>
			                  		<c:when test="${ n.ntcCategory == 100 }">
			                    		복학
			                  		</c:when>
		                    	</c:choose>
	                        </td>
	                        <td>${ n.ntcTitle }</td>
	                        <td>${ n.count }</td>
	                        <td>${ n.createDate }</td> 
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
            <br>
            <c:if test="${not empty loginAdm}">
		        <div align="right">
		        	<button class="btn btn-primary" type="button" onclick="location.href='enrollFrom.ntc'">등록하기</button>
		        </div>
	       </c:if>
          </div>
        </div>
      </div>
      
	  <div id="pagingArea">
         <ul class="pagination">
         	<c:choose>
         		<c:when test="${ pi.currentPage ne 1 }">
         			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage-1 }">Previous</a></li>
         		</c:when>
         		<c:otherwise>
         			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
         		</c:otherwise>
         	</c:choose>
         	
             <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             	<c:choose>
          		<c:when test="${ pi.currentPage ne p }">
             			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ p }">${ p }</a></li>
          		</c:when>
          		<c:otherwise>
          			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
          		</c:otherwise>
          	</c:choose>
             </c:forEach>
              
             <c:choose>
         		<c:when test="${ pi.currentPage ne pi.maxPage }">
         			<li class="page-item"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage+1 }">Next</a></li>
         		</c:when>
         		<c:otherwise>
         			<li class="page-item disabled"><a class="page-link" href="list.ntc?currentPage=${ pi.currentPage+1 }">Next</a></li>
         		</c:otherwise>
         	</c:choose>
         </ul>
      </div>      
    </main>
    
    <script>
    	$(function(){
    		$("#sampleTable tbody tr").click(function(){
    			location.href="detail.ntc?bno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>
    
    <!-- Essential javascripts for application to work-->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/main.js"></script>
    <!-- The javascript plugin to display page loading on top-->
    <script src="js/plugins/pace.min.js"></script>
    <!-- Page specific javascripts-->
    <!-- Data table plugin-->
    <script type="text/javascript" src="js/plugins/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/plugins/dataTables.bootstrap.min.js"></script>
    <script type="text/javascript">$('#sampleTable').DataTable();</script>
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