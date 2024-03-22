<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div{
        box-sizing: border-box;
    }
    .wrap{
        width: 484px;
        height: 680px;
        border: 5px solid rgb(255, 222, 239);
    }
    .pwdTable{
        width: 400px;
    }
    table th{
        font-size: 20px;
    }
    table input{
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
    .search{
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

    #pwd{margin-top: 100px;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

    <div class="wrap">

        <h2 align="center">비밀번호 찾기</h2>

        <table align="center" class="pwdTable">
            <tr>
                <th height="50">이름 : </th>
                <td><input type="text" id="check-name" required></td>
            </tr>
            <tr>
                <th height="50">아이디 :</th>
                <td><input type="text" id="check-id" required></td>
            </tr>
            <tr>
                <th height="50">이메일 :</th>
                <td> <input type="text" id="check-email" required></td>
            </tr>
        </table>
        
        <button onclick="searchPwd();" class="search">조회하기</button>
        
        <h2 align="center">조회결과</h2>
        
        <div id="result-wrap" align="center">
            <span id="pwd" onkeydown="checkNumber();"></span>
        </div> 
        <button class="search" >확인</button>
    </div>

    <script>
        function searchPwd(){

            if($("#check-name").val() === ""){
                alert("이름을 입력하세요")
                return;
            }

            if($("#check-id").val() === ""){
                alert("아이디을 입력하세요")
                return;
            }

            if($("#check-email").val() === ""){
                alert("이메일을 입력하세요")
                return;
            }


            $.ajax({
                type:"post",
                url:"/puppy/searchPwd.me",
                data:{
                    userName:$("#check-name").val(),
                    userId:$("#check-id").val(),
                    email:$("#check-email").val(),

                },
                success:function(result){
                    console.log(result)
                    

                    if(result === 'NNN'){
                        $("#result-wrap").html("조회된 결과가 없습니다")
                    }else{
                        checkNumber(result);
                    }
                    
                    $("#pwd").html(
                        "조회하신 비밀번호는 **** 입니다."
                );
                    
                },
                error:function(){
                    alert("ajax 실패")
                }


            })

        }

        function checkNumber(result){


                $(".search").mousedown(() => {

                    $("#pwd").html(
                        "조회하신 비밀번호는"+ result + "입니다."
                );
                $(".search").mouseup(() => {
                    $("#pwd").html(
                        "조회하신 비밀번호는 ****입니다."
                );
                
                });

                });
        }
        
    </script>


</body>
</html>