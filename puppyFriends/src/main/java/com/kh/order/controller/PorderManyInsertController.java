package com.kh.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.member.model.vo.Member;
import com.kh.order.model.service.OrderService;
import com.kh.order.model.vo.Order;

/**
 * Servlet implementation class PorderManyInsertController
 */
@WebServlet("/manyInsert.po")
public class PorderManyInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PorderManyInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
		
		// List의 length 사이즈는 같다
		// 굳이 반복문 안돌아도 바로 값을 꺼낼 수 있음
		int cartCount = 0;
		String[] cartList = request.getParameterValues("count");
		
		String productNo = "";	
		int result = 0;
		String[] list = request.getParameterValues("pno");
		int many = 998;
		
		for(int i=0; i<list.length; i++) {	
			if(i == 0) { // 첫번째 상품일때
				productNo = list[i];
				cartCount = Integer.parseInt(cartList[i]);
				many = 999;
			}else {
				productNo = list[i];
				cartCount = Integer.parseInt(cartList[i]);
				many = 998;
			}	
		
		String buyerAddr = request.getParameter("buyerAddr");
		String buyerName = request.getParameter("buyerName");
		String buyerTel = request.getParameter("buyerTel");
		String omg = request.getParameter("omg");
		
		String impUid = request.getParameter("iu");
		String merchantUid = request.getParameter("mc");
		String price = request.getParameter("pr");
		
		Order o = new Order();
		o.setOrderUser(String.valueOf(userNo));
		o.setProductNo(String.valueOf(productNo));
		o.setOrderName(buyerName);
		o.setOrderAddress(buyerAddr);
		o.setOrderPhone(buyerTel);
		o.setOrderReq(omg);
		o.setOrderCount(cartCount);
		
		
		result = new OrderService().orderInsert(o, impUid, merchantUid, price, many);
		}
		
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
