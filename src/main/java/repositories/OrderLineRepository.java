package repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import domain.OrderLine;

@Repository
public interface OrderLineRepository extends JpaRepository<OrderLine,Integer>{

	@Query("select o.orderLines from Order o where o.id=?1")
	Collection<OrderLine> findOrderLinesOfOrder(int orderId);
	
	@Query("select o.orderLines from Order o where o.purchaser.userAccount.id=?1")
	Collection<OrderLine> findMyOrderLines(int userAccountId);
	

}