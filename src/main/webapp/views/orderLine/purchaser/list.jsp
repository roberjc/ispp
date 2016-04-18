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
	<h3>Checkout</h3>
	<p>
		Returning customer? <a href="shop-login.html">Click here to login.</a>
	</p>

	<!-- Shop Content -->
	<div role="main" class="main shop checkout-wrap">

		<div class="row">
			<div class="col-md-12">
				<div class="featured-box featured-box-primary">
					<div class="box-content">
						<table class="shop_table cart">
							<thead>
								<tr>
									<th class="product-title"><spring:message
											code="orderLine.purchaser.ticker"></spring:message></th>
									<th class="product-description"><spring:message
											code="orderLine.purchaser.title"></spring:message></th>
									<th class="product-width"><spring:message
											code="orderLine.purchaser.totalCost"></spring:message></th>
								</tr>
							</thead>
							<tbody>
								<jstl:forEach items="${orderLines}" var="orderLine">

									<tr class="cart_table_item">
										<td class="product-title"><a
											href="shop-product-sidebar.html"><jstl:out
													value="${orderLine.ticker}"></jstl:out></a></td>
										<td class="product-title"><a
											href="shop-product-sidebar.html"><jstl:out
													value="${orderLine.title}"></jstl:out></a></td>
										<td class="product-discipline"><span class="amount"><jstl:out
													value="${orderLine.totalCost}"></jstl:out></span></td>
									</tr>
								</jstl:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>
			<div class="col-md-9">
				<div id="first">
					<h3>Review & Payment</h3>
					<div class="racc">
						<div class="toggle-content">
							<hr class="tall">
							<h4>Cart Totals</h4>
							<table class="cart-totals">
								<tbody>
									<tr class="cart-subtotal">
										<th><strong>Cart Subtotal</strong></th>
										<td><strong><span class="amount"><jstl:out
														value="${orderLines[0].order.totalCost} euros"></jstl:out></span></strong></td>
									</tr>
									<tr class="taxes">
										<th>IVA</th>
										<td>21%<input type="hidden" value="free_shipping"
											name="shipping_method">
										</td>
									</tr>
									<tr class="shipping">
										<th>Shipping</th>
										<td>Free Shipping<input type="hidden"
											value="free_shipping" name="shipping_method">
										</td>
									</tr>
									<tr class="total">
										<th><strong>Order Total</strong></th>
										<td><strong><span class="amount"><jstl:out
														value="${orderLines[0].order.totalCost} euros"></jstl:out></span></strong></td>
									</tr>
								</tbody>
							</table>
							<hr class="tall">
						</div>
					</div>
					<!-- 						<h3>Shipping Address</h3> -->
					<!-- 						<div class="racc"> -->
					<!-- 							<div class="toggle-content"> -->
					<%-- 								<form> --%>
					<!-- 									<div class="row"> -->
					<!-- 										<div class="col-md-12"> -->
					<!-- 											<span class="remember-box checkbox"> -->
					<!-- 											<label> -->
					<!-- 											<input type="checkbox" checked="checked">Ship to billing address? -->
					<!-- 											</label> -->
					<!-- 											</span> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<div class="row"> -->
					<!-- 										<div class="form-group"> -->
					<!-- 											<div class="col-md-12"> -->
					<!-- 												<label>Country</label> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<div class="row"> -->
					<!-- 										<div class="form-group"> -->
					<!-- 											<div class="col-md-6"> -->
					<!-- 												<label>First Name</label> -->
					<!-- 												<input type="text" value="" class="form-control"> -->
					<!-- 											</div> -->
					<!-- 											<div class="col-md-6"> -->
					<!-- 												<label>Last Name</label> -->
					<!-- 												<input type="text" value="" class="form-control"> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<div class="row"> -->
					<!-- 										<div class="form-group"> -->
					<!-- 											<div class="col-md-12"> -->
					<!-- 												<label>Company Name</label> -->
					<!-- 												<input type="text" value="" class="form-control"> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<div class="row"> -->
					<!-- 										<div class="form-group"> -->
					<!-- 											<div class="col-md-12"> -->
					<!-- 												<label>Address </label> -->
					<!-- 												<input type="text" value="" class="form-control"> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<div class="row"> -->
					<!-- 										<div class="form-group"> -->
					<!-- 											<div class="col-md-12"> -->
					<!-- 												<label>City </label> -->
					<!-- 												<input type="text" value="" class="form-control"> -->
					<!-- 											</div> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<!-- 									<div class="row"> -->
					<!-- 										<div class="col-md-12"> -->
					<!-- 											<a href="#" class="btn btn-primary btn-orange uppercase pull-right">Continue</a> -->
					<!-- 										</div> -->
					<!-- 									</div> -->
					<%-- 								</form> --%>
					<!-- 							</div> -->
					<!-- 						</div> -->
				</div>
				<!-- end of first -->
				<div class="space40"></div>

				<form name='formTpv' method='post'
					action='https://www.sandbox.paypal.com/cgi-bin/webscr'>
					<input name="cmd" type="hidden" value="_cart"> 
					<input name="upload" type="hidden" value="1"> 
					<input name="business" type="hidden" value="tazu@gmail.com"> 
					<input name="shopping_url" type="hidden" value="http://localhost:8080/tazu"> 
					<input name="currency_code" type="hidden" value="EUR"> 
					<input name="return" type="hidden" value="http://localhost:8080/tazu/purchaser/order/success.do">
					<input type='hidden' name='cancel_return' value='http://localhost:8080/tazu/purchaser/order/fail.do'>
					<input name="rm" type="hidden" value="2">

					<jstl:forEach items="${orderLines}" var="orderLine" varStatus="s">
						<input name="item_number_${s.index+1}" type="hidden"
							value="${s.index+1}">
						<input name="item_name_${s.index+1}" type="hidden"
							value="${orderLine.title}">
						<input name="amount_${s.index+1}" type="hidden"
							value="${orderLine.totalCost}">
						<input name="quantity_${s.index+1}" type="hidden" value="1">
					</jstl:forEach>

					<button class="btn btn-primary btn-orange uppercase pull-right"><spring:message code="orderLine.purchaser.paypal"></spring:message></button>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- Main content -->