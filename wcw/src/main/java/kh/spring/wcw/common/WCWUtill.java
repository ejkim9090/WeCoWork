package kh.spring.wcw.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;

@Component
public class WCWUtill {
	public static String getClientIP(HttpServletRequest request) {
//	    String ip = request.getHeader("X-Forwarded-For");
		String ip = request.getRemoteAddr();
//	    if (ip == null) {
//	        ip = request.getHeader("Proxy-Client-IP");
//	    }
//	    if (ip == null) {
//	        ip = request.getHeader("WL-Proxy-Client-IP");
//	    }
//	    if (ip == null) {
//	        ip = request.getHeader("HTTP_CLIENT_IP");
//	    }
//	    if (ip == null) {
//	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
//	    }
//	    if (ip == null) {
//	        ip = request.getRemoteAddr();
//	    }

	    return ip;
	}
}
