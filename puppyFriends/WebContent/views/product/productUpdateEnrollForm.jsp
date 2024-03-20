<%@page import="com.kh.product.model.vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Product> list = (ArrayList<Product>)request.getAttribute("list");

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .upup{
        text-align: center;
    }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

		<div class="outer">

        <form action="<%= contextPath %>/updateTest.pd" id="enroll-form" method="post" enctype="multipart/form-data">
        	
            <div class="upup">         	
                <select onchange="upTest(this);">
                    <option value="-" selected>-</option>
                	<% for(Product p : list){ %>
                    <option value="<%= p.getProductNo()%>"><%= p.getProductNo() %></option>
                    <% } %>
                </select>
                
            </div>


            <table align="center">     
                <tr>
                    <th width="100">상품명</th>
                    <td colspan="3"><input type="text" name="pdname"></td>
                </tr>
                <tr>
                    <th>상품상세설명</th>
                    <td colspan="3">
                        <input type="text" name="pddetail">
                    </td>
                </tr>  
                
                <tr>
                    <th width="100">원래가격</th>
                    <td colspan="3"><input type="text" name="oriprice"></td>
                </tr>

                <tr>
                    <th width="100">할인율</th>
                    <td colspan="3"><input type="text" name="discount"></td>
                </tr>

                <tr>
                    <th>대표상품이미지</th>
                    <td colspan="3" align="center">
                        <img id="titleImg" width="250" height="170" onclick="chooseFile(1);">
                    </td>
                </tr>
                
                <tr>
                    <th>상세이미지</th>
                    <td>
                        <img id="contentImg1" width="150" height="120" onclick="chooseFile(2);">
                    </td>

                    <td>
                        <img id="contentImg2" width="150" height="120" onclick="chooseFile(3);">
                    </td>

                    <td>
                        <img id="contentImg3" width="150" height="120" onclick="chooseFile(4);">  
                    </td>
                </tr>
                
                
                
                
            </table>

            <div id="file-area" style="display:none">
                <input type="file" name="file1" id="file1" onchange="loadImg(this,1);">
                <input type="file" name="file2" id="file2" onchange="loadImg(this,2);"> <!-- 매개변수를 같이 주면 함수이름이 똑같아서 실행이 되더라도 대표이미지인지 상세이미지 어디인지 구별이 가능 -->
                <input type="file" name="file3" id="file3" onchange="loadImg(this,3);">
                <input type="file" name="file4" id="file4" onchange="loadImg(this,4);">
            </div>
            
           <script>
            	function chooseFile(num){
            		$("#file"+num).click();       		
            	}
            
            
                function loadImg(inputFile, num){

                    if(inputFile.files.length == 1){ 


                        const reader = new FileReader();

       
                        reader.readAsDataURL(inputFile.files[0]);
                     
                        reader.onload = function(e){ 
                            
                            switch(num){
                                case 1: $("#titleImg").attr("src", e.target.result); break;
                                case 2 : $("#contentImg1").attr("src", e.target.result); break;
                                case 3 : $("#contentImg2").attr("src", e.target.result); break;
                                case 4 : $("#contentImg3").attr("src", e.target.result); break;
                            }
                        }


                    }else { 
                        switch(num){
                                case 1: $("#titleImg").attr("src", null); break;
                                case 2 : $("#contentImg1").attr("src", null); break;
                                case 3 : $("#contentImg2").attr("src", null); break;
                                case 4 : $("#contentImg3").attr("src", null); break;
                            }
                    }
                }

                function upTest(pnum) {
                    $.ajax({
                        url:"upselect.pd",
                        data:{pnum:pnum},
                        success:function(){

                        }, error:function(){

                        }
                    })
                }
            </script>
			<br>
            <div align="center">
                <button type="submit">수정하기</button>
            </div>                
        </form>
    </div>	
</body>
</html>