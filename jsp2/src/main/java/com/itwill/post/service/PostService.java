package com.itwill.post.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.model.Post;
import com.itwill.post.repository.PostDao;

// Service(Business) layer(서비스/비즈니스 계층)
// Repository 계층의 메서드들을 사용해서 서비스를 만드는 역할.
public class PostService {
    // Slf4j 로깅 기능 사용.
    private static Logger log = LoggerFactory.getLogger(PostService.class);
    
    // Service 계층에서는 Repository 계층의 메서드 사용.
    private final PostDao postDao = PostDao.getInstance();
    
    private static PostService instance = null;
    
    private PostService() {}
    
    public static PostService getInstance() {
        if (instance == null) {
            instance = new PostService();
        }
        
        return instance;
    }
    
    public List<Post> read() {
        log.info("read()");
        
        return postDao.select();
    }
    
    public int create(Post post) {
        log.info("create({})", post);
        
        return postDao.insert(post);
    }

    public Post read(long id) {
        log.info("read({})", id);
        
        return postDao.read(id);
    }

    public int delete(long id) {
        log.info("read({})", id);
        
        return postDao.delete(id);
    }

    public int update(Post post) {
        log.info("update({})", post);
        
        return postDao.update(post);
    }

    public List<Post> readByTKey(String keyword) {
        log.info("readByTKey({})", keyword);
        
        return postDao.readByTKey(keyword);
    }

    public List<Post> readByCKey(String keyword) {
        log.info("readByCKey({})", keyword);
        
        return postDao.readByCKey(keyword);
    }

    public List<Post> readByTcKey(String keyword) {
        log.info("readByTcKey({})", keyword);
        
        return postDao.readByTcKey(keyword);
    }

    public List<Post> readByAKey(String keyword) {
        log.info("readByAKey({})", keyword);
        
        return postDao.readByAKey(keyword);
    }
    
}
