package app;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;
import data.Candidate;

/**
 * Servlet implementation class RemoveCandidate
 */
/**
 * @author sonny
 *
 */
@WebServlet(
		name = "RemoveCandidate",
		urlPatterns = {"/removecandidate"}
		
		)


public class RemoveCandidate extends HttpServlet {
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
//		RequestDispatcher rd=request.getRequestDispatcher("jsp/showall.jsp");
//		rd.include(request,  response);
//		
		// Read parameters to Model
		Candidate candidate = updateCandidate(request);
	
		// Create connection
		Dao dao=new Dao();
		
		// Save value and query total list
		dao.saveCandidate(candidate);
		ArrayList<Candidate> list=dao.readAllCandidate();
		
		// print output and close connection
//		printCandidateList(out, list);
		dao.close();
		
		
//		out.println("<br><a href='./jsp/showall.jsp'>Back to form</a>");

		/*
		 * With a RequestDispatcher object is the htmlend.html file included to this servlet
		 */
		RequestDispatcher rd=request.getRequestDispatcher("/showdata");
		rd.forward(request, response);
	}
	
	private void printCandidateList(PrintWriter out, ArrayList<Candidate> list) {
		out.println("<ul>");
		for (Candidate g:list) {
			out.println("<li>"+g);
		}
		out.println("</ul>");
	}

	public Candidate updateCandidate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Candidate candidate=new Candidate();
		candidate.setLastName(request.getParameter("lName"));
		candidate.setFirstName(request.getParameter("fName"));
		candidate.setPalign(request.getParameter("pAlign"));
		candidate.setState(request.getParameter("hState"));
		candidate.setAge(Integer.parseInt(request.getParameter("cAge")));
		candidate.setWhyQ(request.getParameter("whyQuestion"));
		candidate.setBecauseAnswer(request.getParameter("becauseAnswer"));
		return candidate;
	}
	
}
