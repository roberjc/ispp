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

<div class="page-wrap container contact-wrap">
	<div class="container">
		<div class="col-md-12 no-padding columns">
			<div class="row">

				<div class="table-responsive">
					<display:table name="artists" id="row" requestURI="${requestURI}"
						pagesize="5"
						class="table table-hover table-striped table-condensed">

						<display:column property="name" titleKey="artist.name" />

						<display:column property="surname" titleKey="artist.surname" />


						<spring:message var="artistRatingHeader" code="artist.rating" />
						<display:column title="${artistRatingHeader}" sortable="rating">

							<jstl:choose>
								<jstl:when test="${row.reviews.size() == 0}">

									<spring:message code="artist.review.not.reviewed" />
								</jstl:when>
								<jstl:otherwise>
									<jstl:out value="${row.rating}" />
								</jstl:otherwise>
							</jstl:choose>

						</display:column>

						<display:column titleKey="artist.artworks">
							<a href="artwork/listByArtist.do?artistId=${row.id}"> <spring:message
									code="artist.artworks" />
							</a>
						</display:column>
					</display:table>
				</div>
			</div>
		</div>
	</div>
</div>