-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 17:19:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pick_up`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id_detalle` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id_detalle`, `id_pedido`, `id_producto`, `cantidad`, `precio_unitario`) VALUES
(2, 2, 1, 4, 5.00),
(3, 3, 2, 5, 3.00),
(4, 4, 1, 4, 5.00),
(5, 5, 2, 5, 3.00),
(6, 6, 2, 11, 3.00),
(7, 6, 3, 6, 4.50),
(8, 6, 4, 1, 7.00),
(9, 6, 8, 1, 2.50),
(10, 6, 1, 1, 5.00),
(11, 7, 1, 10, 5.00),
(12, 8, 2, 5, 3.00),
(13, 9, 5, 10, 4.00),
(14, 10, 1, 4, 5.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `envios`
--

CREATE TABLE `envios` (
  `id_envio` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `direccion_envio` text DEFAULT NULL,
  `estado_envio` varchar(50) DEFAULT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_pedidos`
--

CREATE TABLE `estado_pedidos` (
  `id_estado` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `membresias`
--

CREATE TABLE `membresias` (
  `id_membresia` int(11) NOT NULL,
  `tipo_membresia` varchar(50) DEFAULT NULL,
  `descuento_envio` decimal(5,2) DEFAULT NULL,
  `precio_especial` decimal(5,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `membresias`
--

INSERT INTO `membresias` (`id_membresia`, `tipo_membresia`, `descuento_envio`, `precio_especial`) VALUES
(1, 'Estándar', 0.00, 0.00),
(2, 'Premium', 10.00, 20.00),
(3, 'VIP', 15.00, 25.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `metodo_pago` varchar(50) DEFAULT NULL,
  `estado_pago` varchar(50) DEFAULT NULL,
  `fecha_pago` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_pedido` datetime DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `estado` varchar(50) DEFAULT 'Nuevo',
  `direccion_entrega` varchar(255) DEFAULT NULL,
  `telefono_contacto` varchar(20) DEFAULT NULL,
  `metodo_envio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_usuario`, `fecha_pedido`, `total`, `estado`, `direccion_entrega`, `telefono_contacto`, `metodo_envio`) VALUES
(2, 12, '2024-12-02 16:51:03', 26.00, 'Pendiente', 'Calle Los Geranios 342', '972401212', 'delivery'),
(3, 21, '2024-12-02 21:44:10', 15.00, 'Pendiente', 'Calle Los Geranios 347', '9724012122', 'recojo'),
(4, 21, '2024-12-02 22:02:13', 20.00, 'Pendiente', 'Calle Los Geranios 341', '972401014', 'recojo'),
(5, 21, '2024-12-02 23:45:56', 15.00, 'Pendiente', 'Calle Los Geranios 341', '972401010', 'recojo'),
(6, 21, '2024-12-02 23:57:09', 74.50, 'Pendiente', 'Calle Los Geranios 3400', '9724012100', 'recojo'),
(7, 21, '2024-12-03 07:11:52', 50.00, 'Pendiente', 'Calle Los Geranios 332', '972406181', 'recojo'),
(8, 21, '2024-12-03 16:31:18', 21.00, 'Pendiente', 'calle las canicas 142', '9214921', 'delivery'),
(9, 78, '2024-12-03 17:05:30', 46.00, 'Pendiente', 'Calle Los Mercurios 300', '561981', 'delivery'),
(10, 21, '2024-12-03 19:09:28', 26.00, 'Pendiente', 'Av Aviación 1244', '987789987', 'delivery');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_producto` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'Pan con Palta', 'Delicioso pan con palta fresca', 5.00, 'img/panconpalta.jpg'),
(2, 'Jugo de Naranja', 'Jugo de naranja recién exprimido', 3.00, 'img/jugodenaranja.jpg'),
(3, 'Café Americano', 'Café 100% orgánico', 4.50, 'img/cafeamericano.jpg'),
(4, 'Pan con Lomo', 'Pan relleno con lomo saltado', 7.00, 'img/fruite-item-4.jpg'),
(5, 'Avena con Frutas', 'Bebida de avena con frutas frescas', 4.00, 'img/avenaconfrutas.jpg'),
(6, 'Pan con Camote', 'Pan acompañado con dulce camote asado', 5.50, 'img/panconcamote.jpg'),
(7, 'Tamal Criollo', 'Tamal peruano envuelto en hojas de maíz', 6.00, 'img/tamalcriollo.jpg'),
(8, 'Emoliente Tradicional', 'Bebida caliente a base de hierbas medicinales', 2.50, 'img/fruite-item-5.jpg'),
(9, 'Pan con Chicharrón', 'Pan con jugoso chicharrón y zarza criolla', 8.00, 'img/panconchicharron.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'ADMIN'),
(2, 'USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `id_membresia` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `terminos_aceptados` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `email`, `password`, `direccion`, `telefono`, `id_membresia`, `id_rol`, `terminos_aceptados`) VALUES
(12, 'Renzo Minafwe', 'fsdfe4w@gmail.com', 'ABCabc', 'Calle los martinez 1342', '532344', 1, 2, 0),
(13, 'Carlos Perez', 'pperez123@gmail.com', NULL, 'calle las mocasinsd2', '315446', 1, 2, 0),
(14, 'Renzo Cahuana', 'rcahuana124@hotmail.com', 'ABCabc123', 'Calle Las Magnolias 1412', '924128412', 1, 2, 0),
(15, 'Luis Anampa', 'lanampa@gmail.com', '123456', 'Calle Las Amapolas 124', '985123447', 1, 2, 0),
(16, 'Carmen Rosita', 'crosaxd@gmail.com', NULL, 'Calle las margaritas 4212', '948415616', 1, 2, 0),
(20, 'GRUPO MAN PAN', 'manpan.service.sac@gmail.com', NULL, NULL, NULL, 1, 2, 0),
(21, 'Maria', 'maria12@gmail.com', '123456', 'calle los geranios 12', '123456', 1, 2, 0),
(22, 'Victor Vargas', 'knox15981@gmail.com', NULL, NULL, NULL, 1, 2, 0),
(23, 'Jose Antillas', 'jantillas213@gmail.com', 'ABCabc123.,.,', 'Calle Los Algarrobos 142', '987123456', 1, 2, 0),
(28, 'GianCarl Gomez', 'frains342@gmail.com', NULL, 'Calle Las Amapolas 124', '3918418', 1, 2, 0),
(31, 'renzo6118', 'angelinaluciana34@gmail.com', NULL, NULL, NULL, 1, 2, 0),
(47, 'ruiz carmelo', 'rubix3215@gmail.com', NULL, NULL, NULL, 1, 2, 0),
(57, 'Palm Csa', 'palmcsa275@gmail.com', NULL, NULL, NULL, 1, 2, 0),
(59, 'Renzo Daniel Minaya Cahuana', 'minayacahuanarenzo@gmail.com', NULL, NULL, NULL, 1, 2, 0),
(67, 'admin', 'admin@example.com', '123456', 'adminadmin', '999999999', 1, 2, 0),
(68, 'Luis', 'luis@example.com', 'password123', 'Calle Principal 100', '555-9999', 1, 2, 0),
(69, 'Juan', 'juan@example.com', 'password123', 'Calle Falsa 123', '555-1234', 1, 2, 0),
(70, 'Ana Gomez', 'ana@example.com', 'password123', '456 Calle Real', '987654321', 1, 2, 0),
(73, 'Luis', 'luis.unique@example.com', 'password123', 'Calle Principal 100', '555-9999', 1, 2, 0),
(78, 'Jose Ponce', 'jose123@gmail.com', '123456', 'Calle Montes 123', '1294214021', 1, 2, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `envios`
--
ALTER TABLE `envios`
  ADD PRIMARY KEY (`id_envio`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  ADD PRIMARY KEY (`id_estado`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `membresias`
--
ALTER TABLE `membresias`
  ADD PRIMARY KEY (`id_membresia`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_producto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `id_membresia` (`id_membresia`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `envios`
--
ALTER TABLE `envios`
  MODIFY `id_envio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `membresias`
--
ALTER TABLE `membresias`
  MODIFY `id_membresia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_pedidos_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `envios`
--
ALTER TABLE `envios`
  ADD CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `estado_pedidos`
--
ALTER TABLE `estado_pedidos`
  ADD CONSTRAINT `estado_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_membresia`) REFERENCES `membresias` (`id_membresia`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
