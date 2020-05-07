<?php
include __DIR__.'/../app/BDGym.class.php'; 
session_start();
	$cod_usuario="";
	$password="";
	if(isset($_POST['cod_usuario']) && isset($_POST['password'])){
		$password=md5($_POST['password']);
		$cod_usuario=$_POST['cod_usuario'];
	}
$conexion = new conexionBD();


$sql="select count(*) from usuario where cod_usuario=? and password=? ";
try{
$stmt=$conexion->prepare($sql);}
catch(Exception $e){
	echo $e->errorMessage();
	die(header("Location:login.php"));
}
$stmt->bind_param('ss', $cod_usuario, $password);
$stmt->execute();
$stmt->bind_result($registro);

$stmt->fetch();
$stmt->close();

//consulta para obtener el nivel de acceso
$sql="select nivel_acceso from usuario where cod_usuario=? and password=? ";
try{
$stmt=$conexion->prepare($sql);}
catch(Exception $e){
	echo $e->errorMessage();
	die(header("Location:login.php"));
}
$stmt->bind_param('ss', $cod_usuario, $password);
$stmt->execute();
$stmt->bind_result($nivel_acceso);

$stmt->fetch();

$jsondata=array();
if($registro>0){
	
	
	$_SESSION['cod_usuario']=$cod_usuario;
	$_SESSION['nivel_acceso']=$nivel_acceso;
	$_SESSION['autenticacion']=1;

	$jsondata['correcto']="1";
}
else{

	$_SESSION['autenticacion']=0;
	$jsondata['correcto']="0";
}
$stmt->close();
header('Content-Type: application/json');

echo json_encode($jsondata, JSON_FORCE_OBJECT);
?>