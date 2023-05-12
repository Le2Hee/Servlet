<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post Search</title>
        <style>
        header {
            padding: 10px;
            background-color: #e5fff9;
            text-align: center;
        }
        
        table {
            border-collapse: collapse;
            width: 100%;
        }
        
        th, td {
            padding: 10px;
            border-bottom: 1px solid #CD5C5C;
        }
        
        tr:hover {
            background-color: #ffebe6;
        }
        
        td#id, td#time, td#author {
            text-align: center;
        }
        
        th {
            background-color: #ffc2b3;
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
            <h1>포스트 검색</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url var="mainPage" value="./"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="postList"  value="/post" />
                    <a href="${ postList }">포스트 목록 페이지</a>
                </li>
                <li>
                    <c:url var="postCreate" value="/post/create"></c:url>
                    <a href="${ postCreate }">새 포스트 작성</a>
                </li>
            </ul>
        </nav>
        
        <main>
            <table>
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>수정 시간</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ posts }" var="post" >
                        <tr>
                            <td id="id">
                                ${ post.id }
                            </td>
                            <td>
                                <c:url value="/post/detail" var="postDetail">
                                    <c:param name="id" value="${ post.id }" ></c:param>
                                </c:url>
                                <a href="${ postDetail }" >${ post.title }</a>
                            </td>
                            <td id="author">
                                ${ post.author }
                            </td>
                            <td id="time">
                                ${ post.modifiedTime }
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </main>
        
    </body>
</html>