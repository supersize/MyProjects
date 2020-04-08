/**
 * 
 */

function joinCheck(){
	
	if(document.reg_prac.id.value.length == 0){
		alert("아이디가 빈칸일 수 없습니다.");
		reg_prac.id.focus();
		return;
	}
	
	if(document.reg_prac.id.value.length < 3){
		alert("아이디는 4글자 이상으로 만들어주세요.");
		reg_prac.id.focus();
		return;
	}
	
	if(document.reg_prac.pw.value.length < 3){
		alert("비밀번호는 3글자 이상 작성해주세요.");
		reg_prac.pw.focus();
		return;
	}
	
	if(document.reg_prac.pw_check.value != document.reg_prac.pw.value){
		alert("비밀번호가 비밀번호 확인과 같지 않습니다.");
		reg_prac.pw.focus();
		return;
	}
	
	if(document.reg_prac.name.value.length == 0 ){
		alert("이름은 빈칸일수 없습니다.");
		reg_prac.name.focus();
		return;
	}
	
	if(document.reg_prac.eMail.value.length == 0 ){
		alert("이메일이 빈칸일수 없습니다.");
		reg_prac.eMail.focus();
		return;
	}
	
	if(document.reg_prac.address.value.length == 0 ){
		alert("주소가 빈칸일수 없습니다.");
		reg_prac.address.focus();
		return;
	}
	
	
	document.reg_prac.submit();
}


function updateMember(){
	if(document.reg_prac.pw.value.length < 3){
		alert("비밀번호는 4글자 이상 작성해주세요.");
		reg_prac.pw.focus();
		return;
	}
	
	if(document.reg_prac.pw_check.value != document.reg_prac.pw.value){
		alert("비밀번호가 비밀번호 확인과 같지 않습니다.");
		reg_prac.pw.focus();
		return;
	}
	
	if(document.reg_prac.eMail.value.length == 0 ){
		alert("이메일이 빈칸일수 없습니다.");
		reg_prac.eMail.focus();
		return;
	}
	
	if(document.reg_prac.address.value.length == 0 ){
		alert("주소가 빈칸일수 없습니다.");
		reg_prac.address.focus();
		return;
	}
	
	document.reg_prac.submit();
}