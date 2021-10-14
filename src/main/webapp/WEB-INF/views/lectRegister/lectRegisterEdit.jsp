<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 설명 수정 페이지</title>
</head>
<body>
<jsp:include page="lectRegisterMenubar.jsp"/>
	<main class="app-content">
		<div class="app-title">
			<div class="div">
				<h1></h1>
				<p></p>
			</div>
			<ul class="app-breadcrumb breadcrumb">
				<li class="breadcrumb-item"><a href="#">나가기</a></li>
			</ul>
		</div>
		<!-- Buttons-->
		<div class="tile mb-4">
			<div class="page-header">
				<div class="row">
					<div class="col-lg-12">
						<h2 class="mb-3 line-head" id="buttons">
							<img class="menu-bar-2"
								src="${ pageContext.servletContext.contextPath }/resources/images/bar.png"
								style="margin-right: 10px;"></img>강의 설명
						</h2>
					</div>
				</div>

				<div class="col-md-12">
          <div class="tile">
            <div class="tile-body">
              <form class="form-horizontal">
                <div class="form-group row">
	                  <label class="control-label col-md-2">교과목명</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
	                  </div>
	                  <label class="control-label col-md-2">강의코드</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
                    </div>
                </div>
                <div class="form-group row">
	                   <label class="control-label col-md-2">교수명</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
	                  </div>
	                  <label class="control-label col-md-2">이수구분</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
                    	</div>
                    </div>
                <div class="form-group row">
                    <label class="control-label col-md-2">강의실</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
	                  </div>
	                  <label class="control-label col-md-2">강의시간</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
                    	</div>
                    </div>
                <div class="form-group row">
                  <label class="control-label col-md-2">강의 설명</label>
                  <div class="col-md-10">
                    <textarea class="form-control" rows="4" placeholder=""></textarea>
                  </div>
                </div>
                <div class="form-group row">
                  <label class="control-label col-md-2">강의 계획서</label>
                  <div class="col-md-8">
                    <input class="form-control" type="file">
                  </div>
                  <div ><a class="btn btn-danger" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제하기</a></div>
                </div>
                <div class="form-group row">
                    <label class="control-label col-md-2">강의 평점</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
	                  </div>
	                  <label class="control-label col-md-2">학점</label>
	                  <div class="col-md-4">
	                    <input class="form-control col-md-12" type="text">
                    	</div>
                   </div>
                <div class="form-group row">
                  <div class="col-md-8 col-md-offset-3">
                  </div>
                </div>
              </form>
            </div>
            <div class="tile-footer">
              <div class="row">
                <div class="col-md-8 col-md-offset-3">
                <a class="btn btn-secondary" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>뒤로가기</a>&nbsp;&nbsp;&nbsp;
                  <button class="btn btn-primary" type="button"><i class="fa fa-fw fa-lg fa-check-circle"></i>저장하기</button>&nbsp;&nbsp;&nbsp;
                  <a class="btn btn-danger" href="#"><i class="fa fa-fw fa-lg fa-times-circle"></i>삭제하기</a>
                </div>
              </div>
            </div>
          </div>
        </div>
			</div>
		</div>
	</main>
</body>
</html>