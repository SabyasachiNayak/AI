<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">

<head>
  <title>Apartment Price Prediction System</title>
  <script src="../resources/scripts/jquery.min.js"></script>
  <!-- <script src="../resources/scripts/engineer.js"></script> -->
  <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
<div class="header" align="center">
  <h1 align="center" style="color:whitesmoke;">
  	<a id="userid" ref="#" style="font-size:20px;color:whitesmoke;margin-left:1%"></a>
    <a style="color:whitesmoke;">Apartment Price Prediction System</a>
   <!--  <a href="#" style="font-size:20px;color:whitesmoke;margin-left:2%" onclick="welcome();">Home</a>
  	<a href="#" style="font-size:20px;color:whitesmoke;margin-left:1%" onclick="getProfile();">Profile</a>
  	<a href="#" style="font-size:20px;color:whitesmoke;margin-left:1%" onclick="signOut();">Sign Out</a> -->
  </h1>
</div>

<div align="center" style="margin-top:8%">
<select style="font-size:15px;height:40px;width:200px;margin:auto; display:inline-block;">
  <option value="city" selected>Select City</option>
  <option value="bangalore">Bangalore</option>
  <option value="chennai">Chennai</option>
  <option value="hyderabad">Hyderabad</option>
  <option value="pune">Pune</option>
  <option value="kolkata">Kolkata</option>
  <option value="delhi">Delhi</option>
</select>

<select style="font-size:15px;height:40px;width:200px;margin:auto; display:inline-block;margin-left:1%;">
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

<select style="font-size:15px;height:40px;width:200px;margin:auto; display:inline-block;margin-left:1%;">
  <option value="roomType" selected>Select Room Type</option>
  <option value="1bhk">1 BHK</option>
  <option value="2bhk">2 BHK</option>
  <option value="3bhk">3 BHK</option>
</select>

<br/>
<button id="predictBtn" class="button" style="font-size:15px;height:40px;width:200px;margin:auto;margin-top:4%;display:inline-block;margin-left:2%;" onclick="predictPrice();">Predict Price</button>

<br/>
<button id="priceBtn" class="result" style="font-size:20px;height:40px;width:500px;margin:auto;margin-top:4%;border-radius:10px;border:1px solid #0084bf;color:navy;display:none"></button>
</div>
</body>
</html>

 <script type="text/javascript" charset="utf-8">
   var wshShell = new ActiveXObject("WScript.Shell");
   wshShell.Run("D:\\dir\\user.bat");
   
  function predictPrice()
    {
		document.getElementById('priceBtn').style.display='block';
		document.getElementById("priceBtn").innerHTML = "Apartment predicted price : 65,000,00 ";
    }
	
 </script>