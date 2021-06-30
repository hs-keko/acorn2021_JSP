package test.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class FortuneServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//오늘의 운세 얻어오기
		String fortuneToday="06월 10일의 운세 총운은 “사고뭉치” 입니다.\r\n" +
				"전반적으로 평균 정도의 운이 따르는 날이 될 것으로 보이는데 특히 모든 일의 초반은 어려우나 후반에는 의외로 일의 진행이 수월할 것으로 보입니다...";
		/*
		 * 오늘의 운세를 클라이언트에게 응답을 해야 한다.
		 * 어떤 형식으로 응답할까?
		 * html 형식이 적당하겠지?
		 * 그런데 문제가 있다.
		 * 나는 서블릿이기 때문에 html 형식의 문자열을 응답하기가 너무 불편하다.
		 * html 형식의 문자열을 전문적으로 응답하는 아이가 있을까?
		 * 아하! jsp 페이지가 전문이지!
		 * 그럼 jsp 페이지 한테 대신 html 형식의 문자열을 응답(응답을 위임)해 달라고 부탁해야겠다.
		 * 앗!
		 * 오늘의 운세를 전달 안해주었네 미안~
		 * request 영역에 "fortuneToday" 라는 키값으로 넣어둘테니
		 * 잘 빼서 써 jsp 야 고마워~
		 */
		
		//request 영역에 "fortuneToday" 라는 키값으로 String type 저장하기
		req.setAttribute("fortuneToday", fortuneToday);
		
		// 응답을 위임할 jsp 페이지의 위치를 전달하면서 RequestDispatcher 객체의 참조값을 얻어온다.
		RequestDispatcher rd=req.getRequestDispatcher("/test/fortune.jsp");
		// .forward(요청객체, 응답객체) 를 호출해서 대신 응답해 달라고 부탁한다.
		rd.forward(req, resp);
	}
}
