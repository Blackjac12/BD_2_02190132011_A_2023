CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `codigo` int(100) DEFAULT NULL,
  `descipcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `cliente` (
  `dni` int(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_genero` int(11) NOT NULL,
  `id_estado_civil` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `id_genero_idx` (`id_genero`),
  KEY `id_estado_civil_idx` (`id_estado_civil`),
  CONSTRAINT `id_estado_civil` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`) ,
  CONSTRAINT `id_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`) 
);



CREATE TABLE `detalles_pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `precio_unidad` float DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `descuento` varchar(100) DEFAULT NULL,
  `precio_total` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `detalles_pedido_FK` (`id_producto`),
  KEY `detalles_pedido_FK_1` (`id_pedido`),
  KEY `detalles_pedido_FK_2` (`id_pago`),
  CONSTRAINT `detalles_pedido_FK` FOREIGN KEY (`id_producto`) REFERENCES `prodcuto` (`id`),
  CONSTRAINT `detalles_pedido_FK_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `detalles_pedido_FK_2` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id`)
);


CREATE TABLE `empleado` (
  `dni` int(100) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `id_genero` int(11) NOT NULL,
  `id_estado_civil` int(11) NOT NULL,
  `id_jornada` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`dni`),
  KEY `empleado_FK` (`id_genero`),
  KEY `empleado_FK_1` (`id_estado_civil`),
  KEY `empleado_FK_2` (`id_jornada`),
  KEY `empleado_FK_3` (`id_rol`),
  CONSTRAINT `empleado_FK` FOREIGN KEY (`id_genero`) REFERENCES `genero` (`id`),
  CONSTRAINT `empleado_FK_1` FOREIGN KEY (`id_estado_civil`) REFERENCES `estado_civil` (`id`),
  CONSTRAINT `empleado_FK_2` FOREIGN KEY (`id_jornada`) REFERENCES `jornada_trabajo` (`id`),
  CONSTRAINT `empleado_FK_3` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id`)
);

CREATE TABLE `estado_civil` (
  `id` int(11) NOT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `factura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` float DEFAULT NULL,
  `id_pago` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `id_prodcuto` int(11) DEFAULT NULL,
  `id_empleado` int(11) DEFAULT NULL,
  `numero_caja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `factura_FK` (`id_pago`),
  KEY `factura_FK_1` (`id_prodcuto`),
  KEY `factura_FK_2` (`id_cliente`),
  KEY `factura_FK_3` (`id_empleado`),
  CONSTRAINT `factura_FK` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id`),
  CONSTRAINT `factura_FK_1` FOREIGN KEY (`id_prodcuto`) REFERENCES `prodcuto` (`id`),
  CONSTRAINT `factura_FK_2` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`dni`),
  CONSTRAINT `factura_FK_3` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`dni`)
);

CREATE TABLE `genero` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `genero` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);


REATE TABLE `jornada_trabajo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hora_entrada` time DEFAULT NULL,
  `hora_salidad` time DEFAULT NULL,
  PRIMARY KEY (`id`)
);


CREATE TABLE `pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `efectivo` tinyint(4) DEFAULT NULL,
  `tarjeta_credito` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) NOT NULL,
  `id_empleado` int(11) NOT NULL,
  `fecha_pedido` date DEFAULT NULL,
  `fecha_requerida` date DEFAULT NULL,
  `fecha_envio` date DEFAULT NULL,
  `transporte` varchar(100) DEFAULT NULL,
  `dirrecion` varchar(100) DEFAULT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pedido_FK` (`id_cliente`),
  KEY `pedido_FK_1` (`id_empleado`),
  CONSTRAINT `pedido_FK` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`dni`),
  CONSTRAINT `pedido_FK_1` FOREIGN KEY (`id_empleado`) REFERENCES `empleado` (`dni`)
);

CREATE TABLE `prodcuto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `id_categoria` int(11) NOT NULL,
  `cantidad_unidad` int(60) DEFAULT NULL,
  `precio_unitario` float DEFAULT NULL,
  `unidades_stock` int(200) DEFAULT NULL,
  `unidades_encargo` int(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria_idx` (`id_categoria`),
  CONSTRAINT `id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
);


CREATE TABLE `promocion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `descuento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `promocion_producto` (
  `id` int(11) NOT NULL,
  `id_promocion` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_promocion_idx` (`id_promocion`),
  KEY `id_producto_idx` (`id_producto`),
  CONSTRAINT `promocion_producto_FK` FOREIGN KEY (`id_promocion`) REFERENCES `promocion` (`id`),
  CONSTRAINT `promocion_producto_FK_1` FOREIGN KEY (`id_producto`) REFERENCES `prodcuto` (`id`)
) ;

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) DEFAULT NULL,
  `direccion` varchar(45) DEFAULT NULL,
  `ciudad` varchar(45) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `codigo_postal` int(11) DEFAULT NULL,
  `pais` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `proveedor_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_proveedor_idx` (`id_proveedor`),
  KEY `id_producto_idx` (`id_producto`),
  CONSTRAINT `proveedor_producto_FK` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`),
  CONSTRAINT `proveedor_producto_FK_1` FOREIGN KEY (`id_producto`) REFERENCES `prodcuto` (`id`)
) ;

CREATE TABLE `rol` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
