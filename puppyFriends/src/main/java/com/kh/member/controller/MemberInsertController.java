package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Dog;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.me")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberPwd = "";
		String memberPhone = "";
		
		// 회원 정보 추가용 키:벨류
		String memberId = request.getParameter("memberId");
		if(request.getParameter("memberPwd") != null) {
			memberPwd = request.getParameter("memberPwd");			
		}
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
		if(request.getParameter("memberPhone") != null) {
			memberPhone = request.getParameter("memberPhone");
		}
		
	
		// 반려견 정보 추가용 키:벨류
		String dogName = request.getParameter("dogName");
		String dogValue = request.getParameter("dogValue");
		String dogSize = request.getParameter("dogSize");
		int dogAge = Integer.parseInt(request.getParameter("dogAge"));
		String gender = request.getParameter("gender");
		String vaccine = request.getParameter("vaccine");
		String dogSignificant = request.getParameter("dogSignificant");
		
		// 아이디, 비번, 이름, 이메일, 번호 정보 가진 회원 
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPwd(memberPwd);
		m.setMemberName(memberName);
		m.setMemberEmail(memberEmail);
		m.setMemberPhone(memberPhone);
				
		
		
		// 이름, 종, 나이, 성별, 접종, 특이사항 정보 가진 반려견
		Dog d = new Dog();
		d.setDogName(dogName);
		d.setDogValue(dogValue);
		d.setDogSize(dogSize);
		d.setDogAge(dogAge);
		d.setDogGender(gender);
		d.setDogVaccine(vaccine);
		d.setDogSignificant(dogSignificant);
		
		
	
			int result = new MemberService().insertMember(m, d);
			
			if(result>0) { // 성공
				HttpSession session = request.getSession();
				session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다");
				
				response.sendRedirect(request.getContextPath());				
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
