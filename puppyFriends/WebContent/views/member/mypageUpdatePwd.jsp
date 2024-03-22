<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <style>
      div {
        border: 1px solid white;
        box-sizing: border-box;
      }

      .mypage-wrap {
        width: 100%;
        height: 1000px;
      }
      .mypage-form {
        height: 100%;
        width: 80%;
      }
      .mypage-header {
        height: 10%;
      }
      .mypage-menu-empty {
        height: 30%;
      }
      .mypage-order {
        height: 25%;
        padding: 0;
        margin: 0;
      }
      .mypage-order li {
        float: left;
        padding: 0px 5px;
        height: 100%;
        /* border: 1px solid red; */
        list-style-type: none;
        margin: 0px;
      }

      .mypage-order a {
        /* border: 1px solid red; */
        text-decoration: none;
        font-size: 14px;
        color: black;
        width: 100%;
        height: 100%;
        display: block;
      }
      span {
        font-size: 14px;
      }

      .mypage-order a:hover {
        color: black;
        text-decoration: none;
      }

      .mypage-content {
        height: 90%;
        display: flex;
      }
      .mypage-select-zone {
        width: 15%;
      }
      .mypage-select-header {
        height: 10%;
      }
      .mypage-select-header > h2 {
        text-align: left;
        margin-top: 20px;
      }
      .mypage-content-zone {
        width: 85%;
      }
      .line {
        border: 1px solid black;
        width: 100%;
      }

      .mypage-select-main {
        height: 90%;
      }
      .mypage-select-main > ul {
        /* border: 1px solid blue; */
        list-style-type: none;
        padding: 16px 0px;
        text-align: left;
        padding-left: 0px;
        height: 100%;
      }

      .mypage-select-main a {
        text-decoration: none;
        color: black;
        font-size: 16px;
        font-weight: 800;
      }

      .mypage-select-main li {
        margin-top: 40px;
      }
      .mypage-select-main a:hover {
        color: black;
      }

      .mypage-content-side {
        width: 98%;
        height: 100%;
        padding: 30px 0px;
      }
      .mypage-content-main {
        width: 95%;
        height: 55%;
      }

      .mypage-change-pwd {
        width: 80%;
        height: 80%;
        margin-top: 30px;
      }

      .change-pwd-main {
        height: 85%;
      }
      .change-pwd-button {
        height: 15%;
      }
      .change-pwd-button > div {
        float: left;
      }
      .input-row {
        width: 90%;
        height: 20%;
        display: flex;
        margin-top: 20px;
      }
      .input-title {
        width: 30%;
        height: 100%;
        padding-top: 20px;
      }
      .input-group {
        width: 80%;
        height: 100%;
        padding: 12px 20px 0px 0px;
      }
      .input-group>input{
        flex: 1;
        border-style: none;
        background-color: #f6f6f6;
        border-radius: 5px;
    }

      .cancle-update-button,
      .register-update-button {
        width: 50%;
        height: 100%;
      }

      .cancle-update-button > button,
      .register-update-button > button {
        width: 70%;
        height: 100%;
      }
    </style>
    <script
      src="https://kit.fontawesome.com/d48d14d77f.js"
      crossorigin="anonymous"
    ></script>
    <!-- Latest compiled and minified CSS -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
    />

    <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  </head>
  <body>
  
    <%@ include file="../common/menubar.jsp" %>

      <form action="<%= contextPath %>/updatePwd.me" method="post">
          <div class="mypage-wrap" align="center">
            <div class="mypage-form">
              <div class="mypage-header">
                <div class="mypage-menu-empty"></div>
                <div class="mypage-order">
                  <li><a href="">Home ></a></li>
                  <li><a href="">Mypage ></a></li>
                  <li><span>비밀번호변경</span></li>
                </div>
              </div>
              <div class="mypage-content">
                <div class="mypage-select-zone">
                  <div class="mypage-select-header">
                    <h2>MY PAGE</h2>
                  </div>
                  <div class="line"></div>
                  <div class="mypage-select-main">
                    <ul>
                      <li><a href="<%= request.getContextPath()%>/mypage">회원정보수정</a></li>
                      <% if(memberPwd != "") { %>
                        <li><a href="<%= request.getContextPath()%>/updatePwd">비밀번호변경</a></li>
                      <% } %>
                      <li><a data-toggle="modal" href="#deleteModal">회원탈퇴</a></li>
                  </ul>
                    </ul>
                  </div>
                </div>


                <div class="mypage-content-zone">
                  <div class="mypage-content-side">
                    <div class="mypage-content-main">
                        <div class="mypage-change-pwd">
                          <div class="change-pwd-main">
                            <input type="hidden" name="memberId" value="<%= loginUser.getMemberId() %>">  
                            <div class="input-row">
                              <div class="input-title"><b>현재 비밀번호</b></div>
                              <div class="input-group">
                                <input type="password" name="memberPwd" />
                              </div>
                            </div>
                            <div class="input-row">
                              <div class="input-title"><b>바꿀 비밀번호</b></div>
                              <div class="input-group">
                                <input type="password" name="updatePwd"/>
                              </div>
                            </div>
                            <div class="input-row">
                              <div class="input-title"><b>비밀번호 확인</b></div>
                              <div class="input-group">
                                <input type="password" name="checkPwd"/>
                              </div>
                            </div>
                          </div>
                          <br><br><br>
                          <div class="change-pwd-button">
                            <div class="cancle-update-button">
                              <button type="button" onclick="location.href='<%= contextPath %>'" class="btn btn-danger btn-lg">취소</button>
                            </div>
                            <div class="register-update-button">
                              <button type="submit" class="btn btn-primary btn-lg" onclick="return validatePwd();">비밀번호 변경</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
              </div>
            </div>
          </div>
      </form>
      <script>
        function validatePwd(){
          if($("input[name=updatePwd]").val() != $("input[name=checkPwd]").val()){
            alert("변경할 비밀번호가 일치하지 않습니다.");
            return false;
          }
        }
      </script>
      
      <!-- 회원탈퇴용 Modal -->
      <div class="modal" id="deleteModal">
        <div class="modal-dialog" style="margin-top: 250px;">
          <div class="modal-content">

            <!-- Modal Header -->
            <div class="modal-header">
              <h4 class="modal-title">회원탈퇴</h4>
              <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body" align="center">
              
              <form action="<%= contextPath %>/delete.me" method="post">
                  <input type="hidden" name="memberId" value="<%= loginUser.getMemberId() %>">
                  <b>탈퇴 후 복구가 불가능합니다. <br> 정말로 탈퇴하시겠습니까? </b> <br><br>
                  비밀번호 : <input type="password" name="memberPwd1" required> <br><br>
                    <button type="submit" class="btn btn-sm btn-danger" onclick="return deleteMember();">탈퇴하기</button>
              </form>
              
              <script>
                /* function selectPwd(this){
                  let deletePwd = this.value;
                  deleteMember(deletePwd);
                } */

                function deleteMember(){
                	console.log($("input[name=memberPwd1]"));
                  if($("input[name=memberPwd1]").val() != <%= loginUser.getMemberPwd() %>){
                    alert("비밀번호가 일치하지 않습니다.");
                    return false;
                  }
                }
              </script>
            </div>


          </div>
        </div>
      </div>

  </body>
</html>
