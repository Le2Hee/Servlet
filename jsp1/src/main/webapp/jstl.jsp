<%@page import="com.itwill.jsp1.model.Contact"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP</title>
        <style>
            table {
                whidth: 100%;
                border: 1px solid #444444;
            }
            
            th, td {
                border: 1px solid #444444;
            }
            
        </style>
    </head>
    <body>
        <h1>JSTL</h1>
        <h2>JSP Standard Tag Library</h2>
        <%--JSTL 사용하기
            1. POM.xml 파일에 의존성(dependency) 추가 (jstl:jstl:1.2)
            2. JSTL을 사용하는 JSP 파일에서 taglib 지시문<%@ %>을 설정.
         --%>
         
         <%
         // HTML 리스트 아이템으로 사용할 더미 데이터를 생성:
         String[] sites = {"YouTube", "Instagram", "Facebook"};
         // -> scriptlet에서 선언한 지역 변수는 EL에서 사용할 수 없다.
         // -> EL에서 사용할 수 있는 변수는 pageContext, request, session, application에 
         //    저장된 속성들만 사용가능 하다.
         
         pageContext.setAttribute("sites", sites);
         %>
         
         <h2>JSP scriptlet, expression</h2>
         <ul>
            <% for (String x : sites) { %>
                <li><%= x %></li>
            <% } %>
         </ul>
         
         <h2>JSTL, EL</h2>
         <ul>
            <c:forEach items="${ sites }" var="s"> 
            <%-- prefix="c" 로 지정했기 때문에 c로 해야된다. 
                 라이브러리를 사용할때 c라는 접두사를 사용하겠다. --%>
                <li>${ s }</li>
            </c:forEach>
         </ul>
         
         <%-- 테이블에서 사용할 더미 데이터 --%>
         <%
         ArrayList<Contact> list = new ArrayList<>();
         for (int i = 0; i < 5; i++) {
             Contact c = new Contact(i, "이름_" + i, "phone_" + i, "email_" + i);
             list.add(c);
         }
         
         // 리스트를 EL에서 사용할 수 있도록 
         pageContext.setAttribute("contacts", list);
         %>
         
         <h2>JSP를 이용한 Table 작성</h2>
         
         <table >
            <caption>JSP Table</caption>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <% for (Contact c : list) { %>
                    <tr>
                        <td><%= c.getId() %></td>
                        <td><%= c.getName() %></td>
                        <td><%= c.getPhone() %></td>
                        <td><%= c.getEmail() %></td>
                    </tr>
                <% } %>
            </tbody>
         </table>
         
         <h2>JSTL, EL를 이용한 Table 작성</h2>
         <%-- EL은 지역변수로 접근할 수 없기 때문에 pageContext.setAttribute("contacts", list);
              를 사용한다. 
              장점 : 코드가 Java코드 처럼 보이지 않고 html 코드처럼 보인다. --%>
              
         <table>
            <caption>JSTL, EL Table</caption>
            <thead>
                <tr>
                    <th>번호</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th>이메일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${ contacts }" var="cs">
                    <tr>
                        <td>${ cs.id }</td> 
                        <td>${ cs.name }</td>
                        <td>${ cs.phone }</td>
                        <td>${ cs.email }</td>
                        <%-- get()가 있으면 알아서 찾는다. 그 대신 존재해야 하며 get관습이
                             딱 맞게 있어야 사용할 수 있다. --%>
                    </tr>
                </c:forEach>
            </tbody>
         </table>
         
    </body>
</html>