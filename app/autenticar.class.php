<?php 
class autenticar{
	public function conectado(){
		if(!isset($_SESSION['autenticacion'])){
				header("Location: login.php");
			}
	}
}
?>