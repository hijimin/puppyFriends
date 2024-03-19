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
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo")); 
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
		String memberPhone = request.getParameter("memberPhone");
//		int dogNo = Integer.parseInt(request.getParameter("dogNo"));
		String dogName = request.getParameter("dogName");
		String dogValue = request.getParameter("dogValue");
		int dogAge = Integer.parseInt(request.getParameter("dogAge"));
		String dogGender = request.getParameter("dogGender");
		String dogSize = request.getParameter("dogSize");
		String dogVaccine = request.getParameter("dogVaccine");
		String dogSignificant = request.getParameter("dogSignificant");
			
		
		
		Member m = new Member(memberNo, memberId, memberName, memberEmail, memberPhone, dogName, dogValue, dogSize, dogAge, dogGender, dogVaccine, dogSignificant);
			
		Member updateMem = new MemberService().updateMember(m);
		
		
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", updateMem);
		session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
		
		response.sendRedirect(request.getContextPath() + "/mypage");
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
