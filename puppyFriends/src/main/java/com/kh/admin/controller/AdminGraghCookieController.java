package com.kh.admin.controller;

import java.io.IOException;
import java.util.Base64;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.vo.Member;
import com.kh.product.model.vo.Product;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@WebServlet("/AdminGraphCookie.gr")
public class AdminGraghCookieController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminGraghCookieController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String graphDataJson = request.getParameter("graphData");

        String encodedGraphData = Base64.getEncoder().encodeToString(graphDataJson.getBytes());
        Cookie graphDataCookie = new Cookie("graphData", encodedGraphData);
        graphDataCookie.setMaxAge(60 * 60 * 24); // 24시간
        graphDataCookie.setPath("/");
        response.addCookie(graphDataCookie);

        response.getWriter().write("그래프 데이터가 성공적으로 저장되었습니다.");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}
