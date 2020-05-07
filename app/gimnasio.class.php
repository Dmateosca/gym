<?php



class controlador{
	public function mostrarMusculo(){
		include __DIR__."/../app/musculo.class.php";
		$musculo= new musculo();
		$musculo->mostrar();
	}
	public function altaUsuario(){
		include __DIR__."/../app/usuario.class.php";
		$usuario=new usuario();
		$usuario->cod_usuario=$_POST['cod_usuario'];
		$usuario->nombre=$_POST['nombre'];
		$usuario->apellidos=$_POST['apellidos'];
		$usuario->password=md5($_POST['password']);
		$usuario->fecha_nacimiento=$_POST['fecha_nacimiento'];
		$usuario->email=$_POST['email'];
		$usuario->nivel_acceso="C";
		$usuario->alta();
	}
	public function altaEjercicio(){
		include __DIR__."/../app/tabla_ejercicio.class.php";
		
		$contador=1;
		$tablas=$_POST['num_tablas'];
		while ($contador<=$tablas) {
		$tabla_ejercicio=new tablaEjercicio();
		
		if(isset($_POST['ce'.$contador]) && isset($_POST['p1'.$contador]) && isset($_POST['p2'.$contador]) && isset($_POST['p3'.$contador]) && isset($_POST['p4'.$contador])){
			$tabla_ejercicio->cod_ejercicio=$_POST['ce'.$contador];
			$tabla_ejercicio->peso1=$_POST['p1'.$contador];
			$tabla_ejercicio->peso2=$_POST['p2'.$contador];
			$tabla_ejercicio->peso3=$_POST['p3'.$contador];
			$tabla_ejercicio->peso4=$_POST['p4'.$contador];
			if(isset($_POST['r1'.$contador])&& isset($_POST['r2'.$contador]) && isset($_POST['r3'.$contador]) && isset($_POST['r4'.$contador])){
			$tabla_ejercicio->repeticion1=$_POST['r1'.$contador];
			$tabla_ejercicio->repeticion2=$_POST['r2'.$contador];
			$tabla_ejercicio->repeticion3=$_POST['r3'.$contador];
			$tabla_ejercicio->repeticion4=$_POST['r4'.$contador];
				
			}	
			
			if(isset($_POST['fecha'])){
			$tabla_ejercicio->fecha=$_POST['fecha'];
			}
			$tabla_ejercicio->cod_usuario=$_POST['cod_usuario'];
			$tabla_ejercicio->alta();
			}
			$contador++;
		}


	}
	public function editarEjercicio(){
		include "tabla_ejercicio.class.php";
		$tabla_ejercicio= new tablaEjercicio();
		$tabla_ejercicio->peso1=$_POST['p1'];
		$tabla_ejercicio->peso2=$_POST['p2'];
		$tabla_ejercicio->peso3=$_POST['p3'];
		$tabla_ejercicio->peso4=$_POST['p4'];
		$tabla_ejercicio->repeticion1=$_POST['r1'];
		$tabla_ejercicio->repeticion2=$_POST['r2'];
		$tabla_ejercicio->repeticion3=$_POST['r3'];
		$tabla_ejercicio->repeticion4=$_POST['r4'];
		$tabla_ejercicio->cod_ejercicio=$_POST['cod_ejercicio'];
		$tabla_ejercicio->cod_usuario=$_POST['cod_usuario'];
		$tabla_ejercicio->fecha=$_POST['fecha'];
		$tabla_ejercicio->editar();

	}
	public function bajaEjercicio(){
		include "tabla_ejercicio.class.php";
		$tabla_ejercicio= new tablaEjercicio();
		$tabla_ejercicio->cod_ejercicio=$_POST['cod_ejercicio'];
		$tabla_ejercicio->cod_usuario=$_POST['cod_usuario'];
		$tabla_ejercicio->fecha=$_POST['fecha'];
		$tabla_ejercicio->borrar();
	}
	public function muestraEjercicio(){
		include "ejercicio.class.php";
		$ejercicio=new ejercicio();
		if(isset($_POST["cod_musculo"])){
			$ejercicio->cod_musculo=$_POST["cod_musculo"];
		}else{
			echo "No existe el musculo";
			die();
		}
		$ejercicio->mostrar();
	}
	public function mostrarTabla(){
		include "tabla_ejercicio.class.php";
		$tabla_ejercicio=new tablaEjercicio();
		if(isset($_POST['fecha'])&& isset($_POST['cod_usuario'])){
			$tabla_ejercicio->fecha=$_POST['fecha'];
			$tabla_ejercicio->cod_usuario=$_POST['cod_usuario'];
			$tabla_ejercicio->mostrar();
		}
			
	}
	public function mostrarImagen(){
		include "imagenes_ejercicio.class.php";
		$imagenes=new imagenes();
		if(isset($_POST['cod_ejercicio'])){
			$imagenes->cod_ejercicio=$_POST['cod_ejercicio'];
			$imagenes->mostrar();
		}
	}


}
 ?>