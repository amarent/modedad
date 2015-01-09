<!DOCTYPE html>
<html>
<body>
<div id="panel2">
	<form name="form1" action="vinculo_servidores3.php" method="POST" target="_blank">
	    <table style="border-spacing: 5px; font size="3" face="Telefonica Text" color= #151B54", width="100%">
			<tr>
				<td  width="33%" align="center"><img src="TELEFONICA.png" style="width:190px;height:70px"></td>
				<td  width="33%" align="center" width=350px><font size="3" face="Telefonica Text" color= #151B54 ><h3><b>Dirección de Marketing</b></h3>Analitica Comercial<br>Análisis de twitter<br><br></td>
				<td  width="33%" align="center"></td>
			</tr>
		</table>
		
		<table style="border-spacing: 5px; font size="3" face="Telefonica Text" color= #151B54" width="100%">
			
			<tr>
				<td  width="20%" align="center"></td>
				<td rowspan="12"  align="center"  width="20%">
				<img src="Nico_Movistar.png" width=450px height=450px >
				</td>
				<td rowspan="12"  align="left"  width="20%">
			</tr>
	
			<tr>
			<td align="left"><font size="3" face="Telefonica Text" color= #151B54 title="prue">
				&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Número de palabras</font></td>
			</tr>	
			<tr>	
				<td align="left">
				&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;<select name="apariciones" id="apariciones">
						<option value="5" <?php if($_POST['apariciones']==5) echo 'selected="selected" ';?>>5</option>
						<option value="6" <?php if($_POST['apariciones']==6) echo 'selected="selected" ';?>>6</option>
						<option value="7" <?php if($_POST['apariciones']==7) echo 'selected="selected" ';?>>7</option>
						<option value="8" <?php if($_POST['apariciones']==8) echo 'selected="selected" ';?>>8</option>
						<option value="9" <?php if($_POST['apariciones']==9) echo 'selected="selected" ';?>>9</option>
						<option value="10" <?php if($_POST['apariciones']==10) echo 'selected="selected" ';?>>10</option>
						<option value="15" <?php if($_POST['apariciones']==15) echo 'selected="selected" ';?>>15</option>
						<option value="20" <?php if($_POST['apariciones']==20) echo 'selected="selected" ';?>>20</option>
						<option value="20" <?php if($_POST['apariciones']==20) echo 'selected="selected" ';?>>30</option>
					</select>
					
				</td>
			</tr>	
			
			<tr>	
				<td align="left"><font size="3" face="Telefonica Text" color= #151B54 >&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Fecha inicial</font></td>
			</tr>		
			<tr>
				<td align="left">
				&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;<input type=date name="fecha1"  step=1 min=2014-12-01 value="<?php 
						if( isset($_POST['fecha1']) )
							{
     						echo  $_POST['fecha1'];
							}else{
     						echo "2014-12-05";
							} ?>">	
				</td>
			</tr>
			<tr>
				<td align="left"><font size="3" face="Telefonica Text" color= #151B54 >&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;Fecha final</font></td>
			</tr>
			<tr>
				<td align="left">
				&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;<input type=date name="fecha2"  step=1 min=2014-11-07 value="<?php 
						if( isset($_POST['fecha2']) )
							{
								echo  $_POST['fecha2'];
								}else{
								echo "2014-12-25";
							} ?>">
					
				</td>
			</tr>	
			
			<tr>
				<td valign=top align="right"><input type="submit" name="submitform" value="Realizar" style="width:100px; height:25px"></td>
			</tr>
			
	</table>
	</form>
    </div>
  </body>
</html>