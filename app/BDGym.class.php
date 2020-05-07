<?php

Class conexionBD extends mysqli{
	public function __construct(){
		parent::__construct("localhost","root","root","gym");
		parent::set_charset("utf8");
	}
	
	
}

?>