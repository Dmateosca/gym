<?php 
	class imagenes{

		var $cod_ejercicio;
		var $cod_imagen;
		public function  __construct(){
			$this->cod_ejercicio;
		}
		public function mostrar(){
			include "BDGym.class.php";
			$conexion= new conexionBD();	
			$sql="select cod_imagen from imagenes where cod_ejercicio=?";
			$stmt=$conexion->prepare($sql);
			$stmt->bind_param("i",$this->cod_ejercicio);
			$stmt->execute();
			$stmt->bind_result($imagen);
			$imagenes= array();
			while($stmt->fetch()){
				$imagenes[]=array( "imagen_ejercicio"=>$imagen);
			}
			$resultado['imagen']=$imagenes;
			echo json_encode($resultado);
		}
	}



?>