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




CREATE TABLE Empleado (
	id int(100) auto_increment NOT NULL,
	nombre varchar(100) NULL,
	apellido varchar(100) NULL,
	edad varchar(100) NULL,
	id_cargo int(100) NULL,
	sexo char NULL,
	id_hoario int(100) NULL,
	CONSTRAINT Empleado_PK PRIMARY KEY (id),
	CONSTRAINT Empleado_FK FOREIGN KEY (id_cargo) REFERENCES Citypark.cargo(id),
	CONSTRAINT Empleado_FK_1 FOREIGN KEY (id_hoario) REFERENCES Citypark.horario(id)
)





CREATE TABLE Caja_recagar (
	id int(100) auto_increment NOT NULL,
	id_empleado int(100) NULL,
	id_cliente int(100) NULL,
	valor_recagar float NULL,
	id_mod_pago int NULL,
	CONSTRAINT NewTable_PK PRIMARY KEY (id),
	CONSTRAINT Caja_recagar_FK FOREIGN KEY (id_empleado) REFERENCES Citypark.Empleado(id),
	CONSTRAINT Caja_recagar_FK_1 FOREIGN KEY (id_cliente) REFERENCES Citypark.cliente(id),
	CONSTRAINT Caja_recagar_FK_2 FOREIGN KEY (id_mod_pago) REFERENCES Citypark.modo_pago(id)
)



CREATE TABLE juego (
	id int auto_increment NOT NULL,
	nombre varchar(100) NULL,
	Valor_jugar float NULL,
	tick_recompeza_minima float NULL,
	tick_recompeza_maxima float NULL,
	id_cliente int(100) NULL,
	restricion_edad varchar(100) NULL,
	restricion_estatura varchar(100) NULL,
	disponiblidad varchar(100) NULL,
	CONSTRAINT juego_PK PRIMARY KEY (id),
	CONSTRAINT juego_FK FOREIGN KEY (id_cliente) REFERENCES Citypark.cliente(id)
)


CREATE TABLE Caja_premios (
	id int(100) auto_increment NOT NULL,
	nombre_premio varchar(100) NULL,
	valor_tick float NULL,
	id_emlpelado int(100) NULL,
	id_cliete int(100) NULL,
	CONSTRAINT Caja_premios_PK PRIMARY KEY (id),
	CONSTRAINT Caja_premios_FK FOREIGN KEY (id_emlpelado) REFERENCES Citypark.Empleado(id)
)
