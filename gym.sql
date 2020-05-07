-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-04-2017 a las 18:00:41
-- Versión del servidor: 5.7.9
-- Versión de PHP: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejercicio`
--

DROP TABLE IF EXISTS `ejercicio`;
CREATE TABLE IF NOT EXISTS `ejercicio` (
  `cod_musculo` int(11) NOT NULL,
  `cod_ejercicio` int(11) NOT NULL AUTO_INCREMENT,
  `des_ejercicio` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_ejercicio`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`cod_musculo`, `cod_ejercicio`, `des_ejercicio`) VALUES
(1, 1, 'Press Banca'),
(1, 2, 'Press Banca Inclindado'),
(1, 3, 'Aperturas'),
(1, 4, 'Press Declinado'),
(1, 5, 'Press Horizontal'),
(1, 6, 'Fondos Pectorales'),
(1, 7, 'Cruces'),
(1, 8, 'Peck deck'),
(1, 9, 'Pullower'),
(2, 11, 'Dominadas'),
(2, 12, 'Polea por detrás'),
(2, 13, 'Remo Máquina'),
(2, 14, 'Remo'),
(2, 15, 'Tirón Polea'),
(2, 16, 'Peso Muerto'),
(2, 17, 'Remo a un brazo'),
(2, 18, 'Gironda'),
(2, 19, 'Hiperextensiones'),
(3, 20, 'Sentadillas Máquina'),
(3, 21, 'Extensiones Cuadriceps'),
(3, 23, 'Femoral Tumbado'),
(3, 24, 'Prensa Atletica'),
(3, 25, 'Sentadillas'),
(3, 26, 'Zancada'),
(3, 28, 'Gemelos de pie'),
(3, 29, 'Adductor'),
(3, 30, 'Abductor'),
(3, 31, 'Contracción gluteo'),
(4, 32, 'Elevaciones laterales'),
(4, 33, 'Elevaciones Frontales'),
(4, 34, 'Pájaro'),
(4, 35, 'Rowing'),
(4, 37, 'Encogimientos'),
(4, 38, 'Elevaciones laterales Máquina'),
(4, 39, 'MultiPower'),
(4, 40, 'Deltoides en máquina'),
(5, 41, 'Curl Barra'),
(5, 42, 'Curl alterno inclinado'),
(5, 43, 'Predicador'),
(5, 44, 'Concentrado'),
(5, 45, 'Alterno en polea'),
(5, 46, 'Curl Invertido'),
(5, 47, 'Curl antebrazo invertido'),
(6, 49, 'Lagartijas'),
(6, 50, 'Press Frances'),
(6, 51, 'Fondos'),
(6, 52, 'Polea Triceps'),
(6, 53, 'Pico'),
(6, 54, 'Jalones'),
(6, 55, 'Coz'),
(6, 56, 'Pico dos manos'),
(6, 57, 'Presses');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes`
--

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes` (
  `cod_ejercicio` int(11) NOT NULL,
  `cod_imagen` varchar(300) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_ejercicio`,`cod_imagen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `imagenes`
--

INSERT INTO `imagenes` (`cod_ejercicio`, `cod_imagen`) VALUES
(1, 'imagenes/pectoral/press_banca1.jpg'),
(1, 'imagenes/pectoral/press_banca2.jpg'),
(1, 'imagenes/pectoral/press_banca3.jpg'),
(2, 'imagenes/pectoral/press_inclinado1.jpg'),
(2, 'imagenes/pectoral/press_inclinado2.jpg'),
(3, 'imagenes/pectoral/aperturas1.jpg'),
(3, 'imagenes/pectoral/aperturas2.jpg'),
(3, 'imagenes/pectoral/aperturas3.jpg'),
(4, 'imagenes/pectoral/press_declinado1.jpg'),
(4, 'imagenes/pectoral/press_declinado2.jpg'),
(4, 'imagenes/pectoral/press_declinado3.jpg'),
(5, 'imagenes/pectoral/press_horizontal1.jpg'),
(5, 'imagenes/pectoral/press_horizontal2.jpg'),
(5, 'imagenes/pectoral/press_horizontal3.jpg'),
(6, 'imagenes/pectoral/fondos1.jpg'),
(6, 'imagenes/pectoral/fondos2.jpg'),
(6, 'imagenes/pectoral/fondos3.jpg'),
(7, 'imagenes/pectoral/cruces1.jpg'),
(7, 'imagenes/pectoral/cruces2.jpg'),
(7, 'imagenes/pectoral/cruces3.jpg'),
(8, 'imagenes/pectoral/aperturas_maquina1.jpg'),
(8, 'imagenes/pectoral/aperturas_maquina2.jpg'),
(8, 'imagenes/pectoral/aperturas_maquina3.jpg'),
(9, 'imagenes/pectoral/pullower1.jpg'),
(9, 'imagenes/pectoral/pullower2.jpg'),
(9, 'imagenes/pectoral/pullower3.jpg'),
(11, 'imagenes/dorsal/dominadas1.jpeg'),
(11, 'imagenes/dorsal/dominadas2.jpeg'),
(11, 'imagenes/dorsal/dominadas3.jpeg'),
(12, 'imagenes/dorsal/polea_detras1.jpg'),
(12, 'imagenes/dorsal/polea_detras2.jpg'),
(12, 'imagenes/dorsal/polea_detras3.jpg'),
(13, 'imagenes/dorsal/remo_maquina1.jpg'),
(13, 'imagenes/dorsal/remo_maquina2.jpg'),
(13, 'imagenes/dorsal/remo_maquina3.jpg'),
(14, 'imagenes/dorsal/remo1.jpg'),
(14, 'imagenes/dorsal/remo2.jpg'),
(14, 'imagenes/dorsal/remo3.jpg'),
(15, 'imagenes/dorsal/tiro_polea3.jpg'),
(15, 'imagenes/dorsal/tiron_polea1.jpg'),
(15, 'imagenes/dorsal/tiron_polea2.jpg'),
(16, 'imagenes/dorsal/peso_muerto1.jpg'),
(16, 'imagenes/dorsal/peso_muerto2.jpg'),
(16, 'imagenes/dorsal/peso_muerto3.jpg'),
(17, 'imagenes/dorsal/remo_brazo1.jpg'),
(17, 'imagenes/dorsal/remo_brazo2.jpg'),
(17, 'imagenes/dorsal/remo_brazo3.jpg'),
(18, 'imagenes/dorsal/gironda1.jpg'),
(18, 'imagenes/dorsal/gironda2.jpg'),
(18, 'imagenes/dorsal/gironda3.jpg'),
(19, 'imagenes/dorsal/hiperextensiones1.jpg'),
(19, 'imagenes/dorsal/hiperextensiones2.jpg'),
(19, 'imagenes/dorsal/hiperextensiones3.jpg'),
(20, 'imagenes/piernas/sentadillas_maquina1.jpg'),
(20, 'imagenes/piernas/sentadillas_maquina2.jpg'),
(20, 'imagenes/piernas/sentadillas_maquina3.jpg'),
(21, 'imagenes/piernas/extension_cuadriceps1.jpg'),
(21, 'imagenes/piernas/extension_cuadriceps2.jpg'),
(21, 'imagenes/piernas/extension_cuadriceps3.jpg'),
(23, 'imagenes/piernas/femoral1.jpg'),
(23, 'imagenes/piernas/femoral2.jpg'),
(23, 'imagenes/piernas/femoral3.jpg'),
(24, 'imagenes/piernas/prensa_atletica2.jpg'),
(24, 'imagenes/piernas/prensa_atletica3.jpg'),
(24, 'imagenes/piernas/presnsa_atletica1.jpg'),
(25, 'imagenes/piernas/sentadillas1.jpg'),
(25, 'imagenes/piernas/sentadillas2.jpg'),
(25, 'imagenes/piernas/sentadillas3.jpg'),
(26, 'imagenes/piernas/esgrima1.jpg'),
(26, 'imagenes/piernas/esgrima2.jpg'),
(26, 'imagenes/piernas/esgrima3.jpg'),
(28, 'imagenes/piernas/gemelo_pie1.jpg'),
(28, 'imagenes/piernas/gemelo_pie2.jpg'),
(28, 'imagenes/piernas/gemelo_pie3.jpg'),
(29, 'imagenes/piernas/adductor1.jpg'),
(29, 'imagenes/piernas/adductor2.jpg'),
(29, 'imagenes/piernas/adductor3.jpg'),
(30, 'imagenes/piernas/abductor1.jpg'),
(30, 'imagenes/piernas/abductor2.jpg'),
(31, 'imagenes/piernas/contraccion_gluteo1.jpg'),
(31, 'imagenes/piernas/contraccion_gluteo2.jpg'),
(31, 'imagenes/piernas/contraccion_gluteo3.jpg'),
(32, 'imagenes/hombro/lateral1.jpg'),
(32, 'imagenes/hombro/lateral2.jpg'),
(32, 'imagenes/hombro/lateral3.jpg'),
(33, 'imagenes/hombro/frontal1.jpg'),
(33, 'imagenes/hombro/frontal2.jpg'),
(33, 'imagenes/hombro/frontal3.jpg'),
(34, 'imagenes/hombro/pajaro1.jpg'),
(34, 'imagenes/hombro/pajaro2.jpg'),
(34, 'imagenes/hombro/pajaro3.jpg'),
(35, 'imagenes/hombro/rowing1.jpg'),
(35, 'imagenes/hombro/rowing2.jpg'),
(35, 'imagenes/hombro/rowing3.jpg'),
(37, 'imagenes/hombro/encogimientos1.jpg'),
(37, 'imagenes/hombro/encogimientos2.jpg'),
(38, 'imagenes/hombro/elevaciones_maquina1.jpg'),
(38, 'imagenes/hombro/elevaciones_maquina2.jpg'),
(38, 'imagenes/hombro/elevaciones_maquina3.jpg'),
(39, 'imagenes/hombro/multipower1.jpg'),
(39, 'imagenes/hombro/multipower2.jpg'),
(39, 'imagenes/hombro/multipower3.jpg'),
(40, 'imagenes/hombro/deltoides_maquina1.jpg'),
(40, 'imagenes/hombro/deltoides_maquina2.jpg'),
(40, 'imagenes/hombro/deltoides_maquina3.jpg'),
(41, 'imagenes/biceps/curl_barra1.jpg'),
(41, 'imagenes/biceps/curl_barra2.jpg'),
(41, 'imagenes/biceps/curl_barra3.jpg'),
(42, 'imagenes/biceps/curl_mancuerna1.jpg'),
(42, 'imagenes/biceps/curl_mancuerna2.jpg'),
(42, 'imagenes/biceps/curl_mancuerna3.jpg'),
(43, 'imagenes/biceps/scott1.jpg'),
(43, 'imagenes/biceps/scott2.jpg'),
(43, 'imagenes/biceps/scott3.jpg'),
(44, 'imagenes/biceps/concentrado1.jpg'),
(44, 'imagenes/biceps/concentrado2.jpg'),
(44, 'imagenes/biceps/concentrado3.jpg'),
(45, 'imagenes/biceps/alterno_polea1.jpg'),
(45, 'imagenes/biceps/alterno_polea2.jpg'),
(45, 'imagenes/biceps/alterno_polea3.jpg'),
(46, 'imagenes/biceps/curl_invertido1.jpg'),
(46, 'imagenes/biceps/curl_invertido2.jpg'),
(46, 'imagenes/biceps/curl_invertido3.jpg'),
(47, 'imagenes/biceps/curl_antebrazo1.jpg'),
(47, 'imagenes/biceps/curl_antebrazo2.jpg'),
(47, 'imagenes/biceps/curl_antebrazo3.jpg'),
(49, 'imagenes/triceps/lagartijas1.jpg'),
(49, 'imagenes/triceps/lagartijas2.jpg'),
(49, 'imagenes/triceps/lagartijas3.jpg'),
(50, 'imagenes/triceps/press_frances1.jpg'),
(50, 'imagenes/triceps/press_frances2.jpg'),
(50, 'imagenes/triceps/press_frances3.jpg'),
(51, 'imagenes/triceps/fondos1.jpg'),
(51, 'imagenes/triceps/fondos2.jpg'),
(51, 'imagenes/triceps/fondos3.jpg'),
(52, 'imagenes/triceps/polea_alta1.jpg'),
(52, 'imagenes/triceps/polea_alta2.jpg'),
(52, 'imagenes/triceps/polea_alta3.jpg'),
(53, 'imagenes/triceps/pico1.jpg'),
(53, 'imagenes/triceps/pico2.jpg'),
(53, 'imagenes/triceps/pico3.jpg'),
(54, 'imagenes/triceps/jalones1.jpg'),
(54, 'imagenes/triceps/jalones2.jpg'),
(54, 'imagenes/triceps/jalones3.jpg'),
(55, 'imagenes/triceps/coz1.jpg'),
(55, 'imagenes/triceps/coz2.jpg'),
(55, 'imagenes/triceps/coz3.jpg'),
(56, 'imagenes/triceps/picodos1.jpg'),
(56, 'imagenes/triceps/picodos2.jpg'),
(56, 'imagenes/triceps/picodos3.jpg'),
(57, 'imagenes/triceps/presses1.jpg'),
(57, 'imagenes/triceps/presses2.jpg'),
(57, 'imagenes/triceps/presses3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagenes_musculo`
--

DROP TABLE IF EXISTS `imagenes_musculo`;
CREATE TABLE IF NOT EXISTS `imagenes_musculo` (
  `cod_musculo` int(11) NOT NULL,
  `imagen` varchar(250) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_musculo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `imagenes_musculo`
--

INSERT INTO `imagenes_musculo` (`cod_musculo`, `imagen`) VALUES
(1, 'imagenes/musculos/pectoral.jpeg'),
(2, 'imagenes/musculos/dorsal.jpeg'),
(3, 'imagenes/musculos/piernas.jpeg'),
(4, 'imagenes/musculos/hombros.jpeg'),
(5, 'imagenes/musculos/biceps.jpeg'),
(6, 'imagenes/musculos/triceps.jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_musculo`
--

DROP TABLE IF EXISTS `informacion_musculo`;
CREATE TABLE IF NOT EXISTS `informacion_musculo` (
  `cod_musculo` int(11) NOT NULL,
  `cod_documento` varchar(250) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `musculo`
--

DROP TABLE IF EXISTS `musculo`;
CREATE TABLE IF NOT EXISTS `musculo` (
  `cod_musculo` int(11) NOT NULL,
  `des_musculo` varchar(150) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_musculo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `musculo`
--

INSERT INTO `musculo` (`cod_musculo`, `des_musculo`) VALUES
(1, 'Pectoral'),
(2, 'Dorsal'),
(3, 'Piernas'),
(4, 'Hombros'),
(5, 'Biceps'),
(6, 'Triceps');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_ejercicio`
--

DROP TABLE IF EXISTS `tabla_ejercicio`;
CREATE TABLE IF NOT EXISTS `tabla_ejercicio` (
  `fecha` date NOT NULL,
  `cod_ejercicio` int(11) NOT NULL,
  `cod_usuario` char(9) COLLATE utf8_bin NOT NULL,
  `peso1` int(11) NOT NULL,
  `peso2` int(11) NOT NULL,
  `peso3` int(11) NOT NULL,
  `peso4` int(11) NOT NULL,
  `repeticion1` int(11) NOT NULL,
  `repeticion2` int(11) NOT NULL,
  `repeticion3` int(11) NOT NULL,
  `repeticion4` int(11) NOT NULL,
  PRIMARY KEY (`fecha`,`cod_ejercicio`,`cod_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `tabla_ejercicio`
--

INSERT INTO `tabla_ejercicio` (`fecha`, `cod_ejercicio`, `cod_usuario`, `peso1`, `peso2`, `peso3`, `peso4`, `repeticion1`, `repeticion2`, `repeticion3`, `repeticion4`) VALUES
('2016-12-28', 1, '06970737N', 35, 4, 45, 50, 12, 10, 8, 6),
('2016-12-28', 2, '28968669P', 35, 40, 47, 50, 11, 10, 8, 6),
('2016-12-28', 3, '06970737N', 35, 40, 45, 50, 12, 10, 8, 6),
('2016-12-28', 4, '28968669P', 35, 46, 45, 50, 13, 10, 8, 6),
('2017-03-12', 1, '06970737N', 12, 12, 12, 12, 12, 12, 21, 21),
('2017-03-12', 9, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-13', 19, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-18', 20, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-18', 21, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-18', 23, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-18', 24, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-19', 1, '06970737N', 12, 12, 12, 12, 12, 12, 21, 21),
('2017-03-19', 9, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-26', 1, '06970737N', 12, 12, 12, 12, 13, 16, 21, 21),
('2017-03-29', 1, '06970737N', 0, 0, 0, 0, 0, 0, 0, 0),
('2017-03-29', 1, '28977352C', 12, 12, 12, 12, 12, 12, 12, 12),
('2017-03-29', 11, '06970737N', 12, 0, 0, 0, 0, 0, 0, 0),
('2017-03-29', 20, '06970737N', 12, 12, 12, 12, 13, 12, 12, 13),
('2017-03-31', 11, '06970737N', 12, 12, 12, 12, 1, 123, 12, 12),
('2017-04-03', 1, '06970737N', 12, 12, 12, 12, 12, 12, 21, 21),
('2017-04-03', 9, '06970737N', 12, 12, 12, 12, 12, 12, 12, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `cod_usuario` char(9) COLLATE utf8_bin NOT NULL,
  `nombre` varchar(32) COLLATE utf8_bin NOT NULL,
  `apellidos` varchar(32) COLLATE utf8_bin NOT NULL,
  `password` varchar(32) COLLATE utf8_bin NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `email` varchar(300) COLLATE utf8_bin NOT NULL,
  `nivel_acceso` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`cod_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cod_usuario`, `nombre`, `apellidos`, `password`, `fecha_nacimiento`, `email`, `nivel_acceso`) VALUES
('06970737N', 'maria', 'Cano Cercas', '8b5b1b0958e93365369f757c0398a916', '1959-07-07', 'macocace@gmail.com', 'C'),
('28968669P', 'David', 'Mateos Cano', '5b8e64114124b4948fec19137fb820fc', '1992-07-30', 'mateoscano.david@gmail.com', 'T'),
('28977352C', 'Raquel', 'Gómez Donaire', 'bf6d5ac520414bf7840aed2cb8a43797', '1994-03-08', 'raquelgd8@gmail.com', 'C');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
