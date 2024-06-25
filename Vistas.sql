/*VISTAS*/
CREATE VIEW VistaDocentes AS
SELECT ID_Docentes, Nombre, Apellidos, Edad, Genero, Fecha_de_ingreso, Tipo_de_contrato
FROM Docentes;

CREATE VIEW VistaAsistencias AS
SELECT A.ID_Asistencia, A.ID_Docentes, D.Nombre, D.Apellidos, A.Fecha, A.Hora_de_entrada, A.Hora_de_salida
FROM Asistencias A
INNER JOIN Docentes D ON A.ID_Docentes = D.ID_Docentes;

CREATE VIEW VistaCarnets AS
SELECT C.ID_Carnet, C.ID_Docentes, D.Nombre, D.Apellidos, C.No_Carnet, C.Estado, C.Imagen_de_codigoQR
FROM Carnets C
INNER JOIN Docentes D ON C.ID_Docentes = D.ID_Docentes;

CREATE VIEW VistaPermisosMaestros AS
SELECT PM.ID_Permiso, PM.ID_Docentes, D.Nombre, D.Apellidos, PM.Fecha_de_permiso, PM.Motivo, PM.Autorizado
FROM PermisosMaestros PM
INNER JOIN Docentes D ON PM.ID_Docentes = D.ID_Docentes;

CREATE VIEW VistaSalarios AS
SELECT S.ID_Salario, S.ID_Docentes, D.Nombre, D.Apellidos, S.Mes,  S.Salario_del_mes, S.FirmaHojaDeposito
FROM Salarios S
INNER JOIN Docentes D ON S.ID_Docentes = D.ID_Docentes;