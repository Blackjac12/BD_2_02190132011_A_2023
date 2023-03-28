CREATE TABLE `carrera` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrera` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `tipo_Identidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `contacto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `genero` char(1) DEFAULT NULL,
  `id_tipo_de_intetificacion` int(11) DEFAULT NULL,
  `dni` int(11) DEFAULT NULL,
  `nacimiento` date DEFAULT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `ciudad` varchar(30) DEFAULT NULL,
  `Campo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `contacto_FK` (`id_tipo_de_intetificacion`),
  CONSTRAINT `contacto_FK` FOREIGN KEY (`id_tipo_de_intetificacion`) REFERENCES `tipo_Identidad` (`id`)
) ;

CREATE TABLE `modo_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `efectivo` tinyint(1) DEFAULT NULL,
  `Credito` tinyint(1) DEFAULT NULL,
  `debito` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ;

CREATE TABLE `pin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `perido` varchar(30) DEFAULT NULL,
  `año` varchar(10) DEFAULT NULL,
  `valor_pagar` float DEFAULT NULL,
  `id_modo_pago` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pin_FK` (`id_modo_pago`),
  CONSTRAINT `pin_FK` FOREIGN KEY (`id_modo_pago`) REFERENCES `modo_pago` (`id`)
) ;

CREATE TABLE `ifeces` (
  `id` int(11) DEFAULT NULL,
  `dni` varchar(100) DEFAULT NULL,
  `puntaje` float DEFAULT NULL,
  `pdf_scanner` tinyint(1) DEFAULT NULL
) ;


CREATE TABLE `registro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_concto` int(11) DEFAULT NULL,
  `id_carrera` int(11) DEFAULT NULL,
  `id_pin` int(11) DEFAULT NULL,
  `id_ifeces` int(11) DEFAULT NULL,
  `pdf_bachiller_escarner` tinyint(1) DEFAULT NULL,
  `sede` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `registro_FK` (`id_carrera`),
  KEY `registro_FK_1` (`id_concto`),
  KEY `registro_FK_2` (`id_pin`),
  KEY `registro_FK_3` (`id_ifeces`),
  CONSTRAINT `registro_FK` FOREIGN KEY (`id_carrera`) REFERENCES `carrera` (`id`),
  CONSTRAINT `registro_FK_1` FOREIGN KEY (`id_concto`) REFERENCES `contacto` (`id`),
  CONSTRAINT `registro_FK_2` FOREIGN KEY (`id_pin`) REFERENCES `pin` (`id`),
  CONSTRAINT `registro_FK_3` FOREIGN KEY (`id_ifeces`) REFERENCES `ifeces` (`id`)
) ;
