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

<!-- Main content -->
<div class="page-wrap container shop-form-wrap">
	<!-- Shop Content -->
	<div role="main" class="main shop">
		<div class="row">
			<div class="col-md-12">
				<div class="row featured-boxes">
					<div class="col-md-12">
						<div class="featured-box featured-box-primary">
							<div class="box-content">
								<table class="shop_table cart">
									<thead>
										<tr>
											<th class="product-title"><spring:message
													code="review.purchaser.rating"></spring:message></th>
											<th class="product-title"><spring:message
													code="review.purchaser.description"></spring:message></th>
											<th class="product-title"><spring:message
													code="review.purchaser.artist"></spring:message></th>
										</tr>
									</thead>
									<tbody>

										<jstl:forEach items="${reviews}" var="review">

											<tr class="cart_table_item">
												<td class="product-title"><a
													href="shop-product-sidebar.html"><jstl:out
															value="${review.rating}"></jstl:out></a></td>
												<td class="product-description"><a
													href="shop-product-sidebar.html"><jstl:out
															value="${review.description}"></jstl:out></a></td>
												<td class="product-discipline"><span class="amount"><jstl:out
															value="${review.artist.name}"></jstl:out></span></td>
											</tr>
										</jstl:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<br />
				<div class="row featured-boxes">
					<div class="col-md-12">
						<div class="actions-continue">
							<a href="review/purchaser/create.do"> <input
								class="btn btn-primary btn-green uppercase pull-right" type="button"
								name="checkout"
								value="<spring:message code="review.purchaser.create" />" />
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Main content -->