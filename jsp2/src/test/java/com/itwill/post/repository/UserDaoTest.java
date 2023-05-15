package com.itwill.post.repository;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.model.User;

public class UserDaoTest {
    
    private final Logger log = LoggerFactory.getLogger(UserDaoTest.class);
    
    @Test
    public void loginTest() {
        UserDao userDao = UserDao.getInstens();
        Assertions.assertNotNull(userDao);
        
        // username이 "admin"이고 password가 "admin0000"인 테스트 사용자 객체.
        User result = userDao.selectByUsernameAndPassword(new User(0, "admin", "admin0000", null, 0));
        
        // username, password 가 일치하는 사용자를 찾을 수 있어야 함.
        Assertions.assertNotNull(result);
        
        log.info("result: {}", result);
        
        // username or password가 일치하지 않는 사용자는 찾을 수 없어야 한다.
        result = userDao.selectByUsernameAndPassword(new User(0, "Admin", "admin0000", null, 0));
        Assertions.assertNull(result);
        
        log.info("result: {}", result);
        
    }
    
}
