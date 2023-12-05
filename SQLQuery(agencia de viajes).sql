create database agenciadeviajesDB;
use agenciadeviajesDB;
CREATE TABLE clientes (
    cliente_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(50),
    telefono VARCHAR(20)
);
INSERT INTO clientes (nombre, apellido, email, telefono)
VALUES ('Juan', 'Pérez', 'juan@example.com', '1238867890');
INSERT INTO clientes (nombre, apellido, email, telefono)
VALUES ('denis', 'Palmar', 'denisovich@gmail.com', '65114433');
INSERT INTO clientes (nombre, apellido, email, telefono)
VALUES ('nelson', 'choque', 'surdito@gmail.com', '70518265');
INSERT INTO clientes (nombre, apellido, email, telefono)
VALUES ('david', 'aguilar', 'davis@gmail.com', '65579789');
INSERT INTO clientes (nombre, apellido, email, telefono)
VALUES ('felcy', 'flores', 'feliz@gmail.com', '12345678');

CREATE TABLE destinos (
    destino_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombredestino VARCHAR(100),
    descripcion TEXT,
    preciobase INTEGER
);
INSERT INTO destinos (nombredestino, descripcion, preciobase)
VALUES ('Playa del Carmen', 'Hermosas playas caribeñas', 1200.00);
INSERT INTO destinos (nombredestino, descripcion, preciobase)
VALUES ('copacabana', 'Hermosas islas', 1700.00);
INSERT INTO destinos (nombredestino, descripcion, preciobase)
VALUES ('luribay', 'Hermosas viñedas', 1890.00);
INSERT INTO destinos (nombredestino, descripcion, preciobase)
VALUES ('yungas', 'Hermoso clima', 1490.00);
INSERT INTO destinos (nombredestino, descripcion, preciobase)
VALUES ('chuquiñapi', 'Hermosa vista', 1233.00);

CREATE TABLE paquetes (
    paquete_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombrepaquete VARCHAR(100),
    descripcion TEXT,
    fechainicio DATE,
    fechafin DATE,
    preciototal INTEGER,
    destino_id INTEGER,
    FOREIGN KEY (destino_id) REFERENCES destinos(destino_id)
);
INSERT INTO paquetes (nombrepaquete, descripcion, fechainicio, fechafin, preciototal, destino_id)
VALUES ('Vacaciones en el Caribe', 'Explora las maravillas del Caribe', '2023-12-01', '2023-12-15', 2500.00, 1);
INSERT INTO paquetes (nombrepaquete, descripcion, fechainicio, fechafin, preciototal, destino_id)
VALUES ('Vacaciones en parques', 'Explora los animales', '2023-11-01', '2023-11-10', 2110.00, 2);
INSERT INTO paquetes (nombrepaquete, descripcion, fechainicio, fechafin, preciototal, destino_id)
VALUES ('Vacaciones por viñedos', 'Explora las maravillas de vinos', '2023-10-02', '2023-10-12', 2220.00, 3);
INSERT INTO paquetes (nombrepaquete, descripcion, fechainicio, fechafin, preciototal, destino_id)
VALUES ('Vacaciones en los gourmet', 'prueba cada comida', '2023-09-03', '2023-09-13', 3838.00, 4);
INSERT INTO paquetes (nombrepaquete, descripcion, fechainicio, fechafin, preciototal, destino_id)
VALUES ('Vacaciones por el mar', 'sorfea a todo lugar', '2023-08-04', '2023-08-14', 6666.00, 5);

CREATE TABLE reservas (
    reserva_id INTEGER PRIMARY KEY IDENTITY(1,1),
    cliente_id INTEGER,
    paquete_id INTEGER,
    fechareserva DATE,
    cantidadpersonas INTEGER,
    preciototal INTEGER,
    estadoreserva VARCHAR(20),
    FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id),
    FOREIGN KEY (paquete_id) REFERENCES paquetes(paquete_id)
);
INSERT INTO reservas (cliente_id, paquete_id, fechareserva, cantidadpersonas, preciototal, estadoreserva)
VALUES (1, 1, '2023-11-01', 2, 1000, 'confirmada');
INSERT INTO reservas (cliente_id, paquete_id, fechareserva, cantidadpersonas, preciototal, estadoreserva)
VALUES (2, 2, '2023-08-02', 3, 1300, 'pendiente');
INSERT INTO reservas (cliente_id, paquete_id, fechareserva, cantidadpersonas, preciototal, estadoreserva)
VALUES (3, 3, '2023-03-13', 4, 1200, 'confirmada');
INSERT INTO reservas (cliente_id, paquete_id, fechareserva, cantidadpersonas, preciototal, estadoreserva)
VALUES (4, 4, '2023-04-24', 5, 3400, 'confirmada');
INSERT INTO reservas (cliente_id, paquete_id, fechareserva, cantidadpersonas, preciototal, estadoreserva)
VALUES (5, 5, '2023-06-30', 6, 5400, 'pendiente');

CREATE TABLE transportes (
    transporte_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombretransporte VARCHAR(100),
    descripcion TEXT,
    capacidad INTEGER,
    preciobase INTEGER
);
INSERT INTO transportes (nombretransporte, descripcion, capacidad, preciobase)
VALUES ('Avión', 'Vuelo directo', 200, 500.00);
INSERT INTO transportes (nombretransporte, descripcion, capacidad, preciobase)
VALUES ('bote', 'estados en puertos', 16, 340.00);
INSERT INTO transportes (nombretransporte, descripcion, capacidad, preciobase)
VALUES ('auto', 'atravesar carreteras', 6, 5678.00);
INSERT INTO transportes (nombretransporte, descripcion, capacidad, preciobase)
VALUES ('minibus', 'recorridos', 20, 098.00);
INSERT INTO transportes (nombretransporte, descripcion, capacidad, preciobase)
VALUES ('flota', 'paradas', 20, 767.00);

CREATE TABLE reservas_transportes (
    reserva_transporte_id INTEGER PRIMARY KEY IDENTITY(1,1),
    reserva_id INTEGER,
    transporte_id INTEGER,
    FOREIGN KEY (reserva_id) REFERENCES reservas(reserva_id),
    FOREIGN KEY (transporte_id) REFERENCES transportes(transporte_id)
);
INSERT INTO reservas_transportes (reserva_id, transporte_id)
VALUES (1, 1);
INSERT INTO reservas_transportes (reserva_id, transporte_id)
VALUES (2, 2);
INSERT INTO reservas_transportes (reserva_id, transporte_id)
VALUES (3, 3);
INSERT INTO reservas_transportes (reserva_id, transporte_id)
VALUES (4, 4);
INSERT INTO reservas_transportes (reserva_id, transporte_id)
VALUES (5, 5);

CREATE TABLE actividades (
    actividad_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombreactividad VARCHAR(100),
    descripcion TEXT,
    duracion INTEGER,
    preciobase INTEGER
);
INSERT INTO actividades (nombreactividad, descripcion, duracion, preciobase)
VALUES ('Tour en bote', 'Recorrido por la costa', 3, 150.00);
INSERT INTO actividades (nombreactividad, descripcion, duracion, preciobase)
VALUES ('Tour en caballos', 'Recorrido por las montañas', 4, 1540.00);
INSERT INTO actividades (nombreactividad, descripcion, duracion, preciobase)
VALUES ('Tour en delfines', 'Recorrido a mar abierto', 5, 1450.00);
INSERT INTO actividades (nombreactividad, descripcion, duracion, preciobase)
VALUES ('Tour en tablas de surf', 'Recorrido por las olas', 6, 1230.00);
INSERT INTO actividades (nombreactividad, descripcion, duracion, preciobase)
VALUES ('Tour en paracaida', 'caidas asombrosas', 7, 3456.00);

CREATE TABLE reservas_actividades (
    reserva_actividad_id INTEGER PRIMARY KEY IDENTITY(1,1),
    reserva_id INTEGER,
    actividad_id INTEGER,
    FOREIGN KEY (reserva_id) REFERENCES reservas(reserva_id),
    FOREIGN KEY (actividad_id) REFERENCES actividades(actividad_id)
);
INSERT INTO reservas_actividades (reserva_id, actividad_id)
VALUES (1, 1);
INSERT INTO reservas_actividades (reserva_id, actividad_id)
VALUES (2, 2);
INSERT INTO reservas_actividades (reserva_id, actividad_id)
VALUES (3, 3);
INSERT INTO reservas_actividades (reserva_id, actividad_id)
VALUES (4, 4);
INSERT INTO reservas_actividades (reserva_id, actividad_id)
VALUES (5, 5);

CREATE TABLE hoteles (
    hotel_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombrehotel VARCHAR(100),
    descripcion TEXT,
    categoria INTEGER,
    preciobase INTEGER
);
INSERT INTO hoteles (nombrehotel, descripcion, categoria, preciobase)
VALUES ('Hotel Tropical', 'Vistas espectaculares al mar', 4, 180.00);
INSERT INTO hoteles (nombrehotel, descripcion, categoria, preciobase)
VALUES ('Hotel paraiso', 'Vistas con fogatas', 8, 1280.00);
INSERT INTO hoteles (nombrehotel, descripcion, categoria, preciobase)
VALUES ('Hotel ambistico', 'comida gourmet', 3, 1240.00);
INSERT INTO hoteles (nombrehotel, descripcion, categoria, preciobase)
VALUES ('Hotel cariñosito', 'actividades asombrosas', 8, 123.00);
INSERT INTO hoteles (nombrehotel, descripcion, categoria, preciobase)
VALUES ('Hotel margarita', 'piscinas tropicales', 9, 2340.00);

CREATE TABLE reservas_hoteles (
    reserva_hotel_id INTEGER PRIMARY KEY IDENTITY(1,1),
    reserva_id INTEGER,
    hotel_id INTEGER,
    FOREIGN KEY (reserva_id) REFERENCES reservas(reserva_id),
    FOREIGN KEY (hotel_id) REFERENCES hoteles(hotel_id)
);
INSERT INTO reservas_hoteles (reserva_id, hotel_id)
VALUES (1, 1);
INSERT INTO reservas_hoteles (reserva_id, hotel_id)
VALUES (2, 2);
INSERT INTO reservas_hoteles (reserva_id, hotel_id)
VALUES (3, 3);
INSERT INTO reservas_hoteles (reserva_id, hotel_id)
VALUES (4, 4);
INSERT INTO reservas_hoteles (reserva_id, hotel_id)
VALUES (5, 5);

CREATE TABLE vehiculos (
    vehiculo_id INTEGER PRIMARY KEY IDENTITY(1,1),
    nombrevehiculo VARCHAR(100),
    descripcion TEXT,
    capacidad INTEGER,
    preciobase INTEGER
);
INSERT INTO vehiculos (nombrevehiculo, descripcion, capacidad, preciobase)
VALUES ('Automóvil', 'Transporte privado', 4, 80.00);
INSERT INTO vehiculos (nombrevehiculo, descripcion, capacidad, preciobase)
VALUES ('increimóvil', 'Transporte privado', 3, 100.00);
INSERT INTO vehiculos (nombrevehiculo, descripcion, capacidad, preciobase)
VALUES ('rayomovil', 'Transporte publico', 10, 123.00);
INSERT INTO vehiculos (nombrevehiculo, descripcion, capacidad, preciobase)
VALUES ('rap4', 'Transporte privado', 6, 150.00);
INSERT INTO vehiculos (nombrevehiculo, descripcion, capacidad, preciobase)
VALUES ('toyota', 'Transporte privado', 8, 676.00);

CREATE TABLE reservas_vehiculos (
    reserva_vehiculo_id INTEGER PRIMARY KEY IDENTITY(1,1),
    reserva_id INTEGER,
    vehiculo_id INTEGER,
    FOREIGN KEY (reserva_id) REFERENCES reservas(reserva_id),
    FOREIGN KEY (vehiculo_id) REFERENCES vehiculos(vehiculo_id)
);
INSERT INTO reservas_vehiculos (reserva_id, vehiculo_id)
VALUES (1, 1);
INSERT INTO reservas_vehiculos (reserva_id, vehiculo_id)
VALUES (2, 2);
INSERT INTO reservas_vehiculos (reserva_id, vehiculo_id)
VALUES (3, 3);
INSERT INTO reservas_vehiculos (reserva_id, vehiculo_id)
VALUES (4, 4);
INSERT INTO reservas_vehiculos (reserva_id, vehiculo_id)
VALUES (5, 5);

select*from clientes;
select*from destinos;
select*from paquetes;
select*from reservas;
select*from transportes ;
select*from reservas_transportes;
select*from actividades;
select*from reservas_actividades;
select*from hoteles;
select*from reservas_hoteles ;
select*from vehiculos;
select*from reservas_vehiculos ;


//Consultas SQL con JOINS (5 Consultas)//

--Consulta 1: Información de Reservas y Clientes--
   
   SELECT r.reserva_id, c.nombre AS cliente_nombre, r.fechareserva
   FROM reservas r
   JOIN clientes c ON r.cliente_id = c.cliente_id;
   

--Reservas con Paquete y Destino--
   
   SELECT r.reserva_id, p.nombrepaquete, d.nombredestino
   FROM reservas r
   JOIN paquetes p ON r.paquete_id = p.paquete_id
   JOIN destinos d ON p.destino_id = d.destino_id;
   

--Actividades y Clientes Asociados--
   
 SELECT DISTINCT a.nombreactividad, c.nombre AS cliente_nombre
FROM actividades a
JOIN reservas_actividades ra ON a.actividad_id = ra.actividad_id
JOIN reservas r ON ra.reserva_id = r.reserva_id
JOIN clientes c ON r.cliente_id = c.cliente_id;
   

--Transportes y Destinos de Reservas--
   
   SELECT t.nombretransporte, d.nombredestino
FROM transportes t
JOIN reservas_transportes rt ON t.transporte_id = rt.transporte_id
JOIN reservas r ON rt.reserva_id = r.reserva_id
JOIN paquetes p ON r.paquete_id = p.paquete_id
JOIN destinos d ON p.destino_id = d.destino_id;
   

--Hoteles con Reservas y Clientes:
   
   SELECT h.nombrehotel, r.fechareserva, c.nombre AS cliente_nombre
   FROM hoteles h
   JOIN reservas_hoteles rh ON h.hotel_id = rh.hotel_id
   JOIN reservas r ON rh.reserva_id = r.reserva_id
   JOIN clientes c ON r.cliente_id = c.cliente_id;
   

//Funciones de Agregación (5 Ejemplos Simples)//

--Contar el Número Total de Reservas--
   
   SELECT COUNT(reserva_id) AS total_reservas
   FROM reservas;
   

--Calcular el Precio Promedio de los Paquetes--
   
   SELECT AVG(preciototal) AS precio_promedio_paquetes
   FROM paquetes;
   

--Encontrar el Precio Mínimo de Destinos--
   
   SELECT MIN(preciobase) AS min_precio_destinos
   FROM destinos;
   

--Sumar la Duración Total de Todas las Actividades--
   
   SELECT SUM(duracion) AS duracion_total_actividades
   FROM actividades;
   

--Calcular el precio total de todas las reservas confirmadas--
SELECT SUM(r.preciototal) AS precio_total_confirmado
FROM reservas r
WHERE r.estadoreserva = 'confirmada';
   

//Funciones de Agregación II (5 con JOINS)//

--Calcular el Precio Promedio de Paquetes por Destino--
   
   SELECT d.nombredestino, AVG(p.preciototal) AS precio_promedio_paquetes
   FROM destinos d
   JOIN paquetes p ON d.destino_id = p.destino_id
   GROUP BY d.nombredestino;
   

 --Encontrar la Duración Máxima de Actividades por Cliente--
   
   SELECT c.nombre AS cliente_nombre, MAX(a.duracion) AS max_duracion_actividad
   FROM clientes c
   JOIN reservas r ON c.cliente_id = r.cliente_id
   JOIN reservas_actividades ra ON r.reserva_id = ra.reserva_id
   JOIN actividades a ON ra.actividad_id = a.actividad_id
   GROUP BY c.nombre;
   

--Calcular la Cantidad de Reservas por Transporte-- 

SELECT t.nombretransporte, COUNT(rt.reserva_id) AS cantidad_reservas
FROM transportes t
JOIN reservas_transportes rt ON t.transporte_id = rt.transporte_id
GROUP BY t.nombretransporte;
--otra forma--
SELECT t.nombretransporte AS nombretransporte, COUNT(rt.reserva_id) AS cantidad_reservas
	FROM transportes t
	LEFT JOIN reservas_transportes rt ON t.transporte_id = rt.transporte_id
	LEFT JOIN reservas r ON rt.reserva_id = r.reserva_id
	GROUP BY t.nombretransporte;

   

--Sumar el Precio Total de Reservas con Estado Confirmado
   
   SELECT SUM(r.preciototal) AS total_precio_confirmado
   FROM reservas r
   WHERE r.estadoreserva = 'confirmada';
   

--Contar la Cantidad de Reservas por Hotel--
  
   SELECT h.nombrehotel, COUNT(rh.reserva_id) AS cantidad_reservas
   FROM hoteles h
   LEFT JOIN reservas_hoteles rh ON h.hotel_id = rh.hotel_id
   GROUP BY h.nombrehotel;