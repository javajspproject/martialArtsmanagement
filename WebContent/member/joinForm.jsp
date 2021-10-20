<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	
	<fieldset>
	
		<legend> 회원가입 </legend>

		<form action="joinPro.jsp" method="post" name="fr" onsubmit="return regexCheck();">
			아이디 :  <input type="text" name="id" id="id" class="id" placeholder="영문대소문자숫자로  4~12글자 입력">
			<input type="button" value="ID 중복체크" name="idcheck" onclick="winopen();"><br>
			비밀번호 : <input type="password" name="pw" id="pw" placeholder=" 4~12글자 입력"><br>
			비밀번호확인 : <input type="password" name="pw1" id="pw1" placeholder="다시 입력"><br>
			이름 : <input type="text" name="name" id="name"><br>
			성별 : <input type="radio" name="gender" value="남"id="gender">남
				<input type="radio" name="gender" value="여"id="gender">여<br>
			나이 : <input type="text" name="age" id="age"><br>
			이메일 : <input type="text" name="email" id="email"><br>
			주소 : <input type="text" name="addr"id="addr"><br>			
			전화번호 : <input type="tel" name="phone" id="phone" placeholder=" - 포함 번호만 입력"><br>
			<script type="text/javascript">
			if(document.fr.id.readOnly=true){
				</script>
					<input type="submit" value="회원가입">
				<script type="text/javascript">
			}else{
				</script>
					<input type="button" value="ㅇㄱㄹㅇ" onclick="alert('id체크');">
				<script type="text/javascript">
			}
			</script>
		</form>
		
	</fieldset>

</body>

	<script src="../js/regexCheckForm.js" type="text/javascript"></script>

</html>