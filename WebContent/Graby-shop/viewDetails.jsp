
<%@page import="com.product.operation.ProductOperation"%>
<%@page import="com.user.City"%>
<%@page import="com.user.State"%>
<%@page import="com.product.operation.OrderOperation"%>
<%@page import="com.model.product.Order"%>
<%@page import="com.product.operation.CartOperation"%>
<%@page import="com.model.product.Cart"%>
<%@page import="com.jdbc.UserOperation"%>
<%@page import="com.user.User"%>
<%@page import="com.jdbc.CityOperation"%>

<%@page import="com.jdbc.StateOperation"%>

<%@page import="com.jdbc.model.Product"%>

<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
<link rel="shortcut icon" type="image/x-icon" href="userBootstrap/images/logo_zenith.png">

<!-- jQuery -->
<script src="userBootstrap/js/jquery-2.0.0.min.js" type="text/javascript"></script>

<!-- Bootstrap4 files-->
<script src="userBootstrap/js/bootstrap.bundle.min.js" type="text/javascript"></script>
<link href="userBootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<!-- Font awesome 5 -->
<link href="userBootstrap/fonts/fontawesome/css/fontawesome-all.min.css" type="text/css" rel="stylesheet">
        
<!-- plugin: owl carousel  -->
<link href="userBootstrap/plugins/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
<link href="userBootstrap/plugins/owlcarousel/assets/owl.theme.default.css" rel="stylesheet">
<script src="userBootstrap/plugins/owlcarousel/owl.carousel.min.js"></script>
<link href="assets/css/style.css" rel="stylesheet">
<!-- custom style -->
<link href="userBootstrap/css/ui.css" rel="stylesheet" type="text/css"/>
<link href="userBootstrap/css/responsive.css" rel="stylesheet" media="only screen and (max-width: 1200px)" />


<style type="text/css">
table, th, td 
{
  border: 2px solid black !important;
  border-collapse: collapse;
  text-align: center;
  color:black !important;
}

</style>

 <script type="text/javascript">

//--->number to word > start

    var root = typeof self == 'object' && self.self === self && self ||
        typeof global == 'object' && global.global === global && global ||
        this;
 

	// Simplified https://gist.github.com/marlun78/885eb0021e980c6ce0fb
	function isFinite(value) {
	    return !(typeof value !== 'number' || value !== value || value === Infinity || value === -Infinity);
	}

 
	var ENDS_WITH_DOUBLE_ZERO_PATTERN = /(hundred|thousand|(m|b|tr|quadr)illion)$/;
	var ENDS_WITH_TEEN_PATTERN = /teen$/;
	var ENDS_WITH_Y_PATTERN = /y$/;
	var ENDS_WITH_ZERO_THROUGH_TWELVE_PATTERN = /(zero|one|two|three|four|five|six|seven|eight|nine|ten|eleven|twelve)$/;
	var ordinalLessThanThirteen = {
	    zero: 'zeroth',
	    one: 'first',
	    two: 'second',
	    three: 'third',
	    four: 'fourth',
	    five: 'fifth',
	    six: 'sixth',
	    seven: 'seventh',
	    eight: 'eighth',
	    nine: 'ninth',
	    ten: 'tenth',
	    eleven: 'eleventh',
	    twelve: 'twelfth'
	};

	/**
	 * Converts a number-word into an ordinal number-word.
	 * @example makeOrdinal('one') => 'first'
	 * @param {string} words
	 * @returns {string}
	 */
	function makeOrdinal(words) {
	    // Ends with *00 (100, 1000, etc.) or *teen (13, 14, 15, 16, 17, 18, 19)
	    if (ENDS_WITH_DOUBLE_ZERO_PATTERN.test(words) || ENDS_WITH_TEEN_PATTERN.test(words)) {
	        return words + 'th';
	    }
	    // Ends with *y (20, 30, 40, 50, 60, 70, 80, 90)
	    else if (ENDS_WITH_Y_PATTERN.test(words)) {
	        return words.replace(ENDS_WITH_Y_PATTERN, 'ieth');
	    }
	    // Ends with one through twelve
	    else if (ENDS_WITH_ZERO_THROUGH_TWELVE_PATTERN.test(words)) {
	        return words.replace(ENDS_WITH_ZERO_THROUGH_TWELVE_PATTERN, replaceWithOrdinalVariant);
	    }
	    return words;
	}

	function replaceWithOrdinalVariant(match, numberWord) {
	    return ordinalLessThanThirteen[numberWord];
	}

 
	/**
	 * Converts an integer into a string with an ordinal postfix.
	 * If number is decimal, the decimals will be removed.
	 * @example toOrdinal(12) => '12th'
	 * @param {number|string} number
	 * @returns {string}
	 */
	function toOrdinal(number) {
	    var num = parseInt(number, 10);
	    if (!isFinite(num)) throw new TypeError('Not a finite number: ' + number + ' (' + typeof number + ')');
	    var str = String(num);
	    var lastTwoDigits = num % 100;
	    var betweenElevenAndThirteen = lastTwoDigits >= 11 && lastTwoDigits <= 13;
	    var lastChar = str.charAt(str.length - 1);
	    return str + (betweenElevenAndThirteen ? 'th'
	            : lastChar === '1' ? 'st'
	            : lastChar === '2' ? 'nd'
	            : lastChar === '3' ? 'rd'
	            : 'th');
	}

 
	var TEN = 10;
	var ONE_HUNDRED = 100;
	var ONE_THOUSAND = 1000;
	var ONE_MILLION = 1000000;
	var ONE_BILLION = 1000000000;           //         1.000.000.000 (9)
	var ONE_TRILLION = 1000000000000;       //     1.000.000.000.000 (12)
	var ONE_QUADRILLION = 1000000000000000; // 1.000.000.000.000.000 (15)
	var MAX = 9007199254740992;             // 9.007.199.254.740.992 (15)

	var LESS_THAN_TWENTY = [
	    'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten',
	    'eleven', 'twelve', 'thirteen', 'fourteen', 'fifteen', 'sixteen', 'seventeen', 'eighteen', 'nineteen'
	];

	var TENTHS_LESS_THAN_HUNDRED = [
	    'zero', 'ten', 'twenty', 'thirty', 'forty', 'fifty', 'sixty', 'seventy', 'eighty', 'ninety'
	];

	/**
	 * Converts an integer into words.
	 * If number is decimal, the decimals will be removed.
	 * @example toWords(12) => 'twelve'
	 * @param {number|string} number
	 * @param {boolean} [asOrdinal] - Deprecated, use toWordsOrdinal() instead!
	 * @returns {string}
	 */
	function toWords(number, asOrdinal) {
	    var words;
	    var num = parseInt(number, 10);
	    if (!isFinite(num)) throw new TypeError('Not a finite number: ' + number + ' (' + typeof number + ')');
	    words = generateWords(num);
	    return asOrdinal ? makeOrdinal(words) : words;
	}

	function generateWords(number) {
	    var remainder, word,
	        words = arguments[1];

	    // We’re done
	    if (number === 0) {
	        return !words ? 'zero' : words.join(' ').replace(/,$/, '');
	    }
	    // First run
	    if (!words) {
	        words = [];
	    }
	    // If negative, prepend “minus”
	    if (number < 0) {
	        words.push('minus');
	        number = Math.abs(number);
	    }

	    if (number < 20) {
	        remainder = 0;
	        word = LESS_THAN_TWENTY[number];

	    } else if (number < ONE_HUNDRED) {
	        remainder = number % TEN;
	        word = TENTHS_LESS_THAN_HUNDRED[Math.floor(number / TEN)];
	        // In case of remainder, we need to handle it here to be able to add the “-”
	        if (remainder) {
	            word += '-' + LESS_THAN_TWENTY[remainder];
	            remainder = 0;
	        }

	    } else if (number < ONE_THOUSAND) {
	        remainder = number % ONE_HUNDRED;
	        word = generateWords(Math.floor(number / ONE_HUNDRED)) + ' hundred';

	    } else if (number < ONE_MILLION) {
	        remainder = number % ONE_THOUSAND;
	        word = generateWords(Math.floor(number / ONE_THOUSAND)) + ' thousand,';

	    } else if (number < ONE_BILLION) {
	        remainder = number % ONE_MILLION;
	        word = generateWords(Math.floor(number / ONE_MILLION)) + ' million,';

	    } else if (number < ONE_TRILLION) {
	        remainder = number % ONE_BILLION;
	        word = generateWords(Math.floor(number / ONE_BILLION)) + ' billion,';

	    } else if (number < ONE_QUADRILLION) {
	        remainder = number % ONE_TRILLION;
	        word = generateWords(Math.floor(number / ONE_TRILLION)) + ' trillion,';

	    } else if (number <= MAX) {
	        remainder = number % ONE_QUADRILLION;
	        word = generateWords(Math.floor(number / ONE_QUADRILLION)) +
	        ' quadrillion,';
	    }

	    words.push(word);
	    return generateWords(remainder, words);
	}

	/**
	 * Converts a number into ordinal words.
	 * @example toWordsOrdinal(12) => 'twelfth'
	 * @param {number|string} number
	 * @returns {string}
	 */
	function toWordsOrdinal(number) {
	    var words = toWords(number);
	    return makeOrdinal(words);
	}



    var numberToWords = {
        toOrdinal: toOrdinal,
        toWords: toWords,
        toWordsOrdinal: toWordsOrdinal
    };

    if (typeof exports != 'undefined') {
        if (typeof module != 'undefined' && module.exports) {
            exports = module.exports = numberToWords;
        }
        exports.numberToWords = numberToWords;
    } else {
        root.numberToWords = numberToWords;
    }

//--->number to word > end
  </script>



</head>
<body>
	<%@include file="userheader.jsp" %>
	
	<section class="section-content bg padding-y border-top">
<div class="container">

<div class="row">
	<main class="col-sm-12">


<div class="card">

	            			<%
	            				
								String orderno=request.getParameter("id");
								User u=null;
								
								float total = 0.0f,subTotal=0.0f;
								int srno=1,qty=0;
								String uname = (String)session.getAttribute("uname");
								u = UserOperation.GetUserByUserEmail(uname);
								List<Order> list = OrderOperation.getAllOrderById(orderno);
								
								
	
	
		
%>
<table class="table shopping-cart-wrap">
<thead class="text-muted">
<tr>
			<th colspan="12"><h1>Product Rental And Exchange</h1></th>
		</tr>
		
		<tr>
			<th colspan="6" style="text-align:left;">
			M/S,&nbsp;
			<%
				out.println(u.getFname()+u.getLname()+"<br/>");
				out.println(u.getAdd1()+"<br/>");
				out.println(u.getAdd2()+"<br/>");
				City c1 =CityOperation.getByCityId(u.getCid());
				out.println("City  : "+c1.getCityname()+"<br/>");
				State st = StateOperation.getStateById(u.getSid());
				out.println("State : "+st.getStatename());
			%>
			
			</th>
			
			<th colspan="6" style="text-align:left;">
			<% 
				out.println("Phone :"+u.getPhone() +"<br/>");
			%>
			</th>
		</tr>
		
		<tr>
			<th colspan="1">SRNO</th>
			<th colspan="5">Product Description</th>
			<th colspan="2">QTY</th>
			<th colspan="2">RATE</th>
			<th colspan="2">AMOUNT(INR)</th>
		</tr>	
		
<%
	
	for(Order o : list)
	{
		Cart c = CartOperation.getAllByOrderId(o.getCartId());
		Product p = ProductOperation.getAllByID(c.getProductId());
		if(u != null)
		{
			
			total=(p.getPrice()*c.getQuantity());
			subTotal+=(p.getPrice()*c.getQuantity());
			
	
%>
		<tr>
			<th colspan="1"><% out.println(""+(srno++)); %></th>
			<th colspan="5" style="text-align:left !important;"><% out.println(p.getName()); %></th>
			<th colspan="2"><% out.println(c.getQuantity()); %></th>
			<% 
			if(u != null)
			{
				
					out.println("<th colspan='2'>"+p.getPrice()+"</th>");
				
			}
			qty+=c.getQuantity();
			
			%>
			<th colspan="2"><% out.println(""+total);%></th>
		<%
		}	
		
		}
		
		%>
		</tr>
		
		<tr>
			<th colspan="6" style="text-align: right !important;">TOTAL QTY:-</th>
			<th colspan="2"><% out.println(""+qty); %></th>
			<th colspan="2" style="text-align: right !important;">SUB TOTAL</th>
			<th colspan="2"><% out.println(""+subTotal); %></th>
		</tr>
		
		<tr>
			
		
				
			<th colspan="10" style="text-align: right !important;">Packing Charges<br/>Delivery Charges<br/></th>
			<th colspan="2"  style="text-align: center !important;">200.00<br/>50.00<br/></th>
		</tr>
		
  		<tr>
   	 		<th colspan="10" style="text-align: right !important;">NET AMOUNT(Rounded off):-</th>
   	 		<th colspan="2"><% 	 out.println("<span id='amount'>"+list.get(0).getTotalAmount()+"</span>"+".0"); %></th>
  		</tr>

  		<tr>
  			<th colspan="12" style="text-align: left !important;">Amount in Words :- <span id="inwords"></span></th>
  		</tr>

  		<tr>
  			<th colspan="12"></th>	
  		</tr>
</thead>

</table>
                			

</div>
</main>
</div>
</div>
</section>
	
	
	<%@include file="userFooter.jsp" %>
</body>

<script type="text/javascript">
	
	var no=parseInt(document.getElementById("amount").innerHTML);
	intToLetter(no);

	function intToLetter(num)
  	{
 	 	var words = toWords(num);
  		document.getElementById('inwords').innerHTML = words.toUpperCase()+' RUPEES';
  	}
	
	
	
</script>

</html>