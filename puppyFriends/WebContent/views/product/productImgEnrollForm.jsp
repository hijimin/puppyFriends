<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        margin: auto;
        margin-top: 80px;
    }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

		<div class="outer">

        <form action="<%= contextPath %>/insert.pd" id="enroll-form" method="post" enctype="multipart/form-data">
        	
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
                    <th>상품이미지</th>
                    <td colspan="3" align="center">
                        <img id="titleImg" width="250" height="170" onclick="chooseFile(1);">
                    </td>
                </tr>
            </table>

            <div id="file-area" style="display:none">
                <input type="file" name="file1" id="file1" onchange="loadImg(this,1);">
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
                            }
                        }


                    }else { 
                        switch(num){
                                case 1: $("#titleImg").attr("src", null); break;
                            }
                    }
                }
            </script>
			<br>
            <div align="center">
                <button type="submit">등록하기</button>
            </div>                
        </form>
    </div>	
</body>
</html>