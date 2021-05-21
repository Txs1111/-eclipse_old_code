package bean;

import java.util.Date;
import java.text.SimpleDateFormat;

public class Handle_date {
	Date date = new Date();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy��MM��dd�� HHʱmm��ss��");

	public String getDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String dateFormat = simpleDateFormat.format(date);
		return dateFormat;
	}

	public String getIntDate() {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateFormat = simpleDateFormat.format(date);
		return dateFormat;
	}

	public String getDay() {
		String day = String.format("%td", date);
		return day;
	}

	public int getIntDay() {
		int day = Integer.parseInt(String.format("%td", date));
		return day;
	}

	public String getMonth() {
		String month = String.format("%tB", date);
		if (month.equals("һ��")|| month.equals("January")) {
			month = "01";
		}
		if (month.equals("����")|| month.equals("February")) {
			month = "02";
		}
		if (month.equals("����")|| month.equals("March")) {
			month = "03";
		}
		if (month.equals("����")|| month.equals("April")) {
			month = "04";
		}
		if (month.equals("����")|| month.equals("May")) {
			month = "05";
		}
		if (month.equals("����")|| month.equals("June")) {
			month = "06";
		}
		if (month.equals("����")|| month.equals("July")) {
			month = "07";
		}
		if (month.equals("����")|| month.equals("August")) {
			month = "08";
		}
		if (month.equals("����")|| month.equals("September")) {
			month = "09";
		}
		if (month.equals("ʮ��")|| month.equals("October")) {
			month = "10";
		}
		if (month.equals("ʮһ��")|| month.equals("November")) {
			month = "11";
		}
		if (month.equals("ʮ����")|| month.equals("December")) {
			month = "12";
		}
		return month;
	}

	public int getIntMonth() {
		String month = String.format("%tB", date);
		int result = 0;
		if (month.equals("һ��") || month.equals("January")) {
			result = 1;
		}
		if (month.equals("����") || month.equals("February")) {
			result = 2;
		}
		if (month.equals("����") || month.equals("March")) {
			result = 3;
		}
		if (month.equals("����") || month.equals("April")) {
			result = 4;
		}
		if (month.equals("����") || month.equals("May")) {
			result = 5;
		}
		if (month.equals("����") || month.equals("June")) {
			result = 6;
		}
		if (month.equals("����") || month.equals("July")) {
			result = 7;
		}
		if (month.equals("����") || month.equals("August")) {
			result = 8;
		}
		if (month.equals("����") || month.equals("September")) {
			result = 9;
		}
		if (month.equals("ʮ��") || month.equals("October")) {
			result = 10;
		}
		if (month.equals("ʮһ��") || month.equals("November")) {
			result = 11;
		}
		if (month.equals("ʮ����") || month.equals("December")) {
			result = 12;
		}
		return result;
	}

	public String getyear() {
		String year = String.format("%tY", date);
		return year;
	}

	public int getIntyear() {
		int year = Integer.parseInt(String.format("%tY", date));
		return year;
	}

	public String getFullDate() {
		String dateFormat = simpleDateFormat.format(date);
		return dateFormat;
	}

}
