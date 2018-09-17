<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">

<head>
  <title>Apartment Price Prediction System</title>
  <script src="../resources/scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="../resources/css/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body style="background: linear-gradient(rgba(0,0,0,0.1), rgba(0,0,0,0.1)),
 url('http://www.worldpropertychannel.com/news-assets/Bangalore-skyline-India.jpg')">
<div class="header1" align="center">
  <h1 align="center" style="color:whitesmoke;">
    <a style="color:black;">Apartment Price Prediction AI</a>
  </h1>
</div>


<br/>
<div align="center" style="margin-top:2%;">
<!-- <select style="font-size:15px;height:40px;width:150px;margin:auto; display:inline-block;">
  <option value="city" selected>Select City</option>
  <option value="bangalore">Bangalore</option>
  <option value="chennai">Chennai</option>
  <option value="hyderabad">Hyderabad</option>
  <option value="pune">Pune</option>
  <option value="kolkata">Kolkata</option>
  <option value="delhi">Delhi</option>
</select> -->


<label style="font-size:15px;">Select City</label>
<select id="cc" style="font-size:15px;height:40px;width:150px;margin:auto; display:inline-block;">
  <option value="cityCategory" selected>Select City</option>
  <option value="2">Bangalore</option>
  <option value="2">Hyderabad</option>
  <option value="2">Chennai</option>
  <option value="2">Kolkata</option>
  <option value="1">Bhubaneswar</option>
  <option value="1">Chandigarh</option>
  <option value="1">Trivendrum</option>
  <option value="1">Bhopal</option>
  <option value="0">Cuttack</option>
  <option value="0">Mysore</option>
</select>


<!-- <select style="font-size:15px;height:40px;width:150px;margin:auto; display:inline-block;margin-left:1%;">
  <option value="location" selected>Select Location</option>
  <option value="wf">WhiteField</option>
  <option value="ma">Marathalli</option>
  <option value="ko">Koramangala</option>
  <option value="in">IndiraNagar</option>
  <option value="btm">BTM</option>
  <option value="jp">JPNagar</option>
  <option value="jy">JayaNagar</option>
  <option value="ec">Electronic City</option>
</select>
 -->
<label style="font-size:15px;margin-left:5.5%">Room Type</label>
<select style="font-size:15px;height:40px;width:150px;margin:auto; display:inline-block;">
  <option value="roomType" selected>Select Type</option>
  <option value="1bhk">1 BHK</option>
  <option value="2bhk">2 BHK</option>
  <option value="3bhk">3 BHK</option>
</select>

<label style="font-size:15px;margin-left:7%">Parking</label>
<select id="parking" style="font-size:15px;height:40px;width:150px;margin:auto;margin-right:1%">
  <option value="cityCategory" selected>Select Parking</option>
  <option value="0">Not Provided</option>
  <option value="1">Covered</option>
  <option value="2">Open</option>
</select>
<br/><br/><br/><br/>
<label style="font-size:15px;">School Distance</label>
<input type="text" id="td" style="font-size:15px;height:40px;width:150px;display:inline-block;" placeholder="Distance in Meter">
<label style="font-size:15px;margin-left:3.2%;">Market Distance</label>
<input type="text" id="md" style="font-size:15px;height:40px;width:150px;display:inline-block" placeholder="Distance in Meter">
<label style="font-size:15px;margin-left:1.1%;">Hospital Distance</label>
<input type="text" id="hd" style="font-size:15px;height:40px;width:150px;margin-right:4%" placeholder="Distance in Meter">
<br/><br/><br/><br/>
<label style="font-size:15px;">Carpet Area</label>
<input type="text" id="carpet" style="font-size:15px;height:40px;width:150px;display:inline-block;" placeholder="Carpet Area in sqft">
<label style="font-size:15px;margin-left:5%;">BuiltUp Area</label>
<input type="text" id="bu" style="font-size:15px;height:40px;width:150px;display:inline-block;" placeholder="Builtup Area in sqft">
<label style="font-size:15px;margin-left:3%;">Rain Fall(mm)</label>
<input type="text" id="rf" style="font-size:15px;height:40px;width:150px;margin-right:2%" placeholder="Rain Fall"><br/><br/>

<button id="predictBtn" class="button" style="background-color:#FF4500;font-size:15px;height:45px;width:150px;margin:auto;margin-top:5%;display:inline-block;margin-left:7%;" onclick="predictPrice();">Predict Price</button>

<br/>
<button id="priceBtn" style="font-size:20px;height:40px;width:500px;margin:auto;margin-top:4%;margin-left:34%;border-radius:10px;border:1px solid #FF4500;color:navy;display:none"></button>
</div>
<div id='imgDiv' style="display: none;">
    <i class="fa fa-spinner fa-spin" style="margin-left:51.4%;margin-top:2%;font-size:50px;color:#80dfff;"></i>
 	<%-- <img src="${pageContext.request.contextPath}/resources/image/processing.gif"  width="80" height="80" style='margin-left:50%;margin-top:2%;'> --%>
</div>
</body>

<script type="text/javascript" charset="utf-8">
  function predictPrice()
    {
	  document.getElementById('priceBtn').style.display='none';
	  document.getElementById('imgDiv').style.display='block';
	  var formData = {
			  cityCategory : $("#cc").val(),
			  taxiDistance : $("#td").val(),
			  marketDistance : $("#md").val(),
			  hospitalDistance : $("#hd").val(),
			  carpet : $("#carpet").val(),
			  builtup : $("#bu").val(),
			  parking : $("#parking").val(),
			  rainFall : $("#rf").val(),
		};
	  
	  $.ajax({
		  type: 'POST',
		  contentType : 'application/json',
		  url:'../pricePrediction/runML',
		  data:JSON.stringify(formData),
		  dataType: 'json',
		  success: function(aprt) {
			    document.getElementById('imgDiv').style.display='none';
			  	document.getElementById('priceBtn').style.display='block';
				document.getElementById("priceBtn").innerHTML = "Apartment predicted price : " + aprt.price;	
		  },
		  error: function() {
		    console.log('python script run error');
		  }
		});
    }
	
 </script>
</html>

 