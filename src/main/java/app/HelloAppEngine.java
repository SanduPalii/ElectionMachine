package app;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author sonny/sandu
 *
 */
@WebServlet(
    name = "HelloAppEngine",
    urlPatterns = {"/hello"}
)
public class HelloAppEngine extends HttpServlet {

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response) 
      throws IOException {

    response.setContentType("text/plain");
    response.setCharacterEncoding("UTF-8");
    
    HttpSession session = request.getSession(false);
    if (SecurityUtils.isUserLogged(session)) {
    	response.getWriter().println("User: " + session.getAttribute("LoggedUser"));
    } else {
    	response.getWriter().println("User not logged");
    }

    response.getWriter().println("<br><a href=\"/form.html\">Back</a>");

  }
}