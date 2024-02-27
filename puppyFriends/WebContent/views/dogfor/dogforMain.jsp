<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
            
            width: 1700px;
            height: 1000px;
            margin: auto;
            margin-top: 50px;
        }
        .content1{
            width: 100%;
            height: 30%;
            padding-left: 400px;
        }
        .content2, .content4{
            width: 100%;
            height: 10%;
        }
        .content3{
            width: 100%;
            height: 55%;
            padding-left: 400px;
        }
        #photo td{
            padding: 20px;
        }
        
        .content3>div{
            height: 100%;
            float: left;
            
        }        
        .content3_2{
            width: 700px;
        }
        .content3_1, .content3_3{
            width: 100px;
        }
        .check{
            width: 300px;
            height: 200px;
            float: left;
            margin-top: 50px;
        }
        #btn{
            font-size: 50px;
            background-color: rgb(255, 222, 239);
            border: 0px;
            color: white;
            margin-top: 200px;
            border-radius: 20px;
        }


    </style>
  
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>

    <div class="outer" align="center">

        <div class="content1">
            
            <div class="check">
                <br>
                <h3>출석</h3>
                <br><br>
                <h3>xx일</h3>

            </div>
            <div class="check">
                <br>
                <h3>결석</h3>
                <br><br>
                <h3>xx일</h3>
            </div>
            <div class="check">
                <br>
                <h3>출석률</h3>
                <br><br>
                <h3>xx%</h3>
            </div>
            
        </div>

        <div class="content2">
            <a href="<%= contextPath %>/attendance.at" class="btn btn-lg" style="background-color: rgb(255, 222, 239); color: white;">출석부로</a>
        </div>

        <div class="content3" align="center">

            <div class="content3_1">
                <button id="btn"><<</button>
            </div>
            <div class="content3_2">
                <table id="photo">
                    <tr>
                        <td>
                            <img src="녹용.png" width="300" height="200">
                        </td>
                        <td>
                            <img src="녹용.png" width="300" height="200">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="녹용.png" width="300" height="200">
                        </td>
                        <td>
                            <img src="녹용.png" width="300" height="200">
                        </td>
                    </tr>
                </table>
            </div>
            <div class="content3_3">
                <button id="btn">>></button>
            </div>

            

        </div>

        <div class="content4">
            <a href="<%= contextPath %>/gallery.ga" class="btn btn-lg" style="background-color: rgb(255, 222, 239); color: white;">갤러리로</a>
        </div>




    </div>


    <%@ include file="../common/footerbar.jsp" %>

</body>
</html>