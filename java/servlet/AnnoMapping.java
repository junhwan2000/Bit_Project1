package servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet( "/servlet/AnnoMapping.do" )
public class AnnoMapping extends HttpServlet{
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setAttribute( "message", "매핑 성공" );
		req.getRequestDispatcher( "/servlet/AnnoMapping.jsp" )
			.forward( req, resp );
	}
}
