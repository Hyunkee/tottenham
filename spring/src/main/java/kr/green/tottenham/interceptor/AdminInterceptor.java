package kr.green.tottenham.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.green.tottenham.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, 
			HttpServletResponse response, 
			Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		MemberVO user = (MemberVO)session.getAttribute("user");
		//Object user = session.getAttribute("user");
		if(user == null || !user.getAuthority().equals("ADMIN")) {
			response.sendRedirect(request.getContextPath()+"/"); // response : 반응한다
		}
		return true;
	}
}
