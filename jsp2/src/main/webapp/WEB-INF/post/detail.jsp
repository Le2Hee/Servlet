<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post read</title>
        <style>
            div#title {
                border: 2px solid #d99fff;
                background-color: #87a5ff;
                text-align: center;
            }
            
            div#author {
                border: 1px solid black;
                background-color:   #00bfff;
                text-align: right;
            }
            
            div#content{
                border: 1px solid black;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>포스트 보기</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="/" />
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="postList"  value="/post" />
                    <a href="${ postList }">포스트 목록 페이지</a>
                </li>
            </ul>
        </nav>
        
        <main>
            <div id="title">
                <h1>${ post.title }</h1>
            </div>
            <div id="author">
                <h6>${ post.author }</h6>
            </div>
            <div id="content">
                <h2>${ post.content }</h2>
            </div>
        </main>
    </body>
</html>