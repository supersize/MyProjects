package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.Dto;

public class Dao {

	private static final int MEMBER_EXISTENCE = 1;
	private static final int MEMBER_NOT_EXISTENCE = 0;
	private static final int MEMBER_JOIN_FAIL = 0;
	private static final int MEMBER_JOIN_SUCCESS = 1;
	private static final int MEMBER_LOGIN_PW_NO_GOOD = 0;
	private static final int MEMBER_LOGIN_SUCCESS = 1;
	private static final int MEMBER_LOGIN_IS_NOT = -1;
	
	private static Dao instance = new Dao();
	
	public static Dao getDao() {
		return instance;
	}
	
	public int insertMember(Dto dto) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		String query = "insert into test4 values(?,?,?,?,?,?)";
		try {
			conn = getConnnection();
			pstm = conn.prepareStatement(query);
			pstm.setString(1, dto.getId());
			pstm.setString(2, dto.getPw());
			pstm.setString(3, dto.getName());
			pstm.setString(4, dto.geteMail());
			pstm.setTimestamp(5, dto.getrDate());
			pstm.setString(6, dto.getAddress());
			pstm.executeUpdate();
			ri = MEMBER_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				pstm.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public Dto getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		String query = "Select * from test4 where id = ?";
		Dto dto = new Dto();
		
		try {
			conn = getConnnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddress(rs.getString("address"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	public int confirmMember(String id) {
		int ri = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select id from test4 where id = ?";
		
		try {
			conn = getConnnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				ri = MEMBER_EXISTENCE;
			}else{
				ri = MEMBER_NOT_EXISTENCE;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int deleteMember(String id) {
		int ri = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "delete from test4 where id=?";
		
		try {
			conn = getConnnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			ri = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int updateMember(Dto dto) {
		int ri = 0;
		System.out.println("update"+dto.getPw()+ dto.geteMail()+dto.getAddress()+dto.getId()+dto.getName());
		Connection conn = null;
		PreparedStatement pstms = null;
		String query = "update test4 set pw=?, eMail=?, address = ? where id = ?";
		
		try {
			conn = getConnnection();
			pstms = conn.prepareStatement(query);
			pstms.setString(1, dto.getPw());
			pstms.setString(2, dto.geteMail());
			pstms.setString(3, dto.getAddress());
			pstms.setString(4, dto.getId());
			ri = pstms.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try {
				pstms.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
	public int userCheck(String id, String pw) {
		int ri = 0;
		String dbpw;
		System.out.println("아이디 첵 : "+ id +" , "+ pw);
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select pw from test4 where id=?";
		
		try {
			conn = getConnnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dbpw = rs.getString("pw");
				if(dbpw.equals(pw)){
					ri = MEMBER_LOGIN_SUCCESS;
				}else{
					ri = MEMBER_LOGIN_PW_NO_GOOD;
				}
			}else{
				ri = MEMBER_LOGIN_IS_NOT;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return ri;
	}
	
//-------------------------------------------------------
	public ArrayList<Dto> membersAll() {
		
		ArrayList<Dto> dtos = new ArrayList<>();
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "select * from test4";
		
		
		try {
			conn = getConnnection();
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Dto dto = new Dto();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.seteMail(rs.getString("eMail"));
				dto.setrDate(rs.getTimestamp("rDate"));
				dto.setAddress(rs.getString("address"));
				dtos.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				rs.close();
				pstmt.close();
				conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	private Connection getConnnection() {
		Context context = null;
		DataSource datasource = null;
		Connection conn = null;
		try {
			context = new InitialContext();
			datasource = (DataSource)context.lookup("java:comp/env/jdbc/MySQL");
			conn = datasource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
