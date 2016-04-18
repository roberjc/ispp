package controllers;

import java.util.Collection;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import domain.Artist;

import forms.ArtistForm;
import services.ArtistService;

@Controller
@RequestMapping("/artist")
public class ArtistController extends AbstractController {

	// Services ----------------------------------------------------------------
	@Autowired
	private ArtistService artistService;

	// Constructors -----------------------------------------------------------
	public ArtistController() {
		super();
	}

	// Listing-------------------------------------------------------------------
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView result;
		String requestURI;
		String cancelURI;
		Collection<Artist> artists;

	
		artists = artistService.findAll();

		requestURI = "artist/list.do";
		cancelURI = "welcome/index.do";


		result = new ModelAndView("artist/list");
		result.addObject("artists", artists);
		result.addObject("requestURI", requestURI);
		result.addObject("cancelURI", cancelURI);

		return result;

	

	}


	// Creation ---------------------------------------------------------------
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView result;
		ArtistForm artistForm;

		artistForm = artistService.construct();

		result = new ModelAndView("artist/register");
		result.addObject("artistForm", artistForm);

		return result;
	}

	// Edition------------------------------------------------------------------------
	@RequestMapping(value = "/edit", method = RequestMethod.POST, params = "save")
	public ModelAndView save(@Valid ArtistForm artistForm, BindingResult binding) {
		ModelAndView result;
		if (binding.hasErrors()) {
			System.out.println(binding.getAllErrors().get(0));
			result = createEditModelAndView(artistForm, null);
		} else {
			try {
				artistService.deconstruct(artistForm);
				result = new ModelAndView("redirect:/welcome/login.do");
			} catch (org.springframework.dao.DataIntegrityViolationException oops) {
				result = createEditModelAndView(artistForm, "customer.error.duplicate");
			} catch (Throwable oops) {
				result = createEditModelAndView(artistForm, oops.getMessage());

			}
		}

		return result;
	}

	// Other bussiness method
	// ------------------------ ---------------------------------------
	protected ModelAndView createEditModelAndView(ArtistForm artistForm, String message) {

		ModelAndView result;

		result = new ModelAndView("artist/register");
		result.addObject("message", message);

		return result;
	}

}