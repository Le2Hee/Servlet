<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Post read</title>
        <style>
            header {
                background-color: #e5fff9;
                padding: 10px;
                text-align: center;
            }
        
            <%--
            div#title {
                border: 2px solid #d99fff;
                text-align: center;
            }
            
            div#author {
                text-align: right;
            }
            
            div#content {
                padding: 30%;
                border: 1px solid black;
                text-align: center;
            }
            
            div#time {
                text-align: right;
            }
            --%>
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
            <h1>포스트 상세보기 페이지</h1>
        </header>
        
        <nav>
            <ul>
                <li>
                    <c:url var="signOut" value="/user/signout"></c:url>
                    <span>${ signedInUser } 님</span>
                    <a href="${ signOut }">로그아웃</a>
                </li>
                <li>
                    <c:url var="mainPage" value="/" />
                    <a href="${ mainPage }">메인 페이지</a>
                </li>
                <li>
                    <c:url var="postList"  value="/post" />
                    <a href="${ postList }">포스트 목록 페이지</a>
                </li>
                <%-- 로그인 사용자 아이디와 글 작성자 아이디가 같은 경우에만 수정 메뉴를 보여줌 --%>
                <c:if test="${ signedInUser == post.author }">
                    <li>
                        <c:url var="postModify" value="/post/modify">
                            <c:param name="id" value="${ post.id }"></c:param>
                        </c:url>
                        <a href="${ postModify }">포스트 수정</a>
                    </li>
                </c:if>
            </ul>
        </nav>
        
        
        
        <main>
            <form>
                <div>번호 :
                    <input type="text" value="${ post.id }" readonly />
                </div>
                <div>제목 :
                    <input type="text" value="${ post.title }" readonly />
                </div>
                <div>내용 :
                    <textarea rows="5" cols="80" readonly>${ post.content }</textarea>
                </div>
                <div>작성자 :
                    <input type="text" value="${ post.author }"  readonly />
                </div>
                <div>작성 시간 :
                    <input type="text" value="${ post.createdTime }" readonly />
                </div>
                <div>수정 시간 :
                    <input type="text" value="${ post.modifiedTime }" readonly />
                </div>
            </form>
       <!-- <div id="title">
                <h1>${ post.title }</h1>
            </div>
            <div id="author">
                <h6>${ post.author }</h6>
            </div>
            <div id="content">
                <h2>${ post.content }</h2>
            </div>
            <div id="time">
                <h4>${ post.modifiedTime }</h4>
            </div> -->
        </main>
        
    </body>
</html>