package com.test.jsp;

import java.util.Random;

public class MyUtil {
	public int getNum() {
		Random ran = new Random();
		int num = ran.nextInt(100);
		num *= 2;
		return num;
	}
}