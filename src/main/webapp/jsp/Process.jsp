<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String lName=request.getParameter("SUKUNIMI");
String fName=request.getParameter("ETUNIMI");
String pAlign=request.getParameter("PUOLUE");
String hState=request.getParameter("KOTIPAIKKAKUNTA");
String cAge=request.getParameter("IKA");
String whyQuestion=request.getParameter("MIKSI_EDUSKUNTAAN");
String becauseAnswer=request.getParameter("MITA_ASIOITA_HALUAT_EDISTAA");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/vaalikone", "sandu", "password");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into EHDOKKAAT(SUKUNIMI,ETUNIMI,PUOLUE,KOTIPAIKKAKUNTA,IKA,MIKSI_EDUSKUNTAAN,MITA_ASIOITA_HALUAT_EDISTAA)values('"+lName+"','"+fName+"','"+pAlign+"','"+hState+"','"+cAge+"','"+whyQuestion+"','"+becauseAnswer+"')");
        out.println("Data is successfully inserted!");
        request.getRequestDispatcher("/jsp/UpdateCandidate.jsp").include(request, response); 

        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
 