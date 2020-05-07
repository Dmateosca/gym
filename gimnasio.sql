-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-02-2017 a las 15:44:37
-- Versión del servidor: 5.7.9
-- Versión de PHP: 7.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gimnasio`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Volcado de datos para la tabla `ejercicio`
--

INSERT INTO `ejercicio` (`cod_musculo`, `des_ejercicio`) VALUES
(1, 'Press Banca'),
(1, 'Press Banca Inclindado'),
(1, 'Aperturas'),
(1, 'Press Declinado'),
(1, 'Press Horizontal'),
(1, 'Fondos Pectorales'),
(1, 'Cruces'),
(1, 'Peck deck'),
(1, 'Pullower'),
(1,  'Press Inclinado Mancuerna'),
(2, 'Dominadas'),
(2, 'Polea por detrás'),
(2, 'Remo Máquina'),
(2, 'Remo'),
(2, 'Tirón Polea'),
(2, 'Peso Muerto'),
(2, 'Remo a un brazo'),
(2, 'Gironda'),
(2, 'Hiperextensiones'),
(3, 'Sentadillas Máquina'),
(3, 'Extensiones Cuadriceps'),
(3, 'Femoral de pie'),
(3, 'Femoral Sentado'),
(3, 'Prensa Atletica'),
(3, 'Sentadillas'),
(3, 'Zancada'),
(3, 'Gemelos sentado'),
(3, 'Gemelos de pie'),
(3,  'Adductor'),
(3,  'Abductor'),
(3,  'Contracción gluteo'),
(4, 'Elevaciones laterales'),
(4, 'Elevaciones Frontales'),
(4, 'Pájaro'),
(4, 'Rowing'),
(4, 'Press con Mancuernas hombro'),
(4, 'Encogimientos'),
(4, 'Elevaciones laterales Máquina'),
(4, 'MultiPower'),
(4, 'Deltoides en máquina'),
(5, 'Curl Barra'),
(5, 'Curl alterno inclinado'),
(5, 'Predicador'),
(5, 'Concentrado'),
(5, 'Alterno en polea'),
(5, 'Curl Invertido'),
(5, 'Curl antebrazo invertido'),
(5, 'Curl antebrazo trasero'),
(6, 'Lagartijas'),
(6,  'Press Frances'),
(6,  'Fondos'),
(6,  'Polea Triceps'),
(6,  'Pico'),
(6,  'Jalones'),
(6,  'Coz'),
(6,  'Pico dos manos'),
(6,  'Presses');

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
(6,'Triceps');

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

INSERT INTO `tabla_ejercicio` (`fecha`,`cod_ejercicio`, `cod_usuario`, `peso1`, `peso2`, `peso3`, `peso4`, `repeticion1`, `repeticion2`, `repeticion3`, `repeticion4`) VALUES
('2016-12-28', 1,  '06970737N', 35, 4, 45, 50, 12, 10, 8, 6),
('2016-12-28', 2,  '28968669P', 35, 40, 47, 50, 11, 10, 8, 6),
('2016-12-28', 3,  '06970737N', 35, 40, 45, 50, 12, 10, 8, 6),
('2016-12-28', 4,  '28968669P', 35, 46, 45, 50, 13, 10, 8, 6);

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

DROP TABLE IF EXISTS `imagenes`;
CREATE TABLE IF NOT EXISTS `imagenes`  (
`cod_ejercicio` int(11) NOT NULL,
`cod_imagen` varchar(300) COLLATE utf8_bin NOT NULL,
PRIMARY KEY (`cod_ejercicio`,`cod_imagen`)
)
ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




)
