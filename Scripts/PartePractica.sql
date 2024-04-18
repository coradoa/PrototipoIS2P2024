
DROP DATABASE siu;
CREATE DATABASE siu;
USE siu;
-- -----------------------------------------------------
-- Table `educativo`.`Alumnos`
-- -----------------------------------------------------
CREATE TABLE alumnos
 (
  carnet_alumno VARCHAR(15),
  nombre_alumno VARCHAR(45),
  direccion_alumno VARCHAR(45),
  telefono_alumno VARCHAR(45),
  email_alumno VARCHAR(20),
  estatus_alumno VARCHAR(1),
  PRIMARY KEY (carnet_alumno)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;

-- -----------------------------------------------------
-- Table `educativo`.`Maestros`
-- -----------------------------------------------------
CREATE TABLE maestros
(
  codigo_maestro VARCHAR(5),
  nombre_maestro VARCHAR(45),
  direccion_maestro VARCHAR(45),
  telefono_maetro VARCHAR(45),
  email_maestro VARCHAR(20),
  estatus_maestro VARCHAR(1),
  PRIMARY KEY (codigo_maestro)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Facultades`
-- -----------------------------------------------------
CREATE TABLE facultades
(
  codigo_facultad VARCHAR(5),
  nombre_facultad VARCHAR(45),
  estatus_facultad VARCHAR(1),
  PRIMARY KEY (codigo_facultad)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Carreras`
-- -----------------------------------------------------
CREATE TABLE carreras
(
  codigo_carrera VARCHAR(5),
  nombre_carrera VARCHAR(45),
  codigo_facultad VARCHAR(5),
  estatus_carrera VARCHAR(1),
  PRIMARY KEY (codigo_carrera),
  FOREIGN KEY (codigo_facultad) REFERENCES facultades(codigo_facultad)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Cursos`
-- -----------------------------------------------------
CREATE TABLE cursos
(
  codigo_curso VARCHAR(5),
  nombre_curso VARCHAR(45),
  estatus_curso VARCHAR(1),
  PRIMARY KEY (codigo_curso)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Secciones`
-- -----------------------------------------------------
CREATE TABLE secciones
(
  codigo_seccion VARCHAR(5),
  nombre_seccion VARCHAR(45),
  estatus_seccion VARCHAR(1),
  PRIMARY KEY (codigo_seccion)
 ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Sedes`
-- -----------------------------------------------------
CREATE TABLE sedes
(
  codigo_sede VARCHAR(5),
  nombre_sede VARCHAR(45),
  estatus_sede VARCHAR(1),
  PRIMARY KEY (codigo_sede)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Aulas`
-- -----------------------------------------------------
CREATE TABLE aulas
(
  codigo_aula VARCHAR(5),
  nombre_aula VARCHAR(45),
  estatus_aula VARCHAR(1),
  PRIMARY KEY (codigo_aula)
) ENGINE = InnoDB DEFAULT CHARSET=latin1;
CREATE TABLE jornadas
(
	codigo_jornada VARCHAR(5),
    nombre_jornada VARCHAR(45),
    estatus_jornada VARCHAR(1),
    PRIMARY KEY (codigo_jornada)
) ENGINE=INNODB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Asignacion_cursos_alumnos`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosalumnos
(
  codigo_carrera VARCHAR(5),
  codigo_sede VARCHAR(5),
  codigo_jornada VARCHAR(5),
  codigo_seccion VARCHAR(5),
  codigo_aula VARCHAR(5),
  codigo_curso VARCHAR(5),
  carnet_alumno VARCHAR(15),
  nota_asignacioncursoalumnos FLOAT(10,2), 
  PRIMARY KEY (codigo_carrera, codigo_sede, codigo_jornada, codigo_seccion, codigo_aula, codigo_curso, carnet_alumno),
  FOREIGN KEY (codigo_carrera) REFERENCES carreras(codigo_carrera),
  FOREIGN KEY (codigo_sede) REFERENCES sedes(codigo_sede),
  FOREIGN KEY (codigo_jornada) REFERENCES jornadas(codigo_jornada),
  FOREIGN KEY (codigo_seccion) REFERENCES secciones(codigo_seccion),
  FOREIGN KEY (codigo_aula) REFERENCES aulas(codigo_aula),
  FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso),
  FOREIGN KEY (carnet_alumno) REFERENCES alumnos(carnet_alumno)
  ) ENGINE = InnoDB DEFAULT CHARSET=latin1;
-- -----------------------------------------------------
-- Table `educativo`.`Asignacion_cursos_maestros`
-- -----------------------------------------------------
CREATE TABLE asignacioncursosmastros
(
  codigo_carrera VARCHAR(5),
  codigo_sede VARCHAR(5),
  codigo_jornada VARCHAR(5),
  codigo_seccion VARCHAR(5),
  codigo_aula VARCHAR(5),
  codigo_curso VARCHAR(5),
  codigo_maestro VARCHAR(5),
  PRIMARY KEY (codigo_carrera, codigo_sede, codigo_jornada, codigo_seccion, codigo_aula, codigo_curso),
  FOREIGN KEY (codigo_carrera) REFERENCES carreras(codigo_carrera),
  FOREIGN KEY (codigo_sede) REFERENCES sedes(codigo_sede),
  FOREIGN KEY (codigo_jornada) REFERENCES jornadas(codigo_jornada),
  FOREIGN KEY (codigo_seccion) REFERENCES secciones(codigo_seccion),
  FOREIGN KEY (codigo_aula) REFERENCES aulas(codigo_aula),
  FOREIGN KEY (codigo_curso) REFERENCES cursos(codigo_curso),
  FOREIGN KEY (codigo_maestro) REFERENCES maestros(codigo_maestro)
  ) ENGINE = InnoDB DEFAULT CHARSET=latin1;




DROP TABLE IF EXISTS `tbl_modulos`;

CREATE TABLE `tbl_modulos` (
  `pk_id_modulos` int NOT NULL,
  `nombre_modulo` varchar(50) NOT NULL,
  `descripcion_modulo` varchar(150) NOT NULL,
  `estado_modulo` tinyint DEFAULT '0',
  PRIMARY KEY (`pk_id_modulos`)
);


INSERT INTO `tbl_modulos` VALUES (1000,'SEGURIDAD','Seguridad',1);


DROP TABLE IF EXISTS `tbl_perfiles`;

CREATE TABLE `tbl_perfiles` (
  `pk_id_perfil` int NOT NULL AUTO_INCREMENT,
  `nombre_perfil` varchar(50) NOT NULL,
  `descripcion_perfil` varchar(150) NOT NULL,
  `estado_perfil` tinyint DEFAULT '0',
  PRIMARY KEY (`pk_id_perfil`)
);

INSERT INTO `tbl_perfiles` VALUES (1,'ADMINISTRADOR','contiene todos los permisos del programa',1),(2,'SEGURIDAD','contiene todos los permisos de seguridad',1);

DROP TABLE IF EXISTS `tbl_usuarios`;

CREATE TABLE `tbl_usuarios` (
  `pk_id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre_usuario` varchar(50) NOT NULL,
  `apellido_usuario` varchar(50) NOT NULL,
  `username_usuario` varchar(20) NOT NULL,
  `password_usuario` varchar(100) NOT NULL,
  `email_usuario` varchar(50) NOT NULL,
  `estado_usuario` tinyint NOT NULL DEFAULT '0',
  `pregunta` varchar(50) NOT NULL,
  `respuesta` varchar(50) NOT NULL,
  PRIMARY KEY (`pk_id_usuario`)
);

INSERT INTO `tbl_usuarios` VALUES (1,'admin','admin','admin','HO0aGo4nM94=','esduardo@gmail.com',1,'COLOR FAVORITO','X9yc1/l1b2A=');


DROP TABLE IF EXISTS `tbl_aplicaciones`;

CREATE TABLE `tbl_aplicaciones` (
  `pk_id_aplicacion` int NOT NULL,
  `nombre_aplicacion` varchar(50) NOT NULL,
  `descripcion_aplicacion` varchar(150) NOT NULL,
  `estado_aplicacion` tinyint DEFAULT '0',
  PRIMARY KEY (`pk_id_aplicacion`)
);


INSERT INTO `tbl_aplicaciones` VALUES (1,'Menu','Ingreso Login',1),(999,'Cerrar Sesion','Cerrar Sesion',1),(1000,'MDI SEGURIDAD','PARA SEGURIDAD',1),(1001,'Mant. Usuario','PARA SEGURIDAD',1),(1002,'Mant. Aplicación','PARA SEGURIDAD',1),(1003,'Mant. Modulo','PARA SEGURIDAD',1),(1004,'Mant. Perfil','PARA SEGURIDAD',1),(1101,'Asign. Modulo Aplicacion','PARA SEGURIDAD',1),(1102,'Asign. Aplicacion Perfil','PARA SEGURIDAD',1),(1103,'Asign. Perfil Usuario','PARA SEGURIDAD',1),(1201,'Pcs. Cambio Contraseña','PARA SEGURIDAD',1),(1301,'Pcs. BITACORA','PARA SEGURIDAD',1);

DROP TABLE IF EXISTS `tbl_asignacionesperfilsusuario`;

CREATE TABLE `tbl_asignacionesperfilsusuario` (
  `fk_id_usuario` int NOT NULL,
  `fk_id_perfil` int NOT NULL,
  PRIMARY KEY (`fk_id_usuario`,`fk_id_perfil`),
  KEY `fk_id_perfil` (`fk_id_perfil`),
  CONSTRAINT `tbl_asignacionesperfilsusuario_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  CONSTRAINT `tbl_asignacionesperfilsusuario_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
);

INSERT INTO `tbl_asignacionesperfilsusuario` VALUES (1,1);

DROP TABLE IF EXISTS `tbl_asignacionmoduloaplicacion`;

CREATE TABLE `tbl_asignacionmoduloaplicacion` (
  `fk_id_modulos` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  PRIMARY KEY (`fk_id_modulos`,`fk_id_aplicacion`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_asignacionmoduloaplicacion_ibfk_1` FOREIGN KEY (`fk_id_modulos`) REFERENCES `tbl_modulos` (`pk_id_modulos`),
  CONSTRAINT `tbl_asignacionmoduloaplicacion_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
);

INSERT INTO `tbl_asignacionmoduloaplicacion` VALUES (1000,1000),(1000,1001),(1000,1002),(1000,1003),(1000,1004),(1000,1102),(1000,1103),(1000,1201),(1000,1301);

DROP TABLE IF EXISTS `tbl_bitacoradeeventos`;

CREATE TABLE `tbl_bitacoradeeventos` (
  `pk_id_bitacora` int NOT NULL AUTO_INCREMENT,
  `fk_id_usuario` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  `fecha_bitacora` date NOT NULL,
  `hora_bitacora` time NOT NULL,
  `host_bitacora` varchar(45) NOT NULL,
  `ip_bitacora` varchar(100) NOT NULL,
  `accion_bitacora` varchar(50) NOT NULL,
  PRIMARY KEY (`pk_id_bitacora`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_bitacoradeeventos_ibfk_1` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`),
  CONSTRAINT `tbl_bitacoradeeventos_ibfk_2` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`)
);

INSERT INTO `tbl_bitacoradeeventos` VALUES (1,1,1000,'2024-02-21','19:21:03','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(2,1,1000,'2024-02-21','19:21:53','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(3,1,1,'2024-02-23','08:36:22','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(4,1,1000,'2024-02-23','08:36:23','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Prototipo'),(5,1,1,'2024-02-23','08:37:00','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(6,1,1,'2024-02-23','08:37:47','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(7,1,999,'2024-02-23','08:37:54','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(8,1,1,'2024-02-23','09:12:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(9,1,1000,'2024-02-23','09:12:18','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Prototipo'),(10,1,1000,'2024-02-23','09:14:25','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(11,1,999,'2024-02-23','09:27:42','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion'),(12,1,1,'2024-02-23','21:23:24','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(13,1,1000,'2024-02-23','21:23:26','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Prototipo'),(14,1,1000,'2024-02-23','21:24:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(15,1,1000,'2024-02-23','21:25:57','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(16,1,1,'2024-02-23','21:26:16','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(17,1,1000,'2024-02-23','21:26:17','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Prototipo'),(18,1,1,'2024-02-23','21:28:14','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Login'),(19,1,1000,'2024-02-23','21:28:18','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Ingreso Prototipo'),(20,1,1000,'2024-02-23','21:29:37','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(21,1,1000,'2024-02-23','21:30:32','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Se ha guardado un registro'),(22,1,999,'2024-02-23','21:54:46','LAPTOP-R6RT5UAG','fe80::b0e1:4dc3:fcc8:4576%10','Cerro Sesion');


DROP TABLE IF EXISTS `tbl_permisosaplicacionesusuario`;

CREATE TABLE `tbl_permisosaplicacionesusuario` (
  `fk_id_aplicacion` int NOT NULL,
  `fk_id_usuario` int NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT '0',
  `modificar_permiso` tinyint(1) DEFAULT '0',
  `eliminar_permiso` tinyint(1) DEFAULT '0',
  `buscar_permiso` tinyint(1) DEFAULT '0',
  `imprimir_permiso` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fk_id_aplicacion`,`fk_id_usuario`),
  KEY `fk_id_usuario` (`fk_id_usuario`),
  CONSTRAINT `tbl_permisosaplicacionesusuario_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  CONSTRAINT `tbl_permisosaplicacionesusuario_ibfk_2` FOREIGN KEY (`fk_id_usuario`) REFERENCES `tbl_usuarios` (`pk_id_usuario`)
);


DROP TABLE IF EXISTS `tbl_permisosaplicacionperfil`;

CREATE TABLE `tbl_permisosaplicacionperfil` (
  `fk_id_perfil` int NOT NULL,
  `fk_id_aplicacion` int NOT NULL,
  `guardar_permiso` tinyint(1) DEFAULT '0',
  `modificar_permiso` tinyint(1) DEFAULT '0',
  `eliminar_permiso` tinyint(1) DEFAULT '0',
  `buscar_permiso` tinyint(1) DEFAULT '0',
  `imprimir_permiso` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`fk_id_perfil`,`fk_id_aplicacion`),
  KEY `fk_id_aplicacion` (`fk_id_aplicacion`),
  CONSTRAINT `tbl_permisosaplicacionperfil_ibfk_1` FOREIGN KEY (`fk_id_aplicacion`) REFERENCES `tbl_aplicaciones` (`pk_id_aplicacion`),
  CONSTRAINT `tbl_permisosaplicacionperfil_ibfk_2` FOREIGN KEY (`fk_id_perfil`) REFERENCES `tbl_perfiles` (`pk_id_perfil`)
);

INSERT INTO `tbl_permisosaplicacionperfil` VALUES (1,1000,1,1,1,1,1),(1,1001,1,1,1,1,1),(1,1002,1,1,1,1,1),(1,1003,1,1,1,1,1),(1,1004,1,1,1,1,1),(1,1101,1,1,1,1,1),(1,1102,1,1,1,1,1),(1,1103,1,1,1,1,1),(1,1201,1,1,1,1,1),(1,1301,1,1,1,1,1);

INSERT INTO tbl_modulos VALUES
('8000', 'MDI PARCIAL', 'PARA SISTEMA EDUCATIVO', 1)
;
 
-- -----APLICACIONES
INSERT INTO tbl_aplicaciones VALUES
('8000', 'MDI PARCIAL', 'PARA SISTEMA EDUCATIVO', '1'),
('8001', 'Mant. Maestros ', 'PARA SISTEMA EDUCATIVO', '1'),
('8002', 'Mant. Alumnos', 'PARA SISTEMA EDUCATIVO', '1'),
('8003', 'Mant. Notas', 'PARA SISTEMA EDUCATIVO', '1');
 
-- -----ASIGNACIÓNES MODULO A APLICACION
INSERT INTO tbl_asignacionmoduloaplicacion VALUES
('8000', '8000'),
('8000', '8001'),
('8000', '8002'),
('8000', '8003');

 
-- -----PERMISOS DE APLICACIONES A PERFILES
INSERT INTO tbl_permisosAplicacionPerfil VALUES
('1', '8000', '1', '1', '1', '1', '1'),
('1', '8001', '1', '1', '1', '1', '1'),
('1', '8002', '1', '1', '1', '1', '1'),
('1', '8003', '1', '1', '1', '1', '1');