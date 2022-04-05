package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import data.Candidate;

@WebServlet(
		name = "AddCandidate",
		urlPatterns = {"/addcandidate"}
		)
public class AddCandidate extends HttpServlet {
	/*
	 * If the request type is POST, the request is transferred to the method doGet
	 */
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		doGet(request, response);
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();

		/*
		 * With a RequestDispatcher object is the htmlstart.html file included to this servlet
		 */
		RequestDispatcher rd=request.getRequestDispatcher("staticpages/htmlstart.html");
		rd.include(request,  response);;
		
		// Read parameters to Model
		Candidate candidate = readCandidate(request);
	
		// Create connection
		Dao dao=new Dao();
		
		// Save value and query total list
		dao.saveCandidate(candidate);
		ArrayList<Candidate> list=dao.readAllCandidates();
		
		// print output and close connection
		printCandidateList(out, list);
		dao.close();
		
		
		out.println("<br><a href='./form.html'>Back to form</a>");

		/*
		 * With a RequestDispatcher object is the htmlend.html file included to this servlet
		 */
		rd=request.getRequestDispatcher("staticpages/htmlend.html");
		rd.include(request,  response);;
	}


	private Candidate readCandidate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Candidate candidate=new Candidate();
		
		//candidate.setId(request.getParameter("EHDOKAS_ID"));
		
		candidate.setLastName(request.getParameter("SUKUNIMI"));
		candidate.setFirstName(request.getParameter("ETUNIMI"));
		candidate.setPAlign(request.getParameter("PUOLUE"));
		candidate.setState(request.getParameter("KOTIPAIKKAKUNTA"));
		
		// needs to be configured
		// candidate.setAge(request.getParameter("IKA"));
		
		candidate.setWhyQ(request.getParameter("MIKSI_EDUSKUNTAAN"));
		candidate.setBecauseAnswer(request.getParameter("MITA_ASIOITA_HALUAT_EDISTAA"));
		return candidate;
	}
	
	private void printCandidateList(PrintWriter out, ArrayList<Candidate> list) {
		out.println("<ul>");
		for (Candidate g:list) {
			out.println("<li>"+g);
		}
		out.println("</ul>");
	}

}