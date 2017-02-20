/* 20/02/2017 */

/* TABLA 4-ALUMNOS */
CREATE TABLE  IF NOT EXISTS alumnos(
  nia CHAR (7) PRIMARY KEY,
  nombreCompleto VARCHAR(50) NOT NULL,
  idSeccion CHAR(6) NOT NULL ,
  CONSTRAINT fk_secciones_alumnos  FOREIGN KEY (idSeccion) REFERENCES secciones(idSeccion)
);

/* TABLA 13-ANOTACIONES */
CREATE TABLE IF NOT EXISTS anotaciones(
  numAnotacion SMALLINT PRIMARY KEY,
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
  idUsuario TINYINT PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL,
  pass VARCHAR(255) NOT NULL,
  tipo CHAR(1) NOT NULL
);