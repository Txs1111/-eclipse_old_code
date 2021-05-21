package dao;

import java.sql.ResultSet;

public class Tool {
	public static boolean isNull(String data) {
		/**
		 * 判断值是否为空，空返回true，非空则返回false。
		 */
		if (data.equals("") || data == null) {
			return true;
		} else {
			return false;
		}

	}

	public static boolean isNull(ResultSet result) {
		// TODO Auto-generated method stub
		if (result.equals("") || result == null) {
			return true;
		} else {
			return false;
		}
	}

	// 限制字符串函数 输入字符串和限定字数
	public String limit(String tittle, int x) {
		if (tittle.length() > x) {
			tittle = tittle.substring(0, x - 1) + "...";
		}
		return tittle;
	}
}
