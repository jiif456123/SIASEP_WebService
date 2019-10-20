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
create table per_trabajador(
	id_per_trabajador int primary key identity(1,1),
	codigo_trabajador int unique not null,
	fkid_persona int unique not null,
	FOREIGN KEY (fkid_persona) REFERENCES persona(id_persona)
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
	fec_modificacion date null,
	dscrp_observacion varchar(255) null,
	fkid_per_alumno int not null,
	fkid_per_trabajador int not null,
	fkid_estado_matricula int not null,
	fkid_periodo_anual int not null,
	FOREIGN KEY (fkid_per_alumno) REFERENCES per_alumno(id_per_alumno),
	FOREIGN KEY (fkid_per_trabajador) REFERENCES per_trabajador(id_per_trabajador),
	FOREIGN KEY (fkid_estado_matricula) REFERENCES estado_matricula(id_estado_matricula),
	FOREIGN KEY (fkid_periodo_anual) REFERENCES periodo_anual(id_periodo_anual)
);
go
