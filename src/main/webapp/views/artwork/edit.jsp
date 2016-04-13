<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<input type="hidden" id="profitNumber" value="${ profitNumber}" />
<input type="hidden" id="taxNumber" value="${ taxNumber}" />

<script>
	function totalPrice() {
		m1 = parseFloat(document.getElementById("price").value);
		m2 = parseFloat(document.getElementById("profitNumber").value);
		m3 = parseFloat(document.getElementById("taxNumber").value);

		r = m1 + (m1 * m2) + (m1 * m3);

		cost = roundToTwo(r);
		document.getElementById("resultado").innerHTML = r + " euros";
	}

	function roundToTwo(num) {
		return +(Math.round(num + "e+2") + "e-2");
	}
</script>

<!-- Main content -->
<div class="page-wrap container contact-wrap">
	<div class="container">
		<div class="col-md-12 no-padding columns">
			<div class="row">
				<div class="col-md-9">
					<form:form action="artwork/artist/edit.do" cssClass="contact-form"
						modelAttribute="artwork" enctype="multipart/form-data"
						method="post">

						<form:hidden path="id" />
						<form:hidden path="version" />
						<form:hidden path="artist" />
						<form:hidden path="moment" />
						<form:hidden path="status" />
						<form:hidden path="ticker" />
						<form:hidden path="tax" />
						<form:hidden path="deleted" />

						<div class="row">
							<div class="col-md-6">

								<acme:textbox code="artwork.title" path="title" />

								<acme:textbox code="artwork.discipline" path="discipline" />

								<acme:textbox code="artwork.tags.edit" path="tags" />

							</div>
							<div class="col-md-6">
								<acme:textbox code="artwork.heigth" path="height"
									placeholder="Email Address*" />
								<acme:textbox code="artwork.width" path="width"
									placeholder="Email Address*" />
								<form:label path="price">
									<spring:message code="artwork.price" />
								</form:label>
								<form:input path="price" onChange='totalPrice()'
									placeholder="Email Address*" />
								<form:errors cssClass="error" path="price" />
							</div>
						</div>
						<acme:textarea code="artwork.description" path="description" />
						<form:label path="picture">
							<spring:message code="artwork.picture" />
						</form:label>
						<form:input path="picture" id="picture" type="file" />
						<form:errors path="picture" cssClass="error" />
						<button type="submit" id="sendMessage" name="save"
							class="btn btn-primary btn-sm btn-orange uppercase pull-right">
							<spring:message code="artwork.save"></spring:message>
						</button>
					</form:form>
					<div id="successMessage" class="successmessage">
						<p>
							<span class="success-ico"></span> Thanks for sending your
							message! We'll get back to you shortly.
						</p>
					</div>
					<div id="failureMessage" class="errormessage">
						<p>
							<span class="error-ico"></span> There was a problem sending your
							message. Please try again.
						</p>
					</div>
					<div id="incompleteMessage" class="statusMessage">
						<p>Please complete all the fields in the form before sending.</p>
					</div>
				</div>
				<aside class="col-md-3">
					<div class="side-widget contact-info">
						<h4>
							<spring:message code="artwork.total.cost.with.tax" />
						</h4>
						<h1>
							<div id="resultado">Esperando precio</div>
						</h1>
					</div>
				</aside>
			</div>
		</div>
	</div>
</div>
<!-- Main content -->