create database BD_SIASEP;
go
use BD_SIASEP;
GO
create table estado_usuario(
	id_estado_usuario int primary key identity(1,1),
	nom_estado_usuario varchar(150)
);
go
create table tipo_documento(
	id_tipo_documento int primary key identity(1,1),
	nom_tipo_documento varchar(150)
);
go
create table distrito(
	id_distrito int primary key identity(1,1),
	nom_distrito varchar(255)
);
go
create table lugar_nacimiento(
	id_lugar_nacimiento int primary key identity(1,1),
	nom_lugar_nacimiento varchar(150)
);
go
create table tipo_usuario(
	id_tipo_usuario int primary key identity(1,1),
	nom_tipo_usuario varchar(150),
	dscrp_tipo_usuario varchar(255)
);
go
create table persona(
	id_persona int primary key identity(1,1),
	primer_nombre varchar(150) not null,
	apellido_materno varchar(150) not null,
	apellido_paterno varchar(150) not null,
	numero_documento varchar(20) unique not null,
	fec_nacimiento date not null,
	sexo char(1) not null,
	telefono_casa varchar(45) null,
	telefono_celular varchar(45) null,
	direccion varchar(255) not null,
	correo varchar(255) null,
	fkid_tipo_documento int not null,
	fkid_distrito int not null,
	fkid_lugar_nacimiento int not null,
	FOREIGN KEY (fkid_tipo_documento) REFERENCES tipo_documento(id_tipo_documento),
	FOREIGN KEY (fkid_distrito) REFERENCES distrito(id_distrito),
	FOREIGN KEY (fkid_lugar_nacimiento) REFERENCES lugar_nacimiento(id_lugar_nacimiento)
);
go
create table usuario(
	id_usuario int primary key identity(1,1),
	username varchar(150) not null,
	password varchar(150) not null,
	fec_creacion date null,
	fkid_persona int unique not null,
	fkid_estado_usuario int not null,
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona),
	FOREIGN KEY (fkid_estado_usuario) REFERENCES estado_usuario(id_estado_usuario)
);
go
create table multi_role(
	id_multi_role int primary key identity(1,1),
	fkid_usuario int not null,
	fkid_tipo_usuario int not null,
	FOREIGN KEY (fkid_usuario) REFERENCES usuario(id_usuario),
	FOREIGN KEY (fkid_tipo_usuario) REFERENCES tipo_usuario(id_tipo_usuario)
);
go
create table tipo_alumno(
	id_tipo_alumno int primary key identity(1,1),
	nom_tipo_alumno varchar(150)
);
go
create table per_alumno(
	id_per_alumno int primary key identity(1,1),
	codigo_alumno int unique not null,
	nombre_ie_anterior varchar(255) not null,
	ref_nivel varchar(45) not null,
	ref_grado_anterior char(1) not null,
	ref_seccion char(1) not null,
	ref_ponderado_anterior float not null,
	flg_orden_merito bit not null,
	grupo_sanguineo varchar(45) not null,
	lengua_materna varchar(150) not null,
	segunda_lengua varchar(150) null,
	nro_hermanos int not null,
	flg_copia_dni bit not null,
	flg_vive_con_padres bit not null,
	fkid_persona int unique not null,
	fkid_tipo_alumno int not null,
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona),
	FOREIGN KEY (fkid_tipo_alumno) REFERENCES tipo_alumno(id_tipo_alumno)
);
go
create table tipo_familiar(
	id_tipo_familiar int primary key identity(1,1),
	nom_tipo_familiar varchar(45)
);
go
create table estado_civil(
	id_estado_civil int primary key identity(1,1),
	nom_estado_civil varchar(45)
);
go
create table grado_instruccion(
	id_grado_instruccion int primary key identity(1,1),
	nom_grado_instruccion varchar(45)
);
go
create table per_familiar(
	id_per_familiar int primary key identity(1,1),
	flg_copia_dni_apo bit not null,
	dscrp_ocupacion varchar(255) null,
	telefono_emergencia varchar(15) not null,
	fkid_persona int unique not null,
	fkid_tipo_familiar int not null,
	fkid_estado_civil int not null,
	fkid_grado_instruccion int not null,
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona),
	FOREIGN KEY (fkid_tipo_familiar) REFERENCES tipo_familiar(id_tipo_familiar),
	FOREIGN KEY (fkid_estado_civil) REFERENCES estado_civil(id_estado_civil),
	FOREIGN KEY (fkid_grado_instruccion) REFERENCES grado_instruccion(id_grado_instruccion)
);
go
create table vinculo_familiar(
	fkid_per_alumno int not null,
	fkid_per_familiar int not null,
	flg_ofi_apoderado bit not null,
	fec_inicio_vinculo date null,
	fec_fin_vinculo date null
	primary key(fkid_per_alumno, fkid_per_familiar),
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno),
	FOREIGN KEY (fkid_per_familiar) REFERENCES per_familiar(id_per_familiar)
);
go
create table tipo_trabajador(
	id_tipo_trabajador int primary key identity(1,1),
	nom_tipo_trabajador varchar(150) not null
);
go
create table per_trabajador(
	id_per_trabajador int primary key identity(1,1),
	codigo_trabajador int unique not null,
	fkid_persona int unique not null,
	fkid_tipo_trabajador int not null,
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona),
	FOREIGN KEY (fkid_tipo_trabajador) REFERENCES tipo_trabajador(id_tipo_trabajador)
);
go
create table estado_matricula(
	id_estado_matricula int primary key identity(1,1),
	nom_estado_matricula varchar(45)
);
go
create table periodo_anual(
	id_periodo_anual int primary key identity(1,1),
	fec_inicio_anual date not null,
	fec_fin_anual date null
);
go
create table matricula(
	id_matricula int primary key identity(1,1),
	codigo_matricula varchar(8) unique not null,
	fec_realizada date not null,
	fkid_per_alumno int not null,
	fkid_estado_matricula int not null,
	fkid_periodo_anual int not null,
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno),
	FOREIGN KEY (fkid_estado_matricula) REFERENCES estado_matricula(id_estado_matricula),
	FOREIGN KEY (fkid_periodo_anual) REFERENCES periodo_anual(id_periodo_anual)
);
go
create table historial_matricula(
	id_historial_matricula int primary key identity(1,1),
	fec_modificacion date not null,
	dscrp_observacion varchar(255) not null,
	fkid_matricula int not null,
	fkid_per_trabajador int not null,
	FOREIGN KEY (fkid_matricula) REFERENCES matricula(id_matricula),
	FOREIGN KEY (fkid_per_trabajador) REFERENCES per_trabajador(id_per_trabajador)
);
go
go
------------------------------FUNCIONES T-SQL------------------------------------------
go
CREATE TRIGGER t_create_log_matricula
ON historial_matricula
AFTER INSERT
AS
DECLARE @id_matricula_new int, @codigo_matricula varchar(8), @fec_modificacion date, 
	    @dscrp_observacion varchar(255), @nom_estado_matricula varchar(45), @id_per_trabajador int
SET @id_matricula_new = (select fkid_matricula from inserted)
SET @codigo_matricula = (select codigo_matricula from matricula where id_matricula = @id_matricula_new)
SET @fec_modificacion = (select fec_modificacion from inserted)
SET @dscrp_observacion = (select dscrp_observacion from inserted)
SET @nom_estado_matricula = (select esma.nom_estado_matricula
							 from   matricula as matr INNER JOIN estado_matricula as esma 
									on (matr.fkid_estado_matricula = esma.id_estado_matricula)
							 where  matr.id_matricula = @id_matricula_new)
SET @id_per_trabajador = (select fkid_per_trabajador from inserted)

IF not exists (select * from sysobjects where name='log_matricula' and xtype='U')
begin
	create table log_matricula (
		id_log_matricula int PRIMARY KEY IDENTITY,
		lg_codigo_matricula varchar(8) not null,
		lg_fec_modificacion date not null,
		lg_dscrp_observacion varchar(255) not null,
		lg_nom_estado_matricula varchar(45) not null,
		lg_id_per_trabajador int not null
	)
end
INSERT INTO log_matricula VALUES (@codigo_matricula, @fec_modificacion, @dscrp_observacion, @nom_estado_matricula, @id_per_trabajador)
go
go
CREATE PROCEDURE sp_eliminar_matricula
@id_matricula int
AS
BEGIN
DELETE FROM historial_matricula WHERE fkid_matricula = @id_matricula;
DELETE FROM matricula WHERE id_matricula = @id_matricula;
END
go
--exec sp_eliminar_matricula 9;
go
go
CREATE PROCEDURE sp_modifica_datos_alumno
@codigo_alumno int, @primer_nombre varchar(150), @apellido_materno varchar(150), @apellido_paterno varchar(150),
@numero_documento varchar(20), @fec_nacimiento date, @sexo char(1), @telefono_casa varchar(45),
@telefono_celular varchar(45), @direccion varchar(255), @correo varchar(255),
@fkid_tipo_documento int, @fkid_distrito int, @fkid_lugar_nacimiento int,
@nombre_ie_anterior varchar(255), @ref_nivel varchar(45), @ref_grado_anterior char(1), @ref_seccion char(1),
@ref_ponderado_anterior float, @flg_orden_merito bit, @grupo_sanguineo varchar(45), @lengua_materna varchar(150),
@segunda_lengua varchar(150), @nro_hermanos int, @flg_copia_dni bit, @flg_vive_con_padres bit
AS
BEGIN
DECLARE @id_persona_by_codigo int, @id_per_alumno_by_codigo int;
SET @id_persona_by_codigo = (SELECT per.id_persona FROM persona as per INNER JOIN per_alumno as peralu 
							 ON (per.id_persona = peralu.fkid_persona)
							 WHERE (codigo_alumno = @codigo_alumno));
SET @id_per_alumno_by_codigo = (SELECT id_per_alumno FROM per_alumno WHERE (codigo_alumno = @codigo_alumno));

--Actualizando a tabla persona
UPDATE persona
   SET primer_nombre = @primer_nombre
      ,apellido_materno = @apellido_materno
      ,apellido_paterno = @apellido_paterno
      ,numero_documento = @numero_documento
      ,fec_nacimiento = @fec_nacimiento
      ,sexo = @sexo
      ,telefono_casa = @telefono_casa
      ,telefono_celular = @telefono_celular
      ,direccion = @direccion
      ,correo = @correo
      ,fkid_tipo_documento = @fkid_tipo_documento
      ,fkid_distrito = @fkid_distrito
      ,fkid_lugar_nacimiento = @fkid_lugar_nacimiento
 WHERE (id_persona = @id_persona_by_codigo);
--Actualizando a tabla per_alumno
UPDATE per_alumno
   SET nombre_ie_anterior = @nombre_ie_anterior
      ,ref_nivel = @ref_nivel
      ,ref_grado_anterior = @ref_grado_anterior
      ,ref_seccion = @ref_seccion
      ,ref_ponderado_anterior = @ref_ponderado_anterior
      ,flg_orden_merito = @flg_orden_merito
      ,grupo_sanguineo = @grupo_sanguineo
      ,lengua_materna = @lengua_materna
      ,segunda_lengua = @segunda_lengua
      ,nro_hermanos = @nro_hermanos
      ,flg_copia_dni = @flg_copia_dni
      ,flg_vive_con_padres = @flg_vive_con_padres
 WHERE (id_per_alumno = @id_per_alumno_by_codigo);

END
go
--exec sp_modifica_datos_alumno --,--,--,--,--...;
go
go
CREATE PROCEDURE sp_asignar_apoderado_by_alumno
@codigo_alumno int, @id_per_familiar int
AS
BEGIN
DECLARE @id_alumno int, @fecha_actual DATE, @old_apo_anterior int;
SET @id_alumno = (SELECT id_per_alumno FROM per_alumno WHERE (codigo_alumno = @codigo_alumno));
SET @fecha_actual = ((SELECT CONVERT(DATE, GETDATE()) [Current Date]));
SET @old_apo_anterior = (SELECT fkid_per_familiar FROM vinculo_familiar
						 WHERE (flg_ofi_apoderado = 1 AND fkid_per_alumno = @id_alumno));

IF(@id_per_familiar != @old_apo_anterior)
BEGIN
	UPDATE vinculo_familiar SET flg_ofi_apoderado = 0, fec_fin_vinculo = @fecha_actual
	WHERE(fkid_per_familiar = @old_apo_anterior AND fkid_per_alumno = @id_alumno);
	
	UPDATE vinculo_familiar SET flg_ofi_apoderado = 1, 
								fec_inicio_vinculo = @fecha_actual,
								fec_fin_vinculo = NULL
	WHERE(fkid_per_familiar = @id_per_familiar AND fkid_per_alumno = @id_alumno);
END

END
go
--exec sp_asignar_apoderado_by_alumno a,b;
go
----------------------POPULATE------------------------------------------
go
INSERT INTO estado_usuario VALUES ('Habilitado');
INSERT INTO estado_usuario VALUES ('Deshabilitado');
go
INSERT INTO tipo_documento VALUES ('DNI');
INSERT INTO tipo_documento VALUES ('Pasaporte');
go
INSERT INTO tipo_usuario VALUES ('Directiva', 'Area administrativa en cargos generales');
INSERT INTO tipo_usuario VALUES ('Auxiliar', 'Personal administrativo y seguridad');
INSERT INTO tipo_usuario VALUES ('Docente', 'Maestros de docencia, coordinacion y tutoria');
INSERT INTO tipo_usuario VALUES ('Apoderado', 'Vinculo familiar del alumno');
INSERT INTO tipo_usuario VALUES ('Estudiante', 'Beneficiado de la institucion educativa');
go
INSERT INTO distrito VALUES ('Callao');	
INSERT INTO distrito VALUES ('Bellavista');
INSERT INTO distrito VALUES ('Carmen de La Legua');	
INSERT INTO distrito VALUES ('La Perla');	
INSERT INTO distrito VALUES ('La Punta');	
INSERT INTO distrito VALUES ('Mi Per�');	
INSERT INTO distrito VALUES ('Ventanilla');	
INSERT INTO distrito VALUES ('Lima');	
INSERT INTO distrito VALUES ('Anc�n');	
INSERT INTO distrito VALUES ('Ate');	
INSERT INTO distrito VALUES ('Barranco');	
INSERT INTO distrito VALUES ('Bre�a');	
INSERT INTO distrito VALUES ('Carabayllo');	
INSERT INTO distrito VALUES ('Cieneguilla');	
INSERT INTO distrito VALUES ('Chaclacayo');	
INSERT INTO distrito VALUES ('Chorrillos');	
INSERT INTO distrito VALUES ('Comas');	
INSERT INTO distrito VALUES ('El Agustino');	
INSERT INTO distrito VALUES ('Independencia');	
INSERT INTO distrito VALUES ('Jes�s Mar�a');	
INSERT INTO distrito VALUES ('La Molina');	
INSERT INTO distrito VALUES ('La Victoria');	
INSERT INTO distrito VALUES ('Lince');	
INSERT INTO distrito VALUES ('Los Olivos');	
INSERT INTO distrito VALUES ('Lurigancho');	
INSERT INTO distrito VALUES ('Lur�n');	
INSERT INTO distrito VALUES ('Magdalena del Mar');	
INSERT INTO distrito VALUES ('Miraflores');	
INSERT INTO distrito VALUES ('Pachac�mac');	
INSERT INTO distrito VALUES ('Pucusana');	
INSERT INTO distrito VALUES ('Pueblo Libre');	
INSERT INTO distrito VALUES ('Puente Piedra');	
INSERT INTO distrito VALUES ('Punta Hermosa');	
INSERT INTO distrito VALUES ('Punta Negra');	
INSERT INTO distrito VALUES ('R�mac');	
INSERT INTO distrito VALUES ('San Bartolo');	
INSERT INTO distrito VALUES ('San Borja');	
INSERT INTO distrito VALUES ('San Isidro');	
INSERT INTO distrito VALUES ('San Juan de Lurigancho');	
INSERT INTO distrito VALUES ('San Juan de Miraflores');	
INSERT INTO distrito VALUES ('San Luis');	
INSERT INTO distrito VALUES ('San Mart�n de Porres');	
INSERT INTO distrito VALUES ('San Miguel');	
INSERT INTO distrito VALUES ('Santa Anita');	
INSERT INTO distrito VALUES ('Santa Mar�a del Mar');	
INSERT INTO distrito VALUES ('Santa Rosa');	
INSERT INTO distrito VALUES ('Santiago de Surco');	
INSERT INTO distrito VALUES ('Surquillo');	
INSERT INTO distrito VALUES ('Villa El Salvador');	
INSERT INTO distrito VALUES ('Villa Mar�a del Triunfo');
go
INSERT INTO estado_matricula (nom_estado_matricula) VALUES ('Habilitado');
INSERT INTO estado_matricula (nom_estado_matricula) VALUES ('Deshabilitado');
go
INSERT INTO tipo_alumno (nom_tipo_alumno) VALUES ('Vigente');
INSERT INTO tipo_alumno (nom_tipo_alumno) VALUES ('Repetido');
go
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Amazonas');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Ancash');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Apurimac');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Arequipa');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Ayacucho');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Cajamarca');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Callao');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Cuzco');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Huancavelica');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Huanuco');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Ica');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Junin');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('La libertad');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Lambayeque');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Lima');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Loreto');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Madre de dios');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Moquegua');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Pasco');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Piura');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Puno');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('San Martin');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Tacna');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Tumbes');
INSERT INTO lugar_nacimiento(nom_lugar_nacimiento) VALUES ('Ucayali');
go
--TRABAJADORES
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Ricardo','Villanueva','Ramirez','85984515','1975-05-15','M','5987622','943892138','Bellavista 1654','ricardo12@gmail.com',1,5,3);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Cristina','Ruiz','Gonzales','55700412','1868-04-10','F','5287622','933892138','Ov.Naranjal 15','cristina14@gmail.com',1,29, 12);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Felipe','Ruiz','Ramirez','34151545','1973-01-10','M','5587622','926892138','Ov.SanMartin','felin.ruiz@gmail.com',1,44, 10);
--ALUMNOS
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Andre','Carpio','Guitierrez','74474515','2000-10-25','M','5087622','913892138','Jr Rivaguero','carpioAnd@gmail.com',1,11, 12);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Leonardo','Ruiz','Cordova','66231110','2002-11-16','M','5187622','922892138','Mz Z lt 14', NULL, 1,36, 15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Jesus','Pinedo','Olivares','35511442','2004-05-01','M','5387622','966892138','Mz F lt 48','jesusin@gmail.com',1,6, 15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Maria','Heredia','Cruz','48181843','2003-01-28','F','5257622','943845138','General Vidal 554',NULL,1,10, 15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Melissa','Vilchez','Soto','77774412','2003-12-20','F','5184622','948892138','Jose Galvez 1157',NULL,1,15,15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Orlando','Torres','Navarro','9000005','2003-07-15','M','5287625','963892138','Ov.Guiterrez Cd 15','orlandoruiz3@gmail.com',1,50,15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Oliver','Ortiz','Bailon','40401212','2002-09-25','M','5287666','943892148','Mz D lt 15','oliveroka@gmail.com',1,2,15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Martin','Lopez','Mello','445601212','2004-09-25','M','5287226','943894448','Mz F lt 05','Martintin@gmail.com',1,25,13);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Alejandra','Ramirez','Bailon','55401212','2005-09-25','F','5283366','943892148','Av Benavides 1447','alejandrina@gmail.com',2,35,1);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Molly','Melo','Mucha','471141212','2007-09-25','F','5287556','943855148','JoseGranda 4514','mollylin@gmail.com',1,15,10);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Alejandro','Galvan','Ya�ez','4040555','2002-09-25','M','5547666','9438924148','Ov Higuereta cdra 15','Alejo145@gmail.com',1,26,25);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Mario','Huamani','Solano','6660401212','2005-09-25','M','528459666','943442148','Mz F lt 15','Mariooo25@gmail.com',1,22,16);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Maria','Joyce','Martinez','4781212','2006-09-25','F','5497666','945592148','Urb Sagitario','JoyceMa@gmail.com',1,2,11);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Ricardo','Vilchez','Bailon','12310401212','2003-09-25','M','5687666','91452148','Caminos del Inca 541','ricarmemn@gmail.com',1,20,20);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Romina','Castillo','Castillo','40487','2004-09-25','F','5287614','943456148','Av Benavides 145','oliveroka@gmail.com',1,34,15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Ruben','Maldonado','Melendez','45612','2005-09-25','M','5287896','978992148','Casuarinas 154','oliveroka@gmail.com',1,2,11);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Cristina','Ortiz','Bailon','45601212','2006-09-25','F','5287966','941542148','Surquillo 451','CrisoRbA@gmail.com',1,8,15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Diana','Ortiz','Bailon','41234562','2003-09-25','F','5287156','9438456148','Jose Galvez 145','dianax@gmail.com',1,1,1);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Roxana','Franco','Bailon','40499212','2004-09-25','F','5294666','943845148','Av Los Frutales 145','Roxana541@gmail.com',1,1,15);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Oscar','Rodriguez','Rodriguez','4045628','2005-09-25','M','52154666','943892148','Domingo Orue 154','Oscar_xd@gmail.com',1,2,2);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Homero','Sanchez','Sanchez','47892','2006-09-26','M','5284566','943412148','Monterrico 546','HomeroS@gmail.com',1,2,20);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Lisa','Portillo','Mejia','401232','2004-09-25','F','5287666','941264148','Mz Z lt 15','LisaS@gmail.com',1,25,15);
--FAMILIARES
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Pablo','Sanchez','Guitierrez','488232','1984-06-06','M','5668454','941264140','Jr Rivaguero','aaaS@gmail.com',1,14,6);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Pedro','Delgado','Ya�ez','502132','1972-09-15','M','5286622','941264142','Mz Z lt 14','bbbS@gmail.com',1,12,5);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Lisa','Salcedo','Bailon','151232','1990-01-13','F','6548592','941264144','Caminos del Inca 541','cccS@gmail.com',1,10,4);
go
go
INSERT INTO usuario(username, password, fec_creacion, fkid_persona, fkid_estado_usuario) VALUES ('direccion001','siasep','2019-09-20',  2, 1);
INSERT INTO usuario(username, password, fec_creacion, fkid_persona, fkid_estado_usuario) VALUES ('secretaria001','siasep','2019-09-20', 1 , 1);
INSERT INTO usuario(username, password, fec_creacion, fkid_persona, fkid_estado_usuario) VALUES ('subdirector001','siasep','2019-09-20', 3, 1);
go
INSERT INTO multi_role (fkid_usuario, fkid_tipo_usuario) VALUES (1, 1);
INSERT INTO multi_role (fkid_Usuario, fkid_tipo_usuario) VALUES (2, 1);
INSERT INTO multi_role (fkid_Usuario, fkid_tipo_usuario) VALUES (3, 3);
go
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100001,'Colegio Sanfrancisco del Oyola','Secundaria','3','A','16.5',1,'AB-','Espa�ol',NULL,3,1,0,4,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100002,'Colegio Pamer','Secundaria','2','D','10.5',0,'AB-','Espa�ol','Quechua',3,1,0,5,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100003,'Colegio Maria y Jose','Secundaria','1','B','12.5',0,'B-','Espa�ol',NULL,2,1,1,6,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100004,'Colegio Pitagoras','Secundaria','3','A','15.5',1,'AB+','Espa�ol',NULL,0,1,1,7,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100005,'Colegio San Andres','Secundaria','3','C','11.8',0,'O+','Espa�ol',NULL,2,1,0,8,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100006,'Colegio Americano','Secundaria','3','B','14.5',0,'A-','Espa�ol',NULL,1,1,0,9,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100007,'Colegio Sanfrancisco del Oyola','Secundaria','3','B','12.5',0,'O-','Espa�ol','Ingles',0,0,0,10,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100008,'Colegio san juan','Secundaria','1','A','13.5',1,'A+','Espa�ol','Ingles',2,0,0,11,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100009,'Colegio santa rosa','Secundaria','1','A','14',1,'AB','Espa�ol','Frances',1,0,0,12,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100010,'Colegio joce chavez','Secundaria','3','B','12.5',1,'A+','Espa�ol','Ingles',0,0,0,13,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100011,'Alpamayo','Secundaria','2','A','16', 0,'B-','Espa�ol','Frances',1,0,0,14,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100012,'Antonio Raimondi','Secundaria','2','A','13',1,'A-','Espa�ol','Frances',1,0,0,15,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100013,'Cambridge College Lima','Secundaria','1','B','13.5',1,'O-','Espa�ol','Frances',0,0,0,16,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100014,'Franklin D. Roosevelt','Secundaria','4','B','14.5',1,'AB','Espa�ol','Ingles',0,0,0,17,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100015,'Jos� Antonio Encinas','Secundaria','3','B','12',1,'AB','Espa�ol','Frances',2,0,0,18,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100016,'Markham College','Secundaria','1','A','12.5',1,'A-','Espa�ol','Aleman',1,0,0,19,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100017,'Mart�n Ad�n','Secundaria','3','B','14.5',1,'B+','Espa�ol','Frances',1,0,0,20,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100018,'Peruano Brit�nico','Secundaria','2','A','15',0,'AB-','Espa�ol','Ingles',1,0,0,21,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100019,'San Silvestre School','Secundaria','1','B','11',1,'O+','Espa�ol','Aleman',1,0,0,22,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100020,'Santa Margarita','Secundaria','2','A','15',0,'A+','Espa�ol','Frances',0,0,0,23,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100021,'Trener','Secundaria','3','A','14.5',1,'A-','Espa�ol','Aleman',0,0,0,24,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_orden_merito, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, fkid_persona, fkid_tipo_alumno) 
VALUES (100022,'Colegio san Sanfrancisco del Oyola','Secundaria','3','A','12.5',1,'O-','Espa�ol','Ingles',0,0,0,25,1);
go
go
INSERT INTO tipo_familiar (nom_tipo_familiar) VALUES ('Padre');
INSERT INTO tipo_familiar (nom_tipo_familiar) VALUES ('Madre');
INSERT INTO tipo_familiar (nom_tipo_familiar) VALUES ('Tio(a)');
INSERT INTO tipo_familiar (nom_tipo_familiar) VALUES ('Padrino');
INSERT INTO tipo_familiar (nom_tipo_familiar) VALUES ('Vecino(a)');
INSERT INTO tipo_familiar (nom_tipo_familiar) VALUES ('Otros');
go
INSERT INTO grado_instruccion(nom_grado_instruccion) VALUES('Sin Estudios');
INSERT INTO grado_instruccion(nom_grado_instruccion) VALUES('Primario');
INSERT INTO grado_instruccion(nom_grado_instruccion) VALUES('Secundarios');
INSERT INTO grado_instruccion(nom_grado_instruccion) VALUES('Medio-Superior');
INSERT INTO grado_instruccion(nom_grado_instruccion) VALUES('Superior');
go
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Casado');
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Divorciado');
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Soltero');
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Viudo');
go
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(1,'Gerente Financiero','5272338',26,1,1,5);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(0,'Programador','5212288',27,4,3,5);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(1,'Tendera del local','4226288',28,2,1,4);
/*
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(1,'Profesor','5276448',8,2,1,5);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(0,'Gerente','5126288',7,4,3,4);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(0,'Profesor','5273488',6,3,2,3);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(0,'Encargado de limpieza','5276128',8,1,1,1);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(1,'Gerente de Ventas','527338',4,2,4,2);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(0,'Director','527558',6,6,4);
INSERT INTO per_familiar(flg_copia_dni_apo,dscrp_ocupacion ,telefono_emergencia,fkid_persona,fkid_tipo_familiar,fkid_estado_civil,fkid_grado_instruccion)
VALUES(0,'Ama De casa','5276123',4,5,4,1,3);
go*/
go
INSERT INTO vinculo_familiar(fkid_per_alumno,fkid_per_familiar,flg_ofi_apoderado,fec_inicio_vinculo,fec_fin_vinculo)
VALUES (1,1,0,NULL,NULL);
INSERT INTO vinculo_familiar(fkid_per_alumno,fkid_per_familiar,flg_ofi_apoderado,fec_inicio_vinculo,fec_fin_vinculo)
VALUES (1,2,1,'2010-03-15',NULL);
INSERT INTO vinculo_familiar(fkid_per_alumno,fkid_per_familiar,flg_ofi_apoderado,fec_inicio_vinculo,fec_fin_vinculo)
VALUES (7,3,1,NULL,NULL);
INSERT INTO vinculo_familiar(fkid_per_alumno,fkid_per_familiar,flg_ofi_apoderado,fec_inicio_vinculo,fec_fin_vinculo)
VALUES (9,3,1,NULL,NULL);
INSERT INTO vinculo_familiar(fkid_per_alumno,fkid_per_familiar,flg_ofi_apoderado,fec_inicio_vinculo,fec_fin_vinculo)
VALUES (14,3,1,NULL,NULL);
INSERT INTO vinculo_familiar(fkid_per_alumno,fkid_per_familiar,flg_ofi_apoderado,fec_inicio_vinculo,fec_fin_vinculo)
VALUES (17,3,1,NULL,NULL);
go
INSERT INTO periodo_anual VALUES ('2019-03-15', NULL);
go
INSERT INTO tipo_trabajador VALUES ('Director(a)');
INSERT INTO tipo_trabajador VALUES ('Sub-Director(a)');
INSERT INTO tipo_trabajador VALUES ('Secretario(a)');
INSERT INTO tipo_trabajador VALUES ('Coordinador');
INSERT INTO tipo_trabajador VALUES ('Auxiliar');
go
INSERT INTO per_trabajador VALUES (0101022, 1, 3);
INSERT INTO per_trabajador VALUES (0101010, 2, 1);
INSERT INTO per_trabajador VALUES (0101033, 3, 2);
go
