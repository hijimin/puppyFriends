package com.kh.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Image;
import com.kh.product.model.service.ProductService;
import com.kh.product.model.vo.Product;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class AjaxProductImgUpdateController
 */
@WebServlet("/updateTest.pd")
public class AjaxProductImgUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxProductImgUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("오냐?");
		
		request.setCharacterEncoding("utf-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new MyFileRenamePolicy());
			
			String productName = multiRequest.getParameter("pdname");
			String productDesc = multiRequest.getParameter("pddetail");
			String price = multiRequest.getParameter("oriprice");
			int discount = Integer.parseInt(multiRequest.getParameter("discount"));
			int productNo = Integer.parseInt(multiRequest.getParameter("pno"));
			
			Product p = new Product();
			p.setProductNo(productNo);
			p.setProductName(productName);
			p.setProductDesc(productDesc);
			p.setPrice(price);
			p.setDiscount(discount);
			
			
				Image im = new Image();
				im.setFileName(multiRequest.getOriginalFileName("file1"));
				im.setChangeName(multiRequest.getFilesystemName("file1"));
				im.setFilePath("resources/upfiles/");
				
				Image im1 = new Image();
				im1.setFileName(multiRequest.getOriginalFileName("file2"));
				im1.setChangeName(multiRequest.getFilesystemName("file2"));
				im1.setFilePath("resources/upfiles/");
						
			
			int result = new ProductService().updateProduct(p,im);
			
			response.getWriter().print(result);
			
			
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
