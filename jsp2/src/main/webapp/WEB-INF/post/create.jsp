<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post Create</title>
    </head>
    <body>
        <heager>
            <h1>새 포스트 작성</h1>
        </heager>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/" ></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="postList" value="/post"></c:url>
                    <a href="${ postList }">포스트 목록 페이지</a>
                </li>
            </ul>
        </nav>
    </body>
</html>