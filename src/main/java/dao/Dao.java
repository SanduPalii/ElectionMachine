package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import dao.Dao;
import data.Candidate;


import java.sql.PreparedStatement;


public class Dao {
	private Connection conn;
	public Dao() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			conn=java.sql.DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "sandu", "password");
		} catch (SQLException | InstantiationException | IllegalAccessException | ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
	public void addUser(String username, String pw, String salt) {
		String sql = "insert into useraccount (username, hashedpassword, salt) values (?,?,?)";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, username);
			stmt.setString(2, pw);
			stmt.setString(3, salt);
			
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public String getUserSalt(String username) {
		String result = "";
		String sql = "select salt from useraccount where username = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getString("salt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	public String getUserPasswordHash(String username) {
		String result = "";
		String sql = "select hashedpassword from useraccount where username = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			ResultSet rs = stmt.executeQuery();
			
			if (rs.next()) {
				result = rs.getString("hashedpassword");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int saveCandidate(Candidate candidate) {
		Statement stmt=null;
		int count=0;
		try {
			stmt = conn.createStatement();
			count=stmt.executeUpdate("insert into EHDOKKAAT(EHDOKAS_ID, SUKUNIMI, ETUNIMI, PUOLUE, KOTIPAIKKAKUNTA, IKA, MIKSI_EDUSKUNTAAN, MITA_ASIOITA_HALUAT_EDISTAA) values("+candidate.getId()+", "+candidate.getLastName()+", "+candidate.getFirstName()+", "+candidate.getPalign()+", "+candidate.getState()+", "+candidate.getAge()+", "+candidate.getWhyQ()+", "+candidate.getBecauseAnswer());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
	public ArrayList<Candidate> readAllCandidates() {
		ArrayList<Candidate> list=new ArrayList<>();
		Statement stmt=null;
		int count=0;
		try {
			stmt = conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from EHDOKKAAT");
			while (rs.next()) {
				Candidate candidate=new Candidate();
				candidate.setId(rs.getInt("EHDOKAS_ID"));
				candidate.setLastName(rs.getString("SUKUNIMI"));
				candidate.setFirstName(rs.getString("ETUNIMI"));
				candidate.setPalign(rs.getString("PUOLUE"));
				candidate.setState(rs.getString("KOTIPAIKKAKUNTA"));
				candidate.setAge(rs.getInt("IKA"));
				candidate.setWhyQ(rs.getString("MIKSI_EDUSKUNTAAN"));
				candidate.setBecauseAnswer(rs.getString("MITA_ASIOITA_HALUAT_EDISTAA"));
				list.add(candidate);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	public Candidate getCandidateInfo(int id) {
		Candidate result = null;
		String sql = "select * from EHDOKKAAT where EHDOKAS_ID = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
						
			stmt.setInt(1, id);
			
			ResultSet resultset = stmt.executeQuery();
			
			if (resultset.next()) {
				result = new Candidate();
				result.setId(resultset.getInt("EHDOKAS_ID"));
				result.setLastName(resultset.getString("SUKUNIMI"));
				result.setFirstName(resultset.getString("ETUNIMI"));
				result.setPalign(resultset.getString("PUOLUE"));
				result.setState(resultset.getString("KOTIPAIKKAKUNTA"));
				result.setAge(resultset.getInt("IKA"));
				result.setWhyQ(resultset.getString("MIKSI_EDUSKUNTAAN"));
				result.setBecauseAnswer(resultset.getString("MITA_ASIOITA_HALUAT_EDISTAA"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateCandidate(Candidate candidate) {
		int count = 0;
		String sql = "update EHDOKKAAT set SUKUNIMI = ?, ETUNIMI = ?, PUOLUE = ?, KOTIPAIKKAKUNTA = ?, IKA = ?, MIKSI_EDUSKUNTAAN = ?, MITA_ASIOITA_HALUAT_EDISTAA = ?, where EHDOKAS_ID = ?";
		try {
			PreparedStatement stmt = conn.prepareStatement(sql);
			
			stmt.setString(1, candidate.getLastName());
			stmt.setString(2, candidate.getFirstName());
			stmt.setString(3, candidate.getPalign());
			stmt.setString(4, candidate.getState());
			stmt.setInt(5, candidate.getAge());
			stmt.setString(6, candidate.getWhyQ());
			stmt.setString(7, candidate.getBecauseAnswer());
			
			
			stmt.setInt(8, candidate.getId());
			
			count = stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return count;
	}
	
}
