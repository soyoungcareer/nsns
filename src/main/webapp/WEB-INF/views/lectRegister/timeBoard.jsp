<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
</head>
<body>
	<jsp:include page="lectRegisterMenubar.jsp" /> 
	<!-- 추가 -->
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1><i class="fa fa-pencil fa-lg" aria-hidden="true" style="margin-right: 10px;"></i>수강신청</h1>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="${ pageContext.servletContext.contextPath }" style="color: #222d32;"><i class="fa fa-sign-out fa-2x" aria-hidden="true"></i><div>나가기</div></a></li>
			</ul>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>시간표
			</h2>
		</div>
		<div class="tile mb-4">
			<div class="page-header">
				<div class="row">
				</div>
				<div id="sampleTable_wrapper"
					class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<div class="dataTables_length" id="sampleTable_length">
								<label>이수구분 : &nbsp;&nbsp;&nbsp;<select
									name="sampleTable_length" aria-controls="sampleTable"
									class="form-control form-control-sm" style="width: 100px">
										<option value="1">수강신청</option>
										<option value="2">장바구니</option>
								</select>
								</label>
							</div>
						</div>
						<div class="col-sm-12" style="margin-top: 10px">
							<div class="table-responsive">
								<table class="table table-bordered" id="sampleTable">
									<thead>
										<tr style="width: 19%; text-align: center;">
											<th style="width: 10%"></th>
											<th style="width: 18%">월</th>
											<th style="width: 18%">화</th>
											<th style="width: 18%">수</th>
											<th style="width: 18%">목</th>
											<th style="width: 18%">금</th>
										</tr>
									</thead>
									<tbody>
										<!-- <tr style="text-align: center">
											<th style="text-align: center"><h3>1</h3><div>9-10</div></th>
											<td></td>
											<td rowspan="2" style="background-color: #ecc369">Practical
												English A2</td>
											<td rowspan="2" style="background-color: #f08676">해부생리학2</td>
											<td rowspan="2" style="background-color: #70a5e9">Practical
												English A4</td>
											<td rowspan="2" style="background-color: #75ca87">다문화가족건강</td>
										</tr> -->
						                   
											<tr>
						                    <th style="text-align: center"><h3>1</h3><div>9-10</div></th>
						                    <td class="mon1"></td>
						                    <td class="tue1"></td>
						                    <td class="wed1"></td>
						                    <td class="thur1"></td>
						                    <td class="fri1"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>2</h3><div>10-11</div></th>
						                    <td class="mon2"></td>
						                    <td class="tue2"></td>
						                    <td class="wed2"></td>
						                    <td class="thur2"></td>
						                    <td class="fri2"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>3</h3><div>11-12</div></th>
						                    <td class="mon3"></td>
						                    <td class="tue3"></td>
						                    <td class="wed3"></td>
						                    <td class="thur3"></td>
						                    <td class="fri3"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>4</h3><div>12-1</div></th>
						                    <td class="mon4"></td>
						                    <td class="tue4"></td>
						                    <td class="wed4"></td>
						                    <td class="thur4"></td>
						                    <td class="fri4"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>5</h3><div>1-2</div></th>
						                    <td class="mon5"></td>
						                    <td class="tue5"></td>
						                    <td class="wed5"></td>
						                    <td class="thur5"></td>
						                    <td class="fri5"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>6</h3><div>2-3</div></th>
						                    <td class="mon6"></td>
						                    <td class="tue6"></td>
						                    <td class="wed6"></td>
						                    <td class="thur6"></td>
						                    <td class="fri6"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>7</h3><div>3-4</div></th>
						                    <td class="mon7"></td>
						                    <td class="tue7"></td>
						                    <td class="wed7"></td>
						                    <td class="thur7"></td>
						                    <td class="fri7"></td>
											</tr>
											<tr>
						                    <th style="text-align: center"><h3>8</h3><div>4-5</div></th>
						                    <td class="mon8"></td>
						                    <td class="tue8"></td>
						                    <td class="wed8"></td>
						                    <td class="thur8"></td>
						                    <td class="fri8"></td>
											</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
<script type="text/javascript">

var list = new Array();
<c:forEach items="${ timeList }" var="time">
 list.push({t:"${time.subject.subTime}", n:"${time.subject.subTitle}", c:"${time.subject.subClass}"})
</c:forEach>
 $(function() {
	list.forEach(function(a, index) { //시간표 만들기
		for(var i=1; i<9;i++){
			if(a.t[0]=="월"&&a.t[1]==i||a.t[0]=="월"&&a.t[2]==i||a.t[0]=="월"&&a.t[3]==i){
				$(".mon"+i).text(a.n)
				$(".mon"+i).css("background-color","#F8B389");
			}
			if(a.t[0]=="화"&&a.t[1]==i||a.t[0]=="화"&&a.t[2]==i||a.t[0]=="화"&&a.t[3]==i){
				$(".tue"+i).text(a.n)
				$(".tue"+i).css("background-color","#91ACF0");
			}
			if(a.t[0]=="수"&&a.t[1]==i||a.t[0]=="수"&&a.t[2]==i||a.t[0]=="수"&&a.t[3]==i){
				$(".wed"+i).text(a.n)
				$(".wed"+i).css("background-color","pink");
			}
			if(a.t[0]=="목"&&a.t[1]==i||a.t[0]=="목"&&a.t[2]==i||a.t[0]=="목"&&a.t[3]==i){
				$(".thur"+i).text(a.n)
				$(".thur"+i).css("background-color","#93F567");
			}
			if(a.t[0]=="금"&&a.t[1]==i||a.t[0]=="금"&&a.t[2]==i||a.t[0]=="금"&&a.t[3]==i){
				$(".fri"+i).text(a.n)
				$(".fri"+i).css("background-color","#FFC745");
			}
		}
	})
})

</script>
</body>
</html>
