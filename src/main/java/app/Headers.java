package app;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;

@WebServlet(
        name = "Headers",
        urlPatterns = {"/headers"}
)
public class Headers extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // process the request
        List<String> headerNames = Collections.list(request.getHeaderNames());

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<ol>");
        for (String headerName : headerNames) {
            out.println("<li>" + headerName + ": " + request.getHeader(headerName) + "</li>");
        }
        out.println("</ol>");
        out.close();
    }

}
