//package app;
//
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//
//import data.Candidate;
//
//public class CandidateDao {
//	 
//     
//	public static Connection getConnection(){ 
//			String jdbcURL = "jdbc:mysql://127.0.0.1:3306/vaalikone?user=root";
//	
//		     String dbUser = "root";
//		     String dbPassword = "password";
//	       Connection con=null;  
//	        try{  
//	        	con=DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
//	
//	            con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/?user=root","root","password"); 
//	            
//	        }catch(Exception e){System.out.println(e);}  
//	        return con;  
//        }
//	
//	 public static int save(Candidate e){
//	        int status=0;  
//	        try{  
//	            Connection con=CandidateDao.getConnection(); 
//	            PreparedStatement ps=con.prepareStatement( 
//	            		"insert into EHDOKKAAT(EHDOKAS_ID, SUKUNIMI, ETUNIMI, PUOLUE, KOTIPAIKKAKUNTA, IKA, MIKSI_EDUSKUNTAAN, MITA_ASIOITA_HALUAT_EDISTAA) values (?,?,?,?,?,?,?,?)");
//	            ps.setInt(1,e.getId());
//	            ps.setString(2,e. getLastName());  
//	            ps.setString(3,e.getFirstName());  
//	            ps.setString(4,e.getPalign());  
//	            ps.setString(5,e.getState());  
//	            ps.setInt(5,e.getAge());
//	            ps.setString(7,e.getWhyQ());  
//	            ps.setString(8,e.getBecauseAnswer());  
//	             
//	            status=ps.executeUpdate(); 
//	            
//	            con.close();  
//	            
//	        }catch(Exception ex){ex.printStackTrace();}  
//	          
//	        return status;  
//	    }  
//	 
//	 
//	 public static int update(Candidate e){
//	        int status=0;  
//	        try{  
//	            Connection con=CandidateDao.getConnection(); 
//	            PreparedStatement ps=con.prepareStatement( 
//	            		"update EHDOKKAAT set SUKUNIMI = ?, ETUNIMI = ?, PUOLUE = ?, KOTIPAIKKAKUNTA = ?, IKA = ?, MIKSI_EDUSKUNTAAN = ?, MITA_ASIOITA_HALUAT_EDISTAA = ?, where EHDOKAS_ID = ?"); 
//	            ps.setInt(1,e.getId());
//	            ps.setString(2,e. getLastName());  
//	            ps.setString(3,e.getFirstName());  
//	            ps.setString(4,e.getPalign());  
//	            ps.setString(5,e.getState());  
//	            ps.setInt(5,e.getAge());
//	            ps.setString(7,e.getWhyQ());  
//	            ps.setString(8,e.getBecauseAnswer()); 
//	             
//	            status=ps.executeUpdate(); 
//	            
//	            con.close();  
//	            
//	        }catch(Exception ex){ex.printStackTrace();}  
//	          
//	        return status;  
//	    }  
//	 
//	            
//	 public static int delete(int Id){  
//		 int status=0; 
//		 try{  
//			 Connection con=CandidateDao.getConnection(); 
//	            PreparedStatement ps=con.prepareStatement( 
//	            		"delete from EHDOKKAAT where Id=?" );
//	            
//	            ps.setInt(1,Id);  
//	            status=ps.executeUpdate();  
//	              
//	            con.close();  
//	        }catch(Exception e){e.printStackTrace();}  
//	          
//	        return status;  
//	    }  
//	 
//	 public static Candidate getCandidateByID(int Id){  
//	        Candidate e=new Candidate();  
//	          
//	        try{  
//	        	Connection con=CandidateDao.getConnection(); 	
//	        	PreparedStatement ps=con.prepareStatement(
//	        			"select * from EHDOKKAAT where Id=?");  
//	        	
//	        	ps.setInt(1,Id);
//	        	ResultSet rs=ps.executeQuery(); 
//	        	if(rs.next()){  
//	        		e.setId(rs.getInt(1));  
//	                e.setLastName(rs.getString(2));  
//	                e.setFirstName(rs.getString(3));  
//	                e.setPalign(rs.getString(4));  
//	                e.setState(rs.getString(5)); 
//	                e.setAge(rs.getInt(6));
//	                e.setWhyQ(rs.getString(7));  
//	                e.setBecauseAnswer(rs.getString(8));  
//	        	}
//	        	 con.close();  
//	        }catch(Exception ex){ex.printStackTrace();}  
//	        
//	        return e;  
//	    }  
//	 public static List<Candidate> getAllCandidates(){
//		 List<Candidate> list=new ArrayList<Candidate>();
//		 try{  
//	            Connection con=CandidateDao.getConnection(); 
//	            PreparedStatement ps=con.prepareStatement("select * from EHDOKKAAT");
//	            ResultSet rs=ps.executeQuery();  
//	            while(rs.next()){ 
//	            	
//	            	Candidate e=new Candidate();
//	            	e.setId(rs.getInt(1));  
//	                e.setLastName(rs.getString(2));  
//	                e.setFirstName(rs.getString(3));  
//	                e.setPalign(rs.getString(4));  
//	                e.setState(rs.getString(5)); 
//	                e.setAge(rs.getInt(6));
//	                e.setWhyQ(rs.getString(7));  
//	                e.setBecauseAnswer(rs.getString(8));   
//	            }
//	            con.close();  
//	        }catch(Exception e){e.printStackTrace();}  
//	          
//	        return list;  
//	    }  
//	}  