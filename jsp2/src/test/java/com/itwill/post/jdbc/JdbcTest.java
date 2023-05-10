package com.itwill.post.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.MethodOrderer.OrderAnnotation;
import org.junit.jupiter.api.Order;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.TestMethodOrder;

import com.itwill.post.model.Post;

import oracle.jdbc.OracleDriver;

import static com.itwill.post.model.Post.Entity.*;

// JUnit Test(자바 단위 테스트)를 하기 위한 클래스.
// JDBC(Java Database Connectivity) 테스트 - ojdbc11 라이브러리 동작 여부 테스트.
// main()를 만들지 않고, test()를 작성하면 junit-jupiter-engine에서 test()를 실행.
@TestMethodOrder(OrderAnnotation.class) // 테스트 메서드 실행 순서를 애너테이션을 설정한다.
public class JdbcTest {
    
    // Oracle DB 접속 주소
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:xe";
    
    // DB 접속 계정
    private static final String USER = "scott";
    
    // DB 접속 비밀번호
    private static final String PASSWORD = "tiger";
    
    // Test method 작성 :
    //  1. @Test 애너테이션을 사용해야 된다.
    //     -> 엔진에서 이 메서드가 test메서드인지 판단한다.
    //     -> 애너테이션도 import 해야 된다.
    //  2. 반드시 public이여야 한다. 
    //     -> 직접 실행 시키는게 아니라 JUnit이라는 엔진으로 실행시키기 때문이다.
    //  3. return 타입은 void이여야 한다.
    //     -> 리턴타입을 검사하지 않는다. 테스트가 무조건 끝나야 한다.
    //  4. 파라미터를 갖지 않음.
    //     -> 수 많은 파라미터가 존재하는데 모든 경우의 수를 포함하는 엔진을 만들 수 없기 때문이다.
    
    //  테스트 성공/ 실패 여부는 test() 작성자가 설정해야 된다.
    
    // @Test 애너테이션이 2개 이면 형식상으로는 윗 코드 부터 진행하지만 
    //  method의 실행순서를 설정할 수 있다.
    //  -> 두 곳에서 설정을 해야된다. 
    //  1. class
    //   -> @TestMethodOrder(OrderAnnotation.class) 
    //   -> 테스트 메서드 실행 순서를 애너테이션을 설정한다.
    //  2. method
    //   -> @Order(2)
    //   -> method 마다 번호를 지정한다. 
    
    @Test
    @Order(2) // 2번째로 실행할 테스트 메서드.
    public void testSelect( ) throws SQLException {
        // 1. JDBC 라이브러리를 DriverManager에 등록.
        DriverManager.registerDriver(new OracleDriver());
        System.out.println("OJDBC Driver 등록 성공");
        
        // 2. 등록된 JDBC 드라이버를 사용해서 DB 서버에 접속.
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        
        // 단위 테스트 성공 조건을 작성
        Assertions.assertNotNull(conn); 
        // -> conn이 null이 아니면 테스트 성공, 그렇지 않으면 테스트 실패.
        
        System.out.println("conn : " + conn);
        
        // POSTS 테이블의 전체 내용을 검색(select)하고 
        // ArrayList<Post>를 생성하고,
        // 그 결과를 콘솔창에 출력.
        // ArrayList<Post>의 원소 개수는 1개임을 주장.
        String sql = "select * from posts";
        PreparedStatement stmt = conn.prepareStatement(sql);
        
        ResultSet rs = stmt.executeQuery();
        
        ArrayList<Post> list = new ArrayList<>();
        int count = 0;
        
        while (rs.next()) {
            long id = rs.getLong(COL_ID);
            String title = rs.getString(COL_TITLE);
            String content = rs.getString(COL_CONTENT);
            String author = rs.getString(COL_AUTHOR);
            LocalDateTime createdTime = rs.getTimestamp(COL_CREATEDTIME).toLocalDateTime();
            LocalDateTime modifiedTime = rs.getTimestamp(COL_MODIFIEDTIME).toLocalDateTime();
            
            Post p = new Post(id, title, content, author, createdTime, modifiedTime);
            
            list.add(p);
            count++;
            
            System.out.println(p);
        }
        
        Assertions.assertEquals(count, list.size());
        // -> list의 크기 (원소 개수)가 1이면 단위 테스트 성공, 그렇지 않으면 실패.
        
        // DB와 연결된 접속을 해제
        rs.close();
        stmt.close();
        conn.close();
        System.out.println("연결 해제 성공");
        
    }
    
    @Test // JUnit 엔진에서 호출할 테스트 메서드.
    @Order(1) // 1번째로 실행할 테스트 메서드.
    public void testInsert() throws SQLException {
        // Driver 등록 -> Connection -> PreparedStatement -> execute -> 결과처리 -> 리소스해제
        
        DriverManager.registerDriver(new OracleDriver());
        
        Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
        
        String sql = "insert into posts(title, content, author) values (?, ?, ?)";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        
        stmt.setString(1, "BUGATTI LA VOITRUE NOIRE");
        stmt.setString(2, "$12,056,000.00");
        stmt.setString(3, "BUGATTI");
        
        int result = stmt.executeUpdate();
        Assertions.assertEquals(1, result);
        // -> insert 문장의 실행 결과가 1이면 단위 테스트 성공, 그렇지 않으면 실패.
        
        stmt.close();
        conn.close();
        
    }
    
}
