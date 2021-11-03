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
    <title>낙성대학교 강의 관리</title>
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
          <h1><i class="fa fa-th-list"></i> 강의 신청 내역</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb side">
          <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
          <li class="breadcrumb-item">강의관리</li>
          <li class="breadcrumb-item active"><a href="#">강의 신청 내역</a></li>
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
                      <th>과목코드</th>
                      <th>교과목명</th>
                      <th>학과</th>
                      <th>교수</th>
                      <th>이수구분</th><!-- 전공, 교양 -->
                      <th>강의형태</th><!-- 집체/온라인 -->
                      <th>강의시간</th>                      
                      <th>학점</th>
                      <th>학년도</th>
                      <th>학기</th>
                      <th>강의실</th><!-- 강의실 지정 -->
                      <!-- <th>승인</th>변경 사항 승인(생성, 수정) -->
                      <!-- <th>강의계획서 첨부파일</th> -->
                    </tr>
                  </thead>
                  <tbody align="center">
                  	<c:if test="${ empty subAllList }">
                  		<tr>
                  			<td colspan=11>강의 변경 신청 내역이 존재하지 않습니다.</td>
                  		</tr>
                  	</c:if>
                    <c:forEach items="${ subAllList }" var="al">
	                    <tr>
	                        <td>${ al.subCode }</td>
	                        <td>${ al.subTitle }</td>
	                        <td>${ al.deptTitle }
	                        	<input type="hidden" id="deptCode" name="deptCode" value="${ al.deptCode }">
	                        </td><!-- deptCode -->	                        
	                        <td>${ al.profName }
	                        	<input type="hidden" id="profId" name="profId" value="${ al.profId }">
	                        </td><!-- profId -->
	                        <td>
	                        	<c:choose>
	                        		<c:when test="${ al.subDivs == 1 }">
	                        			전공
	                        		</c:when>
	                        		<c:otherwise>
	                        			교양
	                        		</c:otherwise>
	                        	</c:choose>	                      
	                        </td>
	                        <td>${ al.subType }</td>
	                        <td>${ al.subTime }</td>
	                        <td>${ al.subCredit }</td>
	                        <td>${ al.subYear }</td>
	                        <td>${ al.subSmst }</td>
	                        
	                        <td>${ al.subClass }
	                        	<input type="hidden" id="originName" name="originName" value="${ al.originName }">
                				<input type="hidden" id="changeName" name="changeName" value="${ al.changeName }">
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
      
      		<!-- 페이징 - div 위치 수정 -->
      		<div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="subAllList.adm?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="subAllList.adm?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="subAllList.adm?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="subAllList.adm?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            
    </main>
    <!-- detailView
    <script>
    	$(function(){
    		$("#sampleTable tbody tr").click(function(){
    			location.href="detailSub.adm?sno=" + $(this).children().eq(0).text();
    		});
    	});
    </script> -->
    
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