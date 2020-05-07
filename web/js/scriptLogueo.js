
$(
    function(){

        $("#idLogueo2").submit(function(e){
        var cod_usuario=$("#idUsuario2").val();
        var password=$("#idPassword2").val();
        $.ajax({
           
            type: 'POST',
            data: $("#idLogueo2").serialize(),
            url: 'control_logueo.php',
                success: function(data){
                  
                    if(data.correcto=="1"){
                       $("#idErrorLog2").html("Todo Correcto");
                       $(location).attr("href","index.php");
                  }else{
                        $("#idErrorLog2").html("Contraseña y usuario Incorrectos");
                    }
                    //alert(data.correcto);
                }

                });
               e.preventDefault();
               return false;
                });


            } );

 
