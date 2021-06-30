package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		String fortuneToday="동쪽으로 가면 귀인을 만나요";
	 
		req.setAttribute("fortune",fortuneToday);
		
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		rd.forward(req, resp);
	     }
}



