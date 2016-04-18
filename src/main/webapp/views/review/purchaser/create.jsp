
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
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="review/purchaser/create.do" modelAttribute="review">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="purchaser" />

	<!-- Main content -->
	<div class="page-wrap container contact-wrap">
		<div class="col-md-12 no-padding columns">
			<div class="row">
				<div class="col-md-12">
					<h4>Leave a Message</h4>
					<div class="space30"></div>
					<div class="row">
						<div class="col-md-6">
							<label><spring:message code="review.purchaser.rating" /></label>
							<form:select cssClass="form-control" path="rating">
								<form:options items="${ratings}" />
							</form:select>
							<form:errors cssClass="error" path="rating" />
						</div>
						<div class="col-md-6">
							<label><spring:message code="review.purchaser.artist" /></label>
							<form:select cssClass="form-control" path="artist">
								<form:options items="${artists}" itemLabel="name" itemValue="id" />
							</form:select>
							<form:errors cssClass="error" path="artist" />
						</div>
						<div class="col-md-12">
							<acme:textarea cssClass="form-control"
								code="review.purchaser.description" path="description" />
							<br />
							<jstl:if test="${showError == true}">
								<div class="error">
									<spring:message code="review.purchaser.create.failed" />
								</div>
							</jstl:if>
							<button type="submit" id="sendMessage" name="save"
								class="btn btn-primary btn-green uppercase pull-right">
								<spring:message code="review.purchaser.save"></spring:message>
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Main content -->

</form:form>