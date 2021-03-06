

$(function(){
	$("#payment").on("click", function() {
	var IMP = window.IMP;
	IMP.init('imp81234843');
	var param = {
			"no" : $('#no').val(),
			"merchant_uid" : $('#merchant_uid').val(),
		    "name" : $('#name').val(),
		    "amount" : $('#price').val(), // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
		    "customer_uid" : $('#customer_uid').val(),
		    "buyer_email" : $('#buyer_email').val(),
		    "buyer_name" : $('#buyer_name').val(),
		    "buyer_tel" : $('#buyer_tel').val(),
		    "buyer_addr" : $('#buyer_addr').val()
	}

	<!-- 아임포트 실행 테스트 -->
	IMP.request_pay({
	    pay_method : 'card',
	    merchant_uid : $('#merchant_uid').val(),
	    name : $('#name').val(),
	    amount : $('#price').val(), // 결제창에 표시될 금액. 실제 승인이 이뤄지지는 않습니다. (모바일에서는 가격이 표시되지 않음)
	    customer_uid : $('#customer_uid').val(),
	    buyer_email : $('#buyer_email').val(),
	    buyer_name : $('#buyer_name').val(),
	    buyer_tel : $('#buyer_tel').val(),
	    buyer_addr : $('#buyer_addr').val(), 
	    buyer_postcode : ''
		},	
		function(rsp) {
			if ( rsp.success ) {
				alert("성공 : " + rsp.name);
				$.ajax({
					url: 'artPay.do',
		            data: param,
		            type: 'POST',
		            success: function(result) {
		            	alert(result.result)
		                	 location.href="orderArtForm.do";
		             }
		          });
				}
			else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        alert(msg);
		        location.href="artPayForm.do";
		    }})
	});
});