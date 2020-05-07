<?php

	include __DIR__."/../app/gimnasio.class.php";

	$opciones= array("inicio" => "inicio",
					"alta-usuario" => "altaUsuario",
					"mostrar-musculo" => "mostrarMusculo",
					"mostrar-tabla"=> "mostrarTabla",
					"mostrar-ejercicio" => "muestraEjercicio",
					"alta-ejercicio" => "altaEjercicio",
					"baja-ejercicio" => "bajaEjercicio",
					"editar-ejercicio" => "editarEjercicio",
					"mostrar-imagen" => "mostrarImagen"


 		);
	$pagina="";
	if(isset($_POST['control'])){
		$pagina=$_POST['control'];
	}else{
		$pagina="inicio";
	}
	$pagina=$opciones[$pagina];
	$controlador=new controlador();

	if (method_exists($controlador,$pagina)) {
			call_user_func(array(new $controlador, $pagina));
		} else {
			header('Status: 404 Not Found');
			echo "<html><body><h1>Error 404: El controlador no tiene la pagina <i>".$pagina."</i></h1></body></html>";
		}

 ?>