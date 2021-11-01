<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
<title>자격증</title>
</head>
<body>
	<jsp:include page="../student/studentMenubar.jsp"/>
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1></h1>
				<p></p>
			</div>
		</div>
		<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>자격증
			</h2>
		</div>
		<div class="tile mb-4">
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
							<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
											<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#certifi"
											style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"
											></i>추 가</button>
									</div>
								</div>

								<div class="col-sm-12" style="margin-top: 10px">
									<div class="table-responsive">
										<table class="table table-hover table-bordered"
											id="cerTable">
											<thead>
												<tr style="background: #222d32; color: white;">
													<th>번호</th>
													<th>자격증 구분</th>
													<th>자격증명</th>
													<th>시행처</th>
													<th style="width: 25%">취득일자</th>
													<th>비고</th>
												</tr>
											</thead>
											<tbody>
											<c:if test="${ empty certificate }">
											<tr >
											<td colspan="6">
											<h2 class="bs-component" style="text-align: center; line-height: 100px"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 해당 자료가 없습니다. 입력해주세요 </h2>
											<script type="text/javascript">
												$("#cerTable").removeClass("table-hover");
											</script>
											</td>
												</tr>
											</c:if>
											<c:if test="${ !empty certificate }">
											
											<c:forEach items="${ certificate }" var="cer" varStatus="nu">
												<tr>
													<td>${ nu.index+1 } <input class="cerNo" type="hidden" value="${ cer.cerNo }"/></td>
													<td>${ cer.category }</td>
													<td>${ cer.title }</td>
													<td>${ cer.agency }</td>
													<td><fmt:formatDate value="${cer.getDate }" pattern="yyyy년  MM월  dd일 "/></td>
													<th style="padding: 0px; width: 160px"><button class="btn btn-secondary btn-sm" type="button"
												style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>수 정</button>
												<button class="btn btn-danger btn-sm" type="button"
												style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>삭 제</button></th>
												
												</tr>
											
											</c:forEach>
											</c:if>
												<!-- <tr>
													<td style="padding: 0px;">
								                      <select class="form-control" id="exampleSelect1" style="border: none;">
									                      <option>자격증</option>
									                      <option>어학시험</option>
								                      </select>
							                    	</td>
													<td>토익</td>
													<td>YBM</td>
													<td  style="padding: 0px;"> <input class="form-control" id="demoDate" type="date" placeholder="Select Date" style="border: none;"></td>
													<td style="padding: 0px;"><button class="btn btn-danger" type="button"
												style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>수정하기</button></td>
												</tr> -->
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
			<div class="app-title" style="background: none; box-shadow: none; height: 76px; margin-bottom: 0px; margin-top: 30px">
			<h2 class="" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>봉사활동
			</h2>
		</div>
		<div class="tile mb-4" >
						<div id="sampleTable_wrapper"
							class="dataTables_wrapper container-fluid dt-bootstrap4 no-footer">
							<div class="row">
							<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
									</div>
								</div>
								<div class="col-sm-12 col-md-6">
									<div id="sampleTable_filter" class="dataTables_filter">
											<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#volunt"
											style="margin-left: 10px;"><i class="fa fa-plus-circle" ></i>추 가</button>
									</div>
								</div>
								<div class="col-sm-12" style="margin-top: 10px">
									<div class="table-responsive">
										<table class="table table-hover table-bordered"
											id="volTable" >
											<thead>
												<tr style="background: #222d32; color: white;">
													<th>번호</th>
													<th>봉사활동명</th>
													<th>봉사기간</th>
													<th>봉사시간</th>
													<th>파일첨부</th>
													<th>비고</th>
												</tr>
											</thead>
											<tbody>

												<c:if test="${ empty volunteer }">
											<tr >
											<td colspan="6">
											<h2 class="bs-component" style="text-align: center; line-height: 100px"><i class="fa fa-exclamation-triangle" aria-hidden="true"></i> 해당 자료가 없습니다. 입력해주세요 </h2>
											<script type="text/javascript">
												$("#volTable").removeClass("table-hover");
											</script>
											</td>
												</tr>
											</c:if>
											<c:if test="${ !empty volunteer }">
												<c:forEach items="${ volunteer }" var="ver" varStatus="num">
												<tr>
													<td>${ num.index+1 } <input class="volNo" type="hidden" value="${ ver.volNo }"></td>
													<td>${ ver.volTitle }<input class="change" type="hidden" value="${ ver.changeName }"></td>
													<td><fmt:formatDate value="${ver.startDate }" pattern="yyyy년   MM월   dd일 "/> 
													 ~   <fmt:formatDate value="${ver.endDate }" pattern="yyyy년  MM월  dd일 "/></td>
													<td>총  ${ ver.volTime } 시간</td>
													<td>
													<c:if test="${ !empty ver.originName }">
													<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/${ ver.changeName }" 
													download=${ ver.originName }>${ ver.originName }</a>
													</c:if>
													</td>
													<th style="padding: 0px; width: 160px"><button class="btn btn-secondary btn-sm" type="button"
												style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>수 정</button>
												<button class="btn btn-danger btn-sm" type="button"
												style="margin-left: 10px;"><i class="fa fa-plus-circle" aria-hidden="true"></i>삭 제</button></th>
												
												</tr>
											</c:forEach>
											</c:if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					
	</main>
	<div class="modal fade" id="certifi">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table; margin-top:100px">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>자격증 추가
					</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="cerAdd.cer" method="post">
					<!-- Modal Body -->
					<div class="modal-body">

						<div class="form-group row">
							<label class="control-label col-md-2">자격증 <div>구분</div></label>
							<div class="col-md-4">
								<select class="form-control" name="category" id="category">
								<option value="자격증">자격증</option>
		                       <option value="어학점수">어학점수</option>
		                       </select>
							</div>
							<label class="control-label col-md-2">자격증명</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="text" value="" name="title" id="title">
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">시행처</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="text" value="" name="agency" id="agency">
							</div>
							<label class="control-label col-md-2">취득일자</label>
							<div class="col-md-4">
							<input class="form-control col-md-12" type="date" value="" name="day" id="day">
							</div>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" >저장</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="certifiUpdate">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table; margin-top:100px">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>자격증 수정
					</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="cerUpd.cer" method="post">
					<!-- Modal Body -->
					<div class="modal-body cerUpModal">
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" >저장</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="volUpdate">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table;">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>봉사활동 수정
					</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="volUpd.cer" method="post"  enctype="multipart/form-data">
					<!-- Modal Body -->
					<div class="modal-body volUpModal">
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" >저장</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="volunt">
		<div class="modal-dialog " style="max-width: 100%; width: auto; display: table; margin-top:50px">
			<div class="modal-content">
				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title" id="buttons">
						<img class="menu-bar-2"
							src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
							style="margin-right: 10px;"></img>봉사활동 추가
					</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<form action="volAdd.cer" method="post" enctype="multipart/form-data">
					<!-- Modal Body -->
					<div class="modal-body">

						<div class="form-group row">
							<label class="control-label col-md-2">봉사명</label>
							<div class="col-md-10">
							<input class="form-control col-md-12" type="text" value="" name="volTitle" id="volTitle">
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">시작일</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="date" value="" name="sDay" id="sDay">
							</div>
							<label class="control-label col-md-2">마감일</label>
							<div class="col-md-4">
								<input class="form-control col-md-12" type="date" value="" name="eDay" id="eDay">
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">봉사시간</label>
							<div class="col-md-10">
								<input class="form-control col-md-12" type="text" value="" name="volTime" id="volTime" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
							</div>
						</div>
						<div class="form-group row">
							<label class="control-label col-md-2">파일 첨부</label>
							<div class="col-md-10">
								<input class="form-control" type="file" id="file" name="uploadFile"> 
							</div>
						</div>
					</div>
					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" >저장</button>
						<button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$("#cerTable tbody tr th button:nth-last-child(1)").click(function() { //자격증 삭제
		var cerNo = $(this).parent().parent().children().eq(0).children().val();//자격증 번호
		location.href="cerDel.cer?cerNo="+cerNo;
	});
	$("#volTable tbody tr th button:nth-last-child(1)").click(function() { //봉사활동 삭제
		var volNo = $(this).parent().parent().children().eq(0).children().val();//봉사활동 번호
		var ch = $(this).parent().parent().children().eq(1).children().val();//봉사활동 번호
		location.href="volDel.cer?volNo="+volNo+"&ch="+ch;
	});
	$("#cerTable tbody tr th button:nth-last-child(2)").click(function() { //자격증 수정
		var cerNo = $(this).parent().parent().children().eq(0).children().val();//자격증 번호
		 $.ajax({
			url:"cerUpdate.ce",
			type:"post",
			data:{cerNo:cerNo},
			success:function(cer){
					$(".cerUpModal").html("");
					$("#certifiUpdate").modal('show');
					var value="";
					value +='<div class="form-group row">' +
					'<label class="control-label col-md-2">자격증 <div>구분</div></label>'+
					'<div class="col-md-4">' 
						if(cer.category=="자격증" ){
							value+='<select class="form-control" name="category" id="category">'+
									'<option value="자격증" selected >자격증</option>'+
		                     	 	'<option value="어학점수">어학점수</option>'+
									'</select>'
						}else{
							value+='<select class="form-control" name="category" id="category">'+
									'<option value="자격증" >자격증</option>'+
					                 '<option value="어학점수" selected >어학점수</option>'+
									'</select>'
						}
						value+= '</div>'+ 
					'<label class="control-label col-md-2">자격증명</label>'+
					'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" value="'+cer.title+'" name="title" id="title">'+
						'<input class="form-control col-md-12"  name="cerNo" id="cerNo" type="hidden" value="'+ cer.cerNo +'"/>'+
					'</div>'+ 
				'</div>'+
				'<div class="form-group row">'+
					'<label class="control-label col-md-2">시행처</label>'+
					'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="text" value="'+cer.agency+'" name="agency" id="agency">'+
					'</div>'+
					'<label class="control-label col-md-2">취득일자</label>'+
					'<div class="col-md-4">'+
					'<input class="form-control col-md-12" type="date" value="'+cer.getDate+'" name="uday" id="uday">'+
					'</div>'+
				'</div>' 
					$(".cerUpModal").html(value);
			},error:function(){
				console.log("자격증 수정 페이지 로딩 ajax 통신 실패");
			}
		});
	});
	$("#volTable tbody tr th button:nth-last-child(2)").click(function() { //봉사활동 수정
		var volNo = $(this).parent().parent().children().eq(0).children().val();//봉사활동 번호
		 $.ajax({
			url:"volUpdate.ce",
			type:"post",
			data:{volNo:volNo},
			success:function(vol){
					$(".volUpModal").html("");
					$("#volUpdate").modal('show');
					var value="";
					value += '<div class="form-group row">'+
					'<label class="control-label col-md-2">봉사명</label>'+
					'<div class="col-md-10">'+
					'<input class="form-control col-md-12" type="text" value="'+vol.volTitle+'" name="volTitle" id="volTitle">'+
					'<input class="" name="volNo" id="volNo" type="hidden"  value="'+vol.volNo+'">'+
					'</div>'+
				'</div>'  +
				'<div class="form-group row">'+
					'<label class="control-label col-md-2">시작일</label>'+
					'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="date" value="'+vol.startDate+'" name="sDay" id="sDay">'+
					'</div>'+
					'<label class="control-label col-md-2">마감일</label>'+
					'<div class="col-md-4">'+
						'<input class="form-control col-md-12" type="date" value="'+vol.endDate+'" name="eDay" id="eDay">'+
					'</div>'+
				'</div>'+
				'<div class="form-group row">'+
					'<label class="control-label col-md-2">봉사시간</label>'+
					'<div class="col-md-10">'+
						'<input class="form-control col-md-12" type="text" value="'+vol.volTime+'" name="volTime" id="volTime" >'+
					'</div>'+
				'</div>'+
				'<div class="form-group row">'+
					'<label class="control-label col-md-2">파일 첨부</label>'+
					'<div class="col-md-10">'+
						'<input class="form-control" type="file" id="file" name="uploadFile">'+
						'</div>'+
						'</div>'+
						'<div class="form-group row">'+
						'<label class="control-label col-md-2">현재 파일</label>'+
						'<div class="col-md-10">'
						 if(vol.originName!=""&&typeof vol.originName != "undefined"){
								value += '<a href="${ pageContext.servletContext.contextPath }/resources/upload_files/'+vol.changeName+'"'+
				                        												'download='+vol.originName+'>'+vol.originName+'</a>'+
				                        												'<input class="form-control col-md-12" name="changeName" id="changeName" type="hidden" value="'+vol.changeName+'">'+
				                        												'<input class="form-control col-md-12" name="originName" id="originName" type="hidden"  value="'+vol.originName+'">'
										 }else{
									value +='<input class="form-control col-md-12" type="text" disabled value="첨부파일이 없습니다." style="color:red;">'
										 } 
						 value +=	'</div>'+
							'</div>'
					$(".volUpModal").html(value);
			},error:function(){
				console.log("봉사활동 수정 페이지 로딩 ajax 통신 실패");
			}
		}); 
	});
	
	
	$(".volUpModal").on("keydown"," #volTime",function() {
		if((event.keyCode<48 || event.keyCode>57 )&& event.keyCode !== 8){
	           event.returnValue=false;
	           alert("숫자만 입력 가능합니다.");
	        }
	})
	</script>
</body>
</html>