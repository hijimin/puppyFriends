package com.kh.member.model.service;

import java.sql.Connection;

import static com.kh.common.JDBCTemplate.*;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Dog;
import com.kh.member.model.vo.Member;

public class MemberService {

	public Member loginMember(String userId, String userPwd) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, userId, userPwd);
		
		close(conn);
		
		return loginUser;
	}
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;
		
		
	}
	
	public Member kakaoLoginMember(String memberId, String memberName, String memberEmail) {
		Connection conn = getConnection();
		
		Member m = new MemberDao().kakaoLoginMember(conn, memberId, memberName, memberEmail);
		
		close(conn);
		
		return m;
	}
	
	
	
	
	public int insertMember(Member m, Dog d) {
		Connection conn = getConnection();
		int result = new MemberDao().insertMember(conn, m);
		int result2 = new MemberDao().insertDog(conn, d);
		
		if(result>0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result * result2;
				
	}
	
	
	
	public Member selectOrderMember(int userNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectOrderMember(conn, userNo);
		close(conn);
		return m;
	}
	
	
}
