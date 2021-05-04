<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>회원가입 페이지</h1>

	<form action="singupprocess.jsp" method="post">
	아이디 <input onclick="changeColor('pink');" type="text" name="id" id="user_id" placeholder="아이디를 입력해주세요">
	<br>
	비밀번호 <input type="password" name="pwd" placeholder="영문과 특수 문자를 표현한 최소 8자">
	<br>
	이름 <input type="text" name="name" placeholder="이름을 적어주세요">
	<br>
	이메일 <input type="email" name="email" placeholder="이메일을 입력해 주세요">
	<br>
	<input type="submit">
	</form>
	
	<script>
	function changeColor(newColor) {
		  var elem = document.getElementById('user_id').vale;
		  var elem2 = document.getElementById('user_id');
		  if(elem==undefined)
		{
			  elem2.style.backgroundColor = newColor; 
		}

		
		}
	</script>
</body>
</html>