<?php


Class conexionBD extends mysqli{
	var $user;
	var $password;
	public function __construct(){
		include 'cargarFichero.php';
		$cargar = new cargarFichero();
		$array = $cargar->cargarFicheros();
		parent::__construct("localhost",$array['user'],$array['password'],"gym");
		parent::set_charset("utf8");
	}

	
	
	
}

?>