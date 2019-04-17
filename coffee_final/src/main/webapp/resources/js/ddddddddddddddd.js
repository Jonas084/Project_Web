/*
 Copyright (C) Federico Zivolo 2017
 Distributed under the MIT License (license terms are at http://opensource.org/licenses/MIT).
 */

function show(id){
	
	if (document.getElementById(id).style.visibility=="collapse"){
		
		  $.ajax({ 
             url:'resources/jspfile/clickcount.jsp?num='+id, //가져오고자하는 서버페이지 주소를 넣는다. 
             type:'get', //데이터를 서버로 전송하게 된다. 
             data:'text',
             dataType:"text",
             success : function(t){ 
            	 $('#clickcount'+id).html(t);
             } , 
             error : function(){ 
                       alert('실패 ㅠㅠ'); 
             } 
      	});
		document.getElementById(id).style.visibility="visible";
	}else{document.getElementById(id).style.visibility="collapse";}
}

function send(){
	if(confirm( '구매하시겠습니까?')){ 
		var f = document.buy_coffee;
		f.method = "post";
		f.action = "buy_login.do";
		f.submit();
	}
}
function sendb(){
	if(confirm( '장바구니에 담겠습니까?')){ 
		var f = document.basket_coffee;
		f.method = "post";
		f.action = "basket_login.do";
		f.submit();
	}
}
window.onload = function(){
	var obj = document.getElementById("loginid").value;
		
	if(obj!='null'){
		writer.value=obj;
	}else{
		writer.value='Anonymous';
	}
}


//# sourceMappingURL=popper.min.js.map
