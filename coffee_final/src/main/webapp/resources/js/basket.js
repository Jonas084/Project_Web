/*
 Copyright (C) Federico Zivolo 2017
 Distributed under the MIT License (license terms are at http://opensource.org/licenses/MIT).
 */

function fn_sum(id){
	var obj =  document.getElementById('quantity'+id).value;
	var q = 0;
	q = parseInt(obj);
	var obj1 =document.getElementById('price'+id).value;
	p=parseInt(obj1);
	document.getElementById('totalp'+id).value=(q*p);
	document.getElementById('total'+id).value=(q*p);
	document.getElementById('quant'+id).value=q;
	document.getElementById('ch'+id).value=(q*p);
	fn_tsum(id);
	
};

function fn_tsum(id){
	var check = document.getElementsByName('check');
	var output=0;
	for(var i=0;i<check.length;i++){
		if(check[i].checked){
			output += parseInt(check[i].value);	
		}
	}
	totalprice.value=output;
	var point = document.getElementById('point').value;
	var to = document.getElementById('totalprice').value;
	var re=point-to;
	remain.value=re;
	if(remain.value<0){
		alert("포인트를 충전하세요");
		location.href = "mypage_point.do" 
	}
}
$(function() {
	  $("#submitFrm").on("click", function() {
	    if($("td>input:checkbox[name=check]:checked").length<1) {
	      alert("아무것도 선택되지 않았습니다..");
	      return;
	    }else{
	    	var totalprice=$('#totalprice').val();
	        var checkboxValues = [];
	        var totalp=[];
	        var quant=[];
		        $("td>input:checkbox[name=check]:checked").each(function() {
		          	checkboxValues.push($(this).parent().children("#basket_number").val());
		          	totalp.push($(this).parent().children(".totalp").val());
		          	quant.push($(this).parent().children(".quantity").val());
		        	          
		        });
		        var allData = { "totalprice":totalprice, "checkArray":checkboxValues, "top":totalp,"quantity":quant};
		        
		        $.ajax({
		            url:"buy_basket.do",
		            type:'get',
		            data: allData,
		            success:function(data){
		                alert("완료!");
		               location.reload();
		                self.close();
		            },
		            error:function(jqXHR, textStatus, errorThrown){
		                alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		                self.close();
		            }
		        });
		  }    

	  });
});
$(function() {
	  $("#deleteFrm").on("click", function() {
	    if($("td>input:checkbox[name=check]:checked").length<1) {
	      alert("아무것도 선택되지 않았습니다..");
	      return;
	    }else{
	        var checkboxValues = [];
		        $("td>input:checkbox[name=check]:checked").each(function() {
		          	checkboxValues.push($(this).parent().children("#basket_number").val());
		        });
		        var allData = { "checkArray":checkboxValues};
		        
		        $.ajax({
		            url:"delete_basket.do",
		            type:'get',
		            data: allData,
		            success:function(data){
		                alert("완료!");
		               location.reload();
		                self.close();
		            },
		            error:function(jqXHR, textStatus, errorThrown){
		                alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
		                self.close();
		            }
		        });
		  }    
	  });
});
//# sourceMappingURL=popper.min.js.map
