<?php

	
	class usuario{
		var $cod_usuario;
		var $nombre;
		var $apellidos;
		var $password;
		var $fecha_nacimiento;
		var $email;
		var $nivel_acceso;
		public function __construct(){
			$this->cod_usuario="";
			$this->nombre="";
			$this->apellidos="";
			$this->password="";
			$this->fecha_nacimiento="";
			$this->email="";
			$this->nivel_acceso="";
		}
		public function alta(){
		include 'BDGym.class.php'; 
		session_start();
		$conexion = new conexionBD();
		
		
		$fecha=strtotime($this->fecha_nacimiento);
		//$fecha=strtotime("07/03/1994");
		$fecha=date("Y-m-d",$fecha);
		//$nivel_acceso="C";
		/*echo $fecha_nacimiento;
		echo $fecha;
		$cod_usuario="28968667X";
		$password=md5("28968667X");
		$email="mateoscanodavid@gmail.com";
		$nombre="David";
		$apellidos="Rodriguez";
		$fecha="1994-07-30";
		$nivel_acceso="C";*/
		$sql="select count(*) filas from usuario where cod_usuario=? and email=?";
		try{
		$stmt=$conexion->prepare($sql);}
		catch(Exception $e){
			echo $e->errorMessage();
			die(header("Location:index.php"));
		}
		$stmt->bind_param('ss', $this->cod_usuario, $this->email);
		$stmt->execute();

		$stmt->bind_result($filas);


		$stmt->fetch();

		if($filas==1){
			//echo $filas;
			//echo $stmt->num_rows;
			$stmt->close();
			
			$jsondata['correcto']="0";

		}
		else{

			$stmt->close();
			$sql="insert into usuario values(?,?,?,?,?,?,?)";
			try{
			$stmt=$conexion->prepare($sql);
			
			$stmt->bind_param('sssssss', $this->cod_usuario, $this->nombre,$this->apellidos,$this->password,$fecha,$this->email,$this->nivel_acceso);
			$stmt->execute();
			$stmt->fetch();
			$jsondata['correcto']="1";
		}
			catch(Exception $e){
				echo $e->errorMessage();
				die(header("Location:index.php"));
			}
		}
		$conexion->close();


		echo json_encode($jsondata, JSON_FORCE_OBJECT);
			}
		}



 ?>