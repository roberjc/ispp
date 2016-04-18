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
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
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
	public ModelAndView index(HttpServletResponse response) {
		ModelAndView result;
		Collection<Artwork> artworks;

		artworks = artworkService.findArtworkOnSale();

		result = new ModelAndView("welcome/index");
		result.addObject("artworks", artworks);

		// if (LoginService.hasPrincipal() == true) {
		// List<Authority> authorities = new ArrayList
		// (LoginService.getPrincipal().getAuthorities());
		// String authority=authorities.get(0).getAuthority();
		//
		// if (authority.equals(Authority.PURCHASER.toString())) {
		// Integer amountCart = 0;
		//
		// if (cartService.findMyCart().getArtworks().size() == 0)
		// result.addObject("amountCart", 0);
		// else {
		// amountCart = cartService.findMyCart().getArtworks().size();
		// result.addObject("amountCart", amountCart);
		// }
		// }
		// }

		if (LoginService.hasPrincipal() == true) {
			List<Authority> authorities = new ArrayList(LoginService.getPrincipal().getAuthorities());
			String authority = authorities.get(0).getAuthority();

			if (authority.equals(Authority.PURCHASER.toString())) {
//				Integer amountCart = 0;
				Cookie cartAmountCookie;

				if (cartService.findMyCart().getArtworks().size() == 0)
					// result.addObject("amountCart", 0);
					cartAmountCookie = new Cookie("cartAmount", "0");
				else {
					// amountCart =
					// cartService.findMyCart().getArtworks().size();
					// result.addObject("amountCart", amountCart);
					cartAmountCookie = new Cookie("cartAmount",
							new Integer(cartService.findMyCart().getArtworks().size()).toString());

				}
				cartAmountCookie.setMaxAge(60 * 60 * 24 * 365);
				response.addCookie(cartAmountCookie);

			}
		}

		return result;
	}

}