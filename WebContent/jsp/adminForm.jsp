<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>관리자 회원관리페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/custom-styles.css">
<!--Table-->
<!--    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">-->

<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<!-- <script src="//code.jquery.com/jquery-1.11.1.min.js"></script> -->

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]-->

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<!-- <script src="http://code.jquery.com/jquery-1.8.3.min.js"></script> -->
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.3.1.min.js" -->
<!-- 	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" -->
<!-- 	crossorigin="anonymous"></script> -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- table
================================================== -->
<script>
function getList() {
	$.ajax({
		type : 'get',
		url : 'selectAllMember.do',
		data : {'page' : $('#page').val()},
		dataType : 'json',
		success : function(data) {
			$('#tbody').html('');
			$('#memberPaging').html('');
			var count = 1;
			$.each(data.member.memberList, function(i, member) {
				$('#tbody').append("<tr>"
									+ "<td><input type='checkbox' class='checkthis'></td>"
									+ "<td>" + count + "</td>"
									+ "<td>" + member.id + "</td>"
									+ "<td>" + member.name + "</td>"
									+ "<td>" + member.phone + "</td>"
									+ "<td>" + member.addr + "</td>"
									+ "<td>" + member.email + "</td>"
									+ "<td>" + member.nickname + "</td>"
									+ "<td>" + member.birth + "</td>"
									+ "<td>" + member.isCheck + "</td>"
									+ "<td>" + member.joinDate + "</td>"
									+ "<td>" + member.state + "</td>"
									+ "</tr>");
				count++;
			});
			var htmlStr = '';
			htmlStr += '<ul>';
				if(data.member.start != 1) {
					htmlStr += '<li><a href="javascript:goPage(1);">처음</a>'
								+ '<a href="javascript:goPage('+ (data.member.start - 10) +');">이전</a></li>';
				}
				for(i = data.member.start; i <= data.member.end; i++) {
					if(i == data.member.current) {
						htmlStr += '<li class="active"><a>' + i + '</a></li>';
					} else if(i != data.member.current && i <= data.member.last) {
						htmlStr += '<li><a href="javascript:goPage('+ i +');">' + i + '</a></li>';
					}
				}
				if((data.member.end) < (data.member.last)) {
					htmlStr += '<li><a href="javascript:goPage('+ (data.member.end + 1) +');">다음</a>'
					+ '<a href="javascript:goPage('+ data.member.last +');">끝</a></li>';
				}
			htmlStr += '</ul>'
			$('#memberPaging').append(htmlStr);
		},
		error : function(status, error) {
			alert("조회 실패");
		}
	});
}

function goPage(pageNum) {
	$('#page').val(pageNum);
	getList();
}

	$(document).ready(function() {
		$("#artistList").hide();
		
		$("#manage").click(function() {
			$("#memberList").show();
			$("#artistList").hide();
		});
		$("#approval").click(function() {
			$("#artistList").show();
			$("#memberList").hide();
		});
		
		$("#mytable #checkall").click(function() {
			if ($("#mytable #checkall").is(':checked')) {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", true);
				});

			} else {
				$("#mytable input[type=checkbox]").each(function() {
					$(this).prop("checked", false);
				});
			}
		});

		$("[data-toggle=tooltip]").tooltip();
	});
</script>
<!-- table end-->
</head>
<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!-- 	header section -->
		<%@include file="header.jsp"%>

		<div class="row">

			<div class="span12">
				<h2 class="title-bg">회원관리 페이지</h2>
			</div>


			<!-- Table Items ================================================== -->
			<div class="span12">

				<ul id="filterOptions" class="gallery-cats clearfix; pull-right">
					<li class="active"><a href="#" class="all" id="manage">회원 관리 페이지</a></li>
					<li><a href="#" class="design" id="approval">아티스트 승인 페이지</a></li>
				</ul>

				<div class="row the-grid" id="memberList">
					<div class="span12 contact">
						<!--Begin page content column-->
						<div class="container">
							<!--                             <div class="row the-grid">-->
							<div class="col-md-12">
								<h3>전체 회원목록</h3>
								<div class="table-responsive">

									<form class="form-inline">
										<div class="input-prepend">
											<span class="add-on"><i class="icon-th-list"></i></span> 
											<select
												class="form-control; span2" id="select" name="find">
												<option selected="" id="type">검색조건선택</option>
												<option value="id">아이디</option>
												<option value="name">이름</option>
												<option value="nickname">닉네임</option>
											</select> <input class="span3" id="keyword" size="16"
												type="text">&nbsp; <label class="radio">
												<input type="radio" name="radio" value="guest"> Guest &nbsp;
											</label> 
											<label class="radio"> <input type="radio" name="radio" value="artist">
												Artist &nbsp;
											</label>
											<button type="submit" class="btn">검색</button>
											<input type="button" class="btn" onclick="goPage(1);"
												value="전체조회">
										</div>
									</form>
									<hr>


									<div class="fixed-table-container">
										<div class="fixed-table-body">
											<!-- <div class="table-responsive">-->
											<table id="mytable" class="table table-bordred table-striped">
												<button class="btn btn-danger pull-right" data-title="Edit"
													data-target="#edit">
													<span class="icon-remove-circle"></span>삭제
												</button>
												<button class="btn btn-primary pull-right" data-title="Edit"
													data-target="#edit">
													<span class="icon-ok-sign"></span>수정
												</button>

												<thead>
													<th><input type="checkbox" id="checkall" /></th>
													<th>No</th>
													<th>ID</th>
													<th>이름</th>
													<th>연락처</th>
													<th>주소</th>
													<th>이메일</th>
													<th>닉네임</th>
													<th>생년월일</th>
													<th>아티스트/사용자</th>
													<th>가입날짜</th>
													<th>이용권한</th>
													<!-- 													<th>Edit</th> -->
													<!-- 													<th>Delete</th> -->
												</thead>
												<tbody id="tbody">
													<!-- 													<tr> -->
													<!-- 														<td><input type="checkbox" class="checkthis" /></td> -->
													<!-- 														<td>1</td> -->
													<!-- 														<td>Mohsin</td> -->
													<!-- 														<td>Irshad</td> -->
													<!-- 														<td>Mohsin</td> -->
													<!-- 														<td>010-0000-0000</td> -->
													<!-- 														<td scope="col" width="250">서울시 서울구 서울동 111-11 서울아파트 -->
													<!-- 															A동 1201호</td> -->
													<!-- 														<td>isometric.mohsin@gmail.com</td> -->
													<!-- 														<td>1999-03-01</td> -->
													<!-- 														<td>Y</td> -->
													<!-- 														<td> -->
													<!-- 															<p data-placement="top" data-toggle="tooltip" -->
													<!-- 																title="Edit"> -->
													<!-- 																<button class="btn btn-primary btn-xs" data-title="Edit" -->
													<!-- 																	data-toggle="modal" data-target="#edit"> -->
													<!-- 																	<span class="icon-pencil"></span> -->
													<!-- 																</button> -->
													<!-- 															</p> -->
													<!-- 														</td> -->
													<!-- 														<td> -->
													<!-- 															<p data-placement="top" data-toggle="tooltip" -->
													<!-- 																title="Delete"> -->
													<!-- 																<button class="btn btn-danger btn-xs" -->
													<!-- 																	data-title="Delete" data-toggle="modal" -->
													<!-- 																	data-target="#delete"> -->
													<!-- 																	<span class="icon-trash"></span> -->
													<!-- 																</button> -->
													<!-- 															</p> -->
													<!-- 														</td> -->
													<!-- 													</tr> -->
												</tbody>
											</table>
											<!--                                    </div>-->
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="modal fade" id="edit" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">Edit
											Your Detail</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<input class="form-control " type="text" placeholder="Mohsin">
										</div>
										<div class="form-group">

											<input class="form-control " type="text" placeholder="Irshad">
										</div>
										<div class="form-group">
											<textarea rows="2" class="form-control"
												placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


										</div>
									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-warning btn-lg"
											style="width: 100%;">
											<span class="glyphicon glyphicon-ok-sign"></span> Update
										</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>


						<div class="modal fade" id="delete" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="icon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">삭제 경고창</h4>
									</div>
									<div class="modal-body">

										<div class="alert alert-danger">
											<span class="icon-warning-sign"></span>해당 회원을 삭제하시겠습니까?
										</div>

									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-success">
											<span class="icon-ok"></span> Yes
										</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">
											<span class="icon-remove"></span> No
										</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>


						<!-- Pagination -->
						<div class="pagination" id="memberPaging">
							<!-- 							<ul> -->
							<%-- 								<c:if test="${start != 1 }"> --%>
							<!-- 									<li> -->
							<!-- 										<a href="#">[처음]</a> -->
							<!-- 										<a href="#">[이전]</a> -->
							<!-- 									</li> -->
							<%-- 								</c:if> --%>
							<%-- 								<c:forEach begin="${start }" end="${end }" var="i"> --%>
							<%-- 									<c:choose> --%>
							<%-- 										<c:when test="${i == current }"> --%>
							<!-- 											<li> -->
							<%-- 												[${i }] --%>
							<!-- 											</li> -->
							<%-- 										</c:when> --%>
							<%-- 										<c:when test="${i != current && i <= last }"> --%>
							<!-- 											<li> -->
							<%-- 												<a href="#">[${i }]</a> --%>
							<!-- 											</li> -->
							<%-- 										</c:when> --%>
							<%-- 									</c:choose> --%>
							<%-- 								</c:forEach> --%>
							<%-- 								<c:if test="${end < last }"> --%>
							<!-- 									<li> -->
							<!-- 										<a href="#">[다음]</a> -->
							<!-- 										<a href="#">[끝]</a> -->
							<!-- 									</li> -->
							<%-- 								</c:if> --%>
							<!-- 							</ul> -->
						</div>
						<!-- End gallery list-->

					</div>
					<!-- End Container -->


				</div>
				<!--End page content column-->

				<div class="row the-grid" id="artistList">
					<div class="span12 contact">
						Begin page content column
						<div class="container">
							<!--                             <div class="row the-grid"> -->
							<div class="col-md-12">
								<h3>아티스트 목록</h3>
								<div class="table-responsive">

									<form class="form-inline">
										<div class="input-prepend">
											<span class="add-on"><i class="icon-th-list"></i></span> <select
												class="form-control; span2" id="select" name="find">
												<option selected="">검색조건선택</option>
												<option value="id">아이디</option>
												<option value="name">이름</option>
												<option value="nickname">닉네임</option>

											</select> <input class="span3" id="appendedInputButtons" size="16"
												type="text">
											<button type="submit" class="btn">검색</button>
											<button type="submit" class="btn">전체조회</button>
										</div>
									</form>
									<hr>


									<div class="fixed-table-container">
										<div class="fixed-table-body">
											<div class="table-responsive">
												<table id="mytable"
													class="table table-bordred table-striped">
													<button class="btn btn-danger pull-right" data-title="Edit"
														data-target="#edit">
														<span class="icon-remove-circle"></span>거절
													</button>
													<button class="btn btn-primary pull-right"
														data-title="Edit" data-target="#edit">
														<span class="icon-ok-sign"></span>승인
													</button>

													<thead>
														<th><input type="checkbox" id="checkall" /></th>
														<th>No</th>
														<th>ID</th>
														<th>이름</th>
														<th>닉네임</th>
														<th>연락처</th>
														<th>주소</th>
														<th>이메일</th>
														<th>생년월일</th>
													</thead>
													<tbody>

														<tr>
															<td><input type="checkbox" class="checkthis" /></td>
															<td>1</td>
															<td>Mohsin</td>
															<td>Irshad</td>
															<td>Mohsin</td>
															<td>010-0000-0000</td>
															<td scope="col" width="250">서울시 서울구 서울동 111-11 서울아파트
																A동 1201호</td>
															<td>isometric.mohsin@gmail.com</td>
															<td>1999-03-01</td>
														</tr>

														<tr>
															<td><input type="checkbox" class="checkthis" /></td>
															<td>1</td>
															<td>Mohsin</td>
															<td>Irshad</td>
															<td>Mohsin</td>
															<td>010-0000-0000</td>
															<td scope="col" width="250">서울시 서울구 서울동 111-11 서울아파트
																A동 1201호</td>
															<td>isometric.mohsin@gmail.com</td>
															<td>1999-03-01</td>
														</tr>


														<tr>
															<td><input type="checkbox" class="checkthis" /></td>
															<td>1</td>
															<td>Mohsin</td>
															<td>Irshad</td>
															<td>Mohsin</td>
															<td>010-0000-0000</td>
															<td scope="col" width="250">서울시 서울구 서울동 111-11 서울아파트
																A동 1201호</td>
															<td>isometric.mohsin@gmail.com</td>
															<td>1999-03-01</td>
														</tr>



														<tr>
															<td><input type="checkbox" class="checkthis" /></td>
															<td>1</td>
															<td>Mohsin</td>
															<td>Irshad</td>
															<td>Mohsin</td>
															<td>010-0000-0000</td>
															<td scope="col" width="250">서울시 서울구 서울동 111-11 서울아파트
																A동 1201호</td>
															<td>isometric.mohsin@gmail.com</td>
															<td>1999-03-01</td>
														</tr>


														<tr>
															<td><input type="checkbox" class="checkthis" /></td>
															<td>1</td>
															<td>Mohsin</td>
															<td>Irshad</td>
															<td>Mohsin</td>
															<td>010-0000-0000</td>
															<td scope="col" width="250">서울시 서울구 서울동 111-11 서울아파트
																A동 1201호</td>
															<td>isometric.mohsin@gmail.com</td>
															<td>1999-03-01</td>
														</tr>

													</tbody>

												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="modal fade" id="edit" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">Edit
											Your Detail</h4>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<input class="form-control " type="text" placeholder="Mohsin">
										</div>
										<div class="form-group">

											<input class="form-control " type="text" placeholder="Irshad">
										</div>
										<div class="form-group">
											<textarea rows="2" class="form-control"
												placeholder="CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan"></textarea>


										</div>
									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-warning btn-lg"
											style="width: 100%;">
											<span class="glyphicon glyphicon-ok-sign"></span> Update
										</button>
									</div>
								</div>
								/.modal-content
							</div>
							/.modal-dialog
						</div>


						<div class="modal fade" id="delete" tabindex="-1" role="dialog"
							aria-labelledby="edit" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">
											<span class="icon-remove" aria-hidden="true"></span>
										</button>
										<h4 class="modal-title custom_align" id="Heading">삭제 경고창</h4>
									</div>
									<div class="modal-body">

										<div class="alert alert-danger">
											<span class="icon-warning-sign"></span>해당 회원을 삭제하시겠습니까?
										</div>

									</div>
									<div class="modal-footer ">
										<button type="button" class="btn btn-success">
											<span class="icon-ok"></span> Yes
										</button>
										<button type="button" class="btn btn-default"
											data-dismiss="modal">
											<span class="icon-remove"></span> No
										</button>
									</div>
								</div>
								/.modal-content
							</div>
							/.modal-dialog
						</div>


						Pagination
						<div class="pagination">
							<ul>
								<li class="active"><a href="#">Prev</a></li>
								<li class="active"><a href="#">1</a></li>
								<li><a href="#">2</a></li>
								<li><a href="#">3</a></li>
								<li><a href="#">4</a></li>
								<li><a href="#">Next</a></li>
							</ul>
						</div>
						End gallery list

					</div>
					End Container


				</div>
				End page content column
			</div>
			<!-- End container row -->

		</div>
		<!-- End Container -->

		<!-- 	Footer section -->
		<%@include file="footer.jsp"%>

		<form>
			<input type="hidden" id="page" value="1">
		</form>
</body>
</html>