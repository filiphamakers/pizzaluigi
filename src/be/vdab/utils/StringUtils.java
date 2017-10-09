package be.vdab.utils;

import java.math.BigDecimal;

public class StringUtils {
	public static boolean isLong(String string) {
		try {
			Long.parseLong(string);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}

	public static boolean isBigDecimal(String string) {
		try {
			new BigDecimal(string);
			return true;
		} catch (NullPointerException|NumberFormatException e) {
			return false;
		}
	}
}
