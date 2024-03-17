package com.kh.dogfor.controller;

import java.io.IOException;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.kh.common.MyFileRenamePolicy;
import com.kh.common.model.vo.Image;
import com.kh.dogfor.model.service.DogforService;
import com.oreilly.servlet.MultipartRequest;

/**
 * {@link Servlet} implementation class GalleryInsertController
 */
@WebServlet("/insert.ga")
public class GalleryInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전송용량제한
			
			int maxSize = 10 * 1024 * 1024;
			
			// 1_2. 저장시킬 폴더의 물리적인 경로
			String savePath = request.getSession().getServletContext().getRealPath("/resources/upfiles/");
			
			// 2. 전달된 파일 업로드
			// HttpServletRequest request => MultipartRequest 타입으로 변환
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8", new MyFileRenamePolicy());
			
			// 3. DB에 기록할 값 뽑기
			// Board Insert
			
			String dogNo = multiRequest.getParameter("dogNo");
			String content = multiRequest.getParameter("content");

			String key = "file";
			
			Image img = new Image();
			
			if(multiRequest.getOriginalFileName(key) != null) {
				img.setFileName(multiRequest.getOriginalFileName(key));
				img.setChangeName(multiRequest.getFilesystemName(key));
				img.setFilePath("resources/upfiles/");
				img.setDogNo(dogNo);
				img.setContent(content);
			}

			
			
			int result = new DogforService().insertImage(img);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath() + "/galleryEnrollForm.ga");
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
