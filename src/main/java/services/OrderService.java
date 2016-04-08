package services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.web.servlet.ModelAndView;

import domain.Artwork;
import domain.Cart;
import domain.Order;
import domain.OrderLine;
import domain.Profit;
import domain.Status;
import domain.Tax;
import junit.framework.Assert;
import repositories.OrderRepository;
import security.Authority;
import security.LoginService;

@Service
@Transactional
public class OrderService {

	// Managed repository
	@Autowired
	private OrderRepository orderRepository;

	// Supporting services
	@Autowired
	private CartService cartService;
	@Autowired
	private ArtistService artistService;
	@Autowired
	private ProfitService profitService;
	@Autowired
	private TaxService taxService;
	@Autowired
	private ArtworkService artworkService;

	// Constructors
	public OrderService() {
		super();
	}

	// Simple CRUD methods
	public Order create() {
		Order res;
		res= new Order();
		return res;
	}

	public Order findOne(int orderId) {
		return orderRepository.findOne(orderId);
	}

	public Collection<Order> findAll() {
		return orderRepository.findAll();
	}

	public void save(Order order) {
		orderRepository.save(order);
	}

	public void delete(Order order) {
		orderRepository.delete(order);
	}

	// Other business methods
	public void createAndSave() {

		Cart cart;
		Double totalCost;
		List<OrderLine> orderLines;
		Order order=create();
		cart=cartService.findMyCart();
		Collection<Artwork> artworks;
		Profit profit;
		Collection<Tax> taxs;
		Tax tax;
		int numberSales;
		
				
		//Encontramos las obras
		artworks=artworkService.findArtWorkInCart();
		// Creamos un nuevo pedido
		orderLines = new ArrayList<OrderLine>();
		totalCost = 0.0;
		order.setTotalCost(totalCost);
		
	
		for (Artwork a: artworks) {
			OrderLine orderLine;
			
			// Por cada línea de carro creamos una línea de pedido
			orderLine = new OrderLine();
			Double orderLineValue=0.0;
			Double profitValue=0.0;
			Double taxValue=0.0;

			// Asociamos atributos
			orderLine.setTicker(a.getTicker());
			orderLine.setTitle(a.getTitle());
			numberSales=artistService.findNumberArtworkSoldByArtist(a.getArtist().getUserAccount().getId());
			profit=profitService.findProfitByNumberSales(numberSales);
			
			orderLine.setProfit(profit.getValue());
			a.setStatus(Status.SOLD);
			a.setCart(null);
			taxValue=a.getPrice()*((1 + (a.getTax().getValue()) / 100));
			profitValue=(a.getPrice()*(profit.getValue())/100);
			orderLineValue=taxValue+profitValue;
			totalCost=totalCost+orderLineValue;
			
			order.setTotalCost(totalCost);
			
			
			// Asociamos las líneas al pedido
			orderLine.setOrder(order);
			orderLines.add(orderLine);
			orderLineValue=redondear(orderLineValue);
			orderLine.setTotalCost(orderLineValue);

		}
		//Encontrar la tasa áctiva
		taxs=taxService.findAll();
		tax=((List<Tax>) taxs).get(0);
		order.setTaxName(tax.getName());
		order.setTaxValue(tax.getValue());
		//Asigno comprador al pedido		
		order.setPurchaser(cart.getPurchaser());
		//Guardo el momento de la compra
		Date moment=new Date(System.currentTimeMillis()-1000);
		order.setMoment(moment);
		//Redondeo el precio
		totalCost=redondear(order.getTotalCost());
		order.setTotalCost(totalCost);
		
		// Libera la asociación entre carro y cliente
		order.getPurchaser().setCart(null);

		// Al eliminar carrito también elimina sus líneas
		cartService.delete(cart);

		// Asociamos al pedido sus líneas
		order.setOrderLines(orderLines);
		orderRepository.save(order);

	}



	public Collection<Order> findMyOrders() {
		checkPurchaserRole();
		Collection<Order> res= new ArrayList<Order>();
		res=orderRepository.findMyOrders(LoginService.getPrincipal().getId());
		return res;
	}
		
	public double redondear(double value) {
		return Math.rint(value * 100) / 100;
	}



	// All checks
	public void checkPurchaserRole() {

		Authority purchaser = new Authority();
		purchaser.setAuthority(Authority.PURCHASER);

		Assert.assertTrue(
				"You're not an PURCHASER user",LoginService.getPrincipal().getAuthorities().contains(purchaser));
	}

	public void checkAdminRole() {

		Authority admin = new Authority();
		admin.setAuthority(Authority.ADMINISTRATOR);

		Assert.assertTrue(
				"You're not an ADMIN user",LoginService.getPrincipal().getAuthorities().contains(admin));
	}


	

	
	
}
