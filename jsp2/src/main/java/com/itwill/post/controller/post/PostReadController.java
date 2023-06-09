package com.itwill.post.controller.post;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.model.Post;
import com.itwill.post.service.PostService;

/**
 * Servlet implementation class PostUpdateController
 */
@WebServlet(name = "postReadController", urlPatterns = {"/post/detail"})
public class PostReadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private static final Logger log = LoggerFactory.getLogger(PostReadController.class);
	
	private final PostService postService = PostService.getInstance();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
	        throws ServletException, IOException {
	    log.info("doGet()");
	    
	    long id = Long.parseLong(request.getParameter("id"));
        
        Post post = postService.read(id);
        log.info("post: {}", post);
        
        request.setAttribute("post", post);
	    
	    request.getRequestDispatcher("/WEB-INF/post/detail.jsp").forward(request, response);
	    
	}

}
