CREATE TABLE tarjeta (
	id int auto_increment NOT NULL,
	Tick float NULL,
	saldo float NULL,
	CONSTRAINT tarjeta_PK PRIMARY KEY (id)
)



CREATE TABLE cliente (
	id int(100) NOT NULL,
	nombre varchar(100) NULL,
	apellido varchar(100) NULL,
	dni int(100) NULL,
	telefono varchar(100) NULL,
	edad varchar(100) NULL,
	genero char NULL,
	id_tarjeta int(100) NULL,
	CONSTRAINT clientePK PRIMARY KEY (id)
	CONSTRAINT cliente_FK FOREIGN KEY (id_tarjeta) REFERENCES Citypark.tarjeta(id)
)


CREATE TABLE modo_pago (
	id int NULL,
	Tarjea de credito boolean NULL,
	tarjata de debito boolean NULL,
	efecitivo boolean NULL,
	CONSTRAINT modo_pago_PK PRIMARY KEY (id)
)

CREATE TABLE cargo (
	id int(100) NULL,
	nombre_cargo varchar(100) NULL,
	CONSTRAINT cargo_PK PRIMARY KEY (id)
)

CREATE TABLE horario (
	id int(100) NULL,
	hoara_de_entrdad time NULL,
	hora_de_salidad time NULL,
	CONSTRAINT horario_PK PRIMARY KEY (id)
)
