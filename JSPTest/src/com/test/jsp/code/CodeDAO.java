package com.test.jsp.code;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class CodeDAO {
	Connection conn = null;
	
	public CodeDAO() {
		this.conn = DBUtil.getConnection();
	}
	
	public ArrayList<CategoryDTO> listCategory(){
		ArrayList<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		String sql="select * from tblCategory";
		try {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			while(rs.next()) {
				CategoryDTO dto = new CategoryDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setName(rs.getString("name"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public int add(CodeDTO dto) {
		String sql = "insert into tblCode values(code_seq.nextval,?,?,?,sysdate,?,?)";
		
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getCategory());
			stat.setString(4, dto.getId());
			stat.setString(5, dto.getFilename());
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("CodeDAO.add :" + e.toString());
		}
		
		return 0;
	}
	
	public ArrayList<CodeDTO> list(){
		String sql = "select seq,subject,"
						+ "(select name from tblMember where id = c.id) as name,"
							+ "to_char(regdate,'yyyy-mm-dd') as regdate,"
								+ "(select name from tblCategory where seq = c.category) as categoryName "
									+ "from tblCode c order by seq desc";
		
		try {
			Statement stat = conn.createStatement();
			ResultSet rs = stat.executeQuery(sql);
			ArrayList<CodeDTO> list = new ArrayList<CodeDTO>();
			while(rs.next()) {
				CodeDTO dto = new CodeDTO();
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setName(rs.getString("name"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setCategoryName(rs.getString("categoryName"));
				list.add(dto);
			}
			return list;
		} catch (Exception e) {
			System.out.println("CodeDAO.list :" + e.toString());
		}
		
		
		return null;
	}
	
	public CodeDTO get(String seq) {
		String sql = "select c.*, " + 
				"    (select name from tblMember where id = c.id) as name, " + 
				"        (select name from tblCategory where seq = c.category) as categoryName  " + 
				"            from tblCode c where seq = ?";
		
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			ResultSet rs = stat.executeQuery();
			CodeDTO dto = new CodeDTO();
			if(rs.next()) {
				dto.setSeq(rs.getString("seq"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getString("content"));
				dto.setCategoryName(rs.getString("categoryName"));
				dto.setCategory(rs.getString("category"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setId(rs.getString("id"));
				dto.setName(rs.getString("name"));
				dto.setFilename(rs.getString("filename"));
			}
			return dto;

		} catch (Exception e) {
			System.out.println("CodeDAO.get :" + e.toString());
		}
		
		
		
		return null;
	}
	
	public int edit(CodeDTO dto) {
		String file="";
		if(dto.getFilename()!=null) {
			file=", filename=? ";			
		}
		
		String sql = String.format("update tblCode set subject=? , content =?, category =? %s where seq =? ",file);
		
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, dto.getSubject());
			stat.setString(2, dto.getContent());
			stat.setString(3, dto.getCategory());
			//stat.setString(4, dto.getId());
			
			if(dto.getFilename()!=null) {
				stat.setString(4, dto.getFilename());
				stat.setString(5, dto.getSeq());				
			}else {
				stat.setString(4, dto.getSeq());
			}
			
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("CodeDAO.add :" + e.toString());
		}
		
		return 0;
	}
	
	public int del(String seq) {
		String sql = "delete from tblCode where seq = ?";
		
		try {
			PreparedStatement stat = conn.prepareStatement(sql);
			stat.setString(1, seq);
			return stat.executeUpdate();
		} catch (Exception e) {
			System.out.println("CodeDAO.del :" + e.toString());
		}
		
		
		return 0;
	}
	
	
}
