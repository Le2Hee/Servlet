<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>User Signin</title>
    </head>
    <body>
        <header>
            <h1>로그인</h1>
        </header>
        
        <main>
            <form method="post"> 
            <!-- action 속성을 지정하지 않으면 현재 주소 그대로 요청을 보낸다. -->
            
                <div>
                    <input type="text" name="username" placeholder="아이디 입력"
                        required autofocus/>
                </div>
                
                <div>
                    <input type="password" name="password" placeholder="비밀번호 입력"
                        required />
                </div>
                
                <div>
                    <input type="submit" value="로그인" />
                </div>
                
            </form>
        </main>
        
    </body>
</html>