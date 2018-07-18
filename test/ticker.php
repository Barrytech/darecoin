<<?php
$url ="https://api.coinmarketcap.com/v1/ticker/ethereum/";
$fgc = file_get_contents();
$json = json_decode($fgc, true);

$price = $jason("last");
$price= number_format($price, 2);
$high = $json("high");
$low = $json("low");
$date = date("m-d-Y - h:i:$a");
$open = $json("open");
if($open < $price){
  //price went up
  $indicator ="+";
  $change = $price - $open
  $percent = $change / $open;
  $percent = $percent * 100;
  $percentChange = $indicator number_format($percent, 2);
  $color ="green";
}
if($open > $price){
  //price went down
  $indicator ="+";
  $change = $open - $price
  $percent = $change / $open;
  $percent = $percent * 100;
  $percentChange = $indicator number_format($percent, 2);
  $color ="red";
}

 ?>


 <!DOCTYPE html>
 <html>
     <head>
         <title>DareChain/ Live Data Example - HTML5 jQuery Chart Plugin by jqChart</title>
            <link rel="stylesheet" type="text/css" href="../../css/jquery.jqChart.css" >
         <link rel="stylesheet" type="text/css" href="../../themes/le-frog/styles.css" >
         <script src="../../js/jquery-1.11.1.min.js" type="text/javascript"></script>
         <script src="../../js/jquery.jqChart.min.js" type="text/javascript"></script>
<style>
#container{
width: 270 px;
height: 90 px;
border: 1 px solid auto;
background-color: white;
overflow: hidden;
border-radius: 3px;
color: black;
}
</style.


     </head>
     <body>
     <div id="name.logo"> </div>

 <nav class="navbar navbar-inverse">
 <div class="container-fluid">
     <ul class="nav navbar-nav navbar-left">
     <li><a href="#"><span><img class="img-fluid rounded-circle" src="https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png" style="width: 25px; height: 25px;"></span></a></li>
       <li><a href="#"><span> DARE-COIN </span></a></li>


     </ul>



   </div>
   <div class="container-fluid">
     <ul class="nav navbar-nav navbar-right">
       <li><a href="#"><span> DARE-COIN </span></a></li>
      <li><a href="#"><span> User Name </span></a></li>
       <li><a href="#"><span><img class="img-fluid rounded-circle" src="https://i.pinimg.com/originals/7c/c7/a6/7cc7a630624d20f7797cb4c8e93c09c1.png" style="width: 25px; height: 25px;"></span></a></li>
     </ul>



   </div>
 </nav>
 <div id="input-form" >
  <form class="navbar-form navbar-center">
       <div class="input-group  input-sm" style="width: 400px;">
         <input type="text" class="form-control" placeholder="Search">
         <div class="input-group-btn">
           <button class="btn btn-primary" type="submit"> Submit
           </button>
         </div>
          </div>

     </form>
     </div>

 <div class="container">

 </div>
  <div>
         <div id="jqChart" style="width: 500px; height: 300px;">
         </div>
     </div>
     <br><br><br>










<div id="container">
<table width:"100%">
<tr>
<td rowspan="3" width="50%" id="lastprice"> <?php echo $price; ?> </td>
<td align="right">{%change}</td>
</tr>
<tr>
<td align="right"><?php echo $high; ?></td>
</tr>
<tr>
<td aligh="right"><?php echo $low; ?></td>
</tr>
<tr>
<td colspan="2" align="right" id = "timeDate">{time and date} </td>
</tr>
</table>
</div>


<script>
$('document').ready(function(){
  refreshData();
}
);
functtion refreshData(){
  $("#container").load("data2.php", function(){
    setTimeout(refreshData, 5000);
  });
}
}
</script>






     </body>
 </html>
