<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post Create</title>
        <style>
        header {
            background-color: #e5fff9;
            padding: 10px;
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
            <h1>새 포스트 작성</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url var="signOut" value="/user/signout"></c:url>
                    <span>${ signedInUser } 님</span>
                    <a href="${ signOut }">로그아웃</a>
                </li>
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
        
        <main>
            <c:url var="postCreate" value="/post/create" />
            <form action="${ postCreate }" method="post">
                <div>
                    <input type="text" name="title" placeholder="제목 입력" required autofocus/>
                </div>
                <div>
                    <textarea rows="5" cols="80" name="content" placeholder="내용 입력"
                        required ></textarea>
                </div>
                <div>
                    <%-- 로그인한 사용자 아이디를 value로 설정, 화면에서는 보이지 않게 -> hidden --%>
                    <input type="hidden" name="author" value="${ signedInUser }" readonly/>
                </div>
                <div>
                    <input type="submit" value="작성 완료"/>
                </div>
            </form>
        </main>
    </body>
</html>