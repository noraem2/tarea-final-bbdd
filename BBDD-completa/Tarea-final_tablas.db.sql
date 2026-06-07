BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Artista" (
	"id_artista"	INTEGER NOT NULL,
	"nombre_artista"	INTEGER NOT NULL UNIQUE,
	"fecha_nacimiento"	TEXT,
	"edad"	INTEGER,
	"código_postal"	TEXT,
	"localidad"	TEXT,
	PRIMARY KEY("id_artista" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Artista_Estilo" (
	"id_artista"	INTEGER NOT NULL,
	"id_estilo"	INTEGER NOT NULL,
	PRIMARY KEY("id_artista","id_estilo"),
	CONSTRAINT "fk_artista_estilo_artista" FOREIGN KEY("id_artista") REFERENCES "Artista"("id_artista"),
	CONSTRAINT "fk_astista_estilo_estilo" FOREIGN KEY("id_estilo") REFERENCES ""
);
CREATE TABLE IF NOT EXISTS "Cliente" (
	"dni"	TEXT NOT NULL,
	"nombre"	TEXT,
	"localidad"	TEXT,
	"calle"	TEXT,
	"numero"	INTEGER,
	"código_postal"	TEXT,
	"dinero_total_gastado"	TEXT,
	PRIMARY KEY("dni")
);
CREATE TABLE IF NOT EXISTS "Cliente_Tema" (
	"dni"	TEXT NOT NULL,
	"id_tema"	INTEGER NOT NULL,
	PRIMARY KEY("dni","id_tema"),
	CONSTRAINT "cliente_tema_cliente" FOREIGN KEY("dni") REFERENCES "Cliente"("dni"),
	CONSTRAINT "cliente_tema_tema" FOREIGN KEY("id_tema") REFERENCES ""
);
CREATE TABLE IF NOT EXISTS "Cliente_artista" (
	"dni_cliente"	TEXT NOT NULL,
	"id_artista"	INTEGER NOT NULL,
	PRIMARY KEY("dni_cliente","id_artista"),
	CONSTRAINT "cliente_artista_cliente" FOREIGN KEY("dni_cliente") REFERENCES "",
	CONSTRAINT "cliente_artista_artista" FOREIGN KEY("id_artista") REFERENCES "Artista"("id_artista")
);
CREATE TABLE IF NOT EXISTS "Compra" (
	"id_compra"	INTEGER,
	"dni"	TEXT NOT NULL,
	"id_obra"	INTEGER NOT NULL,
	"fecha_compra"	TEXT,
	"precio"	REAL,
	PRIMARY KEY("id_compra"),
	CONSTRAINT "fk_compra_cliente" FOREIGN KEY("dni") REFERENCES "Cliente"("dni"),
	CONSTRAINT "fk_compra_obra" FOREIGN KEY("id_obra") REFERENCES ""
);
CREATE TABLE IF NOT EXISTS "Estilo" (
	"id_estilo"	INTEGER NOT NULL,
	"nombre_estilo"	TEXT NOT NULL,
	PRIMARY KEY("id_estilo" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Obra" (
	"id_obra"	INTEGER NOT NULL,
	"título"	TEXT NOT NULL UNIQUE,
	"anio_creacion"	INTEGER,
	"precio"	REAL,
	"id_artista"	INTEGER NOT NULL,
	PRIMARY KEY("id_obra" AUTOINCREMENT),
	CONSTRAINT "obra_artística" FOREIGN KEY("id_artista") REFERENCES ""
);
CREATE TABLE IF NOT EXISTS "Obra_Tema" (
	"id_obra"	INTEGER NOT NULL,
	"id_tema"	INTEGER NOT NULL,
	PRIMARY KEY("id_obra","id_tema"),
	CONSTRAINT "obra_tema_obra" FOREIGN KEY("id_obra") REFERENCES "Obra"("id_obra"),
	CONSTRAINT "obra_tema_tema" FOREIGN KEY("id_tema") REFERENCES ""
);
CREATE TABLE IF NOT EXISTS "Tema" (
	"id_tema"	INTEGER NOT NULL,
	"nombre"	TEXT NOT NULL UNIQUE,
	"descripción"	TEXT,
	PRIMARY KEY("id_tema" AUTOINCREMENT)
);
# Tabla Artista:
INSERT INTO "Artista" VALUES (4,'Artista Anónimo 4','1970-01-01',56,'28001','Madrid');
INSERT INTO "Artista" VALUES (5,'Carmen Sainz','1870',40,'27989','Barcelona');
INSERT INTO "Artista" VALUES (15,'Aurora Vega','1985-03-12',41,'28012','Valencia');
INSERT INTO "Artista" VALUES (16,'Marco Llorens','1978-11-02',47,'08003','Madrid');
INSERT INTO "Artista" VALUES (17,'Selene Duarte','1990-07-25',35,'41001','Barcelona');
INSERT INTO "Artista" VALUES (18,'Dante Ferrer','1982-01-18',44,'46002','Málaga');
INSERT INTO "Artista" VALUES (19,'Iris Calderón','1995-09-30',30,'29015','Madrid');
INSERT INTO "Artista" VALUES (20,'Luna Serrano','1988-04-10',38,'28005','Barcelona');
INSERT INTO "Artista" VALUES (21,'Héctor Marín','1975-09-14',50,'08012','Alicante');
INSERT INTO "Artista" VALUES (22,'Valeria Montes','1992-12-01',33,'41003','Valencia');
INSERT INTO "Artista" VALUES (23,'Nicolás Prado','1980-06-22',45,'46021','Murcia');
INSERT INTO "Artista" VALUES (24,'Elena Rivas','1997-02-17',29,'29002','Murcia');
INSERT INTO "Artista" VALUES (25,'Bruno Castaño','1984-08-09',41,'50001','Barcelona');
INSERT INTO "Artista" VALUES (26,'Clara Belmonte','1991-11-30',34,'03004','Madrid');
INSERT INTO "Artista" VALUES (27,'Adrián Soler','1986-03-05',40,'15003','Alicante');
INSERT INTO "Artista" VALUES (28,'Marta Ledesma','1993-07-19',32,'20011','Valladolidad');
INSERT INTO "Artista" VALUES (29,'Iván Correa','1979-10-28',46,'33002','Málaga');
INSERT INTO "Artista" VALUES (30,'Paula Santamaría','1987-05-13',39,'07004','Sevilla');
INSERT INTO "Artista" VALUES (31,'Diego Armenteros','1994-09-07',31,'14006','Bilbao');
INSERT INTO "Artista" VALUES (32,'Sara Villalba','1983-01-26',43,'35010','Bilbao');
INSERT INTO "Artista" VALUES (33,'Javier Montalvo','1977-04-02',49,'24003','Zaragoza');
INSERT INTO "Artista" VALUES (34,'Noelia Campos','1996-06-11',30,'22005','Sevilla');
INSERT INTO "Artista" VALUES (35,'Gabriel Pardo','1981-12-18',44,'01008','Madrid');
INSERT INTO "Artista" VALUES (36,'Rocío Benítez','1990-02-09',36,'18014','Zaragoza');
INSERT INTO "Artista" VALUES (37,'Tomás Aguilera','1985-07-23',41,'26007','Valladolidad');
INSERT INTO "Artista" VALUES (38,'Ariadna Fuentes','1998-10-05',27,'32004','Sevilla');
INSERT INTO "Artista" VALUES (39,'Samuel Requena','1976-03-29',50,'52001','Alicante');
#Tabla Ariista_Estilo:
INSERT INTO "Artista_Estilo" VALUES (15,4);
INSERT INTO "Artista_Estilo" VALUES (15,5);
INSERT INTO "Artista_Estilo" VALUES (16,7);
INSERT INTO "Artista_Estilo" VALUES (16,8);
INSERT INTO "Artista_Estilo" VALUES (17,10);
INSERT INTO "Artista_Estilo" VALUES (17,11);
INSERT INTO "Artista_Estilo" VALUES (18,13);
INSERT INTO "Artista_Estilo" VALUES (18,14);
INSERT INTO "Artista_Estilo" VALUES (19,16);
INSERT INTO "Artista_Estilo" VALUES (19,17);
INSERT INTO "Artista_Estilo" VALUES (20,6);
INSERT INTO "Artista_Estilo" VALUES (21,9);
INSERT INTO "Artista_Estilo" VALUES (22,12);
INSERT INTO "Artista_Estilo" VALUES (23,15);
INSERT INTO "Artista_Estilo" VALUES (24,18);
INSERT INTO "Artista_Estilo" VALUES (25,19);
INSERT INTO "Artista_Estilo" VALUES (26,20);
INSERT INTO "Artista_Estilo" VALUES (27,21);
INSERT INTO "Artista_Estilo" VALUES (28,22);
INSERT INTO "Artista_Estilo" VALUES (29,23);
INSERT INTO "Artista_Estilo" VALUES (30,6);
INSERT INTO "Artista_Estilo" VALUES (31,9);
INSERT INTO "Artista_Estilo" VALUES (32,12);
INSERT INTO "Artista_Estilo" VALUES (33,15);
INSERT INTO "Artista_Estilo" VALUES (34,18);
#Tabla Cliente::
INSERT INTO "Cliente" VALUES ('11111111A','Nuria Salas','Madrid','Calle Prado',10,'28014','1200');
INSERT INTO "Cliente" VALUES ('22222222B','Jorge Medina','Barcelona','Calle Aragón',55,'08009','1800');
INSERT INTO "Cliente" VALUES ('33333333C','Raquel Torres','Sevilla','Calle Feria',8,'41003','950');
INSERT INTO "Cliente" VALUES ('44444444D','Hugo Navarro','Valencia','Calle Ruzafa',21,'46004','2100');
INSERT INTO "Cliente" VALUES ('55555555E','Claudia Ramos','Bilbao','Calle Autonomía',3,'48010','3000');
INSERT INTO "Cliente" VALUES ('66666666F','Pablo Serrano','Zaragoza','Calle Alfonso',14,'50003','1300');
INSERT INTO "Cliente" VALUES ('77777777G','Irene Márquez','Málaga','Calle Larios',7,'29005','1700');
INSERT INTO "Cliente" VALUES ('88888888H','Víctor Pino','Murcia','Calle Trapería',19,'30001','2500');
INSERT INTO "Cliente" VALUES ('99999999I','Elisa Duarte','Alicante','Calle San Vicente',5,'03004','900');
INSERT INTO "Cliente" VALUES ('12121212J','Mario Lozano','Valladolid','Calle Santiago',9,'47001','2200');
INSERT INTO "Cliente" VALUES ('23232323K','Patricia Vela','Madrid','Calle Arenal',18,'28013','3100');
INSERT INTO "Cliente" VALUES ('34343434L','Diego Castaño','Sevilla','Calle Sierpes',20,'41004','1400');
INSERT INTO "Cliente" VALUES ('45454545M','Lucía Benítez','Valencia','Calle Colón',33,'46004','1600');
INSERT INTO "Cliente" VALUES ('56565656N','Óscar Rivas','Bilbao','Calle Hurtado',2,'48011','3500');
INSERT INTO "Cliente" VALUES ('67676767O','Nerea Soler','Zaragoza','Calle Don Jaime',11,'50001','1100');
INSERT INTO "Cliente" VALUES ('78787878P','Iván Llorente','Málaga','Calle Granada',4,'29015','1900');
INSERT INTO "Cliente" VALUES ('89898989Q','Clara Montoro','Murcia','Calle Jabonerías',16,'30004','2600');
INSERT INTO "Cliente" VALUES ('90909090R','Tomás Requena','Alicante','Calle Mayor',12,'03002','2800');
INSERT INTO "Cliente" VALUES ('31313131S','Alicia Pardo','Valladolid','Calle López Gómez',6,'47002','3200');
INSERT INTO "Cliente" VALUES ('41414141T','Samuel Aguilar','Madrid','Calle Toledo',25,'28005','1500');
#Tabla Cliente_Tema:
INSERT INTO "Cliente_Tema" VALUES ('11111111A',4);
INSERT INTO "Cliente_Tema" VALUES ('22222222B',7);
INSERT INTO "Cliente_Tema" VALUES ('33333333C',12);
INSERT INTO "Cliente_Tema" VALUES ('44444444D',1);
INSERT INTO "Cliente_Tema" VALUES ('55555555E',9);
INSERT INTO "Cliente_Tema" VALUES ('66666666F',3);
INSERT INTO "Cliente_Tema" VALUES ('77777777G',15);
INSERT INTO "Cliente_Tema" VALUES ('88888888H',6);
INSERT INTO "Cliente_Tema" VALUES ('99999999I',11);
INSERT INTO "Cliente_Tema" VALUES ('12121212J',2);
INSERT INTO "Cliente_Tema" VALUES ('23232323K',18);
INSERT INTO "Cliente_Tema" VALUES ('34343434L',5);
INSERT INTO "Cliente_Tema" VALUES ('45454545M',14);
INSERT INTO "Cliente_Tema" VALUES ('56565656N',8);
INSERT INTO "Cliente_Tema" VALUES ('67676767O',20);
INSERT INTO "Cliente_Tema" VALUES ('78787878P',10);
INSERT INTO "Cliente_Tema" VALUES ('89898989Q',17);
INSERT INTO "Cliente_Tema" VALUES ('90909090R',13);
INSERT INTO "Cliente_Tema" VALUES ('31313131S',19);
INSERT INTO "Cliente_Tema" VALUES ('41414141T',16);
#Tabla Cliente_artista::

INSERT INTO "Cliente_artista" VALUES ('11111111A',3);
INSERT INTO "Cliente_artista" VALUES ('22222222B',7);
INSERT INTO "Cliente_artista" VALUES ('33333333C',12);
INSERT INTO "Cliente_artista" VALUES ('44444444D',1);
INSERT INTO "Cliente_artista" VALUES ('55555555E',9);
INSERT INTO "Cliente_artista" VALUES ('66666666F',4);
INSERT INTO "Cliente_artista" VALUES ('77777777G',15);
INSERT INTO "Cliente_artista" VALUES ('88888888H',6);
INSERT INTO "Cliente_artista" VALUES ('99999999I',11);
INSERT INTO "Cliente_artista" VALUES ('12121212J',2);
INSERT INTO "Cliente_artista" VALUES ('23232323K',18);
INSERT INTO "Cliente_artista" VALUES ('34343434L',5);
INSERT INTO "Cliente_artista" VALUES ('45454545M',14);
INSERT INTO "Cliente_artista" VALUES ('56565656N',8);
INSERT INTO "Cliente_artista" VALUES ('67676767O',20);
INSERT INTO "Cliente_artista" VALUES ('78787878P',10);
INSERT INTO "Cliente_artista" VALUES ('89898989Q',17);
INSERT INTO "Cliente_artista" VALUES ('90909090R',13);
INSERT INTO "Cliente_artista" VALUES ('31313131S',19);
INSERT INTO "Cliente_artista" VALUES ('41414141T',16);
#Tabla Compra:
INSERT INTO "Compra" VALUES (1,'11111111A',1,'2024-01-05',1200.0);
INSERT INTO "Compra" VALUES (2,'22222222B',2,'2024-01-12',1800.0);
INSERT INTO "Compra" VALUES (3,'33333333C',3,'2024-01-20',950.0);
INSERT INTO "Compra" VALUES (4,'44444444D',4,'2024-02-01',2100.0);
INSERT INTO "Compra" VALUES (5,'55555555E',5,'2024-02-10',3000.0);
INSERT INTO "Compra" VALUES (6,'66666666F',6,'2024-02-18',1300.0);
INSERT INTO "Compra" VALUES (7,'77777777G',7,'2024-03-02',1700.0);
INSERT INTO "Compra" VALUES (8,'88888888H',8,'2024-03-11',2500.0);
INSERT INTO "Compra" VALUES (9,'99999999I',9,'2024-03-25',900.0);
INSERT INTO "Compra" VALUES (10,'12121212J',10,'2024-04-03',2200.0);
INSERT INTO "Compra" VALUES (11,'23232323K',11,'2024-04-15',3100.0);
INSERT INTO "Compra" VALUES (12,'34343434L',12,'2024-04-28',1400.0);
INSERT INTO "Compra" VALUES (13,'45454545M',13,'2024-05-06',1600.0);
INSERT INTO "Compra" VALUES (14,'56565656N',14,'2024-05-14',3500.0);
INSERT INTO "Compra" VALUES (15,'67676767O',15,'2024-05-22',1100.0);
INSERT INTO "Compra" VALUES (16,'78787878P',16,'2024-06-01',1900.0);
INSERT INTO "Compra" VALUES (17,'89898989Q',17,'2024-06-09',2600.0);
INSERT INTO "Compra" VALUES (18,'90909090R',18,'2024-06-17',2800.0);
INSERT INTO "Compra" VALUES (19,'31313131S',19,'2024-06-25',3200.0);
INSERT INTO "Compra" VALUES (20,'41414141T',20,'2024-07-02',1500.0);
#Tabla Estilo:
INSERT INTO "Estilo" VALUES (4,'pintura');
INSERT INTO "Estilo" VALUES (5,'escultura');
INSERT INTO "Estilo" VALUES (6,'fotografia');
INSERT INTO "Estilo" VALUES (7,'pintura');
INSERT INTO "Estilo" VALUES (8,'escultura');
INSERT INTO "Estilo" VALUES (9,'fotografia');
INSERT INTO "Estilo" VALUES (10,'pintura');
INSERT INTO "Estilo" VALUES (11,'escultura');
INSERT INTO "Estilo" VALUES (12,'fotografia');
INSERT INTO "Estilo" VALUES (13,'pintura');
INSERT INTO "Estilo" VALUES (14,'escultura');
INSERT INTO "Estilo" VALUES (15,'fotografia');
INSERT INTO "Estilo" VALUES (16,'pintura');
INSERT INTO "Estilo" VALUES (17,'escultura');
INSERT INTO "Estilo" VALUES (18,'fotografia');
INSERT INTO "Estilo" VALUES (19,'pintura');
INSERT INTO "Estilo" VALUES (20,'escultura');
INSERT INTO "Estilo" VALUES (21,'fotografia');
INSERT INTO "Estilo" VALUES (22,'pintura');
INSERT INTO "Estilo" VALUES (23,'escultura');
#Tabla Obra:
INSERT INTO "Obra" VALUES (1,'Caminos de Luz',2011,1200.0,1);
INSERT INTO "Obra" VALUES (2,'Sombras del Tiempo',2014,1800.0,2);
INSERT INTO "Obra" VALUES (3,'Ecos del Horizonte',2019,950.0,3);
INSERT INTO "Obra" VALUES (4,'Retrato en Silencio',1890,2100.0,4);
INSERT INTO "Obra" VALUES (5,'Azul Profundo',1910,3000.0,5);
INSERT INTO "Obra" VALUES (6,'Raíces Ocultas',2012,1300.0,6);
INSERT INTO "Obra" VALUES (7,'Senderos',2017,1700.0,7);
INSERT INTO "Obra" VALUES (8,'Dualidad Interior',1890,2500.0,8);
INSERT INTO "Obra" VALUES (9,'Sueños Fragmentados',2016,900.0,9);
INSERT INTO "Obra" VALUES (10,'Catedral de Sombras',1999,2200.0,10);
INSERT INTO "Obra" VALUES (11,'Fragmentos del Alma',1960,3100.0,11);
INSERT INTO "Obra" VALUES (12,'Mirada Perdida',2013,1400.0,12);
INSERT INTO "Obra" VALUES (13,'Círculos Eternos',1880,1600.0,13);
INSERT INTO "Obra" VALUES (14,'Amanecer Carmesí',2022,3500.0,14);
INSERT INTO "Obra" VALUES (15,'Vértigo Azul',2010,1100.0,15);
INSERT INTO "Obra" VALUES (16,'Silencio Roto',2015,1900.0,16);
INSERT INTO "Obra" VALUES (17,'Movimiento Infinito',2017,2600.0,17);
INSERT INTO "Obra" VALUES (18,'Reflejos del Pasado',2019,2800.0,18);
INSERT INTO "Obra" VALUES (19,'Destino Trazado',2020,3200.0,19);
INSERT INTO "Obra" VALUES (20,'Nostalgia de Otoño',2012,1500.0,20);
#Tabla Obra_Tema:
INSERT INTO "Obra_Tema" VALUES (1,3);
INSERT INTO "Obra_Tema" VALUES (2,7);
INSERT INTO "Obra_Tema" VALUES (3,18);
INSERT INTO "Obra_Tema" VALUES (4,2);
INSERT INTO "Obra_Tema" VALUES (5,2);
INSERT INTO "Obra_Tema" VALUES (6,10);
INSERT INTO "Obra_Tema" VALUES (7,5);
INSERT INTO "Obra_Tema" VALUES (8,14);
INSERT INTO "Obra_Tema" VALUES (9,9);
INSERT INTO "Obra_Tema" VALUES (10,19);
INSERT INTO "Obra_Tema" VALUES (11,4);
INSERT INTO "Obra_Tema" VALUES (12,12);
INSERT INTO "Obra_Tema" VALUES (13,17);
INSERT INTO "Obra_Tema" VALUES (14,8);
INSERT INTO "Obra_Tema" VALUES (15,9);
INSERT INTO "Obra_Tema" VALUES (16,6);
INSERT INTO "Obra_Tema" VALUES (17,13);
INSERT INTO "Obra_Tema" VALUES (18,15);
INSERT INTO "Obra_Tema" VALUES (19,9);
INSERT INTO "Obra_Tema" VALUES (20,16);
#Tabla Tema:
INSERT INTO "Tema" VALUES (1,'Naturaleza','Obras inspiradas en paisajes, plantas y elementos naturales');
INSERT INTO "Tema" VALUES (2,'Retrato','Representación de personas, rostros y expresiones');
INSERT INTO "Tema" VALUES (3,'Abstracto','Formas no figurativas y composiciones libres');
INSERT INTO "Tema" VALUES (4,'Urbano','Escenas de ciudad, calles y vida moderna');
INSERT INTO "Tema" VALUES (5,'Animales','Representación de fauna salvaje o doméstica');
INSERT INTO "Tema" VALUES (6,'Mitología','Temas basados en dioses, leyendas y relatos antiguos');
INSERT INTO "Tema" VALUES (7,'Fantasía','Elementos imaginarios, mágicos o irreales');
INSERT INTO "Tema" VALUES (8,'Realismo','Representación fiel y detallada de la realidad');
INSERT INTO "Tema" VALUES (9,'Surrealismo','Imágenes oníricas y combinaciones imposibles');
INSERT INTO "Tema" VALUES (10,'Minimalismo','Composiciones simples y limpias');
INSERT INTO "Tema" VALUES (11,'Tecnología','Obras relacionadas con avances tecnológicos');
INSERT INTO "Tema" VALUES (12,'Historia','Eventos históricos y personajes del pasado');
INSERT INTO "Tema" VALUES (13,'Cultura pop','Referencias a música, cine, moda y tendencias');
INSERT INTO "Tema" VALUES (14,'Ciencia ficción','Temas futuristas, naves, robots y universos alternos');
INSERT INTO "Tema" VALUES (15,'Romanticismo','Emociones intensas, paisajes dramáticos y simbolismo');
INSERT INTO "Tema" VALUES (16,'Expresionismo','Interpretación subjetiva y emocional de la realidad');
INSERT INTO "Tema" VALUES (17,'Geometría','Formas geométricas, patrones y estructuras');
INSERT INTO "Tema" VALUES (18,'Marina','Escenas del mar, barcos y océanos');
INSERT INTO "Tema" VALUES (19,'Arquitectura','Edificios, estructuras y diseño urbano');
INSERT INTO "Tema" VALUES (20,'Infantil','Temas dirigidos a niños, colores vivos y formas simples');
COMMIT;
