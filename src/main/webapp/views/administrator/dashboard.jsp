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




<h4><spring:message code="admin.dashboard.findHighestRateArtists" /></h4>
	<display:table name="highestRateArtists" id="row" requestURI="dashboard/admin/dashboard.do" pagesize="5" class="displaytag"> 
	
	<display:column property="name" titleKey="artist.name"/>
	
	
	<display:column property="surname" titleKey="artist.surname"/>
				
	</display:table>
	<spring:message  code="admin.dashboard.findNumberHighestRateArtists" />: <jstl:out value="${numberHighestRateArtists}"></jstl:out>

<br/>

<h4><spring:message code="admin.dashboard.findMoreArtworksSoldArtists" /></h4>
	<display:table name="moreArtworksSoldArtists" id="row" requestURI="dashboard/admin/dashboard.do" pagesize="5" class="displaytag"> 
	
	<display:column property="name" titleKey="artist.name"/>
	
	
	<display:column property="surname" titleKey="artist.surname"/>
				
	</display:table>
	<spring:message  code="admin.dashboard.findNumberMoreArtworksSoldArtists" />: <jstl:out value="${numberMoreArtworksSoldArtists}"></jstl:out>

<br/>

<h4><spring:message code="admin.dashboard.findArtistEarnedMoreMoney" /></h4>
	<display:table name="artistsEarnedMoreMoney" id="row" requestURI="dashboard/admin/dashboard.do" pagesize="5" class="displaytag"> 
	
	<display:column property="name" titleKey="artist.name"/>
	
	
	<display:column property="surname" titleKey="artist.surname"/>
				
	</display:table>
	<spring:message  code="admin.dashboard.findQuantityArtistEarnedMoreMoney" />: <jstl:out value="${quantityArtistEarnedMoreMoney}"></jstl:out>

<br/>

<h4><spring:message code="admin.dashboard.purchaserSpendMoreMoney" /></h4>

<jstl:out value="${purchaserSpendMoreMoney}"/>
<br/>

<h4><spring:message code="admin.dashboard.moreArtworksBought" /></h4>
	<display:table name="moreArtworksBought" id="row" requestURI="dashboard/admin/dashboard.do" pagesize="5" class="displaytag"> 
	
	<display:column property="name" titleKey="purchaser.name"/>
	
	
	<display:column property="surname" titleKey="purchaser.surname"/>
				
	</display:table>

<br/>

<h4><spring:message code="admin.dashboard.mostExpensiveOnSale" /></h4>
	<display:table name="mostExpensiveOnSale" id="row" requestURI="dashboard/admin/dashboard.do" pagesize="5" class="displaytag"> 
	
	<display:column property="title" titleKey="artwork.title"/>
	
	
	<display:column property="description" titleKey="artwork.description"/>
				
	</display:table>

<br/>
