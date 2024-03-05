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
 * Servlet implementation class PorderInsertController
 */
@WebServlet("/insert.po")
public class PorderInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PorderInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pno"));
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getMemberNo();
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
		
		int result = new OrderService().orderInsert(o, impUid, merchantUid, price);
		
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
