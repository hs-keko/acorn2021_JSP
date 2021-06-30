package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/users/login")
public class LoginServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 폼 전송되는 아이디와 비밀번호를 읽어온다.
		String id=req.getParameter("id");
		/*	
		    DB 에 저장된 내용과 비교해서 맞는 정보인지 확인한다.
		 	유효한 정보이면 로그인 처리를 한다.
		 	로그인 처리라는 것은 로그인된 아이디를 session 영역에 담으면 된다.
		 	session 영역에 담는다는 것은 HttpSession 객체의 .setAttribute() 메소드를 이용해서 담는것이다.
		 	그렇다면 HttpSession 객체의 참조값은 어떻게 얻어올까?
		 	HttpSession 객체의 참조값은 HttpServletRequest 객체의 .getSession() 메소드를 이용해서
		 	얻어오면 된다.
		*/
		
		// 세션 객체의 참조값을 얻어와서
		HttpSession session=req.getSession();
		// "id" 라는 키값으로 String type(로그인된 아이디) 을 담는다.
		session.setAttribute("id",id);
		// 응답하기
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		pw.println("<!doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'/>");
		pw.println("<title>로그인 결과 페이지</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println(id+" 님 로그인 되었습니다.");
		pw.println("<a href='../index.jsp'>인덱스로 가기</a>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
