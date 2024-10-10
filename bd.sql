drop database if exists tareas;
create database tareas;
use tareas;

create table proyecto(
idproyecto int auto_increment primary key,
proyecto varchar(200)
);

create table tipo_doc(
idtipo_doc int auto_increment primary key,
tipo_doc varchar(12)
);

create table persona(
idpersona int auto_increment primary key,
documento varchar(12),
tipo_doc int,
foreign key (tipo_doc) references tipo_doc(idtipo_doc),
nombre varchar(50),
apellido varchar(50)
);

create table tareas(
idtareas int auto_increment primary key,
tarea varchar(100),
descripción text,
fecha_inicio date,
idproyecto int,
foreign key (idproyecto) references proyecto(idproyecto),
idpersona int,
foreign key (idpersona) references persona (idpersona) 
);