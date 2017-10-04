package be.vdab.entities;

import java.math.BigDecimal;

public class Pizza {
	private long id;
	private String naam;
	private BigDecimal prijs;
	private boolean pikant;

	public Pizza(String naam, BigDecimal prijs, boolean pikant) {
		this.naam = naam;
		this.prijs = prijs;
		this.pikant = pikant;
	}

	public Pizza(long id, String naam, BigDecimal prijs, boolean pikant) {
		this(naam, prijs, pikant);
		this.id = id;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getNaam() {
		return naam;
	}

	public static boolean isNaamValid(String naam) {
		return naam != null && !naam.trim().isEmpty();
	}

	public void setNaam(String naam) {
		if (isNaamValid(naam)) {
			this.naam = naam;
		} else
			throw new IllegalArgumentException();

	}

	public static boolean isPrijsValid(BigDecimal prijs) {
		return prijs != null && prijs.compareTo(BigDecimal.ZERO) >= 0;
	}

	public BigDecimal getPrijs() {
		return prijs;
	}

	public void setPrijs(BigDecimal prijs) {
		if (isPrijsValid(prijs)) {
			this.prijs = prijs;
		} else
			throw new IllegalArgumentException();
		
	}

	public boolean isPikant() {
		return pikant;
	}

	public void setPikant(boolean pikant) {
		this.pikant = pikant;
	}

}
