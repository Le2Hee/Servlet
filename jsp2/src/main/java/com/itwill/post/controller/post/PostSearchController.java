package com.itwill.post.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.model.Post;
import com.itwill.post.service.PostService;

/**
 * Servlet implementation class PostSearchController
 */
@WebServlet(name = "postSearchController", urlPatterns = {"/post/search"})
public class PostSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static final Logger log = LoggerFactory.getLogger(PostSearchController.class);
	
	private final PostService postService = PostService.getInstance();
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    log.info("doGet()");
	    
	    String category = request.getParameter("category");
	    String keyword =  request.getParameter("keyword");
	    log.info("카테고리 : {}", category);
	    log.info("키워드 : {}", keyword);
	    
	    List<Post> posts = new ArrayList<>();
	    
	    if (category.equals("t")) {
	        posts = postService.readByTKey(keyword);
	    } else if (category.equals("c")) {
	        posts = postService.readByCKey(keyword);
	    } else if (category.equals("tc")) {
	        posts = postService.readByTcKey(keyword);
	    } else if (category.equals("a")) {
	        posts = postService.readByAKey(keyword);
	    }
	    log.info("검색된 Post: {}", posts);
	    
	    request.setAttribute("posts", posts);
	    
	    request.getRequestDispatcher("/WEB-INF/post/search.jsp").forward(request, response);
	}

}
