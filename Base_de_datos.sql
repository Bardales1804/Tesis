/*BASE DE DATOS*/
CREATE DATABASE CCCP

/*TABLAS*/
CREATE TABLE Docentes(
	ID_Docentes int primary key,
	DPI int  not null,
	Nombre varchar(50) not null,
	Apellidos varchar(50) not null,
	Edad int,
	Direccion varchar(50),
	Telefono int,
	Foto image,
	Genero char(1) check (Genero In ('M','F')),
	Fecha_de_ingreso date not null,
	Tipo_de_contrato varchar(50) not null
)

CREATE TABLE Horarios(
	ID_Horario int primary key,
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
	Dia_de_la_semana varchar(20) not null,
	Hora_de_entrada time,
	Hora_de_salida time
)

CREATE TABLE Descansos(
	ID_Descanso int primary key,
	Fecha date not null,
	Tipo_de_descanso varchar(50)not null,
	Descripcion varchar(200)
)


/*tala intermediaria entre docentes y descansos*/
CREATE TABLE Asignacion(
	ID_Asignacion int primary key,
	ID_Descanso int, foreign key (ID_Descanso) references Descansos(ID_Descanso),
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
	Fecha_descanso date default getdate() not null
)

CREATE TABLE Asistencias(
	ID_Asistencia int primary key,
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
	Fecha date not null,
	Hora_de_entrada time not null,
	Hora_de_salida time not null,
	Estado varchar(20) not null,
	Observaciones varchar(300)
)

CREATE TABLE Carnets(
	ID_Carnet int primary key,
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
	No_Carnet varchar(20) not null,
	Fecha_de_emision date not null,
	Fecha_de_vencimiento date not null,
	Estado bit not null,
	Imagen_de_codigoQR image not null, 
	descripcion varchar(300)
)

CREATE TABLE Eventos (
    ID_Evento int primary key,
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
    Titulo varchar(100),
    Descripcion varchar(300),
    Fecha_de_inicio date,
    Fecha_de_fin date,
    Lugar varchar(100),
    Observaciones varchar(300),
)

CREATE TABLE PermisosMaestros (
    ID_Permiso int primary key,
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
    Fecha_de_permiso date not null,
    Motivo varchar(100) not null,
	Descripcion varchar(300) not null,
	Autorizado bit not null,
    Observaciones varchar(300),
)

CREATE TABLE Salarios (
    ID_Salario int primary key,
	ID_Docentes int, foreign key (ID_Docentes) references Docentes(ID_Docentes),
	Mes varchar(50) not null,
	Dias_laborados int not null,
    Salario_del_mes decimal(10, 2) not null, 
    Bonificaciones decimal(10, 2) not null, 
    Descuentos decimal(10, 2) not null, 
    Fecha_vigencia date not null, 
    Fecha_fin_vigencia date not null, 
	FirmaHojaDeposito bit default 0,
    Observaciones VARCHAR(300)
)