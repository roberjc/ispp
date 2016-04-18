package domain;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Access;
import javax.persistence.AccessType;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.Valid;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.data.annotation.Transient;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Access(AccessType.PROPERTY)
@Table(name="Orderr")
public class Order extends DomainEntity{
	
	// Constructors ------------------
	
	public Order(){
		super();
	}
	
	// Attributes ----------------------
	
	private double totalCost;
	private String taxName;
	private double taxValue;
	private Date moment;
	
	@Transient
	@Min(0)
	public double getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}
	@NotBlank
	public String getTaxName() {
		return taxName;
	}
	public void setTaxName(String taxName) {
		this.taxName = taxName;
	}
	
	
	@NotNull
	@Range(min = 1 , max = 100)
	public double getTaxValue() {
		return taxValue;
	}
	public void setTaxValue(double taxValue) {
		this.taxValue = taxValue;
	}	
	
	@NotNull
	@Past
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "dd/MM/yyyy")
	public Date getMoment() {
		return moment;
	}
	
	public void setMoment(Date moment) {
		this.moment = moment;
	}
	
	// Relationships ------------------------
	
	private Purchaser purchaser;
	private Collection<OrderLine> orderLines;
	
	@Valid
	@NotNull
	@ManyToOne(optional=false)
	public Purchaser getPurchaser() {
		return purchaser;
	}
	public void setPurchaser(Purchaser purchaser) {
		this.purchaser = purchaser;
	}
	
	@Valid
	@NotNull
	@OneToMany(cascade = CascadeType.ALL, mappedBy="order")
	public Collection<OrderLine> getOrderLines() {
		return orderLines;
	}
	public void setOrderLines(Collection<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

}
