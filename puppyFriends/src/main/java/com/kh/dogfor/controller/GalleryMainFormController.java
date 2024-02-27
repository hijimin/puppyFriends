package com.kh.dogfor.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.Image;
import com.kh.common.model.vo.PageInfo;
import com.kh.dogfor.model.service.DogforService;

/**
 * Servlet implementation class GalleryMainFormController
 */
@WebServlet("/gallery.ga")
public class GalleryMainFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GalleryMainFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// -------------------- 페이징 처리 --------------------
		int listCount;   // 현재 총 게시글 개수
		int currentPage; // 현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;   // 페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩)
		int boardLimit;  // 한 페이지내에 보여질 게시글 최대 개수(몇개 단위씩)
		
		// 위의 4개를 가지고 아래 3개의 값을 구해낼꺼임
		int maxPage;     // 가장 마지막 페이지(총 페이지 수)
		int startPage;   // 페이징바의 시작수
		int endPage;     // 페이징바의 끝수
		
		// * listCount : 총 게시글 개수
		listCount = new DogforService().selectThCount();
		
		// * currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지)
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		
		// * pageLimit : 페이징바의 페이지 최대개수 (단위 => 페이징바를 몇개 배치할껀지)
		pageLimit = 5;
		
		// * boardLimit : 게시글 몇개씩 보여줄껀지 (단위)
		boardLimit = 6;
		
		/*
		 * * maxPage : 제일 마지막 페이지 수 (총 페이지 수)
		 * 
		 * listCount, boardLimit에 영향을 받음
		 * 
		 * ex) 게시글이 10개 단위씩 보여진다는 가정하에
		 * 
		 * listCount    boardLimit			maxPage
		 *   100.0    /     10  =>  10.0      10
		 *   101.0    /     10  =>  10.1  	  11
		 *   105.0	  /		10	=>	10.5	  11
		 *   110.0	  /		10	=>	11.0	  11
		 *    
		 * ex) 게시글이 5개 단위씩 보여진다는 가정하에
		 * 
		 * listCount    boardLimit			maxPage
		 *   10.0    /     5  =>  2.0         2
		 *   11.0    /     5  =>  2.2  	      3
		 *   14.0	 /	   5  =>  2.8	      3
		 *
		 *   총게시글개수(실수형)  / boardLimit  => 올림처리
		 * 
		 */
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		/*
		 * * startPage : 페이징바의 시작수
		 * 
		 * pageLimit, currentPage에 영향을 받음
		 * 
		 * ex) 페이징바의 목록이 10개 단위(pageLimit)씩 이라는 가정하에
		 * 		startPage : 1, 11, 21, 31
		 * 				  => n * pageLimit + 1
		 *  currentPage      startPage
		 *      1                1          =>  0 * pageLimit + 1  => n=0
		 *      5				 1          =>  0 * pageLimit + 1  => n=0
		 *      10               1          =>  0 * pageLimit + 1  => n=0
		 *      
		 *      11               11         =>  1 * pageLimit + 1  => n=1
		 *      15               11         =>  1 * pageLimit + 1  => n=1
		 *      20               11         =>  1 * pageLimit + 1  => n=1
		 *      
		 *  1~10      => n=0                   
		 *  11~20     => n=1  
		 *  21~30     => n=2
		 *  
		 *  (currentPage - 1) / pageLimit  => n
		 * 
		 *  startPage = n * pageLimit +1
		 *            = (currentPage - 1) / pageLimit * pageLimit + 1
		 */
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		/*
		 * * endPage : 페이징바의 끝 수
		 * 
		 * startPage, pageLimit에 영향을 받음(단, maxPage에도 영향을 받음)
		 * 
		 * ex) pageLimit : 10 가정하게
		 * 
		 * startPage : 1  => endPage : 10
		 * startPage : 11 => endPage : 20
		 * startPage : 21 => endPage : 30
		 */
		endPage = startPage + pageLimit - 1;
		
		// startPage 11이면 endPage는 20으로 됨 (근데 maxPage가 고작 13까지 밖에 안된다면?)
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// com.kh.common.model.vo.PageInfo
		// 페이징바를 만들때 필요한 객체
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		// * 현재 요청한 페이지(currentPage)에 보여질 게시글 리스트 boardLimit 수 만큼 조회
		ArrayList<Image> list = new DogforService().selectList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		

		request.getRequestDispatcher("/views/dogfor/galleryMainForm.jsp?cpage=1").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
