package services;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import domain.Artist;
import domain.Artwork;
import domain.Cart;
import domain.OrderLine;
import domain.Profit;
import domain.Status;
import domain.Tax;
import repositories.ArtworkRepository;
import security.Authority;
import security.LoginService;

@Service
@Transactional
public class ArtworkService {

	// Managed repository

	@Autowired
	private ArtworkRepository artworkRepository;

	// Supporting services
	@Autowired
	private OrderLineService orderLineService;
	@Autowired
	private CartService cartService;
	@Autowired
	private ArtistService artistService;
	@Autowired
	private TaxService taxService;
	@Autowired
	private ProfitService profitService;

	// Constructors

	public ArtworkService() {
		super();
	}

	// Simple CRUD methods

	public Artwork create() {
		Artwork result;
		Artist artist;
		Date moment;
		Status status;
		String ticker;
		ArrayList<Tax> taxes;
		Tax tax;


		result = new Artwork();

		moment = new Date(System.currentTimeMillis() - 10);
		status = Status.SALE;

		artist = artistService.checkPrincipal();

		ticker = numberGenerator() + "-" + stringGenerator();
		while (findByTicker(ticker) != null) {
			ticker = numberGenerator() + "-" + stringGenerator();
		}
		taxes = (ArrayList<Tax>) taxService.findAll();
		tax = taxes.get(0);
		
		
		result.setArtist(artist);
		result.setMoment(moment);
		result.setStatus(status);
		result.setTicker(ticker);
		result.setTax(tax);
		result.setDeleted(false);

		return result;
	}

	public Artwork findOne(int artworkId) {

		return artworkRepository.findOne(artworkId);
	}

	public Collection<Artwork> findAll() {

		return artworkRepository.findAll();
	}
	
	public Collection<Artwork> findAllNotDeleted() {

		return artworkRepository.findAllNotDeleted();
	}


	public Artwork save(Artwork artwork) {
		Artist artist;
		Date moment;
		String ticker;
		Artwork result;
		Double totalCost;
		Integer numberSales;
		Profit profit;
		Double profitNumber;
		Double taxNumber;
		byte[] picture;
		int length;

		artist = artistService.checkPrincipal();

		Assert.isTrue(artist.equals(artwork.getArtist()));
		Assert.isTrue(artwork.getStatus().equals(Status.SALE));
		Assert.isTrue(artwork.getDeleted()==false);
		Assert.isNull(artwork.getCart(),"artwork.must.not.cart");
		

		moment = new Date(System.currentTimeMillis() - 10);

		artwork.setMoment(moment);
		ticker = numberGenerator() + "-" + stringGenerator();
		while (findByTicker(ticker) != null) {
			ticker = numberGenerator() + "-" + stringGenerator();
		}
		if (artwork.getId() != 0 && artwork.getPicture().length == 0) {
			result = this.findOne(artwork.getId());
			artwork.setPicture(result.getPicture());
		}
		
		numberSales = this.findNumberOfSalesByArtist();
		
		profit = profitService.findProfitByNumberSalesByArtist(numberSales);
		profitNumber = profit.getValue()/100;
		taxNumber = artwork.getTax().getValue()/100;
		totalCost = (artwork.getPrice()+(artwork.getPrice()*taxNumber)+(artwork.getPrice()*profitNumber));
		totalCost = Math.round(totalCost*100)/100.0;
		
		artwork.setTicker(ticker);
		artwork.setTotalCost(totalCost);
		
		
		
		picture = artwork.getPicture();
		length = picture.length;
		
		Assert.isTrue(length != 0, "artwork.picture.notnull");
		
		artwork = artworkRepository.save(artwork);

		return artwork;
	}

	public void saveSimple(Artwork artwork) {
		artworkRepository.save(artwork);
	}

	public void delete(int artworkId) {
		Artist artist;
		Artwork artwork;

		artwork = this.findOne(artworkId);

		artist = artistService.checkPrincipal();

		Assert.isTrue(artwork.getArtist().equals(artist));
		Assert.isTrue(artwork.getStatus().equals(Status.SALE));
		Assert.isNull(artwork.getCart()==null,"artwork.must.not.cart");

		artworkRepository.delete(artwork);

	}

	public Collection<Artwork> findByArtist(int artistId) {
		Collection<Artwork> result;

		result = artworkRepository.findByArtist(artistId);

		return result;
	}

	public Artwork findByTicker(String ticker) {
		Artwork result;

		result = artworkRepository.findByTicker(ticker);

		return result;
	}

	// Other business methods

	public Artwork findArtworkByTicker(String ticker) {
		checkPurchaserRole();
		Artwork res = new Artwork();
		res = artworkRepository.findArtworkByTicker(ticker);
		return res;
	}

	public Collection<Artwork> findArtWorkPurchasedByMe() {
		checkPurchaserRole();
		Collection<OrderLine> orderLines = new ArrayList<OrderLine>();
		Collection<Artwork> res = new ArrayList<Artwork>();
		orderLines = orderLineService.findMyOrderLines();
		for (OrderLine o : orderLines) {
			String ticker = o.getTicker();
			Artwork artwork = artworkRepository.findArtworkByTicker(ticker);
			res.add(artwork);
		}
		return res;

	}

	public Collection<String> formatTags(Artwork artwork) {
		Collection<String> result;
		String tagsArtwork;
		String[] tagsArtworkArray;

		result = new ArrayList<String>();
		if (artwork.getTags() != null) {
			tagsArtwork = artwork.getTags();
			tagsArtworkArray = tagsArtwork.split(",");

			for (int i = 0; i < tagsArtworkArray.length; i++) {
				result.add(tagsArtworkArray[i]);
			}
		}

		return result;
	}

	public Collection<Artwork> findArtworkOnSale() {
		Collection<Artwork> res = new ArrayList<Artwork>();
		res = artworkRepository.findArtworkOnSale();
		return res;
	}

	public Collection<Artwork> findByKeywordService(String keyword) {
		Collection<Artwork> result;

		result = artworkRepository.findByKeywordService(keyword);

		return result;
	}

	public Collection<Artwork> findArtWorkInCart() {
		checkPurchaserRole();
		Collection<Artwork> result = new ArrayList<Artwork>();
		Cart cart = cartService.findMyCart();
		if (cart != null) {
			result = artworkRepository.findArtWorkInCart(cart.getId());
		}
		return result;
	}

	public Collection<Artwork> findArtworksByPrincipal() {
		Collection<Artwork> result;
		Artist artist;

		artist = artistService.checkPrincipal();

		result = artworkRepository.findByArtist(artist.getId());

		return result;
	}
	
	public Integer findNumberOfSalesByArtist() {
		Integer result;
		Artist artist;

		artist = artistService.checkPrincipal();

		result = artworkRepository.findNumberOfSalesByArtist(artist.getId());

		return result;
	}

	private String numberGenerator() {
		String result;
		String numbers;
		Random random;
		StringBuilder stringBuilder;

		numbers = "0123456789";
		random = new Random();
		stringBuilder = new StringBuilder(6);

		for (int i = 0; i < 6; i++)
			stringBuilder
					.append(numbers.charAt(random.nextInt(numbers.length())));

		result = stringBuilder.toString();

		return result;
	}

	private String stringGenerator() {
		String result;
		String string;
		Random random;
		StringBuilder stringBuilder;

		string = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_0123456789";
		random = new Random();
		stringBuilder = new StringBuilder(4);

		for (int i = 0; i < 4; i++) {
			stringBuilder
					.append(string.charAt(random.nextInt(string.length())));
		}

		result = stringBuilder.toString();

		return result;
	}

	// The artwork with the highest price that has not been sold yet
	public Collection<Artwork> findMostExpensiveOnSale() {
		checkAdminRole();
		Collection<Artwork> res = new ArrayList<Artwork>();
		res = artworkRepository.findMostExpensiveOnSale();
		return res;
	}
	
	
	public Status findStatus(int artworkId) {
		Status status;
		status=artworkRepository.findStatus(artworkId);
		return status;
	}
	
	public Integer findArtworkNotSoldInCart(int cartId) {
		checkPurchaserRole();
		Integer res;
		res=artworkRepository.findArtworkNotSoldInCart(cartId);
		return res;
	}
	

	public byte[] watermark(byte[] image) throws IOException{
		BufferedImage img = ImageIO.read(new ByteArrayInputStream(image));

		URL watermarkImageFile = this.getClass().getClassLoader().getResource("logo2.png");
//		URL url = new URL("https://dl.dropboxusercontent.com/u/48315908/watermark.png");
		BufferedImage watermarkImage = ImageIO.read(watermarkImageFile);
//		BufferedImage watermarkImage = ImageIO.read(url);
		
		int imgHeight;
		int imgWidth;
		int watermarkHeight;
		int watermarkWidth;
		
		imgHeight = (int) ((int) img.getHeight()*0.3);
		imgWidth = (int) ((int) img.getWidth()*0.3);
		
		
		
		
		BufferedImage resizedWatermark = resize(watermarkImage,imgWidth,imgHeight);

		// initializes necessary graphic properties
		Graphics2D g2d = (Graphics2D) img.getGraphics();
		AlphaComposite alphaChannel = AlphaComposite.getInstance(AlphaComposite.SRC_OVER, 0.4f);
		g2d.setComposite(alphaChannel);

		// calculates the coordinate where the image is painted
		int topLeftX = (img.getWidth() - resizedWatermark.getWidth()) / 2;
		int topLeftY = (img.getHeight() - resizedWatermark.getHeight()) / 2;

		// paints the image watermark
		g2d.drawImage(resizedWatermark, topLeftX, topLeftY, null);

		// Convertir imagen en byte[]
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(img, "png", baos);
		g2d.dispose();
		baos.flush();
		byte[] imageInByte = baos.toByteArray();
		baos.close();
		
		return imageInByte;
	}
	
	public static BufferedImage resize(BufferedImage bufferedImage, int newW, int newH) {
        int w = bufferedImage.getWidth();
        int h = bufferedImage.getHeight();
        BufferedImage imagenRedimensionada = new BufferedImage(newW, newH, bufferedImage.getType());
        Graphics2D g = imagenRedimensionada.createGraphics();
        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.drawImage(bufferedImage, 0, 0, newW, newH, 0, 0, w, h, null);
        g.dispose();
        return imagenRedimensionada;
    }

	// All checks----------------------------------------------------------

	public void checkPurchaserRole() {

		Authority Purchaser = new Authority();
		Purchaser.setAuthority(Authority.PURCHASER);

		Assert.isTrue(
				LoginService.getPrincipal().getAuthorities()
						.contains(Purchaser), "You're not an Purchaser user");
	}

	public void checkAdminRole() {
		Authority admin = new Authority();
		admin.setAuthority(Authority.ADMINISTRATOR);

		Assert.isTrue(
				LoginService.getPrincipal().getAuthorities().contains(admin),
				"You're not an ADMIN user");
	}



}