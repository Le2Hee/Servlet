<%@page import="com.itwill.jsp1.model.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%--
            - <%@ include %> 지시문과 비슷하게 다른 JSP의 내용을 포함시킴.
            - jspf 확장자를 사용할 수 없고, jsp만 사용.
            - include하는 JSP 마다 각각의 Java 파일과 클래스들이 생성됨.
         --%> 
    
        <h1>JSP Action Tag</h1>
        <%--
            JSP 액션 태그 : 스크립트릿에서 사용되는 자바 코드들을 HTML 또는 XML 등에 사용되는 
                            태그로 대처하기 위해서 정의된 태그.
              * <jsp:forward></jsp:forward>
              * <jsp:include></jsp:include>
              * <jsp:useBean></jsp:useBean>!! 생성자 호출.
              * <jsp:getProperty></jsp:getProperty>!! get 메서드 호출.
              * <jsp:setProperty></jsp:setProperty>!! set 메서드 호출.
         --%>
        
        <% // 스크립트릿에서 자바 객체 생성:
        Contact c1 = new Contact();
        %>
        <p>
            c1: <%= c1 %> <%-- c1.toString() 메서드가 자동 호출됨. --%>
            <br />
            c1.id: <%= c1.getId() %>
            <br />
            c1.name: <%= c1.getName() %>
        </p>
        
        <%-- JSP Action Tag를 사용한 자바 객체 생성: --%>
        <jsp:useBean id="c2" class="com.itwill.jsp1.model.Contact" ></jsp:useBean>
        <p>
            c2.id: <jsp:getProperty property="id" name="c2"/>
            <br />
            c2.name: <jsp:getProperty property="name" name="c2"/>
            <br />
            <jsp:getProperty property="phone" name="c2"/> 
            <!-- 태그가 아니라 자바 코드라고 생각해야 된다. Java에 메서드가 없으면 사용이 안된다.
                                                              (get, set)-->
        </p>
        
        <%
        c1.setName("오쌤");
        %>
        <p>
            c1.name: <%= c1.getName() %>
        </p>
        
        <jsp:setProperty property="name" name="c2" value="이찬희"/>
        <p>
        c2.name: <jsp:getProperty property="name" name="c2"/>
        </p>
        
        <%
        Contact c3 = new Contact(1, "오쌤", "010-0000-0000", "jake@itwill.com");
        // 자바문법을 알아야 할 수 있다.
        %>
        <jsp:useBean id="c4" class="com.itwill.jsp1.model.Contact">
            <jsp:setProperty property="id" value="2"  name="c4"/> 
            <jsp:setProperty property="name" value="GENESIS"  name="c4"/> 
            <jsp:setProperty property="phone" value="080-700-6000"  name="c4"/> 
            <jsp:setProperty property="email" value="genesis@genesis.com"  name="c4"/> 
        </jsp:useBean>
        <!-- 자바 문법 몰라도 할 수 있다. -->
        <p>
            <jsp:getProperty property="id" name="c4"/>
            <br />
            <jsp:getProperty property="name" name="c4"/>
            <br />
            <jsp:getProperty property="phone" name="c4"/>
            <br />
            <jsp:getProperty property="email" name="c4"/>
        </p>
          
    </body>
</html>