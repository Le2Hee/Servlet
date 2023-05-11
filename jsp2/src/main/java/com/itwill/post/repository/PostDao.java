package com.itwill.post.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.itwill.post.datasource.HikariDataSourceUtil;
import com.itwill.post.model.Post;
import com.zaxxer.hikari.HikariDataSource;

import static com.itwill.post.model.Post.Entity.*;

// Repository(Persistence) Layer(저장소/영속성 계층)
// DB CRUD(Create, Read, Update, Delete) 작업을 수행하는 계층.
public class PostDao {
    // Slf4j 로깅 기능 사용을 위해 변수 선언.
    private static final Logger log = LoggerFactory.getLogger(PostDao.class);
    
    private static PostDao instance = null; 
   
    private HikariDataSource ds;
   
    private PostDao() {
        ds = HikariDataSourceUtil.getInstance().getDataSource();
    }
    
    public static PostDao getInstance() {
        if (instance == null) {
            instance = new PostDao();
        }
        
        return instance;
    }
   
    // POSTS 테이블에서 전체 레코드를 id 내림차순으로 정렬(최근 작성 포스트 먼저)해서 검색하는 기능.
    private static final String SQL_SELECT_ALL = "select * from POSTS order by ID desc";
    
    public List<Post> select() {
        List<Post> list = new ArrayList<>();
        
        log.info(SQL_SELECT_ALL);
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try {
            conn = ds.getConnection(); // 풀에서 Connection 객체를 빌려옴.
            stmt = conn.prepareStatement(SQL_SELECT_ALL);
            rs = stmt.executeQuery();
            
            while(rs.next()) {
                // 테이블 컬럼 내용을 Post 타입 객체로 변환하고 리스트에 추가;
                Post post = recordToPost(rs);
                list.add(post);
            }
            log.info("# of rows = {}", list.size());
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close(); // 물리적인 접속 해제가 아니라, 빌려왔던 Connection을 풀에 반환!!
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        return list;
    }

    private Post recordToPost(ResultSet rs) throws SQLException {
        long id = rs.getLong(COL_ID);
        String title = rs.getString(COL_TITLE);
        String content = rs.getString(COL_CONTENT);
        String author = rs.getString(COL_AUTHOR);
        LocalDateTime createdtime = rs.getTimestamp(COL_CREATEDTIME).toLocalDateTime();
        LocalDateTime modifiedtime = rs.getTimestamp(COL_MODIFIEDTIME).toLocalDateTime();
        
        Post post = new Post(id, title, content, author, createdtime, modifiedtime);
        
        return post;
    }
    
    private static final String SQL_INSERT = 
            "insert into POSTS (title, content, author) values (?, ?, ?)";
    
    public int insert(Post post) {
        log.info("insert({})", post);
        
        int result = 0; // executeUpdate() 결과(insert 결과)를 저장할 변수.
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            conn = ds.getConnection();
            stmt = conn.prepareStatement(SQL_INSERT);
            
            stmt.setString(1, post.getTitle());
            stmt.setString(2, post.getContent());
            stmt.setString(3, post.getAuthor());
            
            result = stmt.executeUpdate();
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        
        
        return result;
    }
    
    private static final String SQL_READ = "select * from POSTS where id = ?";

    public Post read(int id) {
        log.info("read({})", id);
        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Post post = null;
        
        try {
            conn = ds.getConnection();
            stmt = conn.prepareStatement(SQL_READ);
            stmt.setInt(1, id);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                long oid = rs.getLong(COL_ID);
                String title = rs.getString(COL_TITLE);
                String content = rs.getString(COL_CONTENT);
                String author = rs.getString(COL_AUTHOR);
                LocalDateTime createdTime = rs.getTimestamp(COL_CREATEDTIME).toLocalDateTime();
                LocalDateTime modifiedTime = rs.getTimestamp(COL_MODIFIEDTIME).toLocalDateTime();
                
                post = new Post(oid, title, content, author, createdTime, modifiedTime);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return post;
    }
    
    
   
}
