create database BD_SIASEP;
go
use BD_SIASEP;
GO
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
);
go
create table usuario(
	id_usuario int primary key identity(1,1),
	username varchar(150) not null,
	password varchar(150) not null,
	fec_creacion date null,
	fkid_persona int unique not null,	
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona)
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
	nombre_ie_anterior varchar(255) null,
	ref_nivel varchar(45) not null,
	ref_grado_anterior char(1) not null,
	ref_seccion char(1) not null,
	ref_ponderado_anterior float null,
	flg_tercio_superior bit null,
	grupo_sanguineo varchar(45) not null,
	lengua_materna varchar(150) not null,
	segunda_lengua varchar(150) null,
	nro_hermanos int not null,
	flg_copia_dni bit not null,
	flg_vive_con_padres bit not null,
	flg_foto_alumno bit not null,
	fkid_persona int unique not null,
	fkid_tipo_alumno int not null,
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona),
	FOREIGN KEY (fkid_tipo_alumno) REFERENCES tipo_alumno(id_tipo_alumno)
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
go
----------------------POPULATE------------------------------------------
go
INSERT INTO estado_matricula (nom_estado_matricula) VALUES ('Habilitado');
INSERT INTO estado_matricula (nom_estado_matricula) VALUES ('Deshabilitado');
go
INSERT INTO tipo_alumno (nom_tipo_alumno) VALUES ('Vigente');
INSERT INTO tipo_alumno (nom_tipo_alumno) VALUES ('Repetido');
go
--TRABAJADORES
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Ricardo','Villanueva','Ramirez','85984515','1975-05-15','M','5987622','943892138','Bellavista 1654','ricardo12@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Cristina','Ruiz','Gonzales','55700412','1868-04-10','F','5287622','933892138','Ov.Naranjal 15','cristina14@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Felipe','Ruiz','Ramirez','34151545','1973-01-10','M','5587622','926892138','Ov.SanMartin','felin.ruiz@gmail.com');
--ALUMNOS
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Andre','Carpio','Guitierrez','74474515','2000-10-25','M','5087622','913892138','Jr Rivaguero','carpioAnd@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Leonardo','Ruiz','Cordova','66231110','2002-11-16','M','5187622','922892138','Mz Z lt 14', NULL);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Jesus','Pinedo','Olivares','35511442','2004-05-01','M','5387622','966892138','Mz F lt 48','jesusin@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Maria','Heredia','Cruz','48181843','2003-01-28','F','5257622','943845138','General Vidal 554',NULL);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Melissa','Vilchez','Soto','77774412','2003-12-20','F','5184622','948892138','Jose Galvez 1157',NULL);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Orlando','Torres','Navarro','9000005','2003-07-15','M','5287625','963892138','Ov.Guiterrez Cd 15','orlandoruiz3@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Oliver','Ortiz','Bailon','40401212','2002-09-25','M','5287666','943892148','Mz D lt 15','oliveroka@gmail.com');

--ALUMNOS RECIEN REGISTRADOS
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Martin','Lopez','Mello','445601212','2004-09-25','M','5287226','943894448','Mz F lt 05','Martintin@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Alejandra','Ramirez','Bailon','55401212','2005-09-25','F','5283366','943892148','Av Benavides 1447','alejandrina@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Molly','Melo','Mucha','471141212','2007-09-25','F','5287556','943855148','JoseGranda 4514','mollylin@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Alejandro','Galvan','Yañez','4040555','2002-09-25','M','5547666','9438924148','Ov Higuereta cdra 15','Alejo145@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Mario','Huamani','Solano','6660401212','2005-09-25','M','528459666','943442148','Mz F lt 15','Mariooo25@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Maria','Joyce','Martinez','4781212','2006-09-25','F','5497666','945592148','Urb Sagitario','JoyceMa@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Ricardo','Vilchez','Bailon','12310401212','2003-09-25','M','5687666','91452148','Caminos del Inca 541','ricarmemn@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Romina','Castillo','Castillo','40487','2004-09-25','F','5287614','943456148','Av Benavides 145','oliveroka@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Ruben','Maldonado','Melendez','45612','2005-09-25','M','5287896','978992148','Casuarinas 154','oliveroka@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Cristina','Ortiz','Bailon','45601212','2006-09-25','F','5287966','941542148','Surquillo 451','CrisoRbA@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Diana','Ortiz','Bailon','41234562','2003-09-25','F','5287156','9438456148','Jose Galvez 145','dianax@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Roxana','Franco','Bailon','40499212','2004-09-25','F','5294666','943845148','Av Los Frutales 145','Roxana541@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Oscar','Rodriguez','Rodriguez','4045628','2005-09-25','M','52154666','943892148','Domingo Orue 154','Oscar_xd@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Homero','Sanchez','Sanchez','47892','2006-09-26','M','5284566','943412148','Monterrico 546','HomeroS@gmail.com');
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo)
VALUES ('Lisa','Portillo','Mejia','401232','2004-09-25','F','5287666','941264148','Mz Z lt 15','LisaS@gmail.com');

go
INSERT INTO usuario(username, password, fec_creacion, fkid_persona) VALUES ('direccion001','siasep','2019-09-20',  2);
INSERT INTO usuario(username, password, fec_creacion, fkid_persona) VALUES ('secretaria001','siasep','2019-09-20', 1 );
INSERT INTO usuario(username, password, fec_creacion, fkid_persona) VALUES ('docente001','siasep','2019-09-20', 3);
go
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100001,'Colegio Sanfrancisco del Oyola','Secundaria','3','A','16.5','1','AB-','Español',NULL,3,'1','0','1',4,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100002,'Colegio Pamer','Secundaria','2','D','10.5','0','AB-','Español','Quechua',3,'1','0','1',5,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100003,'Colegio Maria y Jose','Secundaria','1','B','12.5','0','B-','Español',NULL,2,'1','1','1',6,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100004,'Colegio Pitagoras','Secundaria','3','A','15.5','1','AB+','Español',NULL,0,'1','1','1',7,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100005,'Colegio San Andres','Secundaria','3','C','11.8','0','O+','Español',NULL,2,'1','0','1',8,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100006,'Colegio Americano','Secundaria','3','B','14.5','0','A-','Español',NULL,1,'1','0','0',9,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100007,'Colegio Sanfrancisco del Oyola','Secundaria','3','B','12.5','0','O-','Español','Ingles',0,'0','0','1',10,2);

--NUEVOS REGISTROS
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100008,'Colegio san juan','Secundaria','1','A','13.5',1,'A+','Español','Ingles',2,0,0,1,11,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100009,'Colegio santa rosa','Secundaria','1','A','14',1,'AB','Español','Frances',1,0,0,1,12,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100010,'Colegio joce chavez','Secundaria','3','B','12.5',1,'A+','Español','Ingles',0,0,0,1,13,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100011,'Alpamayo','Secundaria','2','A','16', 0,'B-','Español','Frances',1,0,0,1,14,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100012,'Antonio Raimondi','Secundaria','2','A','13',1,'A-','Español','Frances',1,0,0,1,15,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100013,'Cambridge College Lima','Secundaria','1','B','13.5',1,'O-','Español','Frances',0,0,0,1,16,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100014,'Franklin D. Roosevelt','Secundaria','4','B','14.5',1,'AB','Español','Ingles',0,0,0,1,17,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100015,'José Antonio Encinas','Secundaria','3','B','12',1,'AB','Español','Frances',2,0,0,1,18,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100016,'Markham College','Secundaria','1','A','12.5',1,'A-','Español','Aleman',1,0,0,1,19,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100017,'Martín Adán','Secundaria','3','B','14.5',1,'B+','Español','Frances',1,0,0,1,20,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100018,'Peruano Británico','Secundaria','2','A','15',0,'AB-','Español','Ingles',1,0,0,1,21,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100019,'San Silvestre School','Secundaria','1','B','11',1,'O+','Español','Aleman',1,0,0,1,22,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100020,'Santa Margarita','Secundaria','2','A','15',0,'A+','Español','Frances',0,0,0,1,23,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100021,'Trener','Secundaria','3','A','14.5',1,'A-','Español','Aleman',0,0,0,1,24,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100022,'Colegio san Sanfrancisco del Oyola','Secundaria','3','A','12.5',1,'O-','Español','Ingles',0,0,0,1,25,1);

go
INSERT INTO periodo_anual VALUES ('2019-03-15', NULL);
go
INSERT INTO tipo_trabajador VALUES ('Director(a)');
INSERT INTO tipo_trabajador VALUES ('Sub-Director(a)');
INSERT INTO tipo_trabajador VALUES ('Secretario(a)');
INSERT INTO tipo_trabajador VALUES ('Coordinador');
INSERT INTO tipo_trabajador VALUES ('Auxiliar');
go
INSERT INTO per_trabajador VALUES (0101010, 2, 1);
INSERT INTO per_trabajador VALUES (0101022, 1, 3);
go