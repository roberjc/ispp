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
						</ul></li>
						<!--  ADMIN NAV  -->
					<security:authorize access="hasRole('ADMINISTRATOR')">
						
						<li class='has-sub'><a href="artwork/list.do"><span><spring:message code="master.page.artworks" /></span></a>
							<ul>
							</ul>
						</li>
						
						<li class='has-sub'><a href="artist/list.do"><span><spring:message code="master.page.artist.list" /></span></a>
							<ul>
							</ul>
						</li>
						
	        		</security:authorize>
						

					<!--  PURCHASER NAV  -->
					<security:authorize access="hasRole('PURCHASER')">
						
						<li class='has-sub'><a href="artwork/purchaser/listOnSale.do"><span><spring:message code="master.page.artworks" /></span></a>
							<ul>
							</ul>
						</li>
						
						<li class='has-sub'><a href="artist/list.do"><span><spring:message code="master.page.artist.list" /></span></a>
							<ul>
							</ul>
						</li>
						
						<li class='has-sub'><a href="artwork/purchaser/listInCart.do"><span><spring:message code="master.page.purchaser.cart" /></span></a>
							<ul>
							</ul>
						</li>
	        		</security:authorize>
						
					<!--  Anonymous NAV  -->
					<security:authorize access="isAnonymous()">
	       		 		<li class='has-sub'><a href="security/login.do"><span><spring:message code="master.page.login" /></span></a>
	        		</security:authorize>
	        		
	        		<!--  Authenticated NAV  -->
					<security:authorize access="isAuthenticated()">
							<li class='has-sub'><a href='#'><span><security:authentication property="principal.username" /></span></a>
								<ul>
									<security:authorize access="hasRole('PURCHASER')">
										<li><a href="artwork/purchaser/list.do"> <spring:message code="master.page.purchaser.purchases" /></a></li>
										<li><a href="review/purchaser/list.do"> <spring:message code="master.page.purchaser.reviews" /></a></li>
									</security:authorize>
									<security:authorize access="hasRole('ADMINISTRATOR')">
										<li><a href="dashboard/admin/dashboard.do"> <spring:message code="master.page.purchaser.purchases" /></a></li>
									</security:authorize>
									<li><a href="j_spring_security_logout"> <spring:message code="master.page.logout" /></a></li>
							</ul></li>
					</security:authorize>
				</ul>
			</div>
		</div>
	</div>
</header>
<!-- Header -->