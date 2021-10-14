package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.spring.member.controller.MemberController;

public class TestInterceptor extends HandlerInterceptorAdapter {

	private static final Logger logger = LoggerFactory.getLogger(TestInterceptor.class);

	// �信�� ��û -->filter--> DispatcherServlet -- ���ͼ��� --> Controller --> Service --> Dao --> DB
		//								         <-- ���ͼ��� --  Controller <-- Service <-- Dao <-- DB

	
	//DispatcherServlet �� ��Ʈ�ѷ��� ȣ���ϱ� ���� ����
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		
		logger.debug("========== START ==========");
		logger.debug(request.getRequestURI());
		

		return super.preHandle(request, response, handler);
	}

	//��Ʈ�ѷ�����  DispatcherServlet ���� ���ϵǴ� ���� ����ȴ�.
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
		logger.debug("========== postHandle ==========");
		
		super.postHandle(request, response, handler, modelAndView);
	}

	//��������� �����ϴ� ���� ������ ����۾��� �Ϸ�� �� ���ҽ��� ��ȯ���ֱ� ���� ����ȴ�.
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
		logger.debug("========== afterCompletion END ==========");
		
		super.afterCompletion(request, response, handler, ex);
	}
	
	
}

