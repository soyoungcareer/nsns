package com.kh.spring.common.interceptor;

import java.net.InetAddress;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.spring.member.model.vo.Member;

public class BlistInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(BlistInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		Member loginUser = (Member) session.getAttribute("loginUser");

		if (loginUser == null) {
			logger.info("��α��λ��¿���[ "+ request.getRequestURI() + " ] ���ٽõ�!!");
			
			session.setAttribute("msg", "�α����� �̿��ϼ���");
			response.sendRedirect("/spring");
			return false;
			
		}
			return true;
		

	}

}
