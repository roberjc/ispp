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
											<th class="product-price"><spring:message
													code="order.purchaser.totalCost"></spring:message></th>
											<th class="product-price"><spring:message
													code="order.purchaser.taxName"></spring:message></th>
											<th class="product-price"><spring:message
													code="order.purchaser.taxValue"></spring:message></th>
											<th class="product-price"><spring:message
													code="order.purchaser.moment"></spring:message></th>
											<th class="product-price"><spring:message
													code="order.purchaser.orderLines"></spring:message></th>
										</tr>
									</thead>
									<tbody>
										<jstl:forEach items="${orders}" var="order">

											<tr class="cart_table_item">
												<td class="product-discipline"><span class="amount"><jstl:out
															value="${order.totalCost}"></jstl:out></span></td>
												<td class="product-discipline"><span class="amount"><jstl:out
															value="${order.taxName}"></jstl:out></span></td>
												<td class="product-discipline"><span class="amount"><jstl:out
															value="${order.taxValue}"></jstl:out></span></td>
												<td class="product-width"><span class="amount"><jstl:out
															value="${order.moment}"></jstl:out></span></td>
												<td class="product-price"><span class="amount">
														<a href="orderLine/purchaser/list.do?orderId=${order.id}">
															<i class="fa fa-list-alt"></i>
													</a>
												</span></td>
											</tr>
										</jstl:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Main content -->