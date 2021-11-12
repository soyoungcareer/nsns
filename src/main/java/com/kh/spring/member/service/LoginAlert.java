package com.kh.spring.member.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class LoginAlert {
	
	public static void init(HttpServletResponse response) {
		response.setContentType("text/html; charset=euc-kr");
        response.setCharacterEncoding("euc-kr");
	}
	
	public static void alert(HttpServletResponse response, String alertText) throws IOException {
		
		init(response);
		String path = "login.mem";
		PrintWriter out = response.getWriter();
		out.println("<script>alert('로그인 중 오류가 발생하였습니다.'); location.href='" + path + "' </script>");
		out.close();
	}

}
