<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">

<head>
  <title>Flower Classification System</title>
  <script src="../resources/scripts/jquery.min.js"></script>
  <link rel="stylesheet" href="../resources/css/style.css">
</head>

<body>
<div class="header" align="center">
  <h1 align="center" style="color:whitesmoke;">
    <a style="color:whitesmoke;">Flower Classification System</a>
  </h1>
</div>

<div align="center" style="margin-top:2%">
<input type="text" id="sLen" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Sepal Length"><br/><br/>
<input type="text" id="sWid" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Sepal Width"><br/><br/>
<input type="text" id="pLen" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Petal Length"><br/><br/>
<input type="text" id="pWid" style="font-size:15px;height:40px;width:200px;display:inline-block;" placeholder="Petal Width"><br/><br/>
<button id="identifyBtn" class="button" style="font-size:15px;height:40px;width:300px;margin:auto;margin-top:2%;display:inline-block;margin-left:1%;" onclick="identifyFlower()">Identify Flower</button>

<br/>
<button id="flowerBtn" class="result" style="font-size:20px;height:40px;width:400px;margin:auto;margin-top:2%;border-radius:10px;border:1px solid #0084bf;color:navy;display:none"></button>
</div>

<div id='imgDiv' style="display: none;">
 	<img src="${pageContext.request.contextPath}/resources/image/processing.gif"  width="100" height="100" style='margin-left:47%;margin-top:2%;'>
</div>

<div id='setosaDiv' style="display: none;">
 	<img src="${pageContext.request.contextPath}/resources/image/iris-setosa.jpg"  width="100" height="80" style='margin-left:47%;margin-top:2%;'>
</div>
<div id='versiDiv' style="display: none;">
 	<img src="${pageContext.request.contextPath}/resources/image/iris-versicolor.jpg"  width="100" height="80" style='margin-left:47%;margin-top:2%;'>
</div>
<div id='virgiDiv' style="display: none;">
 	<img src="${pageContext.request.contextPath}/resources/image/iris-virginica.jpg"  width="100" height="80" style='margin-left:47%;margin-top:2%;'>
</div>

</body>


 <script type="text/javascript" charset="utf-8">
  function identifyFlower()
    {	
	  	document.getElementById('flowerBtn').style.display='none';
	  	document.getElementById('setosaDiv').style.display='none';
	  	document.getElementById('versiDiv').style.display='none';
		document.getElementById('virgiDiv').style.display='none';
	    document.getElementById('imgDiv').style.display='block';
		var formData = {
				sepalLength : $("#sLen").val(),
				sepalWidth : $("#sWid").val(),
				petalLength : $("#pLen").val(),
				petalWidth : $("#pWid").val()
		};
		
		$.ajax({
		  type: 'POST',
		  contentType : 'application/json',
		  url:'../flowerIdentification/runML',
		  data:JSON.stringify(formData),
		  dataType: 'json',
		  success: function(flower) {
			    document.getElementById('imgDiv').style.display='none';
				document.getElementById('flowerBtn').style.display='block';
				document.getElementById("flowerBtn").innerHTML = "Flower type is :  " + flower.flowerType;
				
				if(flower.flowerType == 'Iris-setosa')
				{
					document.getElementById('setosaDiv').style.display='block';
					document.getElementById('versiDiv').style.display='none';
					document.getElementById('virgiDiv').style.display='none';
				}
				else if(flower.flowerType == 'Iris-versicolor')
				{
					document.getElementById('versiDiv').style.display='block';
					document.getElementById('setosaDiv').style.display='none';
					document.getElementById('virgiDiv').style.display='none';
				}
				else if(flower.flowerType == 'Iris-virginica')
				{
					document.getElementById('virgiDiv').style.display='block';
					document.getElementById('setosaDiv').style.display='none';
					document.getElementById('versiDiv').style.display='none';
				}
		  },
		  error: function() {
		    console.log('python script run error');
		  }
		});
    }
 </script>
</html>


