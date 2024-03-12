<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@page import="com.kh.member.model.vo.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.kh.common.model.vo.AdminPageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    String contextPath = request.getContextPath();
    
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	String alertMsg = (String)session.getAttribute("alertMsg");
    
    ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
    
    AdminPageInfo pi = (AdminPageInfo)request.getAttribute("pi");
    int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
   	
   %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 회원조회</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
	
  <!-- jQuery library -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   <style>
        .outer{
            width: 1903px;
            height: 950px;
            margin: auto;
        }

        .headerbar{
            width: 100%;
            height: 150px;
            background-color: rgb(255, 222, 239);
            color: white;
            line-height: 150px; 
            /* 라인 하이트 바꾸면 puppyfriends 내려옴
               근데 지금 div 한줄에 h2랑 button이 같이 있어서
                div 노나주면 될듯~ */
        }

        .sidebar{
            width: 200px;
            height: 795px;
            background-color: rgb(255, 222, 239);
            color: white;
            box-sizing: border-box;
        }

        .sidebar>ul{
            margin: 0;
            padding-left: 50px;
            padding-top: 70px;
          
        }

        .sidebar a{
            color: rgb(255, 118, 189);
            font-size: 20px;
        }

         @font-face {
            font-family: 'seolleimcool-SemiBold';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2312-1@1.1/seolleimcool-SemiBold.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
   
        body * {
            font-family: 'seolleimcool-SemiBold';
        }
        
        body button{
            background-color: rgb(255, 167, 212);
            color : white;
            border : none;
            
        }

        .mid>*{
                float: left;
            }

        .headerbar h1{
            padding-top: 100px;
        }  

        .content{
            width: 1400px;
            height: 650px;
            margin-top: 33px;
            margin-left: 130px;
        }

        .list-area{
            font-size: 20px;
        }

        h1{
            margin-left: 560px;
        }

        .list-area td{
            margin-left: 320px;
            font-size: 20px;
        }

        th, td{
            border: 1px solid gray;
        }

        .paging-area{
            margin-right: 150px;
        }
        
        .list-area>tbody>tr>#detailInfo:hover{
        	cursor: pointer;
        }

        #deleteBtn{
            margin-left: 1278px;
            margin-bottom: 30px;
        }
       
    </style>
</head>
<body>

   <div class="outer">
        <div class="headerbar">
                <h1 style="color: rgb(255, 118, 189); display: inline; margin-left: 760px;">PuppyFriends Manager</h1>
        </div>
    
        <div class="mid">
            <div class="sidebar">
                <ul style="list-style-type: none;">
                    <li><a href="">&nbsp;공지사항</a></li>
                    <br><br><br><br>
                    <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;회원</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;수업</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;&nbsp;호텔</a></li>
                    <br><br><br><br>
                    <li><a href="<%= contextPath %>/list.pd?cpage=1">&nbsp;&nbsp;&nbsp;&nbsp;상품</a></li>
                    <br><br><br><br>
                    <li><a href="">&nbsp;&nbsp;&nbsp;게시판</a></li>
                </ul>
            </div>


            <div class="content">
                <table class="list-area" align="center"  style="border: 1px solid gray;">
                    <br>
                    <h1>회원조회</h1>
                    <br><br>
                    <thead align="center">
                        <tr>
                        	<th width="45">선택</th>
                            <th width="150">회원번호</th>
                            <th width="150">회원아이디</th>
                            <th width="150">회원이름</th>
                            <th width="150">반려견식별번호</th>
                            <th width="150">반려견이름</th>
                            <th width="250">회원이메일</th>
                            <th width="250">전화번호</th>
                        </tr>
                        
                    </thead>
                  
                        <tbody align="center">
                            <form id="deleteForm" action="adminDelete.me" method="post"  onsubmit="return confirmDelete()">
                            <% for(Member m : list) {  %>
                                <tr>
                                    <th><input type="checkbox" value="<%= m.getMemberNo() %>" name="deleteMember"></th>
                                    <td id="detailInfo"><%= m.getMemberNo() %></td>
                                    <td><%= m.getMemberId() %></td>
                                    <td><%= m.getMemberName() %></td>
                                    <td><%= m.getDogNo() %></td>
                                    <td><%= m.getDogName() %></td>
                                    <td><%= m.getMemberEmail() %></td>
                                    <td><%= m.getMemberPhone() %></td>
                                </tr>
                        	<% } %>
							</form>
                            <button type="submit" id="deleteBtn" onclick="deleteConfirm()">강제추방</button>
                        </tbody>
                        
                       
                    
                </table>
                
                

				<script>
					$(function(){
						$(".list-area>tbody>tr>#detailInfo").click(function(){
							location.href='<%= contextPath %>/adminDog.me?mno=' + $(this).text();
						})
					})
					
					
					    function deleteConfirm() {
					        var result = confirm("해당 회원을 삭제 하시겠습니까?");
						        
						       if(result){
						            document.getElementById("deleteForm").submit();
						            alert("삭제 완료되었습니다!");
						        } else {							        	
						        	alert("취소 되었습니다.");
						        }
							     
						}
					
				</script>
				
			
                <br><br>
                
                <div class="paging-area" align="center">
                    <% if(currentPage != 1) { %>
                    <button onclick="location.href='<%= contextPath %>/adminSelectMember.me?cpage=<%= currentPage - 1 %>'"> &lt; </button>
                    <% } %>
                    
                    <% for(int p=startPage; p<=endPage; p++) { %>
                        <% if(p == currentPage) { %>
                        <button style="background-color:pink;"><%= p %></button>
                        <% } else { %>
                        <button onclick="location.href='<%= contextPath %>/adminSelectMember.me?cpage=<%= p %>'"><%= p %></button>
                        <% } %>
                    <% } %>
                    
                    <% if(currentPage != maxPage) { %>
                    <button onclick="location.href='<%= contextPath %>/adminSelectMember.me?cpage=<%= currentPage + 1 %>'"> &gt; </button>
                    <% } %>
                </div>
                <br>
            </div>
            
        </div>
        
        
    </div>



</body>
</html>