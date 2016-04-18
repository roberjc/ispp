package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.Order;

@Repository
public interface OrderRepository extends JpaRepository<Order,Integer>{

	@Query("select o from Order o where o.purchaser.userAccount.id=?1")
	Collection<Order> findMyOrders(int userAccount);
	

}
