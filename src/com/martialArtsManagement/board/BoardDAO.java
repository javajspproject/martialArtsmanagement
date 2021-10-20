package com.martialArtsManagement.board;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
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
	
	//bdao.insertBoard(bb)
	public void insertBoard(BoardBean bb){
		System.out.println("BoardDAO-insertBoard() 호출");
		int b_id = 0;
		
		try {
		con = getConn();
		
			sql = "select max(board_id) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				b_id = rs.getInt(1)+1;
			}
			
			System.out.println("b_id : "+b_id);
			
			sql = "insert into "
					+ "board(board_id,board_title,board_category,board_content,readcount,"
					+ "re_ref,re_lev,re_seq,board_date,ip,file,member_id) " 
					+ "values(?,?,?,?,?,?,?,?,now(),?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1,b_id);
			pstmt.setString(2,bb.getB_title());
			pstmt.setString(3,bb.getB_category());
			pstmt.setString(4,bb.getB_content());
			pstmt.setInt(5,0);
			pstmt.setInt(6,b_id);
			pstmt.setInt(7,0); 
			pstmt.setInt(8,0);
			pstmt.setString(9,bb.getIp());
			pstmt.setString(10,bb.getFile());
			pstmt.setString(11,bb.getId());
			
			// 4
			pstmt.executeUpdate();
			System.out.println("글쓰기 완료!!!");
		
		} catch (Exception e) {
			System.out.println("글쓰기 오류!!!");
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	//bdao.insertBoard(bb)
	
	//bdao.getBoardCount()
	public int getBoardCount(){
		int count = 0; 
		
		try {
			con = getConn();
			sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
					
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt(1);
			}
			System.out.println("전체 개수 글 : "+count);
		
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}				
		return count;
	}	
	//bdao.getBoardCount()
	
	//bdao.getBoardListAll()
	public List getBoardListAll(){
		
		List boardList = new ArrayList();
		
		try {
			con = getConn();
			sql = "select * from board";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){

				BoardBean bb = new BoardBean();
				
				bb.setB_id(rs.getInt("board_id"));
				bb.setB_title(rs.getString("board_title"));
				bb.setB_category(rs.getString("board_category"));
				bb.setB_content(rs.getString("board_content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("board_date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				bb.setId(rs.getString("member_id"));
				
				boardList.add(bb);
			}
			
			System.out.println("게시판의 글 개수 : "+boardList.size());
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return boardList;		
	}
	//bdao.getBoardListAll()
	
	// bdao.updateReadCount();
	public void updateReadCount(int b_id){
		
		try {
			con = getConn();
			
			sql = "update board set readcount=readcount+1 where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			
			pstmt.executeUpdate();
			System.out.println(" 조회수 1 증가 ");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	// bdao.updateReadCount();
	
	// getBoard()
	public BoardBean getBoard(int b_id){
		BoardBean bb = null;

		try {
			con = getConn();
			
			sql = "select * from board where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				bb = new BoardBean();
				
				bb.setB_id(rs.getInt("board_id"));
				bb.setB_title(rs.getString("board_title"));
				bb.setB_category(rs.getString("board_category"));
				bb.setB_content(rs.getString("board_content"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setDate(rs.getDate("board_date"));
				bb.setIp(rs.getString("ip"));
				bb.setFile(rs.getString("file"));
				bb.setId(rs.getString("member_id"));
				
				System.out.println("정보조회 성공!"+bb.toString());	
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return bb;
	}
	// getBoard()
	
	//bdao.updateBoard(bb)
	public int updateBoard(BoardBean bb){
		int check = -1;
		
		try {
			con = getConn();
		
			sql = "select member_id from board where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bb.getB_id()); 
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				if(bb.getId().equals(rs.getString("member_id"))){

					sql = "update board set board_category=?, board_title=?, board_content=? where board_id=?";
					pstmt = con.prepareStatement(sql);
					
					pstmt.setString(1, bb.getB_category());
					pstmt.setString(2, bb.getB_title());
					pstmt.setString(3, bb.getB_content());
					pstmt.setInt(4,  bb.getB_id());
					
					check = pstmt.executeUpdate();
				}else{
					check = 0;
				}				
			}else{
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}	
	//bdao.updateBoard(bb)
	
	//bdao.deleteBoard(b_id, id)
	public int deleteBoard(int b_id, String id){
		int check = -1;
		
		try {
			con = getConn();
		
			sql = "select member_id from board where board_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, b_id);			
			
			rs =  pstmt.executeQuery();
			
			if(rs.next()){
				
				if(id.equals(rs.getString("member_id"))){
					
					sql = "delete from board where board_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, b_id);
					
					check = pstmt.executeUpdate();
					
				}else{
					check = 0;
				}						
			}else{
				check = -1; 				
			}
			System.out.println("글 삭제 완료 : "+check);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return check;
	}
	//bdao.deleteBoard(b_id, id)
	
	//bdao.reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb){
		System.out.println("bdao 호출");
		int b_id = 0;
		
		try {
			con = getConn();
		
			sql="select max(board_id) from board";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				b_id = rs.getInt(1)+1;
			}
			System.out.println("답글번호 : "+b_id);
						
			sql ="update board set re_seq=re_seq+1 "
					+ "where re_ref=? and re_seq>?";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, bb.getRe_ref());
			pstmt.setInt(2, bb.getRe_seq());
			
			pstmt.executeUpdate();
			System.out.println("답글 재정렬 완료");
			
			sql = "insert into "
					+ "board(board_id,board_title,board_category,board_content,readcount,"
					+ "re_ref,re_lev,re_seq,board_date,ip,file,member_id) " 
					+ "values(?,?,?,?,?,?,?,?,now(),?,?,?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, b_id);
			pstmt.setString(2, bb.getB_title());
			pstmt.setString(3, bb.getB_category());
			pstmt.setString(4, bb.getB_content());
			pstmt.setInt(5, 0);
			pstmt.setInt(6, bb.getRe_ref());
			pstmt.setInt(7, bb.getRe_lev()+1);
			pstmt.setInt(8, bb.getRe_seq()+1);
			pstmt.setString(9, bb.getIp());
			pstmt.setString(10, bb.getFile());
			pstmt.setString(11, bb.getId());
			
			pstmt.executeUpdate();
			
			System.out.println("답글 작성 완료!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
	}
	//bdao.reInsertBoard(bb)
	
	//bdao.getBoardList(startRow,pageSize)
	public ArrayList<BoardBean> getBoardList(int startRow, int pageSize){
		
		ArrayList<BoardBean> boardList = new ArrayList<BoardBean>();

		try{
		con = getConn();
		
		sql = "select * from board  "
				+ "order by re_ref desc, re_seq asc  "
				+ "limit ?,?";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, startRow-1);
		pstmt.setInt(2, pageSize); 
		
		rs = pstmt.executeQuery();

		while(rs.next()){ 
			BoardBean bb = new BoardBean();
			
			bb.setB_id(rs.getInt("board_id"));
			bb.setB_title(rs.getString("board_title"));
			bb.setB_category(rs.getString("board_category"));
			bb.setB_content(rs.getString("board_content"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setRe_ref(rs.getInt("re_ref"));
			bb.setRe_lev(rs.getInt("re_lev"));
			bb.setRe_seq(rs.getInt("re_seq"));
			bb.setDate(rs.getDate("board_date"));
			bb.setIp(rs.getString("ip"));
			bb.setFile(rs.getString("file"));
			bb.setId(rs.getString("member_id"));
			
			boardList.add(bb);
		}
		
		System.out.println("게시판의 글개수(boardList) : "+boardList.size());
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeDB();
		}

		return boardList;
	}
	//bdao.getBoardList(startRow,pageSize)
	
	
}
