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
    

    .enroll-dog-info{
        width: 260px;
        height: 348px;
        margin: auto;
        
    }

    .enroll-dog-info>div{
        float: left;
        height: 40px;
        width: 50%;
        text-align: center;
        padding-top: 8px;
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
					<form action="<%= request.getContextPath()%>/insert.me">
						
						<input type="hidden" name="memberId" value="<%= memberId %>">
	                    <input type="hidden" name="memberPwd" value="<%= memberPwd %>">
	                    <input type="hidden" name="memberName" value="<%= memberName %>">
	                    <input type="hidden" name="memberEmail" value="<%= memberEmail %>">
	                    <input type="hidden" name="memberPhone" value="<%= memberPhone %>">
                    
	                    <div class="enroll-member-idpwd" align="center">
	                        <input type="text" name="dogName" placeholder="반려견 이름 *" required style="width: 250px; height: 25px;"><br>
	                        <input type="text" name="dogValue" placeholder="반려견 종 *" required style="width: 250px; height: 25px;"><br>
	                        <input type="number" name="dogAge" placeholder="반려견 나이" required style="width: 250px; height: 25px;">
	                    </div>
	
	                    <br>
	                    
	                    <div class="enroll-dog-info">
	                        <h4 style="margin: 0;">반려견 성별 *</h4>
	                        <div class="dog_gender1" >
                                <input type="radio" id="genderM" name="gender" value="M">남
                            </div>
	                        <div class="dog_gender2">
                                <input type="radio" id="genderF" name="gender" value="F">여
                            </div>
	                        <h4 style="margin: 0;">필수예방접종여부 *</h4>
	                        <div class="dog_vacine1">
                                <input type="radio" id="vacineO" name="vaccine" value="Y">O
                            </div>
	                        <div class="dog_vacine2">
                                <input type="radio" id="vacineX" name="vaccine" value="N">X
                            </div>
	                        <h4 style="margin: 0;">반려견 특이사항</h4>
	                        <textarea name="dogSignificant" id="" cols="34" rows="10" style="resize: none;"></textarea>
	                    </div>
                        <button>다음</button>
                    </form>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>