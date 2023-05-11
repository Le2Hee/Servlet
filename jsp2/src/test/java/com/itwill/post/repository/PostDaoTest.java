package com.itwill.post.repository;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.model.Post;

public class PostDaoTest {
    
    private static final Logger log = LoggerFactory.getLogger(PostDaoTest.class);
    
    @Test
    public void testSelect() {
        PostDao dao = PostDao.getInstance();
        List<Post> list = dao.select();
        Assertions.assertNotEquals(0, list.size());
        // 사이즈가 0이 같지 않은걸 원한다.
        
        for (Post p : list) {
            log.info(p.toString());
//            log.info(p); -> 오류난다. Object를 가지고 있지 않기 때문에 문자열을 줘야됨.
        }
        
    }
    

}
