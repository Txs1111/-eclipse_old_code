package dao;

import java.sql.ResultSet;

public class Tool {
	public static boolean isNull(String data) {
		/**
		 * �ж�ֵ�Ƿ�Ϊ�գ��շ���true���ǿ��򷵻�false��
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

	// �����ַ������� �����ַ������޶�����
	public String limit(String tittle, int x) {
		if (tittle.length() > x) {
			tittle = tittle.substring(0, x - 1) + "...";
		}
		return tittle;
	}
}
