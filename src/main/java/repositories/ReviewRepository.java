package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Review;

@Repository
public interface ReviewRepository extends JpaRepository<Review,Integer>{
	
	
	@Query("select p.reviews from Purchaser p where p.id = ?1")
	Collection<Review> findReviewsOfPurchaser(int purchaserId);
		
	@Query("select p.reviews from Purchaser p where p.userAccount.id = ?1")
	Collection<Review> findMyReviews(int userAccountId);

}