<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">

<head>
  <title>Flower Classification System</title>
  <script src="../script/jquery.min.js"></script>
  <link rel="stylesheet" href="../css/style.css">
</head>

<body>
<div class="header" align="center">
  <h1 align="center" style="color:whitesmoke;">
  	<a id="userid" ref="#" style="font-size:20px;color:whitesmoke;margin-left:1%"></a>
    <a style="color:whitesmoke;">Flower Classification System</a>
  </h1>
</div>

<div align="center" style="margin-top:4%">
<input type="text" id="sLen" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Sepal Length"><br/><br/>
<input type="text" id="sWid" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Sepal Width"><br/><br/>
<input type="text" id="pLen" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Petal Length"><br/><br/>
<input type="text" id="pWid" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Petal Width"><br/><br/>
<button id="identifyBtn" class="button" style="font-size:15px;height:40px;width:300px;margin:auto;margin-top:2%;display:inline-block;margin-left:1%;"    onclick="identifyFlower()">Identify Flower</button>

<br/>
<button id="flowerBtn" class="result" style="font-size:20px;height:40px;width:400px;margin:auto;margin-top:4%;border-radius:10px;border:1px solid #0084bf;color:navy;display:none"></button>
</div>
</body>
</html>

<script src="http://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
 <script type="text/javascript" charset="utf-8">
  function identifyFlower()
    {
	    var sLength = document.getElementById('sLen').value;
		var sWidth = document.getElementById('sWid').value;
		var pLength = document.getElementById('pLen').value;
		var pWidth = document.getElementById('pWid').value;
		
		var formData = {
			sLength : $("#sLen").val(),
	    	sWidth : $("#sWid").val(),
			pLength : $("#pLen").val(),
	    	pWidth : $("#pWid").val()
		}
		
		$.ajax({
		  type:'get',
		  url:'../python/flower_classification.py',
		  cache:false,
		  data:JSON.stringify(formData),
		  dataType: 'json',
		  success: function(data) {
			document.getElementById('flowerBtn').style.display='block';
			document.getElementById("flowerBtn").innerHTML = "Flower type is :  " + data;
		  },
		  error: function() {
		    console.log('python script run error');
		  }
		});
    }
 </script>