package com.test.jsp.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement stat = null;
	private ResultSet rs = null;
	
	public MemberDAO() {
		this.conn=DBUtil.getConnection();
		System.out.println("MemberDAO Connected");
	}
	
	/*public static void main(String[] args) {
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		dto.setId("hong");
		dto.setPw("1112");
		
		int result =dao.login(dto);
		System.out.println(result);
		
		//단위테스트 진행!!!!!!!!!!!!!
		 
	}*/
	
	/*public int login(MemberDTO dto) {
		String sql ="select * from tblMember where id =? and pw =?";
		try {
			stat=conn.prepareStatement(sql);
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getPw());
			rs = stat.executeQuery();
			if(rs.next()) {
				//반횐된 레코드가 있다면 로그인 성공
				return 1;
			}else {
				//반환된 레코드가 없다면 로그인 실패
				return 0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return 0;
	}*/
	
	public MemberDTO login(MemberDTO dto) {
		MemberDTO newDTO = new MemberDTO();
		String sql ="select m.*,(select count(*) from tblCode where id = m.id) as cnt from tblMember m where id = ? and pw =?";
		try {
			stat=conn.prepareStatement(sql);
			stat.setString(1, dto.getId());
			stat.setString(2, dto.getPw());
			rs = stat.executeQuery();
			if(rs.next()) {
				//반횐된 레코드가 있다면 로그인 성공
				newDTO.setId(rs.getString("id"));
				newDTO.setName(rs.getString("name"));
				newDTO.setLv(rs.getString("lv"));
				newDTO.setCnt(rs.getString("cnt"));
				return newDTO;
			}else {
				//반환된 레코드가 없다면 로그인 실패
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return null;
	}
	
	
}
