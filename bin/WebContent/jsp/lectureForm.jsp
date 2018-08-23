<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>강의게시판</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS
================================================== -->
<link href='http://fonts.googleapis.com/css?family=Oswald'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/bootstrap-responsive.css">
<link rel="stylesheet" href="css/jquery.lightbox-0.5.css">
<link rel="stylesheet" href="css/custom-styles.css">

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
<script src="http://code.jquery.com/jquery-latest.js"
	type="text/javascript"></script>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.custom.js"></script>


</head>

<body>
	<div class="color-bar-1"></div>
	<div class="color-bar-2 color-bg"></div>

	<div class="container main-container">

		<!--     Header section -->
		<%@include file="header.jsp"%>

		<!-- Blog Content
    ================================================== -->
		<div class="row">

			<!-- Blog Posts
        ================================================== -->
			<div class="span8 blog">

				<!-- Blog Post 1 -->
				<article class="clearfix"> <a href="blog-single.htm"><img
					src="img/gallery/gallery-img-8-4col.jpg" alt="Post Thumb"
					class="align-left"></a>
				<h4 class="title-bg">
					<a href="blog-single.htm">A subject that is beautiful in itself</a>
				</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin
					tristique tellus in est vulputate luctus fermentum ipsum molestie.
				</p>
				<button class="btn btn-mini btn-inverse" type="button">Read
					more</button>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i> 09/04/15</li>
						<li><i class="icon-user"></i> <a href="#">Admin</a></li>
						<li><i class="icon-comment"></i> <a href="#">5 Comments</a></li>
						<li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a
							href="#">tutorials</a></li>
					</ul>
				</div>
				</article>

				<!-- Blog Post 1 -->
				<article class="clearfix"> <a href="blog-single.htm"><img
					src="img/gallery/gallery-img-10-4col.jpg" alt="Post Thumb"
					class="align-left"></a>
				<h4 class="title-bg">
					<a href="blog-single.htm">A great artist is always before his
						time</a>
				</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin
					tristique tellus in est vulputate luctus fermentum ipsum molestie.
				</p>
				<button class="btn btn-mini btn-inverse" type="button">Read
					more</button>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i> 09/04/15</li>
						<li><i class="icon-user"></i> <a href="#">Admin</a></li>
						<li><i class="icon-comment"></i> <a href="#">5 Comments</a></li>
						<li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a
							href="#">tutorials</a></li>
					</ul>
				</div>
				</article>

				<!-- Blog Post 1 -->
				<article class="clearfix"> <a href="blog-single.htm"><img
					src="img/gallery/gallery-img-7-4col.jpg" alt="Post Thumb"
					class="align-left"></a>
				<h4 class="title-bg">
					<a href="blog-single.htm">Is art everything to anybody?</a>
				</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin
					tristique tellus in est vulputate luctus fermentum ipsum molestie.
				</p>
				<button class="btn btn-mini btn-inverse" type="button">Read
					more</button>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i> 09/04/15</li>
						<li><i class="icon-user"></i> <a href="#">Admin</a></li>
						<li><i class="icon-comment"></i> <a href="#">5 Comments</a></li>
						<li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a
							href="#">tutorials</a></li>
					</ul>
				</div>
				</article>

				<!-- Blog Post 1 -->
				<article class="clearfix"> <a href="blog-single.htm"><img
					src="img/gallery/gallery-img-1-4col.jpg" alt="Post Thumb"
					class="align-left"></a>
				<h4 class="title-bg">
					<a href="blog-single.htm">A Brand New Illustration Contest</a>
				</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin
					tristique tellus in est vulputate luctus fermentum ipsum molestie.
				</p>
				<button class="btn btn-mini btn-inverse" type="button">Read
					more</button>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i> 09/04/15</li>
						<li><i class="icon-user"></i> <a href="#">Admin</a></li>
						<li><i class="icon-comment"></i> <a href="#">5 Comments</a></li>
						<li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a
							href="#">tutorials</a></li>
					</ul>
				</div>
				</article>

				<!-- Blog Post 1 -->
				<article class="clearfix"> <a href="blog-single.htm"><img
					src="img/gallery/gallery-img-3-4col.jpg" alt="Post Thumb"
					class="align-left"></a>
				<h4 class="title-bg">
					<a href="blog-single.htm">How to Create a Beautiful Scene</a>
				</h4>
				<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit.
					Nulla iaculis mattis lorem, quis gravida nunc iaculis ac. Proin
					tristique tellus in est vulputate luctus fermentum ipsum molestie.
				</p>
				<button class="btn btn-mini btn-inverse" type="button">Read
					more</button>
				<div class="post-summary-footer">
					<ul class="post-data-3">
						<li><i class="icon-calendar"></i> 09/04/15</li>
						<li><i class="icon-user"></i> <a href="#">Admin</a></li>
						<li><i class="icon-comment"></i> <a href="#">5 Comments</a></li>
						<li><i class="icon-tags"></i> <a href="#">photoshop</a>, <a
							href="#">tutorials</a></li>
					</ul>
				</div>
				</article>

				<!-- Pagination -->
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

				<div>
					<button class="btn" type="button"
						onclick="location.href='addLectureForm.do'">강의개설</button>
				</div>
			</div>

			<!-- Blog Sidebar
        ================================================== -->
			<div class="span4 sidebar">

				<!--Search-->
				<section>
				<div class="input-append">
					<form action="#">
						<input id="appendedInputButton" size="16" type="text"
							placeholder="Search">
						<button class="btn" type="button">
							<i class="icon-search"></i>
						</button>
					</form>
				</div>
				</section>

				<!--Categories-->
				<h5 class="title-bg">Categories</h5>
				<ul class="post-category-list">
					<li><a href="#"><i class="icon-plus-sign"></i>Design</a></li>
					<li><a href="#"><i class="icon-plus-sign"></i>Illustration</a></li>
					<li><a href="#"><i class="icon-plus-sign"></i>Tutorials</a></li>
					<li><a href="#"><i class="icon-plus-sign"></i>News</a></li>
				</ul>

				<!--Popular Posts-->
				<h5 class="title-bg">Popular Posts</h5>
				<ul class="popular-posts">
					<li><a href="blog-single.htm"><img
							src="img/gallery/gallery-img-2-thumb.jpg" alt="Popular Post"></a>
						<h6>
							<a href="#">Lorem ipsum dolor sit amet consectetur adipiscing
								elit</a>
						</h6> <em>Posted on 09/01/15</em></li>
					<li><a href="blog-single.htm"><img
							src="img/gallery/gallery-img-3-thumb.jpg" alt="Popular Post"></a>
						<h6>
							<a href="#">Nulla iaculis mattis lorem, quis gravida nunc
								iaculis</a>
						</h6> <em>Posted on 09/01/15</em>
					<li><a href="blog-single.htm"><img
							src="img/gallery/gallery-img-4-thumb.jpg" alt="Popular Post"></a>
						<h6>
							<a href="#">Vivamus tincidunt sem eu magna varius elementum
								maecenas felis</a>
						</h6> <em>Posted on 09/01/15</em></li>
				</ul>

				<!--Tabbed Content-->
				<h5 class="title-bg">More Info</h5>
				<ul class="nav nav-tabs">
					<li class="active"><a href="#comments" data-toggle="tab">Comments</a></li>
					<li><a href="#tweets" data-toggle="tab">Tweets</a></li>
					<li><a href="#about" data-toggle="tab">About</a></li>
				</ul>

				<div class="tab-content">
					<div class="tab-pane active" id="comments">
						<ul>
							<li><i class="icon-comment"></i>admin on <a href="#">Lorem
									ipsum dolor sit amet</a></li>
							<li><i class="icon-comment"></i>admin on <a href="#">Consectetur
									adipiscing elit</a></li>
							<li><i class="icon-comment"></i>admin on <a href="#">Ipsum
									dolor sit amet consectetur</a></li>
							<li><i class="icon-comment"></i>admin on <a href="#">Aadipiscing
									elit varius elementum</a></li>
							<li><i class="icon-comment"></i>admin on <a href="#">ulla
									iaculis mattis lorem</a></li>
						</ul>
					</div>
					<div class="tab-pane" id="tweets">
						<ul>
							<li><a href="#"><i class="icon-share-alt"></i>@room122</a>
								Vivamus tincidunt sem eu magna varius elementum. Maecenas felis
								tellus, fermentum vitae laoreet vitae, volutpat et urna.</li>
							<li><a href="#"> <i class="icon-share-alt"></i>@room122
							</a> Nulla faucibus ligula eget ante varius ac euismod odio placerat.</li>
							<li><a href="#"> <i class="icon-share-alt"></i>@room122
							</a> Pellentesque iaculis lacinia leo. Donec suscipit, lectus et
								hendrerit posuere, dui nisi porta risus, eget adipiscing</li>
							<li><a href="#"> <i class="icon-share-alt"></i>@room122
							</a> Vivamus augue nulla, vestibulum ac ultrices posuere, vehicula ac
								arcu.</li>
							<li><a href="#"> <i class="icon-share-alt"></i>@room122
							</a> Sed ac neque nec leo condimentum rhoncus. Nunc dapibus odio et
								lacus.</li>
						</ul>
					</div>
					<div class="tab-pane" id="about">
						<p>Enim eiusmod high life accusamus terry richardson ad squid.
							3 wolf moon officia aute, non cupidatat skateboard dolor brunch.
							Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon
							tempor, sunt aliqua put a bird on it squid single-origin coffee
							nulla assumenda shoreditch et. Nihil anim keffiyeh helvetica,
							craft beer labore wes anderson cred nesciunt sapiente ea
							proident. Ad vegan excepteur butcher vice lomo.</p>

						Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid
						single-origin coffee nulla assumenda shoreditch et.
					</div>
				</div>

				<!--Video Widget-->
				<h5 class="title-bg">Video Widget</h5>
				<iframe src="http://player.vimeo.com/video/24496773" width="370"
					height="208"></iframe>
			</div>

		</div>

	</div>
	<!-- End Container -->

	<!-- Footer Area
        ================================================== -->
	<%@include file="footer.jsp"%>

</body>
</html>