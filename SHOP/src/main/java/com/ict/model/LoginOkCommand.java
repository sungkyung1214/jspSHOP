package com.ict.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ict.db.DAO;
import com.ict.db.MemberVO;

public class LoginOkCommand implements Command{
	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		//파라미터값이 넘어오면 일단 그걸 받아야해서 스트링 엠 아이디는~
		//파리미터가 두개 이상이면 vo 아니면 맵에 넣는다
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		MemberVO mvo = new MemberVO();
		mvo.setM_id(m_id);
		mvo.setM_pw(m_pw);
		MemberVO m_vo = DAO.getLogIn(mvo);
		if(mvo != null) {
			// 관리자와 일반회원 분류
			// 보통 로그인 정보는 세션에 관리.(노출되면 안되니까)
			request.getSession().setAttribute("m_vo", m_vo);
			request.getSession().setAttribute("login", "ok");
			
			if(m_vo.getM_id().equals("admin") && m_vo.getM_pw().equals("admin")) {
				request.getSession().setAttribute("admin", "ok");
				return "MyController?cmd=admin";
			}
		}else {
			return "MyController?cmd=login";
		}
		
		return "MyController?cmd=list";
	}
}
