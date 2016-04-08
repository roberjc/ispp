<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="acme" tagdir="/WEB-INF/tags" %>

<input type="hidden" id= "profitNumber" value="${ profitNumber}" />
<input type="hidden" id= "taxNumber" value="${ taxNumber}" />



<script>
function totalPrice(){
  m1 = parseFloat(document.getElementById("price").value);
  m2 = parseFloat(document.getElementById("profitNumber").value);
  m3 = parseFloat(document.getElementById("taxNumber").value);

  r = m1+(m1*m2)+(m1*m3);
 	
  
  cost = roundToTwo(r);
  document.getElementById("resultado").innerHTML = r;
}


function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}


</script>

<form:form action="artwork/artist/edit.do" modelAttribute="artwork" enctype="multipart/form-data" method="post">

	<form:hidden path="id" />
	<form:hidden path="version" />
	<form:hidden path="artist" />
	<form:hidden path="moment" />
	<form:hidden path="status" />
	<form:hidden path="ticker" />
	<form:hidden path="tax" />
	<form:hidden path="deleted" />
	
	
	<acme:textbox code="artwork.title" path="title" />
	<acme:textbox code="artwork.discipline" path="discipline"/>
	<acme:textbox code="artwork.description" path="description"/>
	<acme:textbox code="artwork.heigth" path="height"/>
	<acme:textbox code="artwork.width" path="width"/>
	
	
	
	<form:label path="price">
		<spring:message code="artwork.price" />
	</form:label>
	<form:input path="price" onChange='totalPrice()'/>
	<form:errors cssClass="error" path="price"/>
	<br/>
	
	
	<acme:textbox code="artwork.tags.edit" path="tags"/>
	
	<form:label path="picture">
		<spring:message code="artwork.picture" />
	</form:label>
	<form:input path="picture" id="picture" type="file" />
	<form:errors path="picture" cssClass="error" />
		<br />
	

	
	<acme:submit name="save" code="artwork.save"/>
	
	<input type="button" name="cancel"
	value="<spring:message code="artwork.back"/>"
	onclick="javascript: window.location.replace('artwork/artist/myList.do')" />
	
	

</form:form>

<spring:message code="artwork.total.cost.with.tax"/>
<div id="resultado"></div>

