/*PROCEDIMIENTOS ALMACENADOS*/
CREATE PROCEDURE InsertarDocente
    @DPI int,
    @Nombre varchar(50),
    @Apellidos varchar(50),
    @Edad int,
    @Direccion varchar(50),
    @Telefono int,
    @Foto image,
    @Genero char(1),
    @Fecha_de_ingreso date,
    @Tipo_de_contrato varchar(50)
AS
BEGIN
    INSERT INTO Docentes (DPI, Nombre, Apellidos, Edad, Direccion, Telefono, Foto, Genero, Fecha_de_ingreso, Tipo_de_contrato)
    VALUES (@DPI, @Nombre, @Apellidos, @Edad, @Direccion, @Telefono, @Foto, @Genero, @Fecha_de_ingreso, @Tipo_de_contrato);
END;

CREATE PROCEDURE InsertarHorario
    @ID_Docentes int,
    @Dia_de_la_semana varchar(20),
    @Hora_de_entrada time,
    @Hora_de_salida time
AS
BEGIN
    INSERT INTO Horarios (ID_Docentes, Dia_de_la_semana, Hora_de_entrada, Hora_de_salida)
    VALUES (@ID_Docentes, @Dia_de_la_semana, @Hora_de_entrada, @Hora_de_salida);
END;

CREATE PROCEDURE InsertarDescanso
    @Fecha date,
    @Tipo_de_descanso varchar(50),
    @Descripcion varchar(200)
AS
BEGIN
    INSERT INTO Descansos (Fecha, Tipo_de_descanso, Descripcion)
    VALUES (@Fecha, @Tipo_de_descanso, @Descripcion);
END;

CREATE PROCEDURE AsignarDescanso
    @ID_Descanso int,
    @ID_Docentes int,
    @Fecha_descanso date
AS
BEGIN
    INSERT INTO Asignacion (ID_Descanso, ID_Docentes, Fecha_descanso)
    VALUES (@ID_Descanso, @ID_Docentes, @Fecha_descanso);
END;

CREATE PROCEDURE RegistrarAsistencia
    @ID_Docentes int,
    @Fecha date,
    @Hora_de_entrada time,
    @Hora_de_salida time,
    @Estado varchar(20),
    @Observaciones varchar(300)
AS
BEGIN
    INSERT INTO Asistencias (ID_Docentes, Fecha, Hora_de_entrada, Hora_de_salida, Estado, Observaciones)
    VALUES (@ID_Docentes, @Fecha, @Hora_de_entrada, @Hora_de_salida, @Estado, @Observaciones);
END;

CREATE PROCEDURE InsertarCarnet
    @ID_Docentes int,
    @No_Carnet varchar(20),
    @Fecha_de_emision date,
    @Fecha_de_vencimiento date,
    @Estado varchar(20),
	@Imagen_de_codigoQR image, 
    @Descripcion varchar(300)
AS
BEGIN
    INSERT INTO Carnets (ID_Docentes, No_Carnet, Fecha_de_emision, Fecha_de_vencimiento, Estado, Imagen_de_codigoQR, Descripcion)
    VALUES (@ID_Docentes, @No_Carnet, @Fecha_de_emision, @Fecha_de_vencimiento, @Estado, @Imagen_de_codigoQR, @Descripcion);
END;

CREATE PROCEDURE InsertarEvento
    @ID_Docentes int,
    @Titulo varchar(100),
    @Descripcion varchar(300),
    @Fecha_de_inicio date,
    @Fecha_de_fin date,
    @Lugar varchar(100),
    @Observaciones varchar(300)
AS
BEGIN
    INSERT INTO Eventos (ID_Docentes, Titulo, Descripcion, Fecha_de_inicio, Fecha_de_fin, Lugar, Observaciones)
    VALUES (@ID_Docentes, @Titulo, @Descripcion, @Fecha_de_inicio, @Fecha_de_fin, @Lugar, @Observaciones);
END;

CREATE PROCEDURE RegistrarPermiso
    @ID_Docentes int,
    @Fecha_de_permiso date,
    @Motivo varchar(100),
    @Descripcion varchar(300),
	@Autorizado bit,
    @Observaciones varchar(300)
AS
BEGIN
    INSERT INTO PermisosMaestros (ID_Docentes, Fecha_de_permiso, Motivo, Descripcion, Autorizado, Observaciones)
    VALUES (@ID_Docentes, @Fecha_de_permiso, @Motivo, @Descripcion, @Autorizado, @Observaciones);
END;

CREATE PROCEDURE RegistrarSalario
    @ID_Docentes int,
    @Mes varchar(50),
    @Dias_laborados int,
    @Salario_del_mes decimal(10, 2),
    @Bonificaciones decimal(10, 2),
    @Descuentos decimal(10, 2),
    @Fecha_vigencia date,
    @Fecha_fin_vigencia date,
    @FirmaHojaDeposito bit,
    @Observaciones VARCHAR(300)
AS
BEGIN
    INSERT INTO Salarios (ID_Docentes, Mes, Dias_laborados, Salario_del_mes, Bonificaciones, Descuentos, Fecha_vigencia, Fecha_fin_vigencia, FirmaHojaDeposito, Observaciones)
    VALUES (@ID_Docentes, @Mes, @Dias_laborados, @Salario_del_mes, @Bonificaciones, @Descuentos, @Fecha_vigencia, @Fecha_fin_vigencia, @FirmaHojaDeposito, @Observaciones);
END;