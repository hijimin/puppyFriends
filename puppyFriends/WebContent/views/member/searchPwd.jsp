<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

    
    이름: <input type="text" id="check-name"><br>
    아이디: <input type="text" id="check-id"><br>
    이메일: <input type="text" id="check-email"><br>

    <button onclick="searchPwd();">조회하기</button>
    
    <h2>조회결과</h2>

    <div id="result"><span id="pwd"></span></div> <button>확인</button>

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
                        $("#result").html("조회된 결과가 없습니다")
                    }else{
                        $("#result").html(
                              "조회하신 비밀번호는"
                            +  "<span id='pwd'>" + result + "</span>"
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