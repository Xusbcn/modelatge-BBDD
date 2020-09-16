-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-09-2020 a las 18:02:38
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `optica_cul_dampolla`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `codi_postal` varchar(10) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `client`
--

INSERT INTO `client` (`id_client`, `nom`, `codi_postal`, `telefon`, `email`) VALUES
(1, 'MARCELO', '08002', '698326590', 'marcelo@mail.com'),
(2, 'MARIA', '08003', '678963251', 'maria@mail.com'),
(3, 'LEO', '08004', '784963512', 'leo@mail.com'),
(4, 'FE', '08022', '745896321', 'fe@mail.com'),
(5, 'LUISA', '08012', '123654789', 'luisa@mail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleat`
--

CREATE TABLE `empleat` (
  `id_empleat` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `empleat`
--

INSERT INTO `empleat` (`id_empleat`, `nom`) VALUES
(1, 'PABLO'),
(2, 'LEOPOLDO'),
(3, 'YAMI');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `id_marca` int(11) NOT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `proveidor_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`id_marca`, `nom`, `proveidor_id`) VALUES
(1, 'Oakley', 1),
(2, 'Polaroid', 1),
(3, 'Carrera', 1),
(4, 'Arnette', 2),
(5, 'Police', 2),
(6, 'Prada', 3),
(7, 'Vogue', 2),
(8, 'Dior', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveidor`
--

CREATE TABLE `proveidor` (
  `id_proveidor` int(11) NOT NULL,
  `NIF` varchar(9) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `carrer` varchar(255) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `pis` int(11) DEFAULT NULL,
  `porta` char(1) DEFAULT NULL,
  `ciutat` varchar(100) DEFAULT NULL,
  `codi_postal` varchar(10) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `telefon` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proveidor`
--

INSERT INTO `proveidor` (`id_proveidor`, `NIF`, `nom`, `carrer`, `numero`, `pis`, `porta`, `ciutat`, `codi_postal`, `pais`, `telefon`, `fax`) VALUES
(1, '58301293L', 'VISTA ALEGRE', 'calabria', 1, 0, '', 'Barcelona', '08001', 'España', '654321789', '93456789'),
(2, '06025651L', 'Ojo al Parche', 'Madrid', 255, 0, '', 'Barcelona', '08011', 'España', '650001789', ''),
(3, '28274926Z', 'Mirame', 'La voz del Pueblo', 25, 0, '', 'Barcelona', '08031', 'España', '651231789', '93145789');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ulleres`
--

CREATE TABLE `ulleres` (
  `id_ullere` int(11) NOT NULL,
  `graduacio_vidre_dret` float DEFAULT NULL,
  `graduacio_vider_esquerra` float DEFAULT NULL,
  `color_vidre_dret` varchar(50) DEFAULT NULL,
  `color_vidre_esquerra` varchar(50) DEFAULT NULL,
  `tipus_montura` varchar(10) DEFAULT NULL,
  `color_montura` varchar(20) DEFAULT NULL,
  `preu` float DEFAULT NULL,
  `marca_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ulleres`
--

INSERT INTO `ulleres` (`id_ullere`, `graduacio_vidre_dret`, `graduacio_vider_esquerra`, `color_vidre_dret`, `color_vidre_esquerra`, `tipus_montura`, `color_montura`, `preu`, `marca_id`) VALUES
(1, 1.6, 1.5, 'blanc', 'blanc', 'negre', 'flotant', 350, 1),
(2, 1, 1, 'negre', 'negre', 'blanc', 'metàl·lica', 100, 3),
(3, 0, 0, 'negre', 'negre', 'blau', 'metàl·lica', 100, 4),
(4, 0, 0, 'negre', 'negre', 'verd', 'metàl·lica', 100, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id_venta` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `empleat_id` int(11) DEFAULT NULL,
  `ulleres_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`id_venta`, `client_id`, `empleat_id`, `ulleres_id`) VALUES
(1, 1, 1, 2),
(2, 2, 1, 1),
(3, 3, 3, 3),
(4, 4, 2, 1),
(5, 5, 1, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Indices de la tabla `empleat`
--
ALTER TABLE `empleat`
  ADD PRIMARY KEY (`id_empleat`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`id_marca`),
  ADD KEY `proveidor_id` (`proveidor_id`);

--
-- Indices de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  ADD PRIMARY KEY (`id_proveidor`),
  ADD UNIQUE KEY `NIF` (`NIF`);

--
-- Indices de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD PRIMARY KEY (`id_ullere`),
  ADD KEY `marca_id` (`marca_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id_venta`),
  ADD KEY `client_id` (`client_id`),
  ADD KEY `empleat_id` (`empleat_id`),
  ADD KEY `ulleres_id` (`ulleres_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `empleat`
--
ALTER TABLE `empleat`
  MODIFY `id_empleat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `id_marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `proveidor`
--
ALTER TABLE `proveidor`
  MODIFY `id_proveidor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `ulleres`
--
ALTER TABLE `ulleres`
  MODIFY `id_ullere` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `marca`
--
ALTER TABLE `marca`
  ADD CONSTRAINT `marca_ibfk_1` FOREIGN KEY (`proveidor_id`) REFERENCES `proveidor` (`id_proveidor`);

--
-- Filtros para la tabla `ulleres`
--
ALTER TABLE `ulleres`
  ADD CONSTRAINT `ulleres_ibfk_1` FOREIGN KEY (`marca_id`) REFERENCES `marca` (`id_marca`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`empleat_id`) REFERENCES `empleat` (`id_empleat`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`ulleres_id`) REFERENCES `ulleres` (`id_ullere`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
