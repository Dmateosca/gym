<?php

class cargarFichero {
var $user ;
var $password;

public function cargarFicheros(){
		$json_file = file_get_contents(__DIR__."/../web/ext/application.json");
		$json_array = json_decode($json_file, true);
		$this->user = $json_array["db"]["user"];
        $this->password = $json_array["db"]["password"];
        
        $array = array('user' => $this->user,'password' => $this->password) ;
        return $array; 
        
    }
}

    ?>