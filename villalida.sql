-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-12-2017 a las 04:39:02
-- Versión del servidor: 10.1.28-MariaDB
-- Versión de PHP: 7.1.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `villalida`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `agencia de viajes`
--

CREATE TABLE `agencia de viajes` (
  `Id_ Cliente` int(6) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `RFC` varchar(18) NOT NULL,
  `Direccion` varchar(25) NOT NULL,
  `Tel/Cel` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `agencia de viajes`
--

INSERT INTO `agencia de viajes` (`Id_ Cliente`, `Nombre`, `RFC`, `Direccion`, `Tel/Cel`) VALUES
(1, 'Carlos', '123456781', 'la manga', 993145876),
(4, 'Antonio', '123456784', 'Espejo', 993245267),
(5, 'eduardo', '12345678', 'palma', 1234454555);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destino`
--

CREATE TABLE `destino` (
  `Id_Destino` int(6) NOT NULL,
  `Continente` varchar(10) NOT NULL,
  `Pais` varchar(10) NOT NULL,
  `Ciudad` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `destino`
--

INSERT INTO `destino` (`Id_Destino`, `Continente`, `Pais`, `Ciudad`) VALUES
(0, 'America', 'Mexico', 'Mnterrey'),
(1, 'Europa', 'Alemania', 'Berlin');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paquete`
--

CREATE TABLE `paquete` (
  `Clave` int(6) NOT NULL,
  `Nom_Paq` varchar(8) NOT NULL,
  `Costo` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paquete`
--

INSERT INTO `paquete` (`Clave`, `Nom_Paq`, `Costo`) VALUES
(0, 'express', 1500),
(1, 'complete', 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `Id_Viajes` int(6) NOT NULL,
  `Nombre` varchar(15) NOT NULL,
  `Destino` int(6) NOT NULL,
  `Fecha_Salidaa` date NOT NULL,
  `Fecha_Regreso` date NOT NULL,
  `Paquete` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`Id_Viajes`, `Nombre`, `Destino`, `Fecha_Salidaa`, `Fecha_Regreso`, `Paquete`) VALUES
(0, 'Antonio', 0, '2017-11-01', '2017-11-09', 0),
(1, 'Carlos', 1, '2017-11-01', '2017-11-30', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `agencia de viajes`
--
ALTER TABLE `agencia de viajes`
  ADD PRIMARY KEY (`Id_ Cliente`),
  ADD UNIQUE KEY `Nombre` (`Nombre`);

--
-- Indices de la tabla `destino`
--
ALTER TABLE `destino`
  ADD PRIMARY KEY (`Id_Destino`);

--
-- Indices de la tabla `paquete`
--
ALTER TABLE `paquete`
  ADD PRIMARY KEY (`Clave`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`Id_Viajes`),
  ADD UNIQUE KEY `Nombre` (`Nombre`),
  ADD UNIQUE KEY `Destino` (`Destino`),
  ADD UNIQUE KEY `Paquete` (`Paquete`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`Nombre`) REFERENCES `agencia de viajes` (`Nombre`),
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`Destino`) REFERENCES `destino` (`Id_Destino`),
  ADD CONSTRAINT `viajes_ibfk_3` FOREIGN KEY (`Paquete`) REFERENCES `paquete` (`Clave`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
