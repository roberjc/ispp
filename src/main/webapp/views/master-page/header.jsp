<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<!-- Header -->
<header>
	<div class="container">
		<div class="col-md-12">

			<!-- Logo -->
			<h1 class="logo">
				<a href="index.html"><img src="images/logo.png"
					class="img-responsive" alt="img" width="150" height="150" /></a>
			</h1>

			<!-- Nav Menu -->
			<div id='cssmenu'>
				<ul>
					<li class='has-sub active'><a href='index.html'><span>Home</span></a>
						<ul>
							<li><a href='j_spring_security_logout'><span>Logout</span></a></li>
							<li><a href='security/login.do'><span>Login</span></a></li>
							<li><a href='home3.html'><span>Home - version 3</span></a></li>
							<li><a href='home4.html'><span>Home - version 4</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>Features</span></a>
						<ul>
							<li><a href='about.html'><span>About</span></a></li>
							<li><a href='services.html'><span>Services</span></a></li>
							<li><a href='icons.html'><span>Icon Sets</span></a></li>
							<li><a href='elements.html'><span>Website
										Elements</span></a></li>
							<li><a href='typography.html'><span>Typography
										Styles</span></a></li>
							<li><a href='columns.html'><span>Column Layouts</span></a></li>
							<li><a href='404.html'><span>404 Page</span></a></li>
						</ul></li>
					<li class='has-sub'><a href='#'><span>Our Blog</span></a>
						<ul>
							<li><a href='blog1.html'><span>Blog - Classic</span></a></li>
							<li><a href='blog2.html'><span>Blog - Masonry</span></a></li>
							<li><a href='blog-single.html'><span>Blog -
										Single</span></a></li>
						</ul></li>

					<li class='has-sub'><a href='#' class="active-link"><span>Portfolio</span></a>
						<ul>
							<li><a href='portfolio_01.html'><span>Portfolio -
										style 1</span></a></li>
							<li><a href='portfolio_02.html'><span>Portfolio -
										style 2</span></a></li>
							<li><a href='portfolio_03.html'><span>Portfolio -
										style 3</span></a></li>
							<li><a href='portfolio_04.html'><span>Portfolio -
										style 4</span></a></li>
							<li><a href='portfolio_fancybox.html'><span>Portfolio
										- FancyBox</span></a></li>
							<li><a href='portfolio_single_01.html'><span>Single
										Portfolio - style 1</span></a></li>
							<li><a href='portfolio_single_02.html'><span>Single
										Portfolio - style 2</span></a></li>
						</ul></li>

					<li class='has-sub'><a href='#'><span>Shop</span></a>
						<ul>
							<li><a href='shop_full.html'><span>Products</span></a></li>
							<li><a href='shop_w_sidebar.html'><span>Products
										w/sidebar</span></a></li>
							<li><a href='shop-product-full-width.html'><span>Single
										Product</span></a></li>
							<li><a href='shop-product-sidebar.html'><span>Single
										w/sidebar</span></a></li>
							<li><a href='shop_cart.html'><span>Cart</span></a></li>
							<li><a href='shop_checkout.html'><span>Checkout</span></a></li>
							<li><a href='shop_login.html'><span>Login</span></a></li>
						</ul></li>
						
						
					<security:authorize access="isAnonymous()">
	       		 		<li class='has-sub'><a href="security/login.do"><span><spring:message code="master.page.login" /></span></a>
	        		</security:authorize>
					<security:authorize access="isAuthenticated()">
							<li class='has-sub'><a href='#'><span><security:authentication property="principal.username" /></span></a>
								<ul>
									<li><a href="j_spring_security_logout"> <spring:message code="master.page.logout" /></a></li>
							</ul></li>
					</security:authorize>
				</ul>
			</div>
		</div>
	</div>
</header>
<!-- Header -->