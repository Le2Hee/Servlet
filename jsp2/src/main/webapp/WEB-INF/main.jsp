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
                <!-- 로그인한 username이 있는 경우 -->
                <c:if test="${ not empty signedInUser }" >
                    <li>
                        <span>${ signedInUser } 님</span>
                        <c:url var="signOut" value="/user/signout" />
                        <a href="${ signOut }">로그아웃</a>
                    </li>
                </c:if>
                
                <!-- 로그인한 username이 없는 경우 -->
                <c:if test="${ empty signedInUser }" >
                    <li>
                        <c:url var="signInPage" value="/user/signin" />
                        <a href="${ signInPage }">로그인</a>
                    </li>
                </c:if>
                
                <li>
                    <c:url var="postList" value="/post">포스트 목록 페이지</c:url>
                    <a href="${ postList }">포스트 목록 페이지</a>
                    <%-- / : 무조건 context root <c:url> 이용해서 경로를 확실히 정하기. --%>
                </li>
            </ul>
        </nav>
        
        <main>
            <!-- TODO -->
        </main>
        
    </body>
</html>