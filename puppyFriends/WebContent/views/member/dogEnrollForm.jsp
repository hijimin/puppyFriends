<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String memberId = (String)request.getAttribute("memberId");
	String memberPwd = (String)request.getAttribute("memberPwd");
	String memberName = (String)request.getAttribute("memberName");
	String memberEmail = (String)request.getAttribute("memberEmail");
	String memberPhone = (String)request.getAttribute("memberPhone");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.enroll-form-wrap{height: 800px;}

    div{
        box-sizing: border-box; border: 1px solid red;
     }
 
     .enroll-form{
        width: 40%;
        height: 100%;
        margin: auto;
     }

     .enroll-form-header{height: 10%;}
     .enroll-form-content{height: 80%}
     .enroll-form-content1{
        width: 90%;
        height: 90%;
        margin: auto;
        margin-top: 30px;
    }

    .enroll-picture{
        width: 15%;
        height: 10%;
        margin: auto;
    }

    .enroll-member{
        text-align: center;
        font-size: 18px;
    }

    .enroll-member>div{height: 30px; float: left;}
    .enroll-member-radio{width: 50%; height: 100%;}
    .enroll-trainer-radio{width: 50%; height: 100%;}

    .enroll-member-info{
        width: 260px;
        height: 348px;
        margin: auto;
    }
</style>
</head>
<body>
	 <div class="enroll-form-wrap">
        <div class="enroll-form">
            <div class="enroll-form-header">
                <h1>PUPPY FRIENDS</h1>
            </div>
            <div class="enroll-form-content">
                <div class="enroll-form-content1">
                    <div class="enroll-picture"><i class="fa-solid fa-user" ></i></div>
                   

					
                    <br><br><br>
					<form action="<%= request.getContextPath()%>/enroll-form.dog">
						
						<input type="hidden" name="<%= memberId %>">
	                    <input type="hidden" name="<%= memberPwd %>">
	                    <input type="hidden" name="<%= memberName %>">
	                    <input type="hidden" name="<%= memberEmail %>">
	                    <input type="hidden" name="<%= memberPhone %>">
                    
	                    <div class="enroll-member-idpwd" align="center">
	                        <input type="text" name="memberId" placeholder="아이디 *" required style="width: 250px; height: 25px;"><br>
	                        <input type="password" name="memberPwd" placeholder="비밀번호 *" required style="width: 250px; height: 25px;"><br>
	                        <input type="password" name="checkPwd" placeholder="비밀번호 확인" required style="width: 250px; height: 25px;">
	                    </div>
	
	                    <br>
	                    
	                    <div class="enroll-member-info">
	                        <h4 style="margin: 0;">이름 *</h4>
	                        <input type="text" name="memberName" placeholder="" required style="width: 250px; height: 25px;"><br><br>
	                        <h4 style="margin: 0;">이메일 *</h4>
	                        <input type="text" name="memberEmail" requeired style="width: 250px; height: 25px;"><br><br>
	                        <h4 style="margin: 0;">연락처 *</h4>
	                        <input type="text" name="memberPhone" required style="width: 250px; height: 25px;">
	                    </div>
                        <button>다음</button>
                    </form>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>