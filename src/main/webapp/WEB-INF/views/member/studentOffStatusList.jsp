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
          <h1><i class="fa fa-th-list"></i> 학적 변경</h1><!-- 자퇴 -->
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
            <form id="stuOnOffStaList" action="" method="post">
              <div class="table-responsive">
                <table class="table table-hover table-bordered" id="sampleTable">
                  <thead align="center" style="background-color:#EBEAFE">
                    <tr>
                      <th>학번</th>
                      <th>이름</th>
                      <th>학과</th>
                      <th>휴학사유</th>
                      <th>휴학학기</th>                      
                      <th>휴학학기 수</th>
                      <th>신청단계</th>
                      <th>승인상태</th>
                      <th>처리결과</th>
                      <th>담당교수</th>
                      <th>승인</th>
                      <th>복학</th>
                    </tr>
                  </thead>
                  <tbody align="center">
                  
                  	<c:if test="${ empty staList }">
                  		<tr>
                  			<td colspan=12>휴학 신청이 없습니다.</td>
                  		</tr>
                  	</c:if>
                    <c:forEach items="${ staList }" var="sta">
	                    <tr>                  
	                        <td>${ sta.stuId }
	                        	<input type="hidden" id="stuId" name="stuId" value="${ sta.stuId }">
	                        	<input type="hidden" id="stsNo" name="stsNo" value="${ sta.stsNo }">
	                        </td>
	                        <td>${ sta.stuName }</td>                      
	                        <td>${ sta.deptTitle }
	                        	<input type="hidden" id="deptCode" name="deptCode" value="${ sta.deptCode }">
	                        	<input type="hidden" id="deptTitle" name="deptTitle" value="${ sta.deptTitle }">
	                        	<input type="hidden" id="applicationNo" name="applicationNo" value="${ sta.applicationNo }">
	                        </td>
	                        <td>${ sta.offCategory }
	                        	<input type="hidden" id="offCategory" name="offCategory" value="${ sta.offCategory }">
	                        </td>
	                        <td>${ sta.offSem }
	                        	<input type="hidden" id="offSem" name="offSem" value="${ sta.offSem }">
	                        </td>
	                        <td>${ sta.offSemCnt }
	                        	<input type="hidden" id="offSemCnt" name="offSemCnt" value="${ sta.offSemCnt }">
	                        </td>
	                        <td>${ sta.stsCategory }
	                        	<input type="hidden" id="stsCategory" name="stsCategory" value="${ sta.stsCategory }" readonly>
	                        </td>
	                        <td>${ sta.stsProcess }
	                        	<input type="hidden" id="stsProcess" name="stsProcess" value="${ sta.stsProcess }" readonly>
	                        </td>	                        
	                        <td>${ sta.stsComplete }
	                        	<input type="hidden" id="stsComplete" name="stsComplete" value="${ sta.stsComplete }" readonly>
	                        </td>
	                        <!-- <td>${ sta.applicationNo }
	                        	<input type="hidden" id="applicationNo" name="applicationNo" value="${ sta.applicationNo }">
	                        </td> -->
	                        <td>${ sta.profName }
	                        	<input type="hidden" id="profName" name="profName" value="${ sta.profName }" readonly>
	                        	<input type="hidden" id="profId" name="profId" value="${ sta.profId }">
	                        </td>	                        
	                        <td>
	                        	<!-- <button class="btn btn-primary" type="button" onclick="location.href='stuStaUpdate.adm'">승인</button> -->
	                        	<button class="btn btn-primary" name="stuOffTerm" onclick="stuStaSubmit(1)">승인</button>
	                        </td>
	                        <td>
	                        	<button class="btn btn-secondary" name="stuOnTerm" onclick="stuStaSubmit(2)">복학</button>
	                        </td>
	                    </tr>
                    </c:forEach>
                    
                  </tbody>
                </table>
              </div>
              </form>
            </div>
          </div>
        </div>
      </div>
 
	  <div id="pagingArea">
         <ul class="pagination">
         	<c:choose>
         		<c:when test="${ pi.currentPage ne 1 }">
         			<li class="page-item"><a class="page-link" href="stuStaList.adm?currentPage=${ pi.currentPage-1 }">Previous</a></li>
         		</c:when>
         		<c:otherwise>
         			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
         		</c:otherwise>
         	</c:choose>
         	
             <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
             	<c:choose>
	          		<c:when test="${ pi.currentPage ne p }">
	             			<li class="page-item"><a class="page-link" href="stuStaList.adm?currentPage=${ p }">${ p }</a></li>
	          		</c:when>
	          		<c:otherwise>
	          			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	          		</c:otherwise>
	          	</c:choose>
             </c:forEach>
             
             <c:choose>
         		<c:when test="${ pi.currentPage ne pi.maxPage }">
         			<li class="page-item"><a class="page-link" href="stuStaList.adm?currentPage=${ pi.currentPage+1 }">Next</a></li>
         		</c:when>
         		<c:otherwise>
         			<li class="page-item disabled"><a class="page-link" href="stuStaList.adm?currentPage=${ pi.currentPage+1 }">Next</a></li>
         		</c:otherwise>
         	</c:choose>
         </ul>
      </div>             
    </main>
    <script>
    	$(function(){
    		$("#sampleTable tbody tr").click(function(){
    			location.href="stuStaUpdate.adm?stsNo=" + $(this).children().eq(0).text();
    		});
    	});
    </script>    
    <script>
		function stuStaSubmit(num){
			var stuStaUpdate = $("#stuOnOffStaList");
			
			if(num == 1){
				stuStaUpdate.attr("action", "stuOffUpdate.adm");
			}else if(num == 2){
				stuStaUpdate.attr("action", "stuOnUpdate.adm");
			}
			stuStaUpdate.submit();
		}
	</script>   
    <script>
    	var Now = new Date();
    	var nowMonth = Now.getMonth() + 1;
        var nowDay = Now.getDate();
        var nowHour = Now.getHours();
        var nowMins = Now.getMinutes();
        function changeNum(time){
            var time = time.toString();
            if(time.length < 2){
                time = '0' + time;
                return time;
	        }else{
	            return time;
	        }
        }
    	
    	nowMonth = changeNum(nowMonth);
        nowDay = changeNum(nowDay);
        nowHour = changeNum(nowHour);
        nowMins = changeNum(nowMins);
    	
    	var nowtime = nowMonth + nowDay + nowHour + nowMins;	
    	var startDateWinter = 01011200
    	var endDateWinter = 03311159
    	var startDateSummer = 07011200
    	var endDateSummer = 09311159
    	
    	if(endDateWinter < nowtime){
            $('.btn').attr('disabled', 'true');
        }else if(startDateSummer > nowTime || endDateSummer < nowTime){
        	$('.btn').attr('disabled', 'true');
        }
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