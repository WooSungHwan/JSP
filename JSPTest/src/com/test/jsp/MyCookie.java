package com.test.jsp;

import javax.servlet.http.Cookie;

public class MyCookie {

	public static String getCookie(Cookie[] list, String key) {
		
		for(Cookie cookie : list) {
			if(cookie.getName().equals(key)) {
				return cookie.getValue();
						
			}
		}
		return null;
	}
	
}
