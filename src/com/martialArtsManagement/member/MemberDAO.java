package com.martialArtsManagement.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	
	//DB연결
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql ="";
	
	private Connection getConn() throws Exception{

		Context init = new InitialContext(); 
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/martialArtsManagement");
		con = ds.getConnection();
		System.out.println(" 디비 연결 성공 : "+con);
		
		return con;
	}	
	//DB연결	
	
	// 자원해제 
	public void closeDB(){

		try {
			if(rs != null) rs.close();
			if(pstmt != null) pstmt.close();
			if(con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 자원해제
	
	//mdao.joinIdCheck
	public int joinIdCheck(String id){
		int check = 0;
		
			try {
				getConn();
		
			// 3. sql
				sql = "select * from member where member_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
			// 4.  실행	
				rs = pstmt.executeQuery();
			// 5 rs
				if(rs.next()){
					check = 1;
				}else{
					check = 0;
				}
				System.out.println("아이디 중복체크 끝");
					
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				closeDB();
			}		
		return check;
	}
	//mdao.joinIdCheck

	// mdao.insertMember(mb);
	public void insertMember(MemberBean mb){
		
		try {
			con = getConn();
			
			sql ="insert into member values(?,?,?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			pstmt.setString(2, mb.getPw());
			pstmt.setString(3, mb.getName());
			pstmt.setString(4, mb.getGender());
			pstmt.setInt(5, mb.getAge());
			pstmt.setString(6, mb.getEmail());
			pstmt.setString(7, mb.getPhone());
			pstmt.setString(8, mb.getAddr());
			pstmt.setTimestamp(9, mb.getReg_date());
			
			pstmt.executeUpdate();	
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}	
	// mdao.insertMember(mb);
	
	// loginCheck(id,pass)
	public int loginCheck(String id, String pw){
		int check = -1;
		
		try {
			getConn();
			
			sql = "select member_pw from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){	
				if(pw.equals(rs.getString("member_pw"))){
					check = 1;
				}else{
					System.out.println(check);
					check = 0;
				}
			}else{
				check = -1;
			}
			System.out.println("로그인 체크 완료 "+check);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}	
	// loginCheck(id,pass)
	
	// mdao.getMember(id)
	public MemberBean getMember(String id){
		MemberBean mb = null;
		
		try {
			getConn();
			
			sql = "select * from member where member_id=? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
		
			if(rs.next()){
				mb = new MemberBean();
				
				mb.setId(rs.getString("member_id"));
				mb.setPw(rs.getString("member_pw"));
				mb.setName(rs.getString("name"));
				mb.setGender(rs.getString("gender"));
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddr(rs.getString("address"));				
				mb.setReg_date(rs.getTimestamp("reg_date"));
				
			}
			System.out.println("회원정보 검색 완료!"+mb);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return mb;
	}
	// mdao.getMember(id)
	
	// mdao.updateMember(mb)
	public int updateMember(MemberBean mb) {
		int check = -1;
		
		try {
			getConn();
			
			sql = "select member_pw from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			
			rs = pstmt.executeQuery();

			if(rs.next()){
				if(mb.getPw().equals(rs.getString("member_pw"))){
					
					sql = "update member set member_pw=?,name=?,gender=?,age=?,email=?,phone=?, address=? where member_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, mb.getPw());
					pstmt.setString(2, mb.getName());
					pstmt.setString(3, mb.getGender());
					pstmt.setInt(4, mb.getAge());
					pstmt.setString(5, mb.getEmail());
					pstmt.setString(6, mb.getPhone());
					pstmt.setString(7, mb.getAddr());
					pstmt.setString(8, mb.getId());
					
					pstmt.executeUpdate();
					check = 1;
					System.out.println("수정 완료 "+check);
					
				}else {
					check = 0;
				}
			}else {
				check = -1;
			}			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	// mdao.updateMember(mb)
	
	//mdao.deleteMember(id, pw)
	public int deleteMember(String id,String pw){
		int check = -1;
		
		try {
			getConn();
			
			sql ="select member_pw from member where member_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(pw.equals(rs.getString("member_pw"))){
					sql = "delete from member where member_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, id);
					
					check = pstmt.executeUpdate();		
					System.out.println("삭제 "+check);
					
				}else{
					check = 0;
				}				
			}else{
				check = -1;
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return check;
	}
	//mdao.deleteMember(id, pw)
	
	// mdao.getMemberList
	public ArrayList<MemberBean> getMemberList(){
		ArrayList<MemberBean> memberList = new ArrayList<MemberBean>();
		
		try {
			getConn();
			
			sql = "select * from member";
			pstmt = con.prepareStatement(sql);

			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberBean mb = new MemberBean();
				
				mb.setId(rs.getString("member_id"));
				mb.setPw(rs.getString("member_pw"));
				mb.setName(rs.getString("name"));
				mb.setGender(rs.getString("gender"));
				mb.setAge(rs.getInt("age"));
				mb.setEmail(rs.getString("email"));
				mb.setPhone(rs.getString("phone"));
				mb.setAddr(rs.getString("address"));
				mb.setReg_date(rs.getTimestamp("reg_date"));				
				
				memberList.add(mb);
				System.out.println("회원정보 모두 저장완료!"+mb);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}
		return memberList;
	}
	// mdao.getMemberList
	
	
}
