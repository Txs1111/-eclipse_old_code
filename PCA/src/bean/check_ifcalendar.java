package bean;

import java.util.StringTokenizer;

public class check_ifcalendar {

	public boolean check(int day, String all) {
		boolean result = false;
		StringTokenizer chart = new StringTokenizer(all, "_");
		int num = chart.countTokens();

		for (int a = 0; a < num; a++) {
			if (day == Integer.parseInt(chart.nextToken())) {
				result = true;
				break;
			}
		}
		return result;
	}
}
