package com.kh.reservation.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.reservation.model.vo.KinderClass;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class KinderClassEnrollController
 */
@WebServlet("/insert.crv")
public class KinderClassEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public KinderClassEnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	request.setCharacterEncoding("UTF-8");
			
			if(ServletFileUpload.isMultipartContent(request)) {
				int maxSize = 10 * 1024 * 1024;
				
				String savePath = request.getSession().getServletContext().getRealPath("/resources/thumbnail_upfiles/");
			
				MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
				KinderClass c = new KinderClass();
				c.setClassWriter(Integer.parseInt(multiRequest.getParameter("memberNo")));
				c.setClassName(multiRequest.getParameter("className"));
				c.setClassText(multiRequest.getParameter("classText"));
				c.setClassSize(multiRequest.getParameter("classSize"));
				// c.setdNumber(multiRequest.getParameter("dNumber"));
			
				// 작성중
			
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
