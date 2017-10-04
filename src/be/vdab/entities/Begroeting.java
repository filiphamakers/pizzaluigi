package be.vdab.entities;

import java.time.LocalDateTime;

public class Begroeting {
	@Override
	public String toString() {
		int uur = LocalDateTime.now().getHour();
		return uur >= 6 && uur < 12 ? "Goeiemorgen" : uur >= 12 && uur < 18 ? "Goeiemiddag" : "Goeieavond";
	}
}
