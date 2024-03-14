package com.kh.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.review.model.service.ReviewService;

/**
 * Servlet implementation class AjaxReviewUpdateController
 */
@WebServlet("/reviewUpdate.rv")
public class AjaxReviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxReviewUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		int reviewNum = Integer.parseInt(request.getParameter("rno"));
		String reviewText = request.getParameter("rtext");
		
		System.out.println(reviewNum);
		System.out.println(reviewText);
		
		int result = new ReviewService().updateReview(userNo, reviewNum, reviewText);
		
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
