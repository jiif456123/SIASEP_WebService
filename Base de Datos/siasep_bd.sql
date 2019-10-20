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
create table alergia(
	id_alergia int primary key identity(1,1),
	nom_alergia varchar(150)
);
go
create table discapacidad(
	id_discapacidad int primary key identity(1,1),
	nom_discapacidad varchar(45)
);
go
create table enfermedad(
	id_enfermedad int primary key identity(1,1),
	nom_enfermedad varchar(45)
);
go
create table religion(
	id_religion int primary key identity(1,1),
	nom_religion varchar(45)
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
create table alumno_has_religion(
	fkid_religion int not null,
	fkid_per_alumno int not null,
	primary key(fkid_religion, fkid_per_alumno),
	FOREIGN KEY (fkid_religion) REFERENCES religion(id_religion),
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno)
);
go
create table alumno_has_discapacidad(
	fkid_discapacidad int not null,
	fkid_per_alumno int not null,
	primary key(fkid_discapacidad, fkid_per_alumno),
	FOREIGN KEY (fkid_discapacidad) REFERENCES discapacidad(id_discapacidad),
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno)
);
go
create table alumno_has_enfermedad(
	fkid_enfermedad int not null,
	fkid_per_alumno int not null,
	primary key(fkid_enfermedad, fkid_per_alumno),
	FOREIGN KEY (fkid_enfermedad) REFERENCES enfermedad(id_enfermedad),
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno)
);
go
create table alumno_has_alergia(
	fkid_alergia int not null,
	fkid_per_alumno int not null,
	primary key(fkid_alergia, fkid_per_alumno),
	FOREIGN KEY (fkid_alergia) REFERENCES alergia(id_alergia),
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno)
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
create table centro_labores(
	id_centro_labores int primary key identity(1,1),
	nom_centro_labores varchar(45)
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
create table familiar_has_centro_labores(
	fkid_per_familiar int not null,
	fkid_centro_labores int not null,
	primary key(fkid_per_familiar, fkid_centro_labores),
	FOREIGN KEY (fkid_per_familiar) REFERENCES per_familiar(id_per_familiar),
	FOREIGN KEY (fkid_centro_labores) REFERENCES centro_labores(id_centro_labores)
);
go
create table vinculo_familiar(
	fkid_per_alumno int not null,
	fkid_per_familiar int not null,
	flg_ofi_apoderado bit not null,
	fec_inicio_vinculo date not null,
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
go
----------------------POPULATE------------------------------------------
INSERT INTO tipo_documento VALUES ('DNI');
INSERT INTO tipo_documento VALUES ('Pasaporte');
go
INSERT INTO distrito VALUES ('Callao');	
INSERT INTO distrito VALUES ('Bellavista');
INSERT INTO distrito VALUES ('Carmen de La Legua');	
INSERT INTO distrito VALUES ('La Perla');	
INSERT INTO distrito VALUES ('La Punta');	
INSERT INTO distrito VALUES ('Mi Perú');	
INSERT INTO distrito VALUES ('Ventanilla');	
INSERT INTO distrito VALUES ('Lima');	
INSERT INTO distrito VALUES ('Ancón');	
INSERT INTO distrito VALUES ('Ate');	
INSERT INTO distrito VALUES ('Barranco');	
INSERT INTO distrito VALUES ('Breña');	
INSERT INTO distrito VALUES ('Carabayllo');	
INSERT INTO distrito VALUES ('Cieneguilla');	
INSERT INTO distrito VALUES ('Chaclacayo');	
INSERT INTO distrito VALUES ('Chorrillos');	
INSERT INTO distrito VALUES ('Comas');	
INSERT INTO distrito VALUES ('El Agustino');	
INSERT INTO distrito VALUES ('Independencia');	
INSERT INTO distrito VALUES ('Jesús María');	
INSERT INTO distrito VALUES ('La Molina');	
INSERT INTO distrito VALUES ('La Victoria');	
INSERT INTO distrito VALUES ('Lince');	
INSERT INTO distrito VALUES ('Los Olivos');	
INSERT INTO distrito VALUES ('Lurigancho');	
INSERT INTO distrito VALUES ('Lurín');	
INSERT INTO distrito VALUES ('Magdalena del Mar');	
INSERT INTO distrito VALUES ('Miraflores');	
INSERT INTO distrito VALUES ('Pachacámac');	
INSERT INTO distrito VALUES ('Pucusana');	
INSERT INTO distrito VALUES ('Pueblo Libre');	
INSERT INTO distrito VALUES ('Puente Piedra');	
INSERT INTO distrito VALUES ('Punta Hermosa');	
INSERT INTO distrito VALUES ('Punta Negra');	
INSERT INTO distrito VALUES ('Rímac');	
INSERT INTO distrito VALUES ('San Bartolo');	
INSERT INTO distrito VALUES ('San Borja');	
INSERT INTO distrito VALUES ('San Isidro');	
INSERT INTO distrito VALUES ('San Juan de Lurigancho');	
INSERT INTO distrito VALUES ('San Juan de Miraflores');	
INSERT INTO distrito VALUES ('San Luis');	
INSERT INTO distrito VALUES ('San Martín de Porres');	
INSERT INTO distrito VALUES ('San Miguel');	
INSERT INTO distrito VALUES ('Santa Anita');	
INSERT INTO distrito VALUES ('Santa María del Mar');	
INSERT INTO distrito VALUES ('Santa Rosa');	
INSERT INTO distrito VALUES ('Santiago de Surco');	
INSERT INTO distrito VALUES ('Surquillo');	
INSERT INTO distrito VALUES ('Villa El Salvador');	
INSERT INTO distrito VALUES ('Villa María del Triunfo');
go
INSERT INTO estado_matricula (nom_estado_matricula) VALUES ('Habilitado');
INSERT INTO estado_matricula (nom_estado_matricula) VALUES ('Deshabilitado');
go
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Casado');
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Divorciado');
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Soltero');
INSERT INTO estado_civil (nom_estado_civil) VALUES ('Viudo');
go
INSERT INTO alergia (nom_alergia) VALUES ('Chocolate');
INSERT INTO alergia (nom_alergia) VALUES ('Polvo');
INSERT INTO alergia (nom_alergia) VALUES ('Frutas');
INSERT INTO alergia (nom_alergia) VALUES ('Piscina diluida por clorox');
INSERT INTO alergia (nom_alergia) VALUES ('Cuero');
INSERT INTO alergia (nom_alergia) VALUES ('Gamusa');
INSERT INTO alergia (nom_alergia) VALUES ('Animales');
INSERT INTO alergia (nom_alergia) VALUES ('Metal');
go
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Asma');
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Conjuntivitis');
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Catarro');
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Faringitis');
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Gripe');
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Hepatitis');
INSERT INTO enfermedad (nom_enfermedad) VALUES ('Papera');
go
INSERT INTO religion (nom_religion) VALUES ('Catolico');
INSERT INTO religion (nom_religion) VALUES ('Cristiano');
INSERT INTO religion (nom_religion) VALUES ('Evangelica');
INSERT INTO religion (nom_religion) VALUES ('Mormones');
INSERT INTO religion (nom_religion) VALUES ('Judia');
INSERT INTO religion (nom_religion) VALUES ('Agnóstico');
INSERT INTO religion (nom_religion) VALUES ('Ateismo');
go
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Ciego');
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Sordo');
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Sordo-Mudo');
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Mudo');
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Síndrome de Down');
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Hiperactividad');
INSERT INTO discapacidad (nom_discapacidad) VALUES ('Autista');
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
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Ricardo','Villanueva','Ramirez','85984515','1975-05-15','M','5987622','943892138','Bellavista 1654','ricardo12@gmail.com',1,5,3);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Cristina','Ruiz','Gonzales','55700412','1868-04-10','F','5287622','933892138','Ov.Naranjal 15','cristina14@gmail.com',1,29, 12);
INSERT INTO persona (primer_nombre, apellido_materno, apellido_paterno, numero_documento, fec_nacimiento, sexo, telefono_casa, telefono_celular, direccion, correo, fkid_tipo_documento, fkid_distrito, fkid_lugar_nacimiento)
VALUES ('Felipe','Ruiz','Ramirez','34151545','1973-01-10','M','5587622','926892138','Ov.SanMartin','felin.ruiz@gmail.com',1,44, 10);

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
go
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100001,'Colegio Sanfrancisco del Oyola','Cuarto','3','A','16.5','1','AB-','Español',NULL,3,'1','0','1',4,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100002,'Colegio Pamer','Tercero','2','D','10.5','0','AB-','Español','Quechua',3,'1','0','1',5,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100003,'Colegio Maria y Jose','Segundo','1','B','12.5','0','B-','Español',NULL,2,'1','1','1',6,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100004,'Colegio Pitagoras','Cuarto','3','A','15.5','1','AB+','Español',NULL,0,'1','1','1',7,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100005,'Colegio San Andres','Cuarto','3','C','11.8','0','O+','Español',NULL,2,'1','0','1',8,2);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100006,'Colegio Americano','Tercero','3','B','14.5','0','A-','Español',NULL,1,'1','0','0',9,1);
INSERT INTO per_alumno (codigo_alumno, nombre_ie_anterior, ref_nivel, ref_grado_anterior, ref_seccion, ref_ponderado_anterior, flg_tercio_superior, grupo_sanguineo, lengua_materna, segunda_lengua, nro_hermanos, flg_copia_dni, flg_vive_con_padres, flg_foto_alumno, fkid_persona, fkid_tipo_alumno) 
VALUES (100007,'Colegio Sanfrancisco del Oyola','Cuarto','3','B','12.5','0','O-','Español','Ingles',0,'0','0','1',10,2);
go
INSERT INTO alumno_has_enfermedad(fkid_enfermedad,fkid_per_alumno) VALUES(1,1);
INSERT INTO alumno_has_enfermedad(fkid_enfermedad,fkid_per_alumno) VALUES(1,2);
INSERT INTO alumno_has_enfermedad(fkid_enfermedad,fkid_per_alumno) VALUES(6,6);
INSERT INTO alumno_has_enfermedad(fkid_enfermedad,fkid_per_alumno) VALUES(2,2);
go
INSERT INTO alumno_has_alergia(fkid_alergia,fkid_per_alumno) VALUES(1,1);
INSERT INTO alumno_has_alergia(fkid_alergia,fkid_per_alumno) VALUES(8,3);
INSERT INTO alumno_has_alergia(fkid_alergia,fkid_per_alumno) VALUES(7,4);
go
INSERT INTO alumno_has_discapacidad(fkid_discapacidad,fkid_per_alumno) VALUES(6,2);
go
INSERT INTO alumno_has_religion VALUES(1,1);
INSERT INTO alumno_has_religion VALUES(1,2);
INSERT INTO alumno_has_religion VALUES(2,3);
INSERT INTO alumno_has_religion VALUES(1,4);
INSERT INTO alumno_has_religion VALUES(1,5);
INSERT INTO alumno_has_religion VALUES(1,6);
INSERT INTO alumno_has_religion VALUES(1,7);
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
INSERT INTO centro_labores(nom_centro_labores) VALUES('Banco Azteca');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Everest');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Molitalia');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Academia Pitagoras');
INSERT INTO centro_labores(nom_centro_labores) VALUES('okComputer');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Colegio Pamer');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Universidad Ricardo Palma ');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Financiera Confianza');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Empresa Multinacional Logistica');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Caja Huancayo');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Rimac Seguro');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Vivienda');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Federacion Peruana de Futbol');
INSERT INTO centro_labores(nom_centro_labores) VALUES('Hospital Ricardo Palma');
go
INSERT INTO periodo_anual VALUES ('2019-03-15', NULL);
INSERT INTO periodo_anual VALUES ('2018-03-15', NULL);
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
