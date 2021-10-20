/**
 * 회원가입용 유효셩 체크용
 */

function regexCheck(){
	alert("dd");
	var email = document.fr.email.value;
	var phone = document.fr.phone.value;
	var age = document.fr.age.value;
	var e_regex=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	var ph_regex = /^01([016789]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var num_regex = /^\d+$/;
	
	if (document.fr.id){
		winopen();
		return false;
    }
	
	if(document.fr.pw.value == ""){
		alert("비밀번호를 입력하지 않았습니다.");
		document.fr.pw.focus();
		return false;
	}
	
	if (fr.pw.value == fr.id.value) {
		alert("아이디와 비밀번호가 같습니다.")
		document.fr.pw.focus();
		return false;
     }
	
	if (document.fr.pw.value.length<4 || document.fr.pw.value.length>12) {
        alert("비밀번호를 4~12자까지 입력해주세요.")
        document.fr.pw.focus();
        document.fr.pw.select();
        return false;
    }
	
	if (document.fr.pw.value != document.fr.pw1.value) {
        alert("비밀번호와 일치하지 않습니다")
        document.fr.pw1.value = ""
        document.fr.pw1.focus();
        return false;
    }
	
	 if (document.fr.name.value == "") {
         alert("이름을 입력하지 않았습니다.")
         document.fr.name.focus();
         return false;
     }
	 
	 if(document.fr.name.value.length<2){
         alert("이름을 2자 이상 입력해주십시오.")
         document.fr.name.focus();
         return false;
     }
	 
	 if (document.fr.age.value == "") {
         alert("나이을 입력하지 않았습니다.")
         document.fr.age.focus();
         return false;
     }
	 
	 if (num_regex.test(age) === false) {
         alert("잘못된 나이 형식입니다.");
         document.fr.age.value=""
         document.fr.age.focus();
         return false;
     }
		 
	 if (document.fr.email.value == "") {
         alert("이메일을 입력하지 않았습니다.")
         document.fr.email.focus();
         return false;
     }
	 
	 if (e_regex.test(email) === false) {
         alert("잘못된 이메일 형식입니다.");
         document.fr.email.value=""
         document.fr.email.focus();
         return false;
     }
	 
	 if (document.fr.phone.value == "") {
         alert("전화번호를 입력하지 않았습니다.")
         document.fr.phone.focus();
         return false;
     }
	 
	 if (ph_regex.test(phone) === false) {
         alert("잘못된 전화번호형식입니다.");
         document.fr.phone.value=""
         document.fr.phone.focus();
         return false;
     }     
		
}

function winopen(){
	
	if (document.fr.id.value == ""){
		alert("아이디를 입력하지 않았습니다.");
		document.fr.id.focus();
		return false;
    }
	
	if (document.fr.id.value.indexOf(" ") >= 0) {
		alert("아이디에 공백을 사용할 수 없습니다.")
		document.fr.id.focus();
		document.fr.id.select();
		return false;
    }
	
	if (document.fr.id.value.length<4 || document.fr.id.value.length>12) {
		alert("아이디를 4~12자까지 입력해주세요.")
		document.fr.id.focus();
		document.fr.id.select();
		return false;
    }

	for (var i = 0; i < document.fr.id.value.length; i++){
		ch = document.fr.id.value.charAt(i)
		if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')){
			alert("아이디는 영문 대소문자, 숫자만 입력가능합니다.")
			document.fr.id.focus();
			document.fr.id.select();
			return false;
		}
	}

	var formID = document.fr.id.value;
	window.open("joinIdCheck.jsp?userid="+formID,"","width=500, height=250");
}