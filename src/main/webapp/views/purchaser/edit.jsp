<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<form:form action="purchaser/edit.do" modelAttribute="purchaserForm">
	<form:hidden path="purchaser.id" />
	<form:hidden path="purchaser.version" />
	<form:hidden path="purchaser.userAccount.authorities" />

	<form:hidden path="purchaser.reviews" />
	<form:hidden path="purchaser.orders" />

	<fieldset>

		<acme:textbox code="purchaser.username"
			path="purchaser.userAccount.username" />
		<acme:password code="purchaser.password"
			path="purchaser.userAccount.password" />
		<acme:password code="purchaser.password.repeat" path="checkPassword" />
	</fieldset>
	
	<fieldset>
		<acme:textbox code="purchaser.name" path="purchaser.name" />
		<acme:textbox code="purchaser.surname" path="purchaser.surname" />
		<acme:textbox code="purchaser.email" path="purchaser.email" />
		<acme:textbox code="purchaser.phone" path="purchaser.phone" />
	</fieldset>
	
	<fieldset>
		<acme:textbox code="purchaser.birthDate" path="purchaser.birthDate" />
		<acme:textbox code="purchaser.nationality" path="purchaser.nationality" />
		<acme:textbox code="purchaser.address" path="purchaser.address" />
		<acme:textbox code="purchaser.companyName" path="purchaser.companyName" />
		<acme:textbox code="purchaser.url" path="purchaser.URL" />
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