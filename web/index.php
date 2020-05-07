<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Gimnasio Wellness Sierra de Gata</title>
 	 <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.1/themes/base/jquery-ui.css" />
    <link href="css/estilo1.css" rel="stylesheet">
    <script src="js/jquery-3.1.1.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/script1.js">
	</script>
   
</head>
<body>
<?php
 	
 	include __DIR__.'/../app/autenticar.class.php';
 	session_start();
 	$autenticar=new autenticar();
 	$autenticar->conectado();
 	$cod_usuario= $_SESSION['cod_usuario'];
 	$nivel_acceso=$_SESSION['nivel_acceso'];


 ?>
	
	<header id="hCabecera" class="container-fluid">
	<p class="col-xs-8  text-justify">Centro Wellness Sierra de Gata</p>

	<a class="col-xs-1 col-xs-offset-2 " href="cerrarsesion.php"><button class="btn glyphicon glyphicon-log-out" ></button></a>
	</header>

	<div id="botonesPrincipales" class="container-fluid" >
	<div id="idInicio" class="col-xs-5 col-md-4">
		<p>Que podemos trabajar</p>
	</div>
	<div  class="col-xs-2 col-md-4" id="botonNoche">
		<p>Noche</p>
	</div>
	<div id="cMusculos" class="col-xs-5 col-md-4">
		<p>Que podemos hacer</p>
	</div>
	</div>
	 <section  id="contCalendario"><form id="idFecha">
	 <label for="fecha">Fecha: </label>
	 <input  id="calendario" type="text" name="fecha" value="" readonly >
	 
	 <?php

	 include_once __DIR__.'/../app/BDGym.class.php';
	 $conexion= new conexionBD();
	 

	 if($nivel_acceso=="T"){
	 	$select="<div class='row'><div class='col-xs-2'><select id='idCoUs' class='form-control input-sm' name='cod_usuario'>";
	 	$sql="select * from usuario";
	 	$stmt=$conexion->query($sql);
	 	while($fila=$stmt->fetch_array()){
	 		$select.="<option value='".$fila['cod_usuario']."'>".$fila['nombre']."</option>";
	 	}
	 	$select.="</select></div></div>";
	 	echo $select;
	 	$conexion->close();
	 }else{
	 	$sql="select * from usuario where cod_usuario='".$cod_usuario."'";
	 	$stmt=$conexion->query($sql);
	 	if($fila=$stmt->fetch_array())
	 	echo '<input type="hidden" id="idCoUs" name="cod_usuario" value="'.$fila['cod_usuario'].'"><div id="nombreUsu"><span>'.$fila['nombre'].'</span> <span>'.$fila['apellidos'].'</span></div>';
	 	$conexion->close();
	 }
	  ?>
	 </form></section>
	<section id="navegacion" class="container-fluid">
	</section>


	<footer id="idPie">Creado por David Mateos Cano para Centro Wellness Sierra de Gata 2017</footer>



</body>
</html>