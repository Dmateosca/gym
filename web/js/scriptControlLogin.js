$(function(){
	        	idiomaCalendario();
	            $.datepicker.setDefaults($.datepicker.regional['es']);
	            //creamos el calendario con jquery.ui
	            $("#calendario").datepicker({
	                firstDay:1,
	                dateFormat: 'dd/mm/yy',
	                showButtonPanel: true
	            }).datepicker("setDate", new Date());


        		$("#bt1").on("click",function(e){
        			e.preventDefault();
        			var estaNombre=false;
        			var estaDNI=false;
        			var estaApellido=false;
        			var expDNI=/^\d{8,9}[A-Z]{1}$/;
        			var expNombre=/\D{1,20}/;
        			var expApellido=/\D{1,60}/;
        			if(expNombre.test($("#idNombre").val())){
        				$("#idNombre").css("border","1px solid green");
        				estaNombre=true;
        			}
        			else{
        				$("#idNombre").css("border","1px solid red");
        				estaNombre=false;
        			}
        			
        			if(expDNI.test($("#idDNI").val())){
        				$("#idDNI").css("border","1px solid green");
        				estaDNI=true;
        			}
        			else{
        				$("#idDNI").css("border","1px solid red");
        				estaDNI=false;
        			}
        		
        			if(expApellido.test($("#idApellido").val())){
        				$("#idApellido").css("border","1px solid green");
        				estaApellido=true;
        			}
        			else{
        				$("#idApellido").css("border","1px solid red");
        				estaApellido=false;
        			}
        			var serializeUsuario="cod_usuario="+$("#idDNI").val();
        			var serializeNombre= "nombre="+$("#idNombre").val();
        			var serializeApellido= "apellidos="+$("#idApellido").val();
        			var serializePassword= "password="+$("#idPassword").val();
        			var serializeFecha= "fecha_nacimiento="+$("#calendario").val();
        			var serializeEmail= "email="+$("#idEmail").val();
        			var StringDatos = serializeUsuario+"&"+serializeNombre+"&"+serializeEmail+"&"+serializeApellido+"&"+serializePassword+"&"+serializeFecha+"&"+serializeEmail+"&control=alta-usuario";
        			if(estaApellido && estaNombre && estaDNI){
							$.ajax({
	        					url: "cargador.php",
	        					data: StringDatos,
	        					type: "post",
	        					dataType: "json",
				        		success: function(data){
	        						if(data.correcto=="1"){
	        							$("#errorCrear").html("Usuario creado Correctamente");
	        							 $(location).attr("href","index.php");
	        						}else{
										$("#errorCrear").html("El usuario ya existe");        							
	        						}
        						}

        					});
        			}
        			
        			return false;
        		});



        	})

	//establecemos el idioma del calendario, por defecto lo carga en ingles
	    function idiomaCalendario(){
	            $.datepicker.regional['es']={
	            closeText: 'Cerrar',
	            prevText: '&#x3c;Ant',
	            nextText: 'Sig&#x3e;',
	            currentText: 'Hoy',
	            monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
	            'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
	            monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
	            'Jul','Ago','Sep','Oct','Nov','Dic'],
	            dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
	            dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
	            dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
	            weekHeader: 'Sm',
	            dateFormat: 'dd/mm/yy',
	            firstDay: 1,
	            isRTL: false,
	            showMonthAfterYear: false,
	            yearSuffix: ''}; 
	            }