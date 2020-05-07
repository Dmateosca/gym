<?php
	
	class ejercicio{
		var $cod_musculo;
		var $cod_ejercicio;
		var $des_ejercicio;
		function __construct()
		{
			$this->cod_musculo="";
			$this->cod_ejercicio="";
		}
		public function mostrar(){
			include 'BDGym.class.php';
			$conexion= new conexionBD();
			
			$sql="select cod_ejercicio,des_ejercicio from ejercicio where cod_musculo=? order by cod_ejercicio asc";
			try{
				$stmt=$conexion->prepare($sql);
			}catch(Exception $e){
				echo $e->errorMessage();
				die(header("Location:index.php"));
			}
			$stmt->bind_param("i", $this->cod_musculo);
			$stmt->execute();
			$stmt->store_result();
			$stmt->bind_result($cod_ejercicio,$des_ejercicio);
			$arrayConten=array();
			if($stmt->num_rows>0){
				while($stmt->fetch()){
					$arrayConten[]=array("cod_ejercicio"=>$cod_ejercicio,"des_ejercicio"=>$des_ejercicio);	
				}

			$resultado['ejercicios']=$arrayConten;
			$resultado['correcto']="1";
			}else{
			$resultado["correcto"]="0";	
			 }

			header("Content-Type: application/json");
			echo json_encode($resultado,JSON_FORCE_OBJECT);

		}
	}


 ?>