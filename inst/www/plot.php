<!DOCTYPE html>
<html>
<head>
<?php include("encabezado.php"); ?>
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

var req = $("#plotdiv").rplot("histograma", {
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
<h1>histograma</h1>
<div id="plotdiv"></div>
</body>
</html>
