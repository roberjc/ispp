
<%--
 * login.jsp
 *
 * Copyright (C) 2014 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>

<form:form action="j_spring_security_check" modelAttribute="credentials">

	<!-- Main content -->
	<div class="page-wrap container shop-form-wrap">
		<!-- Shop Content -->
		<div role="main" class="main shop">
			<div class="row">
				<div class="col-md-12">
					<div class="row featured-boxes">
						<div class="col-md-12">
							<div class="featured-box default">
								<div class="box-content">
									<div class="space20"></div>
									<form id="contactForm">
										<div class="row">
											<div class="form-group">
												<div class="col-md-12">
													<form:label path="username">
														<spring:message code="security.username" />
													</form:label>
													<form:input path="username" cssClass="form-control" />
													<form:errors class="error" path="username" />
													<br />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="form-group">
												<div class="col-md-12">
													<form:label path="password">
														<spring:message code="security.password" />
													</form:label>
													<form:password path="password" cssClass="form-control" />
													<form:errors class="error" path="password" />
													<br />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-12">
												<input type="submit"
													value="<spring:message code="security.login" />"
													class="btn btn-primary btn-orange uppercase pull-right" />
											</div>
										</div>
									</form>

									<jstl:if test="${showError == true}">
										<div class="error">
											<spring:message code="security.login.failed" />
										</div>
									</jstl:if>

									<jstl:if test="${param.result == 'success'}">
										<div class="success">
											<br />
											<spring:message code="customer.success.register" />
										</div>
									</jstl:if>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main content -->



</form:form>