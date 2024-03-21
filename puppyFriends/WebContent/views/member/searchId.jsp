<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
    }
    #wrap{
        width: 484px;
        height: 680px;
        border: 5px solid rgb(255, 222, 239);
    }
    #table{
        width: 400px;
    }
    #table th{
        font-size: 20px;
    }
    #table input{
        width: 250px;
        height: 30px;
        border-radius: 5px;
    }
    #result-wrap{
        width: 100%;
        height: 200px;
        border-top: 1px solid lightgray;
        margin-top: 30px;
    }
    #search{
        width: 100px;
        height: 45px;
        background-color: rgb(255, 222, 239);
        border-radius: 10px;
        border: 0px;
        font-size: 15px;
        font-weight: 700;
        margin-left: 360px;
    }
    #result{
        margin: auto;
        width: 90%;

    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

    <div id="wrap">

        <h2 align="center">아이디 찾기</h2>

        <table align="center" id="table">
            <tr>
                <th height="50">이름 : </th>
                <td><input type="text" id="check-name"></td>
            </tr>
            <tr>
                <th height="50">이메일 : </th>
                <td><input type="text" id="check-email"></td>
            </tr>
        </table><br>

    
        <button onclick="searchId();" id="search">조회하기</button>
        <br>
        <div id="result-wrap">
            <h2 align="center">조회결과</h2>
            
            <div id="result"></div>
        </div>
    

    </div>

    
    
	<p id="contextPath" style="display: none;"><%= contextPath %></p>
    <script>
        function searchId(){

            if($("#check-name").val() === ""){
                alert("이름을 입력하세요")
                return;
            }

            if($("#check-email").val() === ""){
                alert("이메일을 입력하세요")
                return;
            }

            $.ajax({
                type:"post",
                url:"/puppy/searchId.me",
                data:{
                    userName:$("#check-name").val(),
                    email:$("#check-email").val()
                },
                success:function(result){
                    console.log(result)

                    if(result === 'NNN'){
                        $("#result").html("조회된 결과가 없습니다")
                    }else{
                        $("#result").html(
                              "조회하신 아이디는"
                            + " " + result + " "
                            + "입니다."
                        );
                    }
                    
                },
                error:function(){
                    alert("ajax 실패")
                }


            })



                

        }
    </script>
	

</body>
</html>