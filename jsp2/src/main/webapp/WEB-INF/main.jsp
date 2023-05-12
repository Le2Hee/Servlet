<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post</title>http://localhost:8081/post/post/create
        <style>
        header {
            background-color: #e5fff9;
            padding: 10px;
            width: 100%;
            text-align: center;
        }
        
        nav {
            font: 17px 'Nanum Gothic', sans-serif;
        }
        
        li > a {
            text-decoration: none;
            color: #404040;
        }
        
        li {
            list-style: none;
        }
        
        ul {
            width: 500px;
            height: 50px;
            overflow: hidden;
            margin: 0 auto;
        }
        
        ul, li {
            float: left;
            width: 100%;
            height: 100%;
            line-height: 50px;
            text-align: center;
            background:     ;
        }
        
        ul, li, li > a {
            display: block;
        }
        
        ul, li, li > a:hover {
            background-color: #ff9980;
            color: #fff;
        }
        
        </style>
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