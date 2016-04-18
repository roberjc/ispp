package controllers.admin;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import controllers.AbstractController;
import domain.Artist;
import domain.Artwork;
import domain.Purchaser;
import services.ArtistService;
import services.ArtworkService;
import services.OrderService;
import services.PurchaserService;

@Controller
@RequestMapping("/dashboard/admin")
public class DashboardAdminController extends AbstractController {

	// Services ----------------------------------------------------------------
	@Autowired
	private ArtistService artistService;

	@Autowired
	private PurchaserService purchaserService;

	@Autowired
	private ArtworkService artworkService;

	@Autowired
	private OrderService orderService;

	// Constructors -----------------------------------------------------------
	public DashboardAdminController() {
		super();
	}

	// Home menu -----------------------------------------------
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public ModelAndView home() {
		ModelAndView result;

		Collection<Artist> highestRateArtists;
		Double numberHighestRateArtists;
		Collection<Artist> moreArtworksSoldArtists;
		Integer numberMoreArtworksSoldArtists;
		Collection<Artist> artistsEarnedMoreMoney;
		Double quantityArtistEarnedMoreMoney;
		Collection<Object> purchaserSpendMoreMoney;
		Collection<Purchaser> moreArtworksBought;
		Collection<Artwork> mostExpensiveOnSale;
		Integer totalPurchasers;
		Integer totalArtists;
		Integer totalOnSaleArtworks;
		Collection<Artwork> onSaleArtworks;
		Collection<Artwork> soldArtworks;
		Integer totalsoldArtworks;
		Integer totalOrders;

		highestRateArtists = artistService.findHighestRateArtists();
		numberHighestRateArtists = artistService.findNumberHighestRateArtists();
		moreArtworksSoldArtists = artistService.findMoreArtworksSoldArtists();
		numberMoreArtworksSoldArtists = artistService.findNumberMoreArtworksSoldArtists();
		artistsEarnedMoreMoney = artistService.findArtistEarnedMoreMoney();
		quantityArtistEarnedMoreMoney = artistService.findQuantityArtistEarnedMoreMoney();
		purchaserSpendMoreMoney = purchaserService.findPurchaserSpendMoreMoney();
		moreArtworksBought = purchaserService.findPurchaserMoreArtworkBought();
		mostExpensiveOnSale = artworkService.findMostExpensiveOnSale();
		totalPurchasers = purchaserService.findAll().size();
		totalArtists = artistService.findAll().size();
		totalOnSaleArtworks = artworkService.findArtworkOnSale().size();
		soldArtworks = artworkService.findAll();
		onSaleArtworks = artworkService.findArtworkOnSale();
		soldArtworks.removeAll(onSaleArtworks);
		totalsoldArtworks = soldArtworks.size();
		totalOrders = orderService.findAll().size();

		String out1 = "";
		for (Object a : purchaserSpendMoreMoney) {
			Object[] arr = (Object[]) a;
			if (arr[0] == null) {
				out1 = "[]";
			} else {
				out1 += "Purchaser: " + arr[0].toString() + ", total cost: " + arr[1].toString() + "\n";

			}
		}

		result = new ModelAndView("administrator/home");

		result.addObject("highestRateArtists", highestRateArtists);
		result.addObject("numberHighestRateArtists", numberHighestRateArtists);
		result.addObject("moreArtworksSoldArtists", moreArtworksSoldArtists);
		result.addObject("numberMoreArtworksSoldArtists", numberMoreArtworksSoldArtists);
		result.addObject("artistsEarnedMoreMoney", artistsEarnedMoreMoney);
		result.addObject("quantityArtistEarnedMoreMoney", quantityArtistEarnedMoreMoney);
		result.addObject("purchaserSpendMoreMoney", out1);
		result.addObject("moreArtworksBought", moreArtworksBought);
		result.addObject("mostExpensiveOnSale", mostExpensiveOnSale);
		result.addObject("totalPurchasers", totalPurchasers);
		result.addObject("totalArtists", totalArtists);
		result.addObject("totalOnSaleArtworks", totalOnSaleArtworks);
		result.addObject("totalsoldArtworks", totalsoldArtworks);
		result.addObject("totalOrders", totalOrders);

		return result;

	}

	// Purchaser menu -----------------------------------------------
	@RequestMapping(value = "/purchasers", method = RequestMethod.GET)
	public ModelAndView purchasers() {
		ModelAndView result;

		result = new ModelAndView("administrator/purchasers");

		return result;

	}

	// Artist menu -----------------------------------------------
	@RequestMapping(value = "/artists", method = RequestMethod.GET)
	public ModelAndView artists() {
		ModelAndView result;

		result = new ModelAndView("administrator/artists");

		return result;

	}

	// On sale artworks menu -----------------------------------------------
	@RequestMapping(value = "/onSaleArtworks", method = RequestMethod.GET)
	public ModelAndView onSaleArtworks() {
		ModelAndView result;
		Collection<Artwork> onSaleArtworks;

		onSaleArtworks = artworkService.findArtworkOnSale();

		result = new ModelAndView("administrator/onSaleArtworks");

		result.addObject("onSaleArtworks", onSaleArtworks);

		return result;

	}

	// sold artworks menu -----------------------------------------------
	@RequestMapping(value = "/soldArtworks", method = RequestMethod.GET)
	public ModelAndView soldArtworks() {
		ModelAndView result;
		Collection<Artwork> onSaleArtworks;
		Collection<Artwork> soldArtworks;

		soldArtworks = artworkService.findAll();
		onSaleArtworks = artworkService.findArtworkOnSale();
		soldArtworks.removeAll(onSaleArtworks);

		result = new ModelAndView("administrator/soldArtworks");

		result.addObject("soldArtworks", soldArtworks);

		return result;

	}

	// Order menu -----------------------------------------------
	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public ModelAndView orders() {
		ModelAndView result;

		result = new ModelAndView("administrator/orders");

		return result;

	}

}