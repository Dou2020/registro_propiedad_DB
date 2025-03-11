-- ===============================
-- Datos de ejemplo para DEPARTAMENTOS
-- ===============================
INSERT INTO DEPARTAMENTOS (nombre) VALUES 
('Guatemala'),
('El Progreso'),
('Sacatepéquez'),
('Chimaltenango'),
('Escuintla'),
('Santa Rosa'),
('Sololá'),
('Totonicapán'),
('Quetzaltenango'),
('Suchitepéquez'),
('Retalhuleu'),
('San Marcos'),
('Huehuetenango'),
('Quiché'),
('Baja Verapaz'),
('Alta Verapaz'),
('Petén'),
('Izabal'),
('Zacapa'),
('Chiquimula'),
('Jalapa'),
('Jutiapa');

-- ===============================
-- Datos de ejemplo para MUNICIPIOS
-- Se asume: Departamento 'Guatemala' (id=1) y 'Sacatepéquez' (id=2)
-- ===============================
INSERT INTO MUNICIPIOS (departamento_id, nombre) VALUES
-- Municipios del departamento de Guatemala (ID = 1)
(1, 'Guatemala'),
(1, 'Mixco'),
(1, 'Villa Nueva'),
(1, 'San Miguel Petapa'),
(1, 'Amatitlán'),
-- Municipios del departamento de El Progreso (ID = 2)
(2, 'Guastatoya'),
(2, 'Sanarate'),
(2, 'Morazán'),
-- Municipios del departamento de Sacatepéquez (ID = 3)
(3, 'Antigua Guatemala'),
(3, 'Ciudad Vieja'),
(3, 'San Lucas Sacatepéquez'),
-- Municipios del departamento de Chimaltenango (ID = 4)
(4, 'Chimaltenango'),
(4, 'San Juan Comalapa'),
(4, 'Tecpán Guatemala'),
-- Municipios del departamento de Escuintla (ID = 5)
(5, 'Escuintla'),
(5, 'Puerto San José'),
(5, 'Santa Lucía Cotzumalguapa'),
-- Municipios del departamento de Santa Rosa (ID = 6)
(6, 'Cuilapa'),
(6, 'Barberena'),
(6, 'Chiquimulilla'),
-- Municipios del departamento de Sololá (ID = 7)
(7, 'Sololá'),
(7, 'Panajachel'),
(7, 'San Pedro La Laguna'),
-- Municipios del departamento de Totonicapán (ID = 8)
(8, 'Totonicapán'),
(8, 'San Cristóbal Totonicapán'),
(8, 'Momostenango'),
-- Municipios del departamento de Quetzaltenango (ID = 9)
(9, 'Quetzaltenango'),
(9, 'Coatepeque'),
(9, 'San Juan Ostuncalco'),
-- Municipios del departamento de Suchitepéquez (ID = 10)
(10, 'Mazatenango'),
(10, 'San Antonio Suchitepéquez'),
(10, 'San Bernardino'),
-- Municipios del departamento de Retalhuleu (ID = 11)
(11, 'Retalhuleu'),
(11, 'San Sebastián'),
(11, 'San Felipe'),
-- Municipios del departamento de San Marcos (ID = 12)
(12, 'San Marcos'),
(12, 'Malacatán'),
(12, 'San Pedro Sacatepéquez'),
-- Municipios del departamento de Huehuetenango (ID = 13)
(13, 'Huehuetenango'),
(13, 'Chiantla'),
(13, 'Colotenango'),
-- Municipios del departamento de Quiché (ID = 14)
(14, 'Santa Cruz del Quiché'),
(14, 'Chichicastenango'),
(14, 'Nebaj'),
-- Municipios del departamento de Baja Verapaz (ID = 15)
(15, 'Salamá'),
(15, 'Cubulco'),
(15, 'Rabinal'),
-- Municipios del departamento de Alta Verapaz (ID = 16)
(16, 'Cobán'),
(16, 'Chisec'),
(16, 'San Pedro Carchá'),
-- Municipios del departamento de Petén (ID = 17)
(17, 'Flores'),
(17, 'San Benito'),
(17, 'Sayaxché'),
-- Municipios del departamento de Izabal (ID = 18)
(18, 'Puerto Barrios'),
(18, 'Livingston'),
(18, 'Morales'),
-- Municipios del departamento de Zacapa (ID = 19)
(19, 'Zacapa'),
(19, 'Gualán'),
(19, 'La Unión'),
-- Municipios del departamento de Chiquimula (ID = 20)
(20, 'Chiquimula'),
(20, 'Esquipulas'),
(20, 'Jocotán'),
-- Municipios del departamento de Jalapa (ID = 21)
(21, 'Jalapa'),
(21, 'San Pedro Pinula'),
(21, 'Mataquescuintla'),
-- Municipios del departamento de Jutiapa (ID = 22)
(22, 'Jutiapa'),
(22, 'Agua Blanca'),
(22, 'El Progreso');

-- ===============================
-- Datos de ejemplo para AREAS
-- ===============================
INSERT INTO AREAS (nombre, descripcion) VALUES 
('Urbana', 'Área urbana'),
('Rural', 'Área rural');
INSERT INTO AREAS (nombre, descripcion) VALUES 
('Comercial', 'Área comercial'),
('Industrial', 'Área industrial');

-- ===============================
-- Datos de ejemplo para USOS
-- ===============================
INSERT INTO USOS (tipo) VALUES ('Residencial');
INSERT INTO USOS (tipo) VALUES ('Comercial');
INSERT INTO USOS (tipo) VALUES ('Agrícola');
INSERT INTO USOS (tipo) VALUES ('Industrial');


-- ===============================
-- Datos de ejemplo para PLANOS
-- ===============================
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado) 
VALUES ('PL-001', 'ruta/planos/PL-001.pdf', '2023-01-15', 'Plano aprobado de Guatemala', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado) 
VALUES ('PL-002', 'ruta/planos/PL-002.pdf', '2023-02-20', 'Plano pendiente en Antigua Guatemala', 'Pendiente');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-003', 'ruta/planos/PL-003.pdf', '2023-03-25', 'Plano aprobado de Mixco', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-004', 'ruta/planos/PL-004.pdf', '2023-04-30', 'Plano aprobado de Ciudad de Guatemala', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-005', 'ruta/planos/PL-005.pdf', '2023-05-05', 'Plano aprobado de Antigua Guatemala', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-006', 'ruta/planos/PL-006.pdf', '2023-06-10', 'Plano aprobado de Quetzaltenango', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-007', 'ruta/planos/PL-007.pdf', '2023-07-15', 'Plano aprobado de Cobán', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-008', 'ruta/planos/PL-008.pdf', '2023-08-20', 'Plano aprobado de Puerto Barrios', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-009', 'ruta/planos/PL-009.pdf', '2023-09-25', 'Plano aprobado de Mazatenango', 'Aprobado');
INSERT INTO PLANOS (numero_plano, archivo_plano, fecha_registro, descripcion, estado)
VALUES ('PL-010', 'ruta/planos/PL-010.pdf', '2023-10-01', 'Plano aprobado de Jalapa', 'Aprobado');

SELECT * FROM PLANOS;

-- ===============================
-- Datos de ejemplo para LIBROS
-- ===============================
INSERT INTO LIBROS (nombre, departamento_id, fecha_creacion) 
VALUES ('Libro de Fincas Guatemala', 1, '2023-03-01');
INSERT INTO LIBROS (nombre, departamento_id, fecha_creacion) 
VALUES ('Libro de Fincas Antigua', 2, '2023-03-05');

-- ===============================
-- Datos de ejemplo para FOLIOS
-- ===============================
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion) 
VALUES (1, 101, 'Folio inicial');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion) 
VALUES (2, 201, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (1, 102, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (2, 202, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (1, 103, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (2, 203, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (1, 104, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (2, 204, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (1, 105, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (2, 205, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (1, 106, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (2, 206, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (1, 107, 'Folio secundario');
INSERT INTO FOLIOS (libro_id, numero_folio, descripcion)
VALUES (2, 207, 'Folio secundario');

SELECT * FROM FOLIOS;

-- ===============================
-- Datos de ejemplo para FINCAS
-- ===============================

INSERT INTO FINCAS (
    numero_finca, folio_id, municipio_id, area_id, uso_id, plano_id, 
    direccion, area_total, tipo_tenencia, estado
) VALUES
(1001, 1, 1, 1, 1, 1, 'Zona 1, Ciudad de Guatemala', 500.00, 'Propia', 'Activo'),
(1002, 2, 1, 2, 3, 2, 'Zona 10, Ciudad de Guatemala', 1200.00, 'Arrendada', 'Activo'),
(1003, 3, 2, 1, 2, 3, 'Avenida Reforma, Ciudad de Guatemala', 750.50, 'Comodato', 'Inactivo'),
(1004, 4, 3, 3, 4, 4, 'Chimaltenango Centro', 300.00, 'Propia', 'Activo'),
(1005, 5, 4, 2, 1, 5, 'Antigua Guatemala, Sacatepéquez', 1500.00, 'Propia', 'Activo'),
(1006, 6, 5, 3, 2, 6, 'Quetzaltenango Centro', 2000.00, 'Arrendada', 'Activo'),
(1007, 7, 6, 1, 1, 7, 'Cobán, Alta Verapaz', 800.00, 'Propia', 'Inactivo'),
(1008, 8, 7, 4, 3, 8, 'Puerto Barrios, Izabal', 1800.00, 'Propia', 'Activo'),
(1009, 9, 8, 1, 4, 9, 'Mazatenango, Suchitepéquez', 600.00, 'Comodato', 'Activo'),
(1010, 10, 9, 2, 2, 10, 'Jalapa Centro', 550.00, 'Propia', 'Activo');

SELECT * FROM FINCAS;

-- ===============================
-- Datos de ejemplo para PROPIETARIOS
-- ===============================
INSERT INTO PROPIETARIOS (nombre, dpi, direccion, telefono, email, nacionalidad, fecha_nacimiento) 
VALUES ('Carlos López', '1234567890101', 'Calle Los Pinos 5-12, Ciudad de Guatemala', '502-1234-5678', 'carlos.lopez@example.com', 'Guatemalteco', '1980-05-15');
INSERT INTO PROPIETARIOS (nombre, dpi, direccion, telefono, email, nacionalidad, fecha_nacimiento) 
VALUES ('Ana González', '1098765432101', 'Avenida Las Flores 8-90, Antigua Guatemala', '502-8765-4321', 'ana.gonzalez@example.com', 'Guatemalteca', '1985-08-20');

SELECT * FROM PROPIETARIOS;
-- ===============================
-- Datos de ejemplo para FINCA_PROPIETARIO
-- ===============================
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion) 
VALUES (31, 1, '2023-04-10');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (32, 2, '2023-04-12');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (33, 1, '2023-04-15');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (34, 2, '2023-04-16');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (35, 1, '2023-04-20');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (36, 2, '2023-04-22');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (37, 1, '2023-04-22');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (38, 2, '2023-04-25');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (39, 1, '2023-04-30');
INSERT INTO FINCA_PROPIETARIO (finca_id, propietario_id, fecha_adquisicion)
VALUES (40, 2, '2023-05-01');

SELECT * FROM FINCA_PROPIETARIO;

-- ===============================
-- Datos de ejemplo para INSCRIPCIONES
-- ===============================
INSERT INTO INSCRIPCIONES (finca_id, descripcion, fecha) 
VALUES (31, 'Inscripción inicial de la finca en Ciudad de Guatemala', '2023-04-15');
INSERT INTO INSCRIPCIONES (finca_id, descripcion, fecha) 
VALUES (32, 'Inscripción complementaria en Mixco', '2023-04-16')

SELECT * FROM INSCRIPCIONES;

-- ===============================
-- Datos de ejemplo para TIPOS_GRAVAMENES
-- ===============================
INSERT INTO TIPOS_GRAVAMENES (nombre, descripcion) 
VALUES ('Hipoteca', 'Gravamen hipotecario');
INSERT INTO TIPOS_GRAVAMENES (nombre, descripcion) 
VALUES ('Embargo', 'Gravamen por embargo');

-- ===============================
-- Datos de ejemplo para ESTADOS_GRAVAMENES
-- ===============================
INSERT INTO ESTADOS_GRAVAMENES (estado) 
VALUES ('Vigente');
INSERT INTO ESTADOS_GRAVAMENES (estado) 
VALUES ('Cancelado');

-- ===============================
-- Datos de ejemplo para GRAVAMENES
-- ===============================
INSERT INTO GRAVAMENES (finca_id, tipo_id, estado_id, descripcion, monto, entidad_financiera, fecha_registro, fecha_vencimiento) 
VALUES (35, 1, 1, 'Hipoteca por valor de Q100,000', 100000.00, 'Banco Industrial', '2023-05-01', '2033-05-01');
INSERT INTO GRAVAMENES (finca_id, tipo_id, estado_id, descripcion, monto, entidad_financiera, fecha_registro, fecha_vencimiento) 
VALUES (38, 2, 2, 'Embargo por deuda de Q50,000', 50000.00, 'Banco G&T Continental', '2023-06-01', '2033-06-01');

-- ===============================
-- Datos de ejemplo para ANOTACIONES
-- ===============================
INSERT INTO ANOTACIONES (finca_id, descripcion, fecha) 
VALUES (39, 'Anotación de revisión catastral en Ciudad de Guatemala', '2023-05-15');
INSERT INTO ANOTACIONES (finca_id, descripcion, fecha) 
VALUES (38, 'Anotación de inspección en Mixco', '2023-05-20');

-- ===============================
-- Datos de ejemplo para PROPIEDADES_HORIZONTALES
-- ===============================
INSERT INTO PROPIEDADES_HORIZONTALES (finca_id, propietario_id, unidad, tipo, area, piso, descripcion) 
VALUES (36, 1, 'Apt 101', 'Apartamento', 75.50, '1', 'Apartamento en primer piso, Ciudad de Guatemala');
INSERT INTO PROPIEDADES_HORIZONTALES (finca_id, propietario_id, unidad, tipo, area, piso, descripcion) 
VALUES (37, 2, 'Oficina 201', 'Local Comercial', 120.00, '2', 'Oficina en segundo piso, Mixco');

SELECT * FROM PROPIEDADES_HORIZONTALES;
-- ===============================
-- Datos de ejemplo para AMENIDADES
-- ===============================
INSERT INTO AMENIDADES (propiedad_horizontal_id, nombre, descripcion) 
VALUES (2, 'Piscina', 'Piscina comunitaria en edificio residencial');
INSERT INTO AMENIDADES (propiedad_horizontal_id, nombre, descripcion) 
VALUES (3, 'Gimnasio', 'Gimnasio equipado para uso de residentes');

-- ===============================
-- Datos de ejemplo para TIPOS_SERVIDUMBRES
-- ===============================
INSERT INTO TIPOS_SERVIDUMBRES (nombre, descripcion) 
VALUES ('Paso', 'Servidumbre de paso para acceso');
INSERT INTO TIPOS_SERVIDUMBRES (nombre, descripcion) 
VALUES ('Acueducto', 'Servidumbre para conducción de agua');

-- ===============================
-- Datos de ejemplo para SERVIDUMBRES
-- ===============================
INSERT INTO SERVIDUMBRES (finca_id, tipo_servidumbre_id, descripcion, fecha_registro) 
VALUES (31, 1, 'Servidumbre de paso en terreno adyacente, Ciudad de Guatemala', '2023-07-01');
INSERT INTO SERVIDUMBRES (finca_id, tipo_servidumbre_id, descripcion, fecha_registro) 
VALUES (32, 2, 'Servidumbre para acueducto en Mixco', '2023-07-02');

-- ===============================
-- Datos de ejemplo para COLINDANTES
-- ===============================
INSERT INTO COLINDANTES (finca_id, direccion, propietario_colindante) 
VALUES (35, 'Calle vecina 10, Zona 1, Ciudad de Guatemala', 'Propietario X');
INSERT INTO COLINDANTES (finca_id, direccion, propietario_colindante) 
VALUES (36, 'Avenida Central, Mixco', 'Propietario Y');

-- ===============================
-- Datos de ejemplo para COORDENADAS
-- ===============================
INSERT INTO COORDENADAS (finca_id, latitud, longitud, referencia) 
VALUES (31, 14.6349, -90.5069, 'Centro de Ciudad de Guatemala');
INSERT INTO COORDENADAS (finca_id, latitud, longitud, referencia) 
VALUES (32, 14.6500, -90.5000, 'Zona 5, Mixco');

-- ===============================
-- Datos de ejemplo para ACTOS_O_NEGOCIOS
-- ===============================
INSERT INTO ACTOS_O_NEGOCIOS (finca_propietario_id, fecha, valor_transaccion, notario, descripcion) 
VALUES (2, '2023-08-01', 120000.00, 'Notario Juan Pérez', 'Transacción de compraventa en Ciudad de Guatemala');
INSERT INTO ACTOS_O_NEGOCIOS (finca_propietario_id, fecha, valor_transaccion, notario, descripcion) 
VALUES (3, '2023-08-05', 80000.00, 'Notario Ana Martínez', 'Transacción de donación en Mixco');

SELECT * FROM ACTOS_O_NEGOCIOS;

-- ===============================
-- Datos de ejemplo para COMPRAVENTA
-- ===============================
INSERT INTO COMPRAVENTA (acto_id, comprador_id, vendedor_id, precio, fecha) 
VALUES (2, 2, 1, 120000.00, '2023-08-10');

-- ===============================
-- Datos de ejemplo para DONACION
-- ===============================
INSERT INTO DONACION (acto_id, donante_id, donatario_id, condicion, fecha) 
VALUES (2, 2, 1, 'Sin condición', '2023-08-15');

-- ===============================
-- Datos de ejemplo para PERMUTA
-- ===============================
INSERT INTO PERMUTA (acto_id, propietario1_id, propietario2_id, descripcion, fecha) 
VALUES (3, 1, 2, 'Permuta de inmuebles en Ciudad de Guatemala', '2023-08-20');

-- ===============================
-- Datos de ejemplo para SUCESION_HEREDITARIA_TESTAMENTARIA
-- ===============================
INSERT INTO SUCESION_HEREDITARIA_TESTAMENTARIA (acto_id, causante_id, heredero_id, testamento, fecha) 
VALUES (2, 1, 2, 'Testamento registrado en Guatemala', '2023-08-25');

-- ===============================
-- Datos de ejemplo para SUCESION_HEREDITARIA_INTESTADA
-- ===============================
INSERT INTO SUCESION_HEREDITARIA_INTESTADA (acto_id, causante_id, heredero_id, resolucion_judicial, fecha) 
VALUES (3, 2, 1, 'Resolución judicial emitida en Guatemala', '2023-08-30');

-- ===============================
-- Datos de ejemplo para TITULACION_SUPLETORIA
-- ===============================
INSERT INTO TITULACION_SUPLETORIA (acto_id, solicitante_id, resolucion, fecha) 
VALUES (3, 1, 'Resolución de titulación emitida por autoridad catastral', '2023-09-01');

-- ===============================
-- Datos de ejemplo para ADJUDICACION
-- ===============================
INSERT INTO ADJUDICACION (acto_id, beneficiario_id, motivo, fecha) 
VALUES (3, 2, 'Adjudicación por herencia en Guatemala', '2023-09-05');

-- ===============================
-- Datos de ejemplo para DESMEMBRACION
-- ===============================
INSERT INTO DESMEMBRACION (acto_id, propietario_id, descripcion, fecha) 
VALUES (2, 1, 'Desmembración de la propiedad en Ciudad de Guatemala', '2023-09-10');
