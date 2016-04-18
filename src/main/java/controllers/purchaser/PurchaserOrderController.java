package controllers.purchaser;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import controllers.AbstractController;
import domain.Order;
import services.OrderService;

@Controller
@RequestMapping("/order/purchaser")
public class PurchaserOrderController extends AbstractController {

	// Services ---------------------------------------------------------------
	@Autowired
	private OrderService orderService;
	




	// Constructors -----------------------------------------------------------

	public PurchaserOrderController() {
		super();
	}

	// Listing-------------------------------------------------------------------

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Order> orders;

		
		orders = orderService.findMyOrders();

		String uri = "order/purchaser/list";
		String requestURI = "order/purchaser/list.do";
		result = createListModelAndView(orders, requestURI, uri);

		return result;
	}
	
	// Edition ------------------------------------------------------------------------------
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;

		orderService.createAndSave();

		result = new ModelAndView("redirect:/order/purchaser/list.do");

		return result;
	}
	
	// Other bussiness method ---------------------------------------------------------------

	protected ModelAndView createListModelAndView(
			Collection<Order> orders, String requestURI, String uri) {
		ModelAndView result;

		result = new ModelAndView(uri);
		result.addObject("orders", orders);
		result.addObject("requestURI", requestURI);

		return result;
	}

}
