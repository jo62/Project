<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>​
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>art 상세 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/prettyPhoto.css" />
<link rel="stylesheet" href="css/custom-styles.css">

<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/style-ie.css"/>
<![endif]--> 

<!-- Favicons
================================================== -->
<link rel="shortcut icon" href="img/favicon.ico">
<link rel="apple-touch-icon" href="img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="72x72" href="img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="114x114" href="img/apple-touch-icon-114x114.png">

<!-- JS
================================================== -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.prettyPhoto.js"></script>
<script src="js/jquery.custom.js"></script>



</head>

<body>
<form id="form" action="artPayForm.do">
	<div class="color-bar-1"></div>
    <div class="color-bar-2 color-bg"></div>
    
    <div class="container main-container">
    		<!--     Header section -->
		<%@include file="header.jsp"%>
     
    <!-- Page Content
    ================================================== --> 
    <div class="row">

        <!-- Gallery Items
        ================================================== --> 
        <div class="span12 gallery-single">

            <div class="row">
                <div class="span6">
                    <img src="img/gallery/gallery-img-3-full.jpg" class="thumbnail" alt="image">
                </div>
                <div class="span6">
                    <h2>"${art.no }"</h2>
                    <p class="lead"></p>
                    <p> "${art.content }"</p>

<!-- 						작품 정보 출력 -->
                    <ul class="project-info">
                        <li><h6>Date:</h6> <fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/></li>
                        <li><h6>Price:</h6> "${art.price }"</li>
                        <li><h6>Art Director:</h6> "${art.id }"</li>
                        <li><h6>Genre</h6> "${art.genre }"</li>
                    </ul>
                    
<!--                     컨트롤러에서 받아 온 값을 결제 폼 페이지로 넘겨 주기 위한 히든 타입 태그 -->
					<input type="hidden" name="no" value="${art.no }">
					<input type="hidden" name="content" value="${art.content }">
					<input type="hidden" name="artDate" value=<fmt:formatDate pattern="yyyy-MM-dd" value="${art.artDate}"/>>
					<input type="hidden" name="price" value="${art.price }">
					<input type="hidden" name="id" value="${art.id }">
					<input type="hidden" name="genre" value="${art.genre }">

<!-- 					결제 방법 선택 -->
					<input type="radio" name="payMethod" value="1">카드결제
					<input type="radio" name="payMethod" value="2">카카오페이
					
                    <input type="submit" id="deliveryValues" class="btn" value="결제하기">
                </div>
            </div>

        </div><!-- End gallery-single-->

    </div><!-- End container row -->
    
    </div> <!-- End Container -->

	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>
    </form>
</body>
</html>
