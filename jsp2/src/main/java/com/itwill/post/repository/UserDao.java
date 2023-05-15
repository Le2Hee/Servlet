package com.itwill.post.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.datasource.HikariDataSourceUtil;
import com.itwill.post.model.User;
import com.zaxxer.hikari.HikariDataSource;

// Repository(Persistence) 계층
public class UserDao {
    private static final Logger log = LoggerFactory.getLogger(UserDao.class);
    
    private final HikariDataSource ds = HikariDataSourceUtil.getInstance().getDataSource();
    
    private static UserDao instanse = null;
    
    private UserDao() {}
    
    public static UserDao getInstens() {
        if (instanse == null) {
            instanse = new UserDao();
        }
        
        return instanse;
    }
    
    // 로그인할 때 사용할 SQL.
    private static final String SQL_SELECT_BY_USERNAME_AND_PASSWORD = 
            "select * from MEMBERS where username = ? and password = ?";
    
    // 야규먼트 user 객체의 username과 password가 일치하는 정보를 찾으면 null이 아닌 값.
    // 일치하는 정보를 찾을 수 없으면 null을 리턴.
    public User selectByUsernameAndPassword(User user) {
        log.info("selectByUsernameAndPassword({})",user);
        
        User result = null;
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = ds.getConnection();
            stmt = conn.prepareStatement(SQL_SELECT_BY_USERNAME_AND_PASSWORD);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            
            rs = stmt.executeQuery();
            
            if (rs.next()) { // username과 password가 일치하는 행이 있으면.
                result = recordToUser(rs);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return result;
    }
    
    private User recordToUser(ResultSet rs) throws SQLException {
        long id = rs.getLong("ID");
        String username = rs.getString("USERNAME");
        String password = rs.getString("PASSWORD");
        String email = rs.getString("EMAIL");
        long point = rs.getLong("POINT");
        
        return new User(id, username, password, email, point);
    }
    
}
