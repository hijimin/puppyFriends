package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class ProductDetailController
 */
@WebServlet("/detail.pd")
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pno"));
		
		// 조회수 증가부터
		// 게시판 조회
		
		ProductService pService = new ProductService();
		
		int result = pService.increaseCount(productNo);
		
		if(result > 0) {
			
			// 상품명, 상품설명, 원래가격, 할인가격, 사진경로, 파일레벨1, 파일레벨2
			ArrayList<Product> list = pService.selectProductDetailList(productNo);
		
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/product/productDetailView.jsp").forward(request, response);
			
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
