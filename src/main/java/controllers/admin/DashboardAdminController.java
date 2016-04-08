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

	// Constructors -----------------------------------------------------------
	public DashboardAdminController() {
		super();
	}

	// Listing-----------------------------------------------------------------
	
	
	@RequestMapping(value = "/dashboard", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		String requestURI;
		Collection<Artist> highestRateArtists;
		Double numberHighestRateArtists;
		Collection<Artist> moreArtworksSoldArtists;
		Integer numberMoreArtworksSoldArtists;
		Collection<Artist> artistsEarnedMoreMoney;
		Double quantityArtistEarnedMoreMoney;
		Collection<Object> purchaserSpendMoreMoney;
		Collection<Purchaser> moreArtworksBought;
		Collection<Artwork> mostExpensiveOnSale;
		
		highestRateArtists = artistService.findHighestRateArtists();
		numberHighestRateArtists = artistService.findNumberHighestRateArtists();
		moreArtworksSoldArtists = artistService.findMoreArtworksSoldArtists();
		numberMoreArtworksSoldArtists = artistService.findNumberMoreArtworksSoldArtists();
		artistsEarnedMoreMoney = artistService.findArtistEarnedMoreMoney();
		quantityArtistEarnedMoreMoney = artistService.findQuantityArtistEarnedMoreMoney();
		purchaserSpendMoreMoney = purchaserService.findPurchaserSpendMoreMoney();
		moreArtworksBought = purchaserService.findPurchaserMoreArtworkBought();
		mostExpensiveOnSale = artworkService.findMostExpensiveOnSale();
		
		String out1="";
		for(Object a:purchaserSpendMoreMoney){
			Object[] arr = (Object[])a;
			if(arr[0]==null){
				out1="[]";
			}else{
			out1 += "Purchaser: "+arr[0].toString() +", total cost: "+ arr[1].toString()+"\n";
			
			}
			
		}		
		
	
		
		
		
		
		
		requestURI="dashboard/admin/dashboard.do";
				
		
		
		
		result = new ModelAndView("administrator/dashboard");
		
		result.addObject("requestURI",requestURI);
		result.addObject("highestRateArtists",highestRateArtists);
		result.addObject("numberHighestRateArtists",numberHighestRateArtists);
		result.addObject("moreArtworksSoldArtists",moreArtworksSoldArtists);
		result.addObject("numberMoreArtworksSoldArtists",numberMoreArtworksSoldArtists);
		result.addObject("artistsEarnedMoreMoney",artistsEarnedMoreMoney);
		result.addObject("quantityArtistEarnedMoreMoney",quantityArtistEarnedMoreMoney);
		result.addObject("purchaserSpendMoreMoney",out1);
		result.addObject("moreArtworksBought",moreArtworksBought);
		result.addObject("mostExpensiveOnSale",mostExpensiveOnSale);
		
		return result;
	
	}
	
	// Creation ---------------------------------------------------------------

	// Edition------------------------------------------------------------------------

	// Other bussiness method
	// ---------------------------------------------------------------


	

}