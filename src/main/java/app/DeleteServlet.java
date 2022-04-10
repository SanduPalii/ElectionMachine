package app;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Dao;

@WebServlet("/DeleteServlet")  
public class DeleteServlet extends HttpServlet {  
    public void doGet(HttpServletRequest request, HttpServletResponse response)   
             throws ServletException, IOException { 
    	HttpSession session = request.getSession();

    	Dao dao = new Dao();
        String sid=request.getParameter("id");  
        int id=Integer.parseInt(sid);  
        dao.delete(id);  
        response.sendRedirect("ViewServlet");  
    }  
}
