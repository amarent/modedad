<!DOCTYPE html>
<html>
<head>
<title>Telefónica</title>
<!-- Include order: first jquery, then opencpu.js, and then your code -->

<script src="opencpu/jquery-1.10.2.min.js"></script>
<script src="opencpu/opencpu-0.4.js"></script>

<script>

function getGET(){
   var loc = document.location.href;
   var getString = loc.split('?')[1];
   var GET = getString.split('&');
   var get = {};//this object will be filled with the key-value pairs and returned.

   for(var i = 0, l = GET.length; i < l; i++){
      var tmp = GET[i].split('=');
      get[tmp[0]] = unescape(decodeURI(tmp[1]));
   }
   return get;
}

var get = getGET();
var Vn= get['n'];
var Vrubro= get['variable'];
var Vmes= get['cve_mes'];

//init this script when the page has loaded
$(document).ready(function(){

var req = $("#plotdiv").rplot("ambas", {
rubro : Vrubro,
n : Vn,
mes : Vmes
})
});
</script>
<style>
#plotdiv {
position: relative;
width: 600px;
height: 400px;
border: solid gray 1px;
}
</style>
</head>
<body>

<table>
	<tr><td><img src="TELEFONICA.png" style="width:150px;height:50px"></td><td align="center" width=350px> 

	<font size="3" face="Telefonica Text" color= #151B54 >
	<h3><b>Dirección de Marketing</b></h3>
	Analitica Comercial
	<br>
	Histograma de variables de Movilidad	
		<br>
		<br>
	</td></tr>
</table>
<div id="plotdiv"></div>
<div>
	<?php
                $varVariable=$_GET['variable']
		$conn = sqlsrv_connect( "10.225.240.98", array( "Database"=>"RADIOBASE", "UID"=>"usrAppWEB", "PWD"=>"Telefonica*01"));
		$CADSQL ="SELECT VARIABLE_DESC,DESCRIPCION,PERIODICIDAD FROM KPIS_DETALLE WHERE VARIABLE_BD=".$varVariable;
		$result = sqlsrv_query($conn ,$CADSQL);
		while( $row = sqlsrv_fetch_array( $result, SQLSRV_FETCH_ASSOC) )
		{
                      echo $row["VARIABLE_DESC"];
		}
		sqlsrv_close();
	?>
</div>
</body>
</html>