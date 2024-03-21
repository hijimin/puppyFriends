package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.member.model.vo.Dog;
import com.kh.order.model.vo.Order;

/**
 * Servlet implementation class AdminOrderDetailViewController
 */
@WebServlet(name = "AdminOrderDetailView.or", urlPatterns = { "/AdminOrderDetailView.or" })
public class AdminOrderDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminOrderDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int orderNo = Integer.parseInt(request.getParameter("mno"));
		// String[] deleteMember = request.getParameterValues("deleteMember");
		
		
		AdminService oService = new AdminService();
		
		
			Order o = oService.adminOrderInfo(orderNo);
			
			request.setAttribute("o", o);
			request.getRequestDispatcher("views/admin/adminOrderDetailView.jsp").forward(request, response);;
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
