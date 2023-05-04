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
        </p>>
        
    </body>
</html>