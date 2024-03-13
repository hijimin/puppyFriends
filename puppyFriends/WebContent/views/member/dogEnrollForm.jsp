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
<script src="https://kit.fontawesome.com/d48d14d77f.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<style>
	.enroll-form-wrap{height: 800px;}

    div{
        box-sizing: border-box; border: 1px solid white;
     }
 
     .enroll-form{
        width: 25%;
        height: 100%;
        margin: auto;
     }

     .enroll-form-header{height: 10%;}
     .enroll-form-content{height: 90%; border: 2px solid lightgray;}
     .enroll-form-content1{
        width: 90%;
        height: 90%;
        margin: auto;
        margin-top: 30px;
        
    }

    .enroll-picture{
        width: 30%;
        height: 10%;
        margin: auto;
        padding: 7px;
    }

    .enroll-member{
        text-align: center;
        font-size: 18px;
    }

    .enroll-member>div{height: 30px; float: left;}
    

    .enroll-dog-info{
        height: 150px;
        margin: auto;
        border-radius: 5px;
    }

    /* .dog-name{
        height: 33%;
        border: 2px solid lightgray;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .dog-name>div{float: left;}
    .dog-name-icon{width: 15%; height: 100%; padding-top: 10px;}
    .dog-name-input{width: 85%; height: 100%;}
    #name-input-window{
        width: 100%;
        height: 100%;
        box-sizing: border-box;
        border: none;
    } */

    .dog-name{
        height: 33%;
        border: 2px solid lightgray;
        border-top-left-radius: 5px;
        border-top-right-radius: 5px;
    }
    .dog-kind, .dog-age{
        height: 33%;
        border: 2px solid lightgray;
        border-top: none;
    }
    .dog-age{
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 5px;
    }

    .dog-name>div, .dog-kind>div, .dog-age>div{float: left;}
    .dog-name-icon, .dog-kind-icon, .dog-age-icon{
        width: 15%;
        height: 100%;
        padding-top: 10px;
    }
    .dog-name-input, .dog-kind-input, .dog-age-input{
        width: 85%;
        height: 100%;
    }
    #name-input-window, #kind-input-window, #age-input-window{
        box-sizing: border-box;
        width: 100%;
        height: 100%;
        border: none;
    }

    .dog-char{
        height: 312px;
        border:2px solid lightgray
    }
    .dog-gender-form, .dog-vacine-form, .dog-size-form{height: 20%;}
    .dog-sig-form{height: 40%;}


    .dog_gender, .dog_vacine{
        float: left;
        height: 40px;
        width: 50%;
        text-align: center;
        padding-top: 8px;
        border: 2px solid lightgray;
    }

    .dog_size{
        float:left;
        height: 40px;
        width: 33%;
        text-align: center;
        padding-top: 8px;
        border: 2px solid lightgray;
    }

    #dog-sig{
        height: 87%;
        width: 100%;
        box-sizing: border-box;
        resize: none;
    }

    
</style>
</head>
<body>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script> -->

	 <div class="enroll-form-wrap">
        <div class="enroll-form">
            <div class="enroll-form-header">
                <h1>PUPPY FRIENDS</h1>
            </div>
            <div class="enroll-form-content">
                <div class="enroll-form-content1">
                    <div class="enroll-picture"><i class="fa-solid fa-dog fa-3x"></i></div>
                   

					
                    <br><br>
					<form action="<%= request.getContextPath()%>/insert.me">
						
						<!-- <input type="hidden" name="memberId" value="<%= memberId %>">
						<% if(memberPwd != null) { %>
	                    	<input type="hidden" name="memberPwd" value="<%= memberPwd %>">
	                    	
	                    <% } %>
	                    <input type="hidden" name="memberName" value="<%= memberName %>">
	                    <input type="hidden" name="memberEmail" value="<%= memberEmail %>">
	                    <% if(memberPhone != null) { %>
	                    	<input type="hidden" name="memberPhone" value="<%= memberPhone %>">
	                    <% } %> -->
                    
	                    <div class="enroll-dog-info" align="center">
                            <div class="dog-name">
                                <div class="dog-name-icon"><i class="fa-solid fa-check"></i></div>
                                <div class="dog-name-input">
                                    <input type="text" id="name-input-window" name="dogName" placeholder="반려견 이름 *" required >
                                </div>
                            </div>
                            <div class="dog-kind">
                                <div class="dog-kind-icon"><i class="fa-solid fa-check"></i></div>
                                <div class="dog-kind-input">
                                    <input type="text" id="kind-input-window" name="dogValue" placeholder="반려견 종 *" required >
                                </div>
                            </div>
                            <div class="dog-age">
                                <div class="dog-age-icon"><i class="fa-solid fa-check"></i></div>
                                <div class="dog-age-input">
                                    <input type="number" id="age-input-window" name="dogAge" placeholder="반려견 나이" required >
                                </div>
                            </div>
	                    </div>
	
	                    <br>
	                    
	                    <div class="dog-char">
                            <div class="dog-gender-form">
                                <h4 style="margin: 0;">반려견 성별 *</h4>
                                <div class="dog_gender" >
                                    <input type="radio" id="genderM" name="gender" value="M">남
                                </div>
                                <div class="dog_gender">
                                    <input type="radio" id="genderF" name="gender" value="F">여
                                </div>
                            </div>
                            <div class="dog-vacine-form">
                                <h4 style="margin: 0;">필수예방접종여부 *</h4>
                                <div class="dog_vacine">
                                    <input type="radio" id="vacineO" name="vaccine" value="Y">O
                                </div>
                                <div class="dog_vacine">
                                    <input type="radio" id="vacineX" name="vaccine" value="N">X
                                </div>
                            </div>
                            <div class="dog-size-form">
                                <h4 style="margin: 0;">반려견 크기 *</h4>
                                <div class="dog_size">
                                    <input type="radio" id="sizeS" name="dogSize" value="S">소형견
                                </div>
                                <div class="dog_size">
                                    <input type="radio" id="sizeM" name="dogSize" value="M">중형견
                                </div>
                                <div class="dog_size">
                                    <input type="radio" id="siezL" name="dogSize" value="L">대형견
                                </div>
                            </div>
                            <div class="dog-sig-form">
                                <h4 style="margin: 0;">반려견 특이사항</h4>
	                            <textarea name="dogSignificant" id="dog-sig"></textarea>
                            </div>
	                    </div>
                        <button>회원가입</button>
                    </form>
                </div>
            </div>
            
        </div>
    </div>
</body>
</html>