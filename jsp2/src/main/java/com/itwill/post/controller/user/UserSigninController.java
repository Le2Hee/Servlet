package com.itwill.post.controller.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.model.User;
import com.itwill.post.service.UserService;

/**
 * Servlet implementation class UserSigninController
 */
@WebServlet(name = "userSigninController", urlPatterns = {"/user/signin"})
public class UserSigninController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static final Logger log = LoggerFactory.getLogger(UserSigninController.class);
	
	private final UserService userServuce = UserService.getInstance();
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		log.info("doGet()");
	    
	    
	    
	    request.getRequestDispatcher("/WEB-INF/user/signin.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
		log.info("doPost()");
		
		// 요청 파라미터에 포함된 username과 password를 읽음.
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		// Service 계층의 메서드를 호출해서 로그인 성공/실패 여부를 판단.
		User user = userServuce.signIn(username, password);
		log.info("로그인 결과: {}", user);
		
		if (user == null) { // username 또는 password가 일치하지 않는 경우 - 로그인 실패.
		    // 로그인 페이지로 이동(redirect)
		    response.sendRedirect("/post/user/signin");
		    //  /context-root/path?query-string
		    
		    return; // doPost() 종료
		}
		
		// 로그인 성공
		// (1) 세션(session)에 로그인 정보를 저장.
		HttpSession session = request.getSession(); // 세션 객체 찾기
		session.setAttribute("signedInUser", user.getUsername());  
		// "" -> 변수 이름, 로그인한 유저 이름만 저장. 세션 객체에 로그인 username만 저장.
		
		// (2) 적절한 페이지로 이동. (main으로 이동)
		response.sendRedirect("/post");
		
		
	}

}
