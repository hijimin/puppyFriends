package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.common.model.vo.Image;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;

/**
 * Servlet implementation class AjaxProductUpdateController
 */
@WebServlet("/upselect.pd")
public class AjaxProductUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int productNo = Integer.parseInt(request.getParameter("pnum"));
		
		// 상품명, 상품상세설명, 원래가격, 할인율, 대표상품이미, 상세이미지
		
		Product p = new ProductService().selectProduct(productNo);
		
		// 사진들 조회
		ArrayList<Image> list = new ProductService().selectImgList(productNo);
		
		HashMap<String, Object> plist = new HashMap<String, Object>();
		plist.put("p", p);
		plist.put("list", list);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(plist, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
