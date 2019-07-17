package controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DateService;
import service.GreetingService;
import service.OtherService;
import service.Service;

@WebServlet("/")
public class FrontController extends HttpServlet {
	
	Map<String, Service> commands = new HashMap<String, Service>();
	
	public FrontController() {
		// /, /greeting, /now/date, 
		commands.put("/", new GreetingService());
		commands.put("/greeting", new GreetingService());
		commands.put("/now/date", new DateService());
		commands.put("/board/list", new DateService());
		commands.put("/board/write", new DateService());
	}
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청 파악 : parameter의 값으로 사용자 요청을 분석/구분
		//String command = request.getParameter("type");
		
		String command = request.getRequestURI();
		
		System.out.println("사용자 요청 URI : " + command);
		
		if(command.indexOf(request.getContextPath()) == 0) {
			//URI에서 contextPath부분을 제외하고 선택하는 코드
			command = command.substring(request.getContextPath().length());
		}
		
		//응답결과
		String resultObj = "";
		String viewpage = "";
		
		//요청에 맞는 기능 수행 : Model 처리 (Service + Dao + 기능 Class) -> 결과 데이터 반환
		//view 지정
		/*
		 * if(command == null || command.equals("/greeting") ||
		 * command.contentEquals("/")) {
		 * 
		 * //resultObj = (String) new GreetingService().getObject(request);
		 * 
		 * viewpage = new GreetingService().getViewPage(request);
		 * 
		 * 
		 * } else if (command.equals("/now/date")) { //작성한 경로가 mvc/now/date라고 친다면
		 * //contextPath를 제외시키는 코드를 위에서 작성했기 //때문에 그 뒷 부분 URI인 /now부터 시작하겠다는 의미
		 * //resultObj = new Date().toString();
		 * 
		 * //viewpage = "/datePage.jsp"; viewpage = new
		 * DateService().getViewPage(request);
		 * 
		 * } else {
		 * 
		 * //resultObj = "Invalid Type";
		 * 
		 * //viewpage = "simplePage.jsp"; viewpage = new
		 * OtherService().getViewPage(request); }
		 */
		
		Service service = commands.get(command);
		if(service == null) {
			service = new OtherService();
		}
		viewpage = service.getViewPage(request);
		
		//결과 데이터를 request 또는 session 영역에 속성으로 저장 : view로 데이터 전달, 공유
		//request.setAttribute("result", resultObj);
		
		//forwarding 
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewpage);
		dispatcher.forward(request, response);
	}
}
