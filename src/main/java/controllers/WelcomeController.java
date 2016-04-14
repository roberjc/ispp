/* WelcomeController.java
 *
 * Copyright (C) 2014 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 * 
 */

package controllers;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import domain.Artwork;
import security.Authority;
import security.LoginService;
import services.ArtworkService;
import services.CartService;

@Controller
@RequestMapping("/welcome")
public class WelcomeController extends AbstractController {

	@Autowired
	ArtworkService artworkService;

	@Autowired
	CartService cartService;

	// Constructors -----------------------------------------------------------

	public WelcomeController() {
		super();
	}

	// Index ------------------------------------------------------------------

	@RequestMapping(value = "/index")
	public ModelAndView index(@RequestParam(required = false, defaultValue = "John Doe") String name) {
		ModelAndView result;
		SimpleDateFormat formatter;
		String moment;
		Collection<Artwork> artworks;

		formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm");
		moment = formatter.format(new Date());
		artworks = artworkService.findArtworkOnSale();

		result = new ModelAndView("welcome/index");
		result.addObject("name", name);
		result.addObject("moment", moment);
		result.addObject("artworks", artworks);

		if (LoginService.hasPrincipal() == true) {
			if (LoginService.getPrincipal().getAuthorities().toArray()[0].toString().equals(Authority.PURCHASER.toString())) {
				Integer amountCart = 0;

				if (cartService.findMyCart().getArtworks().size() == 0)
					result.addObject("amountCart", 0);
				else {
					amountCart = cartService.findMyCart().getArtworks().size();
					result.addObject("amountCart", amountCart);
				}
			}
		}

		return result;
	}

}