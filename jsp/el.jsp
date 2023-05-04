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
        <h1>EL(Expression Language)</h1>
        <%-- 식 언어, 표현식 언어 라고도 부른다. 
            JSP expression 태그(<%= %>)를 대체하는 문법.
            
            사용 방법 : ${ 식 }
            
            사용할 수 없는 곳과 있는 곳이 있다.
            
            * 사용할 수 없는 곳 : (%를 사용하는 곳)
                - 지시문<%@ %> 안에서는 사용할 수 없다.
                - 선언문<%! %> 안에서는 사용할 수 없다.
                - 스크립트릿 <% %> 안에서는 사용할 수 없다.
                - 식(expression)<%= %> 안에서는 사용할 수 없다.
                
            * 그 이외의 JSP 안에서는 언제든지 사용 가능.
                - HTML 태그의 컨텐트 
                - HTML 태그의 속성 값
                - CSS 프로퍼티 값
                - JavaScript 코드의 일부.
         --%>
         
         <p><%= 1 + 2 %></p>
         <p>${1 + 2}</p>
         
         <%-- 상태 정보 유지:
            JSP에서 상태 정보들을 유지하기 위해서 사용하는 객체들:
                * pageContext: JSP 페이지가 유지되는 동안
                * request: 요청 객체가 유지되는 동안
                * session: 세션이 유지되는 동안
                * application: 웹 애플리케이션이 동작하는 동안.
                * 사용 범위: pageContext < request < session < application
             EL에서 상태 정보들을 유지하기 위해서 사용하는 객체들:
                * pageScope
                * requestScope
                * sessionScope
                * applicationScope
                
             EL에서 상태 변수를 찾는 순서:  ${ var }
                ${ pageScope.var } (${ var }이 pageScope에 있는지 찾는다.)
                못찾으면 -> ${ requestScope.var } 
                못찾으면 -> ${ sessionScope.var } 
                못찾으면 -> ${ applicationScope.var } 
                
          --%>
         
         <%-- 상태 저장 변수에 상태 저장 --%>
         <%
         pageContext.setAttribute("var1", 1); 
         // pageContext에 var1 이라는 변수에 값 1을 저장한 것.
         request.setAttribute("var2", "Hello"); 
         // request객체에다가 var2이라는 변수에 hello 값을 넣겠다.
         
         
         Contact c = new Contact(1, "a", "02-", "dde@");
         session.setAttribute("var2", c);
         // session이라는 곳에 var3라는 이름으로 c를 저장한다.
         // 변수 이름이 같아도 상관없다. 저장되는 곳이 다르기 때문이다.
         %>
         
         <h2>JSP Expression 태그를 사용한 상태 정보 읽기</h2>
         <p>
            var1: <%= pageContext.getAttribute("var1") %> <br /> <!-- 출력 하기. -->
            var2: <%= request.getAttribute("var2") %> <br />
            var3: <%= session.getAttribute("var2") %> <br />
         </p>
         
         <h2>EL을 사용한 상태 정보 읽기</h2>
         
         <p>
            var1: ${ var1 } <br /> <%-- ${pageScope.var1}과 동일 --%>
            request.var2: ${ var2 } <br /> <%-- ${requestScope.var2}과 동일 --%>
            session.var3: ${ sessionScope.var2 } <br />
         </p>
    </body>
</html>