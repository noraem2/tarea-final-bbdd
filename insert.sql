USE galeria_arte;

INSERT INTO estilo (nombre) VALUES
('pintura'),
('escultura'),
('fotografía');

INSERT INTO artista 
(nombre_artistico, fecha_nacimiento, edad, localidad_residencia, codigo_postal)
VALUES
('Luna Azul', '1980-04-12', 44, 'Málaga', '29001'),
('Marco Piedra', '1975-09-20', 49, 'Sevilla', '41001'),
('Clara Luz', '1990-01-15', 34, 'Granada', '18001'),
('Neo Arte', '1988-06-30', 36, 'Málaga', '29002'),
('Sombra Viva', '1965-11-03', 59, 'Córdoba', '14001');

INSERT INTO artista_estilo (id_artista, id_estilo) VALUES
(1, 1), -- Luna Azul: pintura
(2, 1), -- Marco Piedra: pintura
(2, 2), -- Marco Piedra: escultura
(3, 3), -- Clara Luz: fotografía
(4, 1), -- Neo Arte: pintura
(4, 2), -- Neo Arte: escultura
(4, 3), -- Neo Arte: fotografía
(5, 2); -- Sombra Viva: escultura

INSERT INTO tema (nombre, descripcion) VALUES
('retratos', 'Obras centradas en la representación de personas.'),
('paisajes', 'Obras que representan espacios naturales o urbanos.'),
('mitología', 'Obras inspiradas en mitos y leyendas.'),
('renacimiento', 'Obras relacionadas con el estilo renacentista.'),
('abstracto', 'Obras basadas en formas, colores y composiciones no figurativas.');

INSERT INTO obra 
(titulo, anio_creacion, precio, id_artista)
VALUES
('Mirada Serena', 1995, 1200.00, 1),
('Azul Profundo', 2005, 2500.00, 1),
('La Piedra Humana', 1998, 4000.00, 2),
('Figura Eterna', 2010, 3500.00, 2),
('Instante Urbano', 2020, 900.00, 3),
('Rostro Digital', 1999, 1800.00, 4),
('Cuerpo Fragmentado', 2001, 2200.00, 4),
('Eco Antiguo', 1985, 5000.00, 5);

INSERT INTO obra_tema (id_obra, id_tema) VALUES
(1, 1), -- Mirada Serena: retratos
(1, 5), -- abstracto
(2, 2), -- paisajes
(3, 1), -- retratos
(3, 4), -- renacimiento
(4, 3), -- mitología
(5, 2), -- paisajes
(6, 1), -- retratos
(6, 5), -- abstracto
(7, 5), -- abstracto
(8, 3); -- mitología

INSERT INTO cliente 
(dni, nombre, localidad, calle, numero, codigo_postal, dinero_total_gastado)
VALUES
('11111111A', 'Ana López', 'Málaga', 'Calle Larios', '10', '29001', 6000.00),
('22222222B', 'Carlos Ruiz', 'Sevilla', 'Avenida Constitución', '5', '41001', 2500.00),
('33333333C', 'Marta Pérez', 'Granada', 'Calle Real', '7', '18001', 8000.00),
('44444444D', 'Javier Martín', 'Málaga', 'Calle Nueva', '3', '29002', 1200.00),
('55555555E', 'Lucía Gómez', 'Córdoba', 'Calle Sol', '12', '14001', 4000.00);

INSERT INTO cliente_artista (dni_cliente, id_artista) VALUES
('11111111A', 1),
('11111111A', 2),
('22222222B', 2),
('33333333C', 3),
('33333333C', 4),
('44444444D', 1),
('55555555E', 5);

INSERT INTO cliente_tema (dni_cliente, id_tema) VALUES
('11111111A', 1),
('11111111A', 5),
('22222222B', 4),
('33333333C', 1),
('33333333C', 2),
('44444444D', 5),
('55555555E', 3);
