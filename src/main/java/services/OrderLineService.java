package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import repositories.OrderLineRepository;
import security.Authority;
import security.LoginService;
import domain.OrderLine;

@Service
@Transactional
public class OrderLineService {

	// Managed repository
	@Autowired
	private OrderLineRepository orderLineRepository;

	// Supporting services

	// Constructors
	public OrderLineService() {
		super();
	}

	// Simple CRUD methods
	public OrderLine create() {
		OrderLine res = new OrderLine();
		return res;
	}

	public OrderLine findOne(int orderLineId) {
		return orderLineRepository.findOne(orderLineId);
	}

	public Collection<OrderLine> findAll() {
		return orderLineRepository.findAll();
	}

	public void save(OrderLine orderLine) {
		orderLineRepository.save(orderLine);
	}

	public void delete(OrderLine orderLine) {
		orderLineRepository.delete(orderLine);
	}

	

	// Other business methods
	public Collection<OrderLine> findOrderLinesOfOrder(int orderId) {
		Collection<OrderLine> res = new ArrayList<OrderLine>();
		res = orderLineRepository.findOrderLinesOfOrder(orderId);
		return res;
	}
	
	public Collection<OrderLine> findMyOrderLines(){
		checkPurchaserRole();
		Collection<OrderLine> res = new ArrayList<OrderLine>();
		res = orderLineRepository.findMyOrderLines(LoginService.getPrincipal().getId());
		return res;
	}

	// All checks
	
	public void checkPurchaserRole() {

		Authority Purchaser = new Authority();
		Purchaser.setAuthority(Authority.PURCHASER);

		Assert.isTrue(LoginService.getPrincipal().getAuthorities().contains(Purchaser), "You're not an Purchaser user");
	}

}
