/* 20/02/2017 */

CREATE DATABASE IF NOT EXISTS IncidenciasEVG;
USE IncidenciasEVG;

/* TABLA 1 - PROFESORES*/
CREATE TABLE IF NOT EXISTS profesores(
  idUsuario TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(20) NOT NULL UNIQUE,
  correo VARCHAR(60) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  pass VARCHAR(255) NOT NULL,
  tipo CHAR(1) NOT NULL,
  baja_temporal BIT NOT NULL
);

/* TABLA 2 - ETAPAS*/
CREATE TABLE IF NOT EXISTS etapas(
  codEtapa CHAR(5) PRIMARY KEY,
  nombre VARCHAR(30) NOT NULL,
  coordinador TINYINT NOT NULL,
  CONSTRAINT fk_etapas_profesores FOREIGN KEY (coordinador) REFERENCES profesores(idUsuario)
);


/* TABLA 4-ALUMNOS */
CREATE TABLE  IF NOT EXISTS alumnos(
  nia CHAR (7) PRIMARY KEY,
  nombreCompleto VARCHAR(50) NOT NULL,
  idSeccion CHAR(6) NOT NULL ,
  CONSTRAINT fk_secciones_alumnos  FOREIGN KEY (idSeccion) REFERENCES secciones(idSeccion)
);

/*TABLA 5 - PROFESORES-SECCION*/
CREATE TABLE IF NOT EXISTS profesores_seccion(
  profesor TINYINT UNSIGNED,
  idSeccion CHAR(5),
  PRIMARY KEY (profesor,idSeccion),
  CONSTRAINT fk_profesor_prof_secc FOREIGN KEY (profesor) REFERENCES profesores(idUsuario),
  CONSTRAINT fk_seccion_prof_secc FOREIGN KEY (idSeccion) REFERENCES secciones(idSeccion)
);

/*TABLA 8 - ASIGNATURAS*/
CREATE TABLE IF NOT EXISTS asignaturas(
  codAsignatura CHAR(7) PRIMARY KEY,
  nombre VARCHAR(40) NOT NULL
);

/*TABLA 9 - HORAS*/
CREATE TABLE IF NOT EXISTS horas(
  idHora TINYINT UNSIGNED PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL
);

/*TABLA 10 - INCIDENCIAS*/
CREATE TABLE IF NOT EXISTS incidencias(
  idIncidencia SMALLINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
  nia CHAR(7) NOT NULL,
  idTipo TINYINT NOT NULL,
  usuario TINYINT NOT NULL,
  codAsignatura CHAR(7) NOT NULL,
  idHora TINYINT NOT NULL,
  fecha_ocurrencia DATE NOT NULL,
  fecha_registro DATETIME NOT NULL,
  descripcion VARCHAR(300) NOT NULL,
  leidaT BIT NOT NULL,
  leidaC BIT NOT NULL,
  gestionada BIT NOT NULL,
  CONSTRAINT fk_incidencias_alumno FOREIGN KEY (nia) REFERENCES alumnos(nia),
  CONSTRAINT fk_incidencias_tipo FOREIGN KEY (idTipo) REFERENCES tipo_Incidencias(idTipo),
  CONSTRAINT fk_incidencias_profesor FOREIGN KEY (usuario) REFERENCES profesores(idUsuario),
  CONSTRAINT fk_incidencias_asignatura FOREIGN KEY (codAsignatura) REFERENCES asignaturas(idAsignatura),
  CONSTRAINT fk_incidencias_hora FOREIGN KEY (idHora) REFERENCES hora(idHora)
);

/*TABLA 12 - tipos_anotaciones_etapas*/
CREATE TABLE IF NOT EXISTS tipos_anotaciones_etapas(
  tipoAnotacion TINYINT UNSIGNED NOT NULL ,
  codEtapa CHAR(5) NOT NULL,
  PRIMARY KEY (tipoAnotacion,codEtapa),
  CONSTRAINT fk_anotacion_etapas_1 FOREIGN KEY (tipoAnotacion)
  REFERENCES tipos_anotaciones (tipoAnotacion),
  CONSTRAINT fk_anotacion_etapas_2 FOREIGN KEY (codEtapa) REFERENCES etapas(codEtapa)
);

/* TABLA 13-ANOTACIONES */
CREATE TABLE IF NOT EXISTS anotaciones(
  numAnotacion SMALLINT UNSIGNED PRIMARY KEY,
  tipoAnotacion TINYINT NOT NULL,
  nia CHAR(7) NOT NULL ,
  hora_Registro DATETIME NOT NULL,
  userCreacion CHAR(1) NOT NULL ,
  leida BIT(1) NOT NULL,
  CONSTRAINT anotaciones_1 FOREIGN KEY (tipoAnotacion)
  REFERENCES tipos_anotaciones_etapas (tipoAnotacion),
  CONSTRAINT anotaciones_2 FOREIGN KEY (nia) REFERENCES alumnos(nia)

  /* TABLA 17-GESTION */
);
CREATE TABLE IF NOT EXISTS gestion(
  idUsuario TINYINT UNSIGNED PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL,
  pass VARCHAR(255) NOT NULL,
  tipo CHAR(1) NOT NULL
);