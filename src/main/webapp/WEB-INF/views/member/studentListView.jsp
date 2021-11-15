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
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <!-- Font-icon css-->
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  
  <body class="app sidebar-mini">
    <jsp:include page="../admin/adminMenubar.jsp" />
    
    <main class="app-content">
      <div class="app-title">
        <div>
          <h1><i class="fa fa-address-card-o"></i> 학생 관리</h1>
        </div> 
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
            <div>
            	<h3 class="tile-title">학생 계정 조회</h3>
            	<br>
            </div>
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="stuListTable">
                  <thead align="center" style="background-color:#EBEAFE">
                    <tr>
                      <th>학번</th>
                      <th>이름</th>
                      <th>학과</th>
                      <th>이메일</th>
                      <th>연락처</th>
                      <th>담당교수</th>
                      <th>학적</th>
                      <th>상태</th>
                    </tr>
                  </thead>
                  <tbody align="center">
                  	<c:if test="${ empty sList }">
                  		<tr>
                  			<td colspan=8>학생 계정이 존재하지 않습니다.</td>
                  		</tr>
                  	</c:if>
                    <c:forEach items="${ sList }" var="s">
	                    <tr>
	                        <td>${ s.stuId }</td>
	                        <td>${ s.stuName }</td>
	                        <td>${ s.deptName }</td>
	                        <td>${ s.email }</td>
	                        <td>${ s.phone }</td>
	                        <td>
	                        	<input type="hidden" name="profStatus" value="${ s.profStatus }">
	                        	<c:if test="${ s.profStatus == 'Y' }">
	                        		${ s.proName }
	                        	</c:if>
	                        	<c:if test="${ s.profStatus == 'N' }">
	                        		<form id="profIdChange" method="post" action="stuUpdatePrf.adm">
			                        	<input type="hidden" name="profId" value="${ s.profId }">	                        	
			                        	<input type="hidden" name="stuId" value="${ s.stuId }">
		                        	</form>
	                        		<input type="submit" class="btn btn-outline-danger" value="없음">
	                        	</c:if>
	                        </td>
	                        <td>${ s.stuStatus }</td>
	                        <td>
	                        	<button class="btn btn-primary">삭제</button>
	                        </td>
	                    </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
      
	  <div id="pagingArea">
         <ul class="pagination">
         	<c:choose>
         		<c:when test="${ pi.currentPage ne 1 }">
         			<li class="page-item"><a class="page-link" href="stuList.adm?currentPage=${ pi.currentPage-1 }">Previous</a></li>
         		</c:when>
         		<c:otherwise>
         			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
         		</c:otherwise>
         	</c:choose>
         	
             <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             	<c:choose>
	          		<c:when test="${ pi.currentPage ne p }">
	             			<li class="page-item"><a class="page-link" href="stuList.adm?currentPage=${ p }">${ p }</a></li>
	          		</c:when>
	          		<c:otherwise>
	          			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	          		</c:otherwise>
          		</c:choose>
             </c:forEach>
             
             <c:choose>
         		<c:when test="${ pi.currentPage ne pi.maxPage }">
         			<li class="page-item"><a class="page-link" href="stuList.adm?currentPage=${ pi.currentPage+1 }">Next</a></li>
         		</c:when>
         		<c:otherwise>
         			<li class="page-item disabled"><a class="page-link" href="stuList.adm?currentPage=${ pi.currentPage+1 }">Next</a></li>
         		</c:otherwise>
         	</c:choose>
         </ul>
     </div>       
    </main>
    
    <script>
    	$(function(){
    		$("#stuListTable tbody tr button").click(function(){
    			var answer = confirm("해당 학생을 퇴학 처리하겠습니까?");
    			if(answer == true){
    				location.href="stuDelete.adm?stuId=" + $(this).parent().parent().children().eq(0).text();
    			}
    		});
    	});
    </script>
    <script>
    	$(function(){
    		$("#stuListTable tbody tr input").click(function(){
    			location.href="stuUpdatePrf.adm?stuId=" + $(this).parent().parent().children().eq(0).text();
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
    <script type="text/javascript">$('#stuListTable').DataTable();</script>
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