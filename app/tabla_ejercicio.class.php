<?php 
class tablaEjercicio{

	var $fecha;
	var $cod_ejercicio;
	var $cod_usuario;
	var $peso1;
	var $peso2;
	var $peso3;
	var $peso4;
	var $repeticion1;
	var $repeticion2;
	var $repeticion3;
	var $repeticion4;



	public function __construct(){

		$this->fecha="";
		$this->cod_ejercicio="";
		$this->cod_usuario="";
		$this->peso1="";
		$this->peso2="";
		$this->peso3="";
		$this->peso4="";
		$this->repeticion1="";
		$this->repeticion2="";
		$this->repeticion3="";
		$this->repeticion4="";
	}
	public function alta(){
		include_once 'BDGym.class.php';	
		$conexion= new conexionBD();
		$sql="insert into tabla_ejercicio values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try{
		$stmt=$conexion->prepare($sql);
		}catch(Exception $e){
			echo $e->erroMessage();	
		}
		$stmt->bind_param("sisiiiiiiii",$this->fecha,$this->cod_ejercicio,$this->cod_usuario,$this->peso1,$this->peso2,$this->peso3,$this->peso4,$this->repeticion1,$this->repeticion2,$this->repeticion3,$this->repeticion4);
		$stmt->execute();
		$stmt->store_result();
		if($stmt->affected_rows>0){
			echo "Insertado";
		}
		else{
			echo "Ese ejercicio ya lo tienes para ese dia";
		}
		
		$stmt->close();
		$conexion->close();
	}


	//mostrar los ejercicios que estan guardados
	public function mostrar(){
		include_once 'BDGym.class.php';	
		/*$fecha1=strtotime($f);*/

		$conexion=new conexionBD();

		/*$sql="select * from ejercicio, tabla_ejercicio
		where fecha='$fecha' and ejercicio.cod_ejercicio=tabla_ejercicio.cod_ejercicio and ejercicio.cod_musculo=tabla_ejercicio.cod_musculo and
		cod_usuario='$cod_usuario' order by ejercicio.cod_musculo";
		*/
		$sql="select ejercicio.cod_ejercicio,ejercicio.des_ejercicio,tabla_ejercicio.peso1,
		tabla_ejercicio.peso2
		,tabla_ejercicio.peso3
		,tabla_ejercicio.peso4
		,tabla_ejercicio.repeticion1
		,tabla_ejercicio.repeticion2
		,tabla_ejercicio.repeticion3
		,tabla_ejercicio.repeticion4
		 from ejercicio, tabla_ejercicio
		where fecha=? and 
		ejercicio.cod_ejercicio=tabla_ejercicio.cod_ejercicio and
		cod_usuario=? order by ejercicio.cod_ejercicio asc";

		try{
			$stmt=$conexion->prepare($sql);
		}catch(Exception $e){
			echo $e->errorMessage();
			die(header("Location:index.php"));
		}

		$stmt->bind_param('ss',$this->fecha,$this->cod_usuario); 
		//$stmt->bind_param('ss',$fecha,$cod_usuario); 
		$stmt->execute();
		$stmt->store_result();
		$stmt->bind_result($cod_ejercicio,$des_ejercicio,$peso1,$peso2,$peso3,$peso4,
			$repeticion1,$repeticion2,$repeticion3,$repeticion4);
		$arrayCont=array();
		if($stmt->num_rows>0){
		while($stmt->fetch()){
		$arrayCont[]=array("cod_ejercicio"=>$cod_ejercicio,"des_ejercicio"=>$des_ejercicio, "peso"=>array($peso1,$peso2,$peso3,$peso4), "repeticion"=>array($repeticion1,$repeticion2,$repeticion3,$repeticion4));
		}

		$resultado['atributos']=$arrayCont;
		$resultado["correcto"]="1";
		$conexion->close();
		}else{
		$resultado["correcto"]=0;
		}
		echo json_encode($resultado);
	}
	public function editar(){
		include_once 'BDGym.class.php';	
		/*$fecha1=strtotime($f);*/

		$conexion=new conexionBD();
		$sql="UPDATE tabla_ejercicio set peso1=?, peso2=?, peso3=?, peso4=?, repeticion1=?, repeticion2=?, repeticion3=?, repeticion4=? where cod_ejercicio=? and fecha=? and cod_usuario=?";
		$stmt=$conexion->prepare($sql);
		$stmt->bind_param("iiiiiiiiiss",$this->peso1,$this->peso2,$this->peso3,$this->peso4,$this->repeticion1,$this->repeticion2,$this->repeticion3,$this->repeticion4,$this->cod_ejercicio,$this->fecha,$this->cod_usuario);
		$stmt->execute();
		$stmt->store_result();
		if($stmt->affected_rows>0){
			echo "Modificado";
		}
		else{
			echo "No se ha podido modificar";
		}
		
		$stmt->close();
		$conexion->close();
	}
	public function borrar(){
		include_once 'BDGym.class.php';	
		/*$fecha1=strtotime($f);*/

		$conexion=new conexionBD();
		$sql="delete from tabla_ejercicio where cod_ejercicio=? and fecha=? and cod_usuario=?";
		$stmt=$conexion->prepare($sql);
		$stmt->bind_param("iss",$this->cod_ejercicio,$this->fecha,$this->cod_usuario);
		$stmt->execute();
		$stmt->store_result();
		if($stmt->affected_rows>0){
			echo "Eliminado";
		}
		else{
			echo "No puedes borrar el ejercicio";
		}
		
		$stmt->close();
		$conexion->close();
	}
}



 ?>
