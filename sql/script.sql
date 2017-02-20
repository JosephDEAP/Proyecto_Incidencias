/* 20/02/2017 */

/*Secciones*/

create table Secciones
(IdSecciones char (5) PRIMARY KEY,
 NombreSecciones varchar (60) not null,
 IdTutor tinyint not null,
 IdEtapa tinyint  not null,
  constraint clave_tut
  foreign key (IdTutor) references Profesores (IdProfesor),
  constraint fk_dept_id
  foreign key (IdEtapa) references Etapas (IdEtapa)
);