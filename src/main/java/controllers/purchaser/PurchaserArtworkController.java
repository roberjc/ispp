package controllers.purchaser;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import controllers.AbstractController;
import domain.Artwork;
import domain.Cart;
import security.Authority;
import security.LoginService;
import services.ArtworkService;
import services.CartService;

@Controller
@RequestMapping("/artwork/purchaser")
public class PurchaserArtworkController extends AbstractController {

	// Services ----------------------------------------------------------------
	@Autowired
	private ArtworkService artworkService;

	@Autowired
	private CartService cartService;

	// Constructors -----------------------------------------------------------
	public PurchaserArtworkController() {
		super();
	}

	// Listing-----------------------------------------------------------------
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		Collection<Artwork> artworks;
		String cancelURI;

		artworks = artworkService.findArtWorkPurchasedByMe();
		cancelURI = "welcome/index.do";

		String uri = "artwork/purchaser/list";
		String requestURI = "artwork/purchaser/list.do";
		result = createListModelAndView(artworks, requestURI, uri);
		result.addObject("cancelURI", cancelURI);

		return result;
	}

	@RequestMapping(value = "/listInCart", method = RequestMethod.GET)
	public ModelAndView listInCart() {
		ModelAndView result;
		Collection<Artwork> artworks;
		String cancelURI;
		Cart cart;
		Double totalCost = 0.0;

		cart = cartService.findMyCart();

		artworks = artworkService.findArtWorkInCart();
		cancelURI = "welcome/index.do";

		String uri = "artwork/purchaser/listInCart";
		String requestURI = "artwork/purchaser/listInCart.do";
		result = createListModelAndView(artworks, requestURI, uri);

		result.addObject("cancelURI", cancelURI);
		result.addObject("cart", cart);
		if (cart != null) {
			totalCost = cartService.calculateTotalCost(cart);
		}
		result.addObject("totalCost", totalCost);

		return result;
	}

	@RequestMapping(value = "/listOnSale", method = RequestMethod.GET)
	public ModelAndView listOnSale() {
		ModelAndView result;
		Collection<Artwork> artworks;
		String keywordURI;
		String cancelURI;

		artworks = artworkService.findArtworkOnSale();
		keywordURI = "artwork/listByKeyword.do";
		cancelURI = "welcome/index.do";

		String uri = "artwork/purchaser/listOnSale";
		String requestURI = "artwork/purchaser/listOnSale.do";

		result = createListModelAndView(artworks, requestURI, uri);
		result.addObject("keywordURI", keywordURI);
		result.addObject("cancelURI", cancelURI);

		return result;
	}

	// Creation ---------------------------------------------------------------

	// Edition------------------------------------------------------------------------

	// Other bussiness method
	// ---------------------------------------------------------------
	protected ModelAndView createListModelAndView(Collection<Artwork> artworks, String requestURI, String uri) {
		ModelAndView result;

		result = new ModelAndView(uri);
		result.addObject("artworks", artworks);
		result.addObject("requestURI", requestURI);

		return result;
	}

}