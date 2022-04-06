package app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(
		name = "LogoutServlet",
		urlPatterns = {"/logout"}
		)

public class LogoutServlet extends HttpServlet {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response)
		throws IOException, ServletException {
		HttpSession session = request.getSession(false);
		
		if (session != null) {
			session.invalidate();
			session = null;
		}
		response.sendRedirect("index.html");
	}
}
