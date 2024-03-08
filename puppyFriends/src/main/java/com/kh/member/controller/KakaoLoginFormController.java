package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class KakaoLoginFormController
 */
@WebServlet("/kakaologin")
public class KakaoLoginFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KakaoLoginFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memberId = request.getParameter("id");
		String memberName = request.getParameter("nickname");
		String memberEmail = request.getParameter("email");
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberName(memberName);
		m.setEmail1(memberEmail);
		
		int count = new MemberService().idCheck(memberId);
		
		if(count > 0) { // 아이디가 db에 있음, 중복 => 로그인
			
			Member kakaoUser =  new MemberService().kakaoLoginMember(memberId, memberName, memberEmail);
			
			if(kakaoUser != null) { // kakaoUser에 값이 널이 아닐경우 => 뭐라도 들어있음
				HttpSession session = request.getSession();
				
				session.setAttribute("loginUser", kakaoUser);
				response.sendRedirect(request.getContextPath());
			}else { // 어디 null이 있다는 거겠지
				
			}
			
			
		}else { // 아이디가 db에 없으므로 => 회원가입 => 근데 강아지 정보 받는 곳으로 이동
			
			request.setAttribute("memberId", memberId);
			request.setAttribute("memberName", memberName);
			request.setAttribute("memberEmail", memberEmail);
			
			request.getRequestDispatcher("views/member/dogEnrollForm.jsp").forward(request, response);
			
			
			
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
