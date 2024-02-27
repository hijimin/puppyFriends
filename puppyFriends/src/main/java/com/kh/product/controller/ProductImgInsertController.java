package com.kh.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Image;
import com.kh.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class ProductImgInsertController
 */
@WebServlet("/insert.pd")
public class ProductImgInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductImgInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 10*1024*1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/board_upfiles/");
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			Product p = new Product();
			p.setProductName(multiRequest.getParameter("pdname"));
			p.setProductDesc(multiRequest.getParameter("pddetail"));
			p.setPrice(Integer.parseInt(multiRequest.getParameter("oriprice")));
			p.setDiscount(Integer.parseInt(multiRequest.getParameter("discount")));
			
			ArrayList<Image> list = new ArrayList<>();
			
			for(int i=1; i<=4; i++) {
				String key = "file"+i;
				if(multiRequest.getOriginalFileName(key) != null) {
					Image im = new Image();
					im.setFileName(multiRequest.getOriginalFileName(key));
					im.setChangeName(multiRequest.getFilesystemName(key));
					im.setFilePath("resources/board_upfiles");
				}
			}
			
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
