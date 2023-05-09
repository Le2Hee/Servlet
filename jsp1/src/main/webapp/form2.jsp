<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>JSP</title>
    </head>
    <body>
        <h1>form 제출 페이지</h1>
        <%-- submit으로 제출이 될려면 name속성을 가지고 있는 요소들만 제출이 된다. --%>
        
        <form action="form2-result.jsp" method="get" >
            <div>
                <input type="text" name="username" placeholder="아이디 입력하세요." autofocus />
            </div>
            <div>
                <select name="color"> 
                
                    <option value="r">빨강</option>
                    <option value="g">초록</option>
                    <option value="b">파랑</option>
                </select>
            </div>
            <div>
                <input type="submit" value="보내기" />
            </div>
        </form>
        
    </body>
</html>