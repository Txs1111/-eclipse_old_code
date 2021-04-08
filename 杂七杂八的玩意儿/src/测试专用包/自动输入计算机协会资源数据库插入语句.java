package 测试专用包;

public class 自动输入计算机协会资源数据库插入语句 {
	public static void main(String[] args) {
		int number = 0;
		String a = null;
		String v = null;
		String ID = null;
		boolean ssssss = true;
		int yue = 1;
		while (ssssss) {
			yue = (int) (Math.random() / 0.1);
			if (yue <= 3 && yue > 0)
				ssssss = false;
		}
		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= 3; j++) {
				for (int o = -1; o <= 3; o++) {
					number++;
					switch (((int) (Math.random() / 0.1))) {
					case 0: {
						a = "链接：https://pan.baidu.com/s/1t7jWNLyhxTmh-ihmSFs-9g";
						v = "ap6l";
						ID = "000";
					}
						break;
					case 1: {
						a = "链接：https://pan.baidu.com/s/1fYHXOnHHkDYxPo4O8PHKbw";
						v = "8s8c";
						ID = "1";
						break;
					}
					case 2: {
						a = "链接：https://pan.baidu.com/s/1VUeoqh0-riVQAhxN2m9ytg";
						v = "evl7";
						ID = "201800001644";
						break;
					}
					case 3: {
						a = "链接：https://pan.baidu.com/s/1ucd_HjOjAn9IJVv-wEP6fw";
						v = "hokf";
						ID = "2019000101689";
						break;
					}
					case 4: {
						a = "链接：https://pan.baidu.com/s/1xLT8YNtaVQY2fObe5UrIuA";
						v = "l1l9";
						ID = "2019000101884";
						break;
					}

					case 5: {
						a = "链接：https://pan.baidu.com/s/1IRRmD99NPSYFJObIp27_mg";
						v = "i9z6";
						ID = "201900010190";
						break;
					}
					case 6: {
						a = "链接：https://pan.baidu.com/s/130o9ba650lMjaOdOCLpHzQ";
						v = "bhru";
						ID = "2019000101906";
						break;
					}
					case 7: {
						a = "链接：https://pan.baidu.com/s/1efcHQS0eT0vr8hAHPreO1w";
						v = "4y41";
						ID = "202000058";
						break;
					}
					case 8: {
						a = "链接：https://pan.baidu.com/s/1KcewAv_ZwRQwMjUYX6duuA";
						v = "alyo";
						ID = "202001715";
						break;
					}
					case 9: {
						a = "链接：https://pan.baidu.com/s/1Hd5upTGrFcQHeS2eR296jg";
						v = "zsyt";
						ID = "202003423";
						break;
					}

					}
					System.out.println(
							"INSERT INTO `PCAstu`.`learning_resource`(`ID`, `title`, `content`,`verification`, `time`, `type`, `path`, `ifcheck`) VALUES ('"
									+ ID + "', '资源" + number + "', '" + a + "', '" + v + "','2021-03-13 04:18:19'," + i
									+ " ," + j + " , " + o + ");");
				}
			}
		}

	}

	public static void content(String a, String v, String ID) {
		switch (((int) (Math.random() / 0.1))) {
		case 0: {
			a = "链接：https://pan.baidu.com/s/1t7jWNLyhxTmh-ihmSFs-9g";
			v = "ap6l";
			ID = "000";
		}
			break;
		case 1: {
			a = "链接：https://pan.baidu.com/s/1fYHXOnHHkDYxPo4O8PHKbw";
			v = "8s8c";
			ID = "1";
			break;
		}
		case 2: {
			a = "链接：https://pan.baidu.com/s/1VUeoqh0-riVQAhxN2m9ytg";
			v = "evl7";
			ID = "201800001644";
			break;
		}
		case 3: {
			a = "链接：https://pan.baidu.com/s/1ucd_HjOjAn9IJVv-wEP6fw";
			v = "hokf";
			ID = "2019000101689";
			break;
		}
		case 4: {
			a = "链接：https://pan.baidu.com/s/1xLT8YNtaVQY2fObe5UrIuA";
			v = "l1l9";
			ID = "2019000101884";
			break;
		}

		case 5: {
			a = "链接：https://pan.baidu.com/s/1IRRmD99NPSYFJObIp27_mg";
			v = "i9z6";
			ID = "201900010190";
			break;
		}
		case 6: {
			a = "链接：https://pan.baidu.com/s/130o9ba650lMjaOdOCLpHzQ";
			v = "bhru";
			ID = "2019000101906";
			break;
		}
		case 7: {
			a = "链接：https://pan.baidu.com/s/1efcHQS0eT0vr8hAHPreO1w";
			v = "4y41";
			ID = "202000058";
			break;
		}
		case 8: {
			a = "链接：https://pan.baidu.com/s/1KcewAv_ZwRQwMjUYX6duuA";
			v = "alyo";
			ID = "202001715";
			break;
		}
		case 9: {
			a = "链接：https://pan.baidu.com/s/1Hd5upTGrFcQHeS2eR296jg";
			v = "zsyt";
			ID = "202003423";
			break;
		}

		}
		System.err.println(((int) (Math.random() / 0.1)));
	}
}
