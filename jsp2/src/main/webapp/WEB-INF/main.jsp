<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post</title>
    </head>
    <body>
        <header>
        <h1>메인 페이지</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url var="postList" value="/post">포스트 목록 페이지</c:url>
                    <a href="${ postList }">포스트 목록 페이지</a>
                    <%-- / : 무조건 context root <c:url> 이용해서 경로를 확실히 정하기. --%>
                </li>
            </ul>
        </nav>
        
    </body>
</html>