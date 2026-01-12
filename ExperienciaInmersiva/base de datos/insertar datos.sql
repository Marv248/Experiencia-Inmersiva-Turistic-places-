INSERT INTO lugar_turistico (nombre, descripcion, ciudad, costo_ingreso) 
VALUES ('Centro Histórico', 'Zona colonial con mucha historia', 'CDMX', 0.00);

INSERT INTO usuario (nombre, email, password, ciudad) 
VALUES ('Juan Perez', 'juan@mail.com', '12345', 'CDMX');

INSERT INTO negocio (id_usuario, id_lugar, nombre_negocio, categoria, precio_promedio, descripcion)
VALUES (1, 1, 'Tacos El Viajero', 'Restaurante', 150.00, 'Los mejores tacos cerca del centro');