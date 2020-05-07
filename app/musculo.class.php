<?php 
	class musculo{
		var $cod_musculo;
		var $des_musculo;
		public function __construct(){
			$this->cod_musculo="";
			$this->des_musculo="";
		}
		public function mostrar(){
			include 'BDGym.class.php';
			$conexion= new conexionBD();
			$sql="select musculo.cod_musculo,musculo.des_musculo, imagenes_musculo.imagen from musculo,imagenes_musculo where musculo.cod_musculo=imagenes_musculo.cod_musculo";
			$stmt=$conexion->prepare($sql);
			$stmt->execute();
			$stmt->bind_result($cod_musculo,$des_musculo,$imagen);
			while($stmt->fetch()){
				$resultado[]=array("cod_musculo"=>$cod_musculo,"des_musculo"=>$des_musculo,"imagen"=>$imagen);
			}
			$respuesta["contenido"]=$resultado;
			header("Content-type: application/json; charset=utf-8");
			echo json_encode($respuesta);
		}
	}



 ?>