package services;

import java.util.ArrayList;
import java.util.Collection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import domain.Purchaser;
import domain.Review;
import repositories.ReviewRepository;
import security.Authority;
import security.LoginService;

@Service
@Transactional
public class ReviewService {

	// Managed repository

	@Autowired
	private ReviewRepository reviewRepository;

	// Supporting services
	@Autowired
	private PurchaserService purchaserService;
	
	// Constructors

	public ReviewService() {
		super();
	}

	// Simple CRUD methods

	public Review create() {
		checkPurchaserRole();
		Review res = new Review();
		int purchaserId=LoginService.getPrincipal().getId();
		Purchaser purchaser=purchaserService.findOneByUserId(purchaserId);
		res.setPurchaser(purchaser);
		return res;
	}

	public Review findOne(int reviewId) {

		return reviewRepository.findOne(reviewId);
	}

	public Collection<Review> findAll() {

		return reviewRepository.findAll();
	}

	public void save(Review review) {
		checkPurchaserRole(); 	
		reviewRepository.save(review);
	}

	public void delete(Review review) {
		reviewRepository.delete(review);
		}

	

	// Other business methods
	
	public Collection<Review> findReviewsOfPurchaser(int purchaserId){
		checkAdminRole();
		Collection<Review> res=new ArrayList<Review>();
		res=reviewRepository.findReviewsOfPurchaser(purchaserId);
		return res;
	}
	
	public Collection<Review> findMyReviews(){
		checkPurchaserRole();
		Collection<Review> res=new ArrayList<Review>();
		res=reviewRepository.findMyReviews(LoginService.getPrincipal().getId());
		return res;
	}

	
	// All checks----------------------------------------------------------


	public void checkAdminRole() {

		Authority admin = new Authority();
		admin.setAuthority(Authority.ADMINISTRATOR);

		Assert.isTrue(LoginService.getPrincipal().getAuthorities().contains(admin), "You're not an ADMIN user");
	}

	public void checkPurchaserRole() {

		Authority Purchaser = new Authority();
		Purchaser.setAuthority(Authority.PURCHASER);

		Assert.isTrue(LoginService.getPrincipal().getAuthorities().contains(Purchaser), "You're not an Purchaser user");
	}
}