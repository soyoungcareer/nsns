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
          <h1><i class="fa fa-check-square-o"></i> 강의 관리</h1>
        </div>
      </div>
      <div class="row">
        <div class="col-md-12">
          <div class="tile">
            <div class="row">
              <div class="col-lg-6">
                <form id="subjectUpdateForm" action="" method="post" enctype="multipart/form-data">
                  <input type="hidden" name="reqSubNo" id="reqSubNo" value="${reqSub.reqSubNo }">
				  <input type="hidden" name="changeName" value="${ reqSub.attChange }">

                  <div class="form-group">
                    <label for="subCode">과목코드</label>
	                    <c:if test="${ !empty reqSub.subCode }">
	                    	<input class="form-control" id="subCode" name="subCode" type="text" value="${reqSub.subCode }">
	                    </c:if>
	                    <c:if test="${ empty reqSub.subCode }">
	                    	<input class="form-control" id="subCode" name="subCode" type="text" placeholder="연도 두자리+학과코드 두자리+등록순서 세자리">
	                    </c:if>
                  </div>
                  
                  <div class="form-group">
                    <label for="subTitle">교과목명</label>
                    <input class="form-control" id="subTitle" name="subTitle" type="text" value="${ reqSub.subTitle }">
                  </div>
                  
                  <div class="form-group">
                    <label for="deptTitle">학과이름</label>
                    <input class="form-control" id="deptTitle" name="deptTitle" type="text" value="${ reqSub.deptTitle }">
                    <input class="form-control" type="hidden" id="deptCode" name="deptCode" value="${ reqSub.deptCode }">
                  </div>
                  
                  <div class="form-group">
                    <label for="subDivs">이수구분</label>
                    <input class="form-control" id="subDivs" name="subDivs" type="hidden" value="${ reqSub.subDivs }">
                    <c:choose>
                    	<c:when test="${ reqSub.subDivs == 1 }">
                    		<input class="form-control" value="전공">
                  		</c:when>
                  		<c:otherwise>
                  			<input class="form-control" value="교양">
                  		</c:otherwise>
                    </c:choose>
                  </div>
                  
                  <div class="form-group">
                    <label for="profName">교수</label>
                    <input class="form-control" id="profName" name="profName" type="text" value="${ reqSub.profName }">
                    <input class="form-control" type="hidden" id="profId" name="profId" value="${ reqSub.profId }">
                  </div>
                  
                  <div class="form-group">
                    <label for="subCredit">학점</label>
                    <input class="form-control" id="subCredit" name="subCredit" type="text" value="${ reqSub.subCredit }">
                  </div>
                  
                  <div class="form-group">
                    <label for="subClass">강의실</label>
                    <input class="form-control" id="subClass" name="subClass" type="text" value="0">                    
                  </div>
                  
                  <div class="form-group">
                    <label for="subTime">강의시간</label>             
                    <input class="form-control" id="subTime" name="subTime" type="text" value="${ reqSub.subTime }">               
                  </div>
                  
                  <div class="form-group">
                    <label for="subType">강의형태</label>
                    <input class="form-control" id="subType" name="subType" type="hidden" value="${ reqSub.subType }">
                    <c:choose>
                    	<c:when test="${ reqSub.subType == 1 }">
                    		<input class="form-control" value="집체">
                  		</c:when>
                  		<c:otherwise>
                  			<input class="form-control" value="온라인">
                  		</c:otherwise>
                    </c:choose>
                  </div>
                  
                  <div class="form-group">
                    <label for="subYear">학년도</label>
                  	<input class="form-control" id="subYear" name="subYear" type="text">
                  </div>
                  <script>
                	document.getElementById('subYear').value=new Date().getFullYear().toString();
                </script>
                  
                  <div class="form-group">
                    <label for="subSmst">학기</label>
                    <select id="subSmst" name="subSmst">
                    	<option value=1>1</option>
                    	<option value=2>2</option>
                    </select>
                  </div>
                  
                  <div class="form-group">
                        <input type="hidden" name="originName" value="${ reqSub.attOrigin }">
                  		<c:if test="${ !empty reqSub.attOrigin }">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${reqSub.attChange}" download="${ reqSub.attOrigin }">${ reqSub.attOrigin }</a>				
                        </c:if>
                        <c:if test="${ empty reqSub.attOrigin }">
                        	첨부파일이 없습니다.
                        </c:if>
                  </div>
                  
                  <div align="center">
                  	<c:if test="${ reqSub.reqType == 'C' }">
                  		<button class="btn btn-primary" onclick="subModSubmit(1);">등록</button>
                  	</c:if>
                  	<c:if test="${ reqSub.reqType == 'E' }">
                  		<button class="btn btn-outline-primary" onclick="subModSubmit(2);">수정</button>
                  	</c:if>
                  	<c:if test="${ reqSub.reqType == 'D' }">
                  		<button class="btn btn-danger" onclick="subModSubmit(3);">삭제</button>
                  	</c:if>   
	              </div>
                </form>
              </div> 
            </div>
            
			<script>
				function subModSubmit(num){
					var subMod = $("#subjectUpdateForm");
					
					if(num == 1){
						subMod.attr("action", "createSub.adm");
					}else if(num == 2){
						subMod.attr("action", "modifySub.adm");
					}else{
						subMod.attr("action", "deleteSub.adm");
					}
					
					subMod.submit();
				}
			</script>
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