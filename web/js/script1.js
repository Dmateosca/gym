var fecha="";
var patronNumero=/^[0-9]$/;
var noche=true;
$(
    
     function(){
        
            crearOpciones();
        
            idiomaCalendario();
            $.datepicker.setDefaults($.datepicker.regional['es']);
            //creamos el calendario con jquery.ui
            $("#calendario").datepicker({
                firstDay:1,
                dateFormat: 'dd/mm/yy',
                showButtonPanel: true
            }).datepicker("setDate", new Date());

            
            //cuando le demos al boton inicio, mostrara los ejercicios del dia
            $("#idInicio").on("click",function(){  
                cod_usuario=$("#idCoUs").val();
                fecha= ""+$("#calendario").val()+"";
                //ejecutamos la funcion que mostrará los ejercicios
                mostrarEjerciciosTabla(fecha,cod_usuario);
            });
            $("#cMusculos").on("click",function(){
                crearOpciones();
            })
            $("#botonNoche").on("click",function(){
                modoNoche();
            });
        });
     


    //creamos los elementos y sus funciones
    function crearOpciones(){
        $("#navegacion").empty();
            $.ajax({

                url: "cargador.php",
                data: {"control":"mostrar-musculo"},
                type: "post",
                success: function(json){
                $.each(json.contenido,function(clave,valor){

                $("#navegacion").append("<div class='col-xs-12 col-md-4 claseMusculo' data-cod_musculo='"+valor.cod_musculo+"'><img   src='"+valor.imagen+"'><p>"+valor.des_musculo+"</p></div>");
                });
                $("#navegacion").css("padding-top","5%");
                $(".claseMusculo").on("click",function(){
                   var cod_musculo=$(this).data("cod_musculo");
                    mostrarEjerciciosMusculo(cod_musculo); 
                });
                }


          
            });
         
        
    }

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
    //Ajax que crea la informacion de la tabla
    function mostrarEjerciciosTabla(fechast,cod_usuario){
        fecha=splitFecha(fechast);

        $.ajax({
            url:'cargador.php',
            data:{"fecha":fecha,"control":"mostrar-tabla","cod_usuario":cod_usuario},
            type:"post",
            dataType:"json",
            success:function(json){
            
                if(json.correcto==1){
                $("#navegacion").html("");
                stTabla="";
                // "e" en la clase equivale al cod_musculo y al codigo ejercicio, po$ "pesoOculto" y el numero, pr es "Peso real" a modificar
                // ro "repeticion oculta" rr "repeticion real"
                $("#navegacion").append("<div class='col-xs-12 cEjercicios'></div>");
                $.each(json.atributos, function(i,v){
                    
                    $(".cEjercicios").append("<form class='col-xs-12 col-md-6  e"+v.cod_ejercicio+"'></form>");
                    stTabla= "<span class='col-xs-12 e"+v.cod_ejercicio+" titEjercicio'>"+v.des_ejercicio+" </span> \
                    <div  class='col-xs-12 capaImagen"+v.cod_ejercicio+"'></div>";
                    for(var i=1;i<=4;i++){
                    stTabla+="<span class='col-xs-6 e"+v.cod_ejercicio+"'> <span class='numeracion'>"+i+".</span> \
                    <input type='text' size='2' class='e"+v.cod_ejercicio+"'  name='p"+i+"' readonly value='"+v.peso[i-1]+"'>Kg \
                    <input type='text' size='2' class='e"+v.cod_ejercicio+"'  name='r"+i+"' readonly value='"+v.repeticion[i-1]+"'> \
                    Repeticiones </span>";
                    }
                    stTabla+="<input type='button' data-cod_ejercicio='"+v.cod_ejercicio+"' class='e"+v.cod_ejercicio+" btn btn-default'  value='Modificar'>";
                    stTabla+="<input type='button' data-cod_ejercicio='"+v.cod_ejercicio+"' class='e"+v.cod_ejercicio+" btn btn-default'  value='Eliminar'></form>";
                     
                    $(".e"+v.cod_ejercicio).append(stTabla);
                    crearImagenes(v.cod_ejercicio,".capaImagen"+v.cod_ejercicio);
                    
                });
               
                
                }else{
                    $("#navegacion").empty();
                    
                    $("#navegacion").load("no_result.html");
                }
               
                $("#navegacion").css({"padding-top":"5%"})
                //$(".cEjercicios").css("background","red");
                $(".cabeceraEjercicios").css({"color":"black","font-size":"1.4em"});
                
                
                $(".cEjercicios input[type='button']").css({"margin-left":"10%"})
                 
                //$("#idPie").css({"position":"absolute","bottom":"0"})
                $(".cEjercicios input[type=text]").on("click",function(){
                    
                  if($(this).attr("readonly")){
                        $(this).attr("readonly",false);
                    }else{
                        $(this).attr("readonly",true);
                    }
                });
                //le damos funcionalidad a los botones dentro del formulario
                //si es modificar, se edita y recarga 
                //si es eliminar, se borra y recarga
                $(".cEjercicios input[type=button]").on("click",function(){
                    if($(this).val()=="Modificar"){

                       
                        var cod_ejercicio=$(this).data("cod_ejercicio");

                        
                        ajaxModificar("e"+cod_ejercicio,cod_ejercicio,cod_usuario);
                    }
                    if($(this).val()=="Eliminar"){
                        var cod_ejercicio=$(this).data("cod_ejercicio");

                        
                        ajaxBorrar("e"+cod_ejercicio,cod_ejercicio,cod_usuario);

                    }
                })

            },
            error:function(html){
                alert(html);
            }
            
        });
    }//fin de ajaxMostrarEjerciciosTabla

   
    //ajax que crea el contenido a insertar
    function mostrarEjerciciosMusculo(cod_musculo){
        
        var contadorTablas=1;
        $.ajax(
        {
        url: "cargador.php",
        data: {"cod_musculo":cod_musculo,"control":"mostrar-ejercicio"},
        type: "post", 
        success: function(json){
            
            if(json.correcto=="1"){
                $("#navegacion").html("");
                $("#navegacion").append("<form id='formEjercicio'></form>");
                $("#formEjercicio").html("");
                //obtenemos todos los valores obtenidos en el json en la parte de ejercicios ejercicios
                $.each(json.ejercicios,function(i,a){
                    $("#formEjercicio").append("<div class='col-md-3 col-xs-12 ej"+a.cod_ejercicio+"'></div>");
                    stTabla="<input class=\"col-xs-1 ej"+a.cod_ejercicio+"\" type=\"checkbox\" name='ce"+contadorTablas+"' value="+a.cod_ejercicio+"> \
                    <span class=\"ej"+a.cod_ejercicio+" col-xs-11 titEjercicio \">"+a.des_ejercicio+"</span> \
                    <div  class='col-xs-12 capaImagen"+a.cod_ejercicio+"'></div> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='p1"+contadorTablas+"' placeholder='Peso1' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='p2"+contadorTablas+"' placeholder='Peso2' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='p3"+contadorTablas+"' placeholder='Peso3' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='p4"+contadorTablas+"' placeholder='Peso4' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='r1"+contadorTablas+"' placeholder='Rep 1' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='r2"+contadorTablas+"' placeholder='Rep 2' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='r3"+contadorTablas+"' placeholder='Rep 3' disabled> \
                    <input class=\"ej"+a.cod_ejercicio+" col-xs-3\" type='text' name='r4"+contadorTablas+"' placeholder='Rep 4' disabled>";
                    $(".ej"+a.cod_ejercicio).append(stTabla);
                    
                   
                    crearImagenes(a.cod_ejercicio,".capaImagen"+a.cod_ejercicio);
                    contadorTablas++;
                });
                $("#formEjercicio").append("<div id='contBotones' class='col-xs-8 col-xs-offset-4'></div>");
                $("#contBotones").append('<input type="submit" id="btnInEj" value="Insertar Dia" class="btn btn-default">');
                $("#contBotones").append('<input type="submit" id="btnInMes" value="Insertar Mes" class="btn btn-default">');
                $("#formEjercicio").append('<input type="hidden" value="'+contadorTablas+'" id="numTab" name="num_tablas">');
                $("#formEjercicio").on("change","input[type=checkbox]",function(){
                    var clase=$(this).attr("class").split(" ");
                    
                    if($("input[type=text]."+clase[1]).attr("disabled")){
                        $("input[type=text]."+clase[1]).attr("disabled",false);
                    }else{
                        $("input[type=text]."+clase[1]).attr("disabled",true);
                    }
                });
                $("#btnInEj").on("click",function(e){
                    e.preventDefault();
                    num_tablas=$("#numTab").val();
                    cod_usuario=$("#idCoUs").val();
                    
                    ajaxInsertar("#formEjercicio",cod_usuario,num_tablas);
                    $("#formEjercicio input[type=checkbox]").attr("checked",false);
                    $("#formEjercicio input[type=text]").attr("disabled",true);
                    return false;
                });
                 $("#btnInMes").on("click",function(e){
                    e.preventDefault();
                    num_tablas=$("#numTab").val();
                    cod_usuario=$("#idCoUs").val();

                    ajaxInsertarMes("#formEjercicio",cod_usuario,num_tablas);
                    $("#formEjercicio input[type=checkbox]").attr("checked",false);
                    $("#formEjercicio input[type=text]").attr("disabled",true);
                    return false;
                });

                }else{
                    $("#formEjercicio").html("No se han encontrado resultados");

                }
            },
            error:function(html){
                alert("Error");
            }
        
        });

    }
    //permite actualizar una parte del ejercicio
    function ajaxModificar(formulario,cod_ejercicio,cod_usuario){
        fecha= splitFecha(""+$("#calendario").val()+"");
        
        stringDatos=$("form."+formulario).serialize()+"&cod_ejercicio="+cod_ejercicio+"&fecha="+fecha+"&cod_usuario="+cod_usuario+"&control=editar-ejercicio";
       
        $.ajax({
            url: "cargador.php",
            data: stringDatos,
            type: "post",
            success: function(html){
               
                $("#navegacion").empty();
                cod_usuario=$("#idCoUs").val();
                fecha= ""+$("#calendario").val()+"";
                mostrarEjerciciosTabla(fecha,cod_usuario);

            }
        })
    }//fin de ajaxModificar

    //ajax que borra ese ejercicio
    function ajaxBorrar(formulario,cod_ejercicio,cod_usuario){
        fecha= splitFecha(""+$("#calendario").val()+"");
        stringDatos="cod_ejercicio="+cod_ejercicio+"&fecha="+fecha+"&cod_usuario="+cod_usuario+"&control=baja-ejercicio";
       
        $.ajax({
            url: "cargador.php",
            data: stringDatos,
            type: "post",
            success: function(html){
               
                $("#navegacion").empty();
                cod_usuario=$("#idCoUs").val();
                fecha= ""+$("#calendario").val()+"";
                mostrarEjerciciosTabla(fecha,cod_usuario);

            }
        })
    }//fin de ajaxBorrar

    //Ajax que permite la insercion de una tabla de jercicios
    function ajaxInsertar(formulario,cod_usuario,num_tablas){
        fecha= splitFecha(""+$("#calendario").val()+"");
        
        stringDatos=$(formulario).serialize()+"&fecha="+fecha+"&cod_usuario="+cod_usuario+"&num_tablas="+num_tablas+"&control=alta-ejercicio";
        $.ajax({
            url: "cargador.php",
            data: stringDatos,
            type: "post",
            success: function(html){
                $("#mensaje").html(html);
                
            }
        })
    }//fin de ajaxInsertar

    //Ajax que permite la insercion de una tabla de jercicios mensual
    function ajaxInsertarMes(formulario,cod_usuario,num_tablas){
        
        for(var i=0;i<4;i++){
            fecha= $("#calendario").val();
            fecha=hSF(7,i,fecha);
            fecha=new Date(fecha[2],fecha[1],fecha[0]);
            fecha=sacarFechaStandar(fecha);
        
        stringDatos=$(formulario).serialize()+"&fecha="+fecha+"&cod_usuario="+cod_usuario+"&num_tablas="+num_tablas+"&control=alta-ejercicio";
        $.ajax({
            url: "cargador.php",
            data: stringDatos,
            type: "post",
            success: function(html){
                $("#mensaje").html(html);
            }
        })
        }//fin del bucle for que inserta el mes
    }//fin de ajaxInsertarMes

    //sacamos la fecha normal
    function sacarFechaStandar(f){
        dia=f.getDate();
        mes=f.getMonth();
        anio=f.getFullYear();
         if(dia<10){
            dia="0"+dia;
        }
        if(mes<10){
            mes="0"+mes;
        }
        return ""+anio+"-"+mes+"-"+dia+"";
    }

    //hora, segundo y año completo 
    // funcion para obtener las semanas que queramos
    function hSF(m,c,f){
        var fecha=f.split("/");
        var dia=parseInt(fecha[0]);
        var mes=parseInt(fecha[1]);
        var anio=parseInt(fecha[2]);
        //m significa la semana por el contador + el dia en el que estamos
        // por ejemplo (7*1)+23 es decir el dia 30, el siguiente seria 14+23, que seria si es 30 el final de mes
        // que es el dia 7
        dia=(m*c)+dia;
        // comprobamos si el dia es menor que 10 
        if(dia<10){
            dia="0"+dia;
        }

        //comprobamos que el mes es menor de 10 
        if(mes<10){
            mes="0"+mes;
        }
        return new Array(dia,mes,anio);
    }//fin de hsF


    //Creacion de elementos
    function splitFecha(valoresFecha){
        var fecha=valoresFecha.split('/');
        var mes=fecha[1];
        var dia=fecha[0];
        var anio=fecha[2];
        return anio+"-"+mes+"-"+dia;
    }// fin splitFecha



    //carga las imagenes en cada ejercicio y le damos la animacion para que se muestren una a una
    function crearImagenes(cod_ejercicio,capaImagen){

        
       
        $.post('cargador.php', {"control":"mostrar-imagen","cod_ejercicio":cod_ejercicio}, function(json, textStatus, xhr) {
                var imagenes="";
                $(capaImagen).empty();
                $.each(json.imagen,function(clave,valor){
                imagenes+='<img id="img'+cod_ejercicio+'" class="img-thumbnail"  src="'+valor.imagen_ejercicio+'">';
                });
                $(capaImagen).html(imagenes);
                $(capaImagen+" img").hide();
                $(capaImagen+" img").eq(1).show();
                var tamanio=0;
                $(capaImagen+" img").on("mouseover",function(){
                
                var carrusel= setInterval(function(){

                    if(tamanio==$(capaImagen+" img ").length){
                        tamanio=0;
                    }
                    
                    $(capaImagen+" img").hide().eq(tamanio).show();

                    tamanio++;
                   
                },1500);
                $(capaImagen+" img").on("mouseout",function(){
                    clearInterval(carrusel);
                })
                });
    
        },"json");
        
       
    }// fin CrearImagenes

    //funcion para crear un modo noche y dia  para hacer mas comoda la vista
    function modoNoche(){
        //Pone el modo noche con los colores de la noche y el texto dia
        if( $("#botonNoche>p").html()=="Noche"){
            $("#botonNoche>p").html("Dia");
            $("#botonNoche").css({"color":"#5195E1","background":"#F5F5F5"});
            $("#botonNoche>p").css({"text-align":"right","background":"#3B444B","padding-right":"3px"});

            $("body").css("background","#3B444B");
            $("header").css("background","#3B444B");
            $("header button").css({"background":"#3B444B"});
            if($(".claseMusculo").length){
                $(".claseMusculo").css("background","#fff");
            }
        }else{//modo dia con los colores del dia y el texto noche
            $("#botonNoche>p").html("Noche");
            $("#botonNoche").css({"color":"#3B444B","background":"#3B444B"});
            $("#botonNoche>p").css({"text-align":"left","background":"#F5F5F5"});
            $("body").css("background","#F5F5F5");
            $("header").css("background","#eee");
            $("header button").css({"background":"#eee"});            
            if($(".claseMusculo").length){
                $(".claseMusculo").css("background","rgba(250,250,250,0.8)");
            }
        }


    }