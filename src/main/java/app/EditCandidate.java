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
import javax.servlet.http.HttpSession;

import dao.Dao;
import data.Candidate;

@WebServlet(
		name = "EditCandidate",
		urlPatterns = {"/editcandidate"}
		)
public class EditCandidate extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
		
		
		// if sessions does not exist, create new one
		HttpSession session = request.getSession();
		
		String idValue = request.getParameter("EHDOKAS_ID");
		
		if ( idValue != null ) {
			try {
				int id = Integer.parseInt(idValue);
				
				Dao dao = new Dao();
				Candidate candidate = dao.getCandidateInfo(id);
				
				session.setAttribute("candidate", candidate);
				
				RequestDispatcher rd = request.getRequestDispatcher("jsp/editform.jsp");
				rd.forward(request, response);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			// Back to list
			response.sendRedirect("/editcandidate");
			
		}
	
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws IOException, ServletException {
	
		
		// Create connection
		Dao dao=new Dao();
		Candidate candidate = readCandidate(request);
		
		dao.updateCandidate(candidate);
		
		dao.close();
		
		// Back to list after actions
		//RequestDispatcher rd = request.getRequestDispatcher("/showdata");
		//rd.forward(request, response);
		response.sendRedirect("/editcandidate");
	}
	
	private Candidate readCandidate(HttpServletRequest request) {
		// TODO Auto-generated method stub
		Candidate candidate=new Candidate();
		candidate.setId(Integer.parseInt(request.getParameter("EHDOKAS_ID")));
		candidate.setLastName(request.getParameter("SUKUNIMI"));
		candidate.setFirstName(request.getParameter("ETUNIMI"));
		candidate.setPalign(request.getParameter("PUOLUE"));
		candidate.setState(request.getParameter("KOTIPAIKKAKUNTA"));
		candidate.setId(Integer.parseInt(request.getParameter("IKA")));
		candidate.setWhyQ(request.getParameter("MIKSI_EDUSKUNTAAN"));
		candidate.setBecauseAnswer(request.getParameter("MITA_ASIOITA_HALUAT_EDISTAA"));
		return candidate;
	}
}
