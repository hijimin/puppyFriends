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
	
	public Member updateMember(Member m) {
		Connection conn = getConnection();
		
		int result1 = new MemberDao().updateMember(conn, m);
		int result2 = new MemberDao().updateDog(conn, m);
		
		Member updateMem = null;
		if(result1 * result2>0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, m.getMemberId());
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return updateMem;
	}
	
	public Member updatePwdMember(String memberId, String memberPwd, String updatePwd) {
		Connection conn = getConnection();
		int result = new MemberDao().updatePwdMember(conn, memberId, memberPwd, updatePwd);
		
		Member updateMem = null;
		if(result>0) {
			commit(conn);
			updateMem = new MemberDao().selectMember(conn, memberId);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return updateMem;
		
	}
	
	public int deleteMember(String memberId, String memberPwd) {
		Connection conn = getConnection();
		int result = new MemberDao().deleteMember(conn, memberId, memberPwd);
		
		if(result > 0 ) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
		
	}
	
	
	
	
	public Member selectOrderMember(int userNo) {
		Connection conn = getConnection();
		Member m = new MemberDao().selectOrderMember(conn, userNo);
		close(conn);
		return m;
	}
	
	public String selectId(String userName, String email) {
		
		Connection conn = getConnection();
		
		String userId = new MemberDao().selectId(conn, userName, email);
	
		close(conn);
	
		return userId;
				
}

public String selectPwd(String userName, String userId,String email) {
	
	Connection conn = getConnection();
	
	String userPwd = new MemberDao().selectPwd(conn, userName, userId, email);

	close(conn);

	return userPwd;
	
	
}
	
	
}
