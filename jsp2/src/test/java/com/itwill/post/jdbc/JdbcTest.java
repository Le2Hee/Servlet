package com.itwill.post.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import oracle.jdbc.OracleDriver;

// JUnit Test(자바 단위 테스트)를 하기 위한 클래스.
// JDBC(Java Database Connectivity) 테스트 - ojdbc11 라이브러리 동작 여부 테스트.
// main()를 만들지 않고, test()를 작성하면 junit-jupiter-engine에서 test()를 실행.
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
    
    @Test
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
        
        // DB와 연결된 접속을 해제
        conn.close();
        System.out.println("연결 해제 성공");
        
    }
    
    
    
}
