<%@page import="com.kh.member.model.vo.Dog"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Dog> list = (ArrayList<Dog>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        font-size: 20px;
        background-color: rgb(255, 222, 239);
        color: white;
        width: 1000px;
        height: auto;
        margin: auto;
        margin-top: 50px;
        padding-bottom: 30px;
        margin-bottom: 100px;
    }
    #enroll-form table{
        border: 0px solid white;
        width: 500px;
        height: 500px;
    }
    #enroll-form textarea{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
    }
    #enroll-form input{
        width: 50%;
        height: 100%;
    } 
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">
        <br>
        <h2 align="center">사진게시판 작성하기</h2>
        <br>

        <form action="<%= contextPath %>/insert.ga" id="enroll-form" method="post" enctype="multipart/form-data">
			
            


            <table align="center">
                <tr>
                    <th width="120">강아지 이름</th>
                    <td colspan="3">
                        <select name="dogNo" id="dogNo">
                        	<% for(Dog dog : list){ %>
                            <option value="<%= dog.getDogNo() %>"><%= dog.getDogName() %></option>
                            <% } %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <th>추가이미지</th>
                    <td colspan="3">
                        <img id="titleImg" width="300" height="200" onclick="chooseFile(1);">
                    </td>
                </tr>
                <tr>
                    <td><br></td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3">
                        <textarea name="content" required rows="5" cols="10" style="resize: none;"></textarea>
                    </td>
                </tr>
               
            </table>

            <div id="file-area" style="display: none;">
                <input type="file" name="file" id="file" onchange="loadImg(this, 1);" required>
            </div>

            <script>

            



                function loadImg(inputFile, num){
                    // inputFile : 현재 변화가 생긴 input type="file" 요소객체
                    // num : 몇번째 input요소인지 확인 후 해당 영역에 미리보기하기 위해 전달받는 숫자

                    // 선택된 파일이 있다면 inputFile.files[0]에 선택된 파일이 담겨있음
                    //                  => inputFile.files.length 또한 1이 될꺼임

                    if(inputFile.files.length == 1){ // 파일 선택된 경우 => 파일 읽어들여서 미리보기

                        // 파일을 읽어들일 FileReader 객체 생성
                        const reader = new FileReader();

                        // 파일을 읽어들이는 메소드
                        reader.readAsDataURL(inputFile.files[0]);

                        // 해당 파일을 읽어들이는 순간 해당 이 파일만의 고유한 url 부여

                        // 해당 파일 읽어들이기가 완료됐을 때 실행할 함수를 정의해두기
                        reader.onload = function(e){
                            // e.target.result => 읽어들인 파일의 고유한 url
                            switch(num){
                                case 1 : $("#titleImg").attr("src", e.target.result); break;

                            }

                        }

                    }else{ // 선택된 파일이 취소된 경우 => 미리보기 된 것도 사라지게
                       
                        switch(num){
                                case 1 : $("#titleImg").attr("src", null); break;

                            }
                            
                    }

                }

                function chooseFile(num){

                    $("#file").click();

                }

            </script>

            <br>

            <div align="right" style="width: 750px;">
                <button type="submit" style="border: 0px; background-color: rgb(255, 244, 244);">등록하기</button>
            </div>

        </form>

    </div>

    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>