package com.itwill.jsp1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class SecondServlet
 */
// 서블릿 클래스이 URL 매핑(요청 주소)을 설정하는 방법.
// 1. web.xml 설정 파일에서 설정 하거나,
// 2. 서블릿 클래스에서 @WebServlet 애너테이션으로 설정하는 방법이 있다.
// (주의) 둘(web.xml과 애너테이션) 중 하나만 해야된다.
// import jakarta.servlet.annotation.WebServlet;이 들어가 있어야 애너테이션이 가능해서
//  ctrl+space를 사용하는 것이 좋다.
// name(문자열리턴)과 urlPatterns(배열리턴)를 사용해서 알려줘야 된다.
// 요즘은 애너테이션으로 넘어가는 추세이다.

@WebServlet(name = "secondServlet", urlPatterns = {"/ex2"})
public class SecondServlet extends HttpServlet {
    // servlet은 웹서버에 반영을 할려면 서버를 재시작 해야된다.
	private static final long serialVersionUID = 1L;
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException { // 실행되는 이유 : TOMCAT 서버가 호출해준다.
	    
	    response.setContentType("text/html; charset=UTF-8");
	    // 클라이언트로 보내는 응답(response)의 한글이 깨지지 않도록 하기 위해서.
	    // (주의) response.getWriter() 메서드를 호출하기 전에 컨텐트 타입을 세팅.
	    // -> <head>를 넣지않고 하는 방법.
	    
	    PrintWriter writer = response.getWriter(); // 응답을 보낼 때 사용하는 도구.
	    writer.append("<!doctype html")
	        .append("<html>")
	        .append("  <body>")
	        .append("      <h1>두번째 Servlet</h1>")
	        .append("      <a href='./'>인덱스 페이지</a>")
	        .append("  </body>")
	        .append("</html>");
	}

}
