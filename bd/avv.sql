-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:33065
-- Tiempo de generación: 17-12-2019 a las 16:42:25
-- Versión del servidor: 10.1.36-MariaDB
-- Versión de PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `avv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `authorities`
--

CREATE TABLE `authorities` (
  `username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `authority` varchar(50) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `authorities`
--

INSERT INTO `authorities` (`username`, `authority`) VALUES
('eva', 'ROLE_VOCAL'),
('juan', 'ROLE_ADMIN'),
('lara', 'ROLE_SECRETARIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enroll`
--

CREATE TABLE `enroll` (
  `idenroll` int(11) NOT NULL,
  `name` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `address` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telephone` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idworkshop` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `enroll`
--

INSERT INTO `enroll` (`idenroll`, `name`, `address`, `email`, `telephone`, `dni`, `idworkshop`) VALUES
(1, 'Sara Sanchez', 'calle vicroria 21, 3-2', 'ssanchez@gmail.com', '654 32 21 45', '77983237N', 3),
(2, 'Victor Garcia', 'calle vicroria 21, 3-2', 'vgarcia@gmail.com', '654 32 21 45', '88760840E', 3),
(3, 'Laura Torra', 'calle vicroria 21, 3-2', 'ltorra@gmail.com', '654 32 21 45', '49195931N', 2),
(8, 'Ana Gutierrez', 'calle Amapola 32, 2-2', 'agutierrez@gmail.com', '654 48 25 45', '09690846A', 2),
(9, 'Pep Alegre', 'calle Napoles 56, 3-1', 'pepalegre@gmail.com', '654 02 58 78', '52917602F', 10),
(11, 'Sara Lopez', 'calle Labrador 43, 7-3', 'slopez@gmail.com', '654 02 58 78', '52917602F', 10),
(14, 'Laura Mato', 'calle Mayo 32, 4-2', 'lmato@gmail.com', '654 23 69 65', '52917602F', 1),
(15, 'Daniel Gutierrez', 'calle septiembre 43, 1-4', 'dgutierres@gmail.com', '654 02 58 78', '52917602F', 10),
(16, 'Marta Sanchez Oliva', 'calle Obrador 12, 5-3', 'msanchez@gmail.com', '654 02 58 78', '28944922C', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructor`
--

CREATE TABLE `instructor` (
  `idinstructor` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `telephone` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL,
  `dni` varchar(15) COLLATE utf8_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `instructor`
--

INSERT INTO `instructor` (`idinstructor`, `name`, `email`, `telephone`, `dni`) VALUES
(1, 'Gabriel Garcia', 'ggarcia@gmail.com', '658 98 74 56', '74501428N'),
(2, 'Sara Leon', 'sleon@gmail.com', '625 14 72 36', '99593189S'),
(8, 'Alfredo Camacho', 'acamacho@gmail.com', '223 66 98 56', '52917602F'),
(10, 'Muntsa Holgado', 'mholgado@gmail.com', '654 89 63 85', '51518209A'),
(11, 'Carolina Ackermann', 'c@gmail.com', '654 89 52 64', '52917602F');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `username` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(68) COLLATE utf8_spanish_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('eva', '$2y$12$jM6PEvLc98cIlvEB8Vgez.gkDe.zObBm1cdYkyz8BNxrgSmmodhMO', 1),
('juan', '$2y$12$jM6PEvLc98cIlvEB8Vgez.gkDe.zObBm1cdYkyz8BNxrgSmmodhMO', 1),
('lara', '$2y$12$jM6PEvLc98cIlvEB8Vgez.gkDe.zObBm1cdYkyz8BNxrgSmmodhMO', 1),
('pep', '$2y$12$jM6PEvLc98cIlvEB8Vgez.gkDe.zObBm1cdYkyz8BNxrgSmmodhMO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `workshop`
--

CREATE TABLE `workshop` (
  `idworkshop` int(11) NOT NULL,
  `title` varchar(100) COLLATE utf8_spanish_ci DEFAULT NULL,
  `description` varchar(300) COLLATE utf8_spanish_ci DEFAULT NULL,
  `price` decimal(10,4) DEFAULT NULL,
  `day` varchar(20) COLLATE utf8_spanish_ci DEFAULT NULL,
  `idinstructor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `workshop`
--

INSERT INTO `workshop` (`idworkshop`, `title`, `description`, `price`, `day`, `idinstructor`) VALUES
(1, 'Yoga', 'Yoga para adultos', '15.0000', 'jueves', 1),
(2, 'Taichi', 'Salud para el cuerpo y la mente.', '20.0000', 'jueves', 2),
(3, 'Ajedrez', 'Para niños y niñas de 7 a 12 años', '15.0000', 'lunes', 1),
(10, 'Macrame', 'Manualidades para una mente despierta', '23.0000', 'jueves', 2),
(11, 'Tot per la pasta', 'Vine a aprendre a fer la teva pasta i combina-la en delicioses receptes d\'espaguetis, lasanyes, canelons, raviolis... ', '15.0000', 'lunes', 1),
(12, 'MenstruaciÃ?Â³n Consciente', 'MenstruaciÃ?Â³n para mujeres pues eso ', '20.0000', 'jueves', 11);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD UNIQUE KEY `ix_auth_username` (`username`,`authority`);

--
-- Indices de la tabla `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`idenroll`),
  ADD KEY `fk_workshop_idx` (`idworkshop`);

--
-- Indices de la tabla `instructor`
--
ALTER TABLE `instructor`
  ADD PRIMARY KEY (`idinstructor`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `workshop`
--
ALTER TABLE `workshop`
  ADD PRIMARY KEY (`idworkshop`),
  ADD KEY `fk_instructor_idx` (`idinstructor`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `enroll`
--
ALTER TABLE `enroll`
  MODIFY `idenroll` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `instructor`
--
ALTER TABLE `instructor`
  MODIFY `idinstructor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `workshop`
--
ALTER TABLE `workshop`
  MODIFY `idworkshop` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `authorities`
--
ALTER TABLE `authorities`
  ADD CONSTRAINT `fk_authorities_users` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Filtros para la tabla `enroll`
--
ALTER TABLE `enroll`
  ADD CONSTRAINT `fk_workshop` FOREIGN KEY (`idworkshop`) REFERENCES `workshop` (`idworkshop`);

--
-- Filtros para la tabla `workshop`
--
ALTER TABLE `workshop`
  ADD CONSTRAINT `fk_instructor` FOREIGN KEY (`idinstructor`) REFERENCES `instructor` (`idinstructor`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
