<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="content-type" content="">
  <title>om2eq</title>
  <meta content="om2eq" name="Author">
  <meta content="OpenMath om2eq" name="Keywords">
  <link type="text/css" href="LADucation-Ggb_files/style.css" rel="stylesheet">
  <script type="text/javascript" src="LADucation-Ggb_ffiles/slide.js"></script>     
</head>
<table cellpadding="0" cellspacing="0" width="1100">
  <tbody>
    <tr>
      <td class="picture" align="center" height="126" valign="bottom" width="160">
      </td>
      <td align="center" height="100" valign="middle" width="754">
      <img border="0" src="LADucation-Ggb_files/LADucation4ggb-cabecera.png" width="650" height="90"></td>
    </tr>
    <tr>
      <td class="menubar" valign="top" width="90"><br>
      <dl>
      	<br>
        <dd><a class="navbutton" href="index.html">Main</a></dd>
        <br>
        <dd><a class="navbutton" href="Instructions.html">Instructions</a></dd>
        <br>
        <dd><a class="navbutton" href="Examples.html">Examples</a></dd>
        <br><br><br>
        <dd><a class="navbutton" href="Contact.html"><small>Contact</small></a></dd>
      </dl>
         
      </td>
      <td class="content" valign="top" width="800">
      
<!------------------------------------------------------------------------------------------->
<!--                           Start of Content                                              -->
<!------------------------------------------------------------------------------------------->
	        <br>
          <table align="center" cellpadding="5" width="100%">
            <tbody><tr>
              <td valign="top" width="100%">
               
                <table align="center" width="90%">
                  <tbody>
                  	<tr>
                    
                    



<?php

/* Directory where to store the uploaded file. */
/* $Root = "d:/www.kessels.com/upload/"; */
$Root = "temporal/";   
/* $Root = "/var/www/LAD/temporal/"; */
$tmptoken = time();
$cabritemp = "ficheroprueba" . $tmptoken . ".fig";
$gsptemp = "ficheroprueba" . $tmptoken . ".htm";
$cindytemp = "ficheroprueba" . $tmptoken . ".cdy";
 $ggbtemp = "ficheroprueba" . $tmptoken . ".ggb";
$ficheros = "ficheros/";


/*
Maybe put them in temporal dir in system
system('rm temporal/resultProveTexto.txt');
system('rm temporal/locus.gif');
system('rm temporal/locusCont.gif');
system('rm temporal/*.txt');
system('rm temporal/*.xml');
system('rm temporal/*.png');
*/

/* Accept the upload and take action on wether the upload has succeeded
   or failed. The parameters of the upload are stored by PHP in the
   $_FILES['Whatever'] array, where "Whatever" is the "file" parameter
   from the form (see "index.html"). */

if($_FILES['Whatever']['size'] < 50000)
{//the size of the file is ok
$Result = move_uploaded_file($_FILES['Whatever']['tmp_name'], $Root.$_FILES['Whatever']['name']);
$extension = explode(".",$_FILES['Whatever']['name']);
$num = count($extension)-1; 
// echo getcwd().'version'.phpversion();


if ($Result == FALSE) { echo "<h2>Sorry!</h2> The upload has failed.<br>";  } 
else {  
//the file is succesfully uploaded
//echo "<h4>Success!</h4>\n<p>\n";

//CABRI FILES
	if($extension[$num] == "fig")
	{echo "<div align='center'><h4>Your Cabri(tm) file ".$_FILES['Whatever']['name']." has been successfully uploaded. It will be processed in 8 seconds. </h4></div>";
	//PROCESAMIENTO DE FICHEROS CABRI
/*
	echo '<pre>';
	print_r($_FILES['Whatever']);
	print_r($extension);
	echo '</pre>';
	print_r('The Cabri file is ' .$Root.$_FILES['Whatever']['name']);
*/

	$nombrefichero = $Root.$_FILES['Whatever']['name'];

//echo system('chmod 666 ' .$Root.$_FILES['Whatever']['name']);
//echo system('cp ' .$Root.$_FILES['Whatever']['name']. ' '.$ficheros.$cabritemp);
//echo system('chmod 666 ' .$ficheros.$cabritemp);

	echo "<br>";
	echo '<hr>';
//echo 'Procesamos el fichero Cabri <br>';
	$salida = system('/opt/java/jdk/bin/java -classpath /var/www/LAD/ Cabri2OMLAD.phrasebookCabriLAD '.$nombrefichero .' >>/dev/null');
// con >>/dev/null el comando un devuelve ninguna salida

	// echo 'The OpenMath translation is in this file <br>';
	//COMENTADO
	//echo '<br>Get the <a href="'. $nombrefichero.'.xml"> OpenMath translation</a> of your file. <br>'; 
	echo system('cp ' .$nombrefichero.'.xml ' .$nombrefichero.'.txt');
	//echo '<br><a href=" '.$nombrefichero.'.txt "> Text file  </a> <br>'; 

	echo '<br>';

	ob_flush(); flush();
	//echo '<strong>Fichero procesado</strong> <br>';

}
//GSP
	else if($extension[$num] == "htm")
	{echo "<div align='center'><h4>Your GSP(tm) file ".$_FILES['Whatever']['name']."  has been successfully uploaded. It will be processed in 8 seconds.</h4></div>";
	//PROCESAMIENTO DE FICHEROS GSP
	/*
	echo '<pre>';
	print_r($_FILES['Whatever']);
	print_r($extension);
	echo '</pre>';
	print_r('The GSP file is ' .$Root.$_FILES['Whatever']['name']);
*/
	$nombrefichero = $Root.$_FILES['Whatever']['name'];

	echo "<br>";
	echo '<hr>';
	//echo 'Procesamos el fichero GSP <br>';
	$salida = system('/opt/java/jdk/bin/java -classpath /var/www/LAD/ GSP2OMLAD.phrasebookGSPLAD '.$nombrefichero .' >>/dev/null');
	// con >>/dev/null el comando un devuelve ninguna salida

//	echo 'The OpenMath translation is in this file <br>';
	//COMENTADO
	//echo '<br>Get the <a href="'. $nombrefichero.'.xml"> OpenMath translation</a> of your file. <br>'; 
	//echo '<br><a href="'. $nombrefichero.'.xml"> XML file </a> <br>'; 
	echo system('cp ' .$nombrefichero.'.xml ' .$nombrefichero.'.txt');
	//echo '<br><a href=" '.$nombrefichero.'.txt "> Text file  </a> <br>'; 
	echo '<br>';
}
//CINDERELLA
	else if($extension[$num] == "cdy")
	{echo "<div align='center'><h4>Your Cinderella file ".$_FILES['Whatever']['name']." has been successfully uploaded. It will be processed in 8 seconds.</h4></div>";
	//PROCESAMIENTO DE FICHEROS CINDY
	
	/*echo '<pre>';
	print_r($_FILES['Whatever']);
	print_r($extension);
	echo '</pre>';
	print_r('The Cinderella file is ' .$Root.$_FILES['Whatever']['name']);
*/
	$nombrefichero = $Root.$_FILES['Whatever']['name'];

	echo "<br>";
	echo '<hr>';
	//echo 'Procesamos el fichero Cindy <br>';
	/*$descomprime = system('gunzip -h');*/
	//echo system('/bin/gunzip -S .cdy '.$nombrefichero); 
	system ('/bin/zcat -S .cdy '.$nombrefichero.' > '.$Root.'cindytext.dat');
	$nombrefichero = $Root.'cindytext.dat';
	//system ('cat '.$nombrefichero);

	//$salida = system('/opt/java/jdk/bin/java -classpath /var/www/LAD/ Cindy2OM.PhrasebookCindyLAD '.$nombrefichero.'  >>/dev/null');
	$salida = system('/opt/java/jdk/bin/java -classpath /var/www/LAD/ Cindy2OM.PhrasebookCindyLAD '.$nombrefichero .' >> /dev/null');
	// con >>/dev/null el comando un devuelve ninguna salida

	//echo 'The OpenMath translation is in this file <br>';
	//echo '<br><a href="'.$nombrefichero.'.xml"> XML file </a> <br>'; 
	//COMENTADO
	//echo '<br>Get the <a href="'. $nombrefichero.'.xml"> OpenMath translation</a> of your file. <br>'; 
	echo system('cp '.$nombrefichero.'.xml '.$nombrefichero.'.txt');
	//echo '<br><a href="'.$nombrefichero.'.txt "> Text file  </a> <br>'; 
	echo '<br>';
}
//GEOGEBRA
	else if($extension[$num] == "ggb")
	{echo "<div align='center'><h4>Your Geogebra file ".$_FILES['Whatever']['name']." has been successfully uploaded. <br> It will be processed in 8 seconds.</h4></div>";
	//PROCESAMIENTO DE FICHEROS GEOGEBRA
	
	/* echo '<pre>';
	print_r($_FILES['Whatever']);
	print_r($extension);
	echo '</pre>';
	print_r('The Geogebra file is ' .$Root.$_FILES['Whatever']['name']);
	*/
	$nombrefichero = $Root.$_FILES['Whatever']['name'];

	echo "<br>";
	echo '<hr>';
	//echo 'Procesamos el fichero Cindy <br>';
	/*$descomprime = system('gunzip -h');*/
	//echo system('/bin/gunzip -S .cdy '.$nombrefichero); 
	//system ('/bin/zcat -S .ggb '.$nombrefichero.' > '.$Root.'geogebratext.dat');
	//echo 'Descomprimir '.$nombrefichero.':'.$Root.': <br>';
	//$pr=system('/usr/bin/unzip -u '.$nombrefichero,$res);
	$execute = "unzip -u $nombrefichero -d $Root";
	`$execute`;
	//echo '<p>Descomprimir :'.$pr.':'.$res.':</p>';
	$nombrefichero = $Root.'geogebra.xml';
	//system ('cat '.$nombrefichero);

	//$salida = system('/opt/java/jdk/bin/java -classpath /var/www/LAD/ Cindy2OM.PhrasebookCindyLAD '.$nombrefichero.'  >>/dev/null');
	$salida = system('/opt/java/jdk/bin/java -classpath /var/www/LAD/LAD4ggb/ Ggb2OM.PhrasebookGgbLAD '.$nombrefichero.'  >> /dev/null');
	// con >>/dev/null el comando un devuelve ninguna salida

	//echo 'The OpenMath translation is in this file <br>';
	//echo '<br><a href="'.$nombrefichero.'.xml"> XML file </a> <br>'; 
	//COMENTADO
	//echo '<br>Get the <a href="'. $nombrefichero.'.xml"> OpenMath translation</a> of your file. <br>'; 
	echo system('cp '.$nombrefichero.'.xml '.$nombrefichero.'.txt');
	
	//echo '<br><a href="'.$nombrefichero.'.txt "> Text file  </a> <br>'; 
	echo '<br>';
}


	else {echo "<div align='center'><br> <br> <h4>TASK ERROR</h4> The file ".$_FILES['Whatever']['name']." is not a GeoGebra file.</div>"; 
		echo "<br>"; 
		echo "<br>";
		//echo "<A href='http://nash.sip.ucm.es/LAD/LADucation4ggb.html'> Back to LADucation 4 GeoGebra</A>";
		exit();}
	}// we have obtained the wd file

if(file_exists($nombrefichero.'.txt') == FALSE) {
echo "<div align='center'><br> <br> <h4>TASK ERROR</h4> Construction with incorrect specification of task (see Instructions).</div>"; 
		echo "<br>"; 
		echo "<br>";
		//echo "<A href='http://nash.sip.ucm.es/LAD/LAD4ggb/LADucation4ggb.html' > Back to LADucation 4 GeoGebra</A>";
		exit();}
else{

//Now we proccess the wd file

	//echo '<br>'; 
	//echo 'Now we get the WD file.  <br>';
	//echo system('/opt/java/jdk/bin/java -classpath /var/www/GLI  OM2Wd');
	system('/opt/java/jdk/bin/java -classpath /var/www/LAD  OM2WdEducaLAD '.$nombrefichero.'.xml >>/dev/null');

	system('cat '.$nombrefichero.'.xml.wd > temporal/WD/fichero.wd');
	//COMENTADO
	//echo 'Your WD file is ready! <a href="temporal/WD/fichero.wd">[download]</a> <br>' ;
	ob_flush();flush();

//Now we launch the Mathematica Kernel
//system('/opt/mathematica/Executables/Linux/math -pwfile /root/.Mathematica/4.1/Licensing/mathpass >>/dev/null ');
/*echo 'Your answer in ';
for ($i = 8; $i >= 0; $i--) {
	echo $i.' seconds '; sleep(1);
	ob_flush();flush();
      }
*/
system('/bin/sh /var/www/LAD/LADucation4ggb/mmaKernel.sh');

$nombre_archivo = 'temporal/locus.gif';

?>
<div align="center">


<table ALIGN=CENTER>
  <tbody>

<?php
if (file_exists("temporal/resultProveTexto.txt")){
	if (filesize("temporal/resultProveTexto.txt")> 0){
	echo '<tr>	
      		<td>
		<H3><pre>';
	system ('cat temporal/resultProveTexto.txt');
	echo '	</pre></H3>
		</td>
    	</tr>';
	}
	else echo '<div align="center"><h4>TASK ERROR</h4> exceeded allotted time.</div>';

}
else if (file_exists('temporal/locus.gif')) {
    echo '<tr>
      <td>LADucation has obtained the EXACT PICTURE</td>
    </tr>';
	echo '<tr>
      <td><strong>The locus is (or is contained in) </strong></td>
    </tr>  ';
	echo '<tr>
      <td><IMG src="temporal/locus.gif" alt="IMAGE NOT AVAILABLE" align="left" border="0"></td>  </tr>';
echo '	<tr>	
      	<td>The  locus equation  is  <br> 
	<pre>';
	system('cat temporal/locusEq.txt'); 
echo '	</pre>
	</td>
    </tr>';

} 
else if (file_exists('temporal/locusCont.gif')) {
    echo '<tr>
      <td>LADucation has obtained an APROXIMATE PICTURE</td>     </tr>';
	echo '<tr><td><strong>The locus is (or is contained in) </strong></td>   </tr>  ';
	echo '<tr> <td><IMG src="temporal/locusCont.gif" alt="IMAGE NOT AVAILABLE" align="left" border="0"></td>    </tr>';

//      	<td>The <a href="temporal/locusEq.txt"> locus equation </a> is  <br> 

echo '	<tr>	
      	<td>The locus equation is  <br> 
	<pre>';
	system('cat temporal/locusEq.txt'); 
echo '	</pre>
	</td>
    </tr>';
}

else if(file_exists('temporal/result.txt')){ // the whole plane
echo 'The locus is the whole plane (or contains a 2-dimensional open set)';
}
else 
{ //compruebo el contenido del fichero wd
 //es posible que todo se haya procesado correctamente, pero que el fichero original no tuviese una 
 // asignaci�n de tareas adecuada
	//guardo el contenido del fichero en un string
	$contenido_fichero = file_get_contents('temporal/WD/fichero.wd');
	//echo '**'.$contenido_fichero.'**';
	//si el fichero original no tiene una tarea asignada, su contenido es
	// "Configuration with no task: no webDiscovery text produced"
	//comprobamos entonces si contienen la �ltima parte
	$palabra = strstr($contenido_fichero, 'no webD');
	//echo '**'.$palabra.'**';
	if($palabra == 'no webDiscovery text produced'){
	echo '<div align="center"><h4>TASK ERROR</H4> Configuration with no task (see instructions).</div>';}
	else {
	echo '<div align="center"><h4>TASK ERROR</h4> Exceeded allotted time.</div>'; }

}

}



}//end ok upload
// the file is too big
else{echo '<br><br><div align="center"><h4>UPLOAD ERROR</H4> The file you are trying to upload is too big. <br> Are you sure you are processing the right file?</div>';}	


?>



<br>


    

<?php

//system('rm temporal/resultProveTexto.txt');
//system('rm temporal/locus.gif');
//system('rm temporal/locusCont.gif');
?> 


 <!--   <tr>
      <td><IMG src="temporal/locusCont.gif" alt="IMAGE NOT AVAILABLE" align="left" border="0"></td>
    </tr>

    <tr>
      <td><IMG src="temporal/locus.gif" alt="IMAGE NOT AVAILABLE" align="left" border="0"></td>
    </tr>-->
    


  </tbody>
</table>



</div>

<br>

<br>


 <!-- <A href="http://nash.sip.ucm.es/LAD/LAD4ggb/LADucation4ggb.html" >Back to LADucation 4 GeoGebra</A> -->


<?php

/* A bit of debugging, show all the available parameters in the
   $_FILES['Whatever'] array. */

//$propietario = system('chmod 666' .$_FILES['name']);

/*
echo '<br>'; 
print_r('El contenido es:');
echo '<br>'; 
echo '<pre>';
print_r(system('cat '.$Root.$_FILES['Whatever']['name']));
echo '</pre>';
*/




// echo '<br><hr><br>';
/*
print_r('Trasferimos la informacion a '.$cabritemp);
echo '<br>';
print_r('El contenido es:');
echo '<br>'; 
echo '<pre>';
print_r(system('cat '.$cabritemp));
echo '</pre>';
*/

//echo system('cat '.$Root.'conpregunta.fig', $retval);
//$ultima_linea = system('cat '.$Root.'conpregunta.fig', $retval);

//echo '<pre>';
//echo system('/opt/java/jdk/bin/java -classpath /var/www/GLI/ Cabri2OM.phrasebookCabriGLIConTags');

//echo htmlentities('hola '.$salida);
//echo htmlentities(system('cat traduccionOM.xml'));


//opt/java/jdk/bin/java -classpath /var/www/GLI/ Cabri2OM.phrasebookCabriGLIConTags
//echo '</pre>';

//echo htmlentities(system('cat traduccionOM.xml'));





//$traduccion = system('cat'. ' traduccionOM.xml');

/*
echo '<pre>';
print_r(system('cat'. ' traduccionOM.xml'));
echo '</pre>';
*/


/*

echo 'Next: como subir el fichero al servidor';

$destino = 'http://193.146.36.46/';
//copy('fichero.wd', $destino);

?>



<form action="http://193.146.36.46/cgi-bin/upload.exe" enctype="multipart/form-data" method="post">
	<input name="Config" value="Rex" type="hidden">
	<p align="center">
		<input name="Whatever" size="75" type="file" value="fichero.wd">
		<!--<input name="Whatever" size="25" type="text" value="/var/www/GLI/fichero.wd"  readonly="true">-->
		<input value="Get Locus" type="submit">	
	</p>
</form>




<?php
//echo system('cp ' .$Root.$extension[0]. ' '.$Root.'ficherocindy.txt');


/*echo exec('whoami');*/

echo "<hr>";

echo date(DATE_RFC822);

//echo "<p>";


//echo "<br> Muestra los ficheros del directorio <br>";
//echo exec('ls -la ' .$Root);


//echo '<pre>';

// Muestra el resultado completo del comando "ls", y devuelve la
// ultima linea de la salida en $ultima_linea. Almacena el valor de
// retorno del comando en $retval.
//$ultima_linea = system('ls -la ' .$Root.'*.fig', $retval);
//$ultima_linea = system('ls -la ' .'*.fig', $retval);
//$ultima_linea = system('ls -la ' .'*.xml', $retval);
//$ultima_linea = system('ls -la temporal/WD/'.'*.wd', $retval);


// Imprimir informacion adicional
//echo '</pre> <hr />Ultima linea de la salida: ' . $ultima_linea . '<hr />Valor de retorno: ' . $retval;
//echo "<br>";


/*
echo $_SERVER["HTTP_USER_AGENT"]; 

echo "<br>";

if (strstr($_SERVER["HTTP_USER_AGENT"], "MSIE")) {
   echo "You are using Internet Explorer, beware of virus<br>";
}
else echo "Good, you do not use Internet Explorer  <br><br>";
  phpinfo(); */

//echo "</p>";

?>


  </tr>
                  
                </tbody></table>
              </td>
            </tr>
                      
          </tbody>
        </table>
        
				<br>
          

          
<!------------------------------------------------------------------------------------------->
<!--                           End of Content                                                -->
<!------------------------------------------------------------------------------------------->
      </td>
    </tr>
  </tbody>
</table>
</body>
</html>
