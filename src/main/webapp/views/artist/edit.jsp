<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="artist/edit.do" modelAttribute="artistForm">
	<form:hidden path="artist.id" />
	<form:hidden path="artist.version" />
	<form:hidden path="artist.userAccount.authorities" />

	<form:hidden path="artist.rating" />
	<form:hidden path="artist.reviews" />
	<form:hidden path="artist.artworks" />

	<fieldset>

		<acme:textbox code="artist.username"
			path="artist.userAccount.username" />
		<acme:password code="artist.password"
			path="artist.userAccount.password" />
		<acme:password code="artist.password.repeat" path="checkPassword" />
	</fieldset>
	
	<fieldset>
		<acme:textbox code="artist.name" path="artist.name" />
		<acme:textbox code="artist.surname" path="artist.surname" />
		<acme:textbox code="artist.email" path="artist.email" />
		<acme:textbox code="artist.phone" path="artist.phone" />
	</fieldset>
	
	<fieldset>
		<acme:textbox code="artist.birthDate" path="artist.birthDate" />
		<acme:textbox code="artist.nationality" path="artist.nationality" />
		<acme:textbox code="artist.address" path="artist.address" />
		<acme:textbox code="artist.url" path="artist.URL" />
	</fieldset>

	<br />

	<acme:checkbox path="conditions" url="privacy/lopd-lssi.do"
		code="customer.terms" />

	<br />

	<jstl:if test="${showError == true}">
		<div class="error">
			<spring:message code="customer.error.register" />
		</div>
	</jstl:if>

	<acme:submit name="save" code="customer.create" />
	<acme:cancel url="welcome/index.do" code="customer.back" />
</form:form>