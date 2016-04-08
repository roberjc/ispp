<%--
 * list.jsp
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
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@taglib prefix="acme" tagdir="/WEB-INF/tags"%>

<display:table name="reviews" id="row" pagesize="5"
	requestURI="${requestURI}" class="displaytag">

	<acme:displayColumn code="review.purchaser.rating" property="rating"/>
	<acme:displayColumn code="review.purchaser.description" property="description" />
	<acme:displayColumn code="review.purchaser.artist" property="artist.name" />
	
	
</display:table>
<br/>
<acme:cancel url="review/purchaser/create.do" code="review.purchaser.create" />

<acme:cancel url="welcome/index.do" code="review.purchaser.back" />
