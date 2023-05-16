<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post</title>
        <style>
        #rogo {
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
        <header id="rogo">
            <h1>포스트 목록 페이지</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <%-- 상대경로에서 현재 폴더(./)의 의미는 : context root까지의 주소
                        http://localhost:8081/post/ 까지의 주소를 의미 한다.
                                            (post : context root)
                     --%>
                    <%-- <a href="./">메인 페이지</a> --%>
                    
                    <c:url var="mainPage" value="./"></c:url>
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
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
                    <li>
                        <c:url var="signUpPage" value="/user/signup" />
                        <a href="${ signUpPage }">회원가입</a>
                    </li>
                </c:if>
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
            
            <c:url value="/post/search" var="searchPage"></c:url>
            <form action="${ searchPage }">
                <select name="category">
                    <option value="t">제목</option>
                    <option value="c">내용</option>
                    <option value="tc">제목 + 내용</option>
                    <option value="a">작성자</option>
                </select>
                <input type="text" name="keyword" placeholder="검색어" 
                    required autofocus/>
                <input type="submit" value="검색" />
            </form>
        </main>
        
    </body>
</html>