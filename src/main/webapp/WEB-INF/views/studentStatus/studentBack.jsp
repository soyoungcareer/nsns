<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
   
  </head>

  <body class="app sidebar-mini">
       
   	<jsp:include page="../student/studentMenubar.jsp"/>  
    
    <main class="app-content">
    
      <div class="app-title">
        <div>
         <h1><i class="fa fa-address-card-o"></i> 복학신청</h1>
        </div>
       
      </div>
      
      <div class="row">
         <div class="col-md-8">
          <div class="tile">
            <div class="tile-title-w-btn">
              <h3 class="title">${stuBack.title} </h3>
            </div>
            <div class="tile-body">
              	
               <table id="contentArea" align="center" class="table">
             
                <tr>
                    <td colspan="4"><p style="height:150px">${stuBack.content}</p></td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                        	<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${stuBack.changeName}" download="${ stuBack.originName }">${ stuBack.originName }</a>
                    </td>
                </tr>
            </table>
            </div>
          </div>
        </div>
        </div>
    </main>
    
         
    <!-- The javascript plugin to display page loading on top-->
    <script src="resources/bootstrap/docs/js/plugins/pace.min.js"></script>



  </body>
</html>