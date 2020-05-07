  <!DOCTYPE html>
  <html>
  <head>
        <title>Login Centro Wellness</title>
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/estiloLogin.css" rel="stylesheet">
        <script src="js/jquery-3.1.1.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/scriptlogueo.js"></script>
  </head>
  <body>
  

  <form  id="idLogueo2" name="formulario"  >
  <div>
            <span id="idErrorLog2"></span>
            <div class="form-group">
                <label class="control-label">Usuario:</label><input type="text"  class="form-control" id="idUsuario2"   name="cod_usuario" value="" placeholder="Introduce tu usuario (DNI)">
                </div>
                <div class="form-group">
                <label  class="control-label">Password:</label>
                <input type="password"  class="form-control" id="idPassword2" name="password" value="" placeholder="Introduce tu contraseña">
                <input type="submit" class="btn btbtn-default" id="btnLogueo2" value="Enviar"><a href="formulario_nuevo_usuario.html">Crear usuario</a>
                </div>
                
   </div>
  </form>
  </body>
  </html>