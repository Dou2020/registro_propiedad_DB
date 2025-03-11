-- Active: 1734408453252@@127.0.0.1@1433@registro_propiedad
-- Crear la base de datos (si no existe) y usarla
CREATE DATABASE registro_propiedad;
GO

USE registro_propiedad;
GO

-- ------------------------------
-- Tabla: DEPARTAMENTOS
-- ------------------------------
CREATE TABLE DEPARTAMENTOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL UNIQUE
);
GO

-- ------------------------------
-- Tabla: MUNICIPIOS
-- ------------------------------
CREATE TABLE MUNICIPIOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    departamento_id INT NOT NULL,
    nombre NVARCHAR(100) NOT NULL,
    CONSTRAINT UQ_MUNICIPIOS_Nombre UNIQUE (nombre),
    CONSTRAINT FK_Municipios_Departamentos FOREIGN KEY (departamento_id)
        REFERENCES DEPARTAMENTOS(id)
);
GO

-- ------------------------------
-- Tabla: AREAS
-- ------------------------------
CREATE TABLE AREAS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(255)
);
GO

-- ------------------------------
-- Tabla: USOS
-- ------------------------------
CREATE TABLE USOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    tipo NVARCHAR(50) NOT NULL
);
GO

-- ------------------------------
-- Tabla: PLANOS
-- ------------------------------
CREATE TABLE PLANOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    numero_plano NVARCHAR(100) NOT NULL UNIQUE,
    archivo_plano NVARCHAR(255),
    fecha_registro DATE,
    descripcion NVARCHAR(255),
    estado NVARCHAR(50)  -- Ej.: Aprobado, Pendiente, Rechazado
);
GO

-- ------------------------------
-- Tabla: LIBROS
-- ------------------------------
CREATE TABLE LIBROS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL UNIQUE,
    departamento_id INT NOT NULL,
    fecha_creacion DATE,
    CONSTRAINT FK_Libros_Departamentos FOREIGN KEY (departamento_id)
        REFERENCES DEPARTAMENTOS(id)
);
GO

-- ------------------------------
-- Tabla: FOLIOS
-- ------------------------------
CREATE TABLE FOLIOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    libro_id INT NOT NULL,
    numero_folio INT NOT NULL,
    descripcion NVARCHAR(255),
    CONSTRAINT UQ_Folios_Libro_Folio UNIQUE (libro_id, numero_folio),
    CONSTRAINT FK_Folios_Libros FOREIGN KEY (libro_id)
        REFERENCES LIBROS(id)
);
GO

-- ------------------------------
-- Tabla: FINCAS
-- ------------------------------
CREATE TABLE FINCAS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    numero_finca INT NOT NULL UNIQUE,
    folio_id INT NOT NULL,
    municipio_id INT NOT NULL,
    area_id INT NOT NULL,
    uso_id INT NOT NULL,
    plano_id INT NOT NULL,
    direccion NVARCHAR(255),
    area_total DECIMAL(18,2),
    tipo_tenencia NVARCHAR(50),  -- Ej.: Propia, Arrendada, Comodato, Otro
    estado NVARCHAR(50),         -- Ej.: Activo, Inactivo
    CONSTRAINT FK_Fincas_Folios FOREIGN KEY (folio_id)
        REFERENCES FOLIOS(id),
    CONSTRAINT FK_Fincas_Municipios FOREIGN KEY (municipio_id)
        REFERENCES MUNICIPIOS(id),
    CONSTRAINT FK_Fincas_Areas FOREIGN KEY (area_id)
        REFERENCES AREAS(id),
    CONSTRAINT FK_Fincas_Usos FOREIGN KEY (uso_id)
        REFERENCES USOS(id),
    CONSTRAINT FK_Fincas_Planos FOREIGN KEY (plano_id)
        REFERENCES PLANOS(id)
);
GO

-- ------------------------------
-- Tabla: PROPIETARIOS
-- ------------------------------
CREATE TABLE PROPIETARIOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(100) NOT NULL,
    dpi NVARCHAR(20) NOT NULL UNIQUE,
    direccion NVARCHAR(255),
    telefono NVARCHAR(50),
    email NVARCHAR(100) NOT NULL UNIQUE,
    nacionalidad NVARCHAR(50),
    fecha_nacimiento DATE
);
GO

-- ------------------------------
-- Tabla: FINCA_PROPIETARIO
-- ------------------------------
CREATE TABLE FINCA_PROPIETARIO (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    propietario_id INT NOT NULL,
    fecha_adquisicion DATE,
    CONSTRAINT FK_FincaPropietario_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id),
    CONSTRAINT FK_FincaPropietario_Propietarios FOREIGN KEY (propietario_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: INSCRIPCIONES
-- ------------------------------
CREATE TABLE INSCRIPCIONES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    descripcion NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Inscripciones_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id)
);
GO

-- ------------------------------
-- Tabla: TIPOS_GRAVAMENES
-- ------------------------------
CREATE TABLE TIPOS_GRAVAMENES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,
    descripcion NVARCHAR(255)
);
GO

-- ------------------------------
-- Tabla: ESTADOS_GRAVAMENES
-- ------------------------------
CREATE TABLE ESTADOS_GRAVAMENES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    estado NVARCHAR(50) NOT NULL
);
GO

-- ------------------------------
-- Tabla: GRAVAMENES
-- ------------------------------
CREATE TABLE GRAVAMENES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    tipo_id INT NOT NULL,
    estado_id INT NOT NULL,
    descripcion NVARCHAR(255),
    monto DECIMAL(18,2),
    entidad_financiera NVARCHAR(100),
    fecha_registro DATE,
    fecha_vencimiento DATE,
    CONSTRAINT FK_Gravamenes_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id),
    CONSTRAINT FK_Gravamenes_Tipos FOREIGN KEY (tipo_id)
        REFERENCES TIPOS_GRAVAMENES(id),
    CONSTRAINT FK_Gravamenes_Estados FOREIGN KEY (estado_id)
        REFERENCES ESTADOS_GRAVAMENES(id)
);
GO

-- ------------------------------
-- Tabla: ANOTACIONES
-- ------------------------------
CREATE TABLE ANOTACIONES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    descripcion NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Anotaciones_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id)
);
GO

-- ------------------------------
-- Tabla: PROPIEDADES_HORIZONTALES
-- ------------------------------
CREATE TABLE PROPIEDADES_HORIZONTALES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    propietario_id INT NOT NULL,  -- Relación: PROPIETARIOS es dueño de estas propiedades
    unidad NVARCHAR(50),
    tipo NVARCHAR(50),  -- Ej.: Apartamento, Local Comercial, Otro
    area DECIMAL(18,2),
    piso NVARCHAR(50),
    descripcion NVARCHAR(255),
    CONSTRAINT FK_PropHorizontales_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id),
    CONSTRAINT FK_PropHorizontales_Propietarios FOREIGN KEY (propietario_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: AMENIDADES
-- ------------------------------
CREATE TABLE AMENIDADES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    propiedad_horizontal_id INT NOT NULL,
    nombre NVARCHAR(50),  -- Ej.: Piscina, Gimnasio, Área Verde, Parqueo, Otro
    descripcion NVARCHAR(255),
    CONSTRAINT FK_Amenidades_PropHorizontales FOREIGN KEY (propiedad_horizontal_id)
        REFERENCES PROPIEDADES_HORIZONTALES(id)
);
GO

-- ------------------------------
-- Tabla: TIPOS_SERVIDUMBRES
-- ------------------------------
CREATE TABLE TIPOS_SERVIDUMBRES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre NVARCHAR(50) NOT NULL,  -- Ej.: Paso, Acueducto, Eléctrica, Otro
    descripcion NVARCHAR(255)
);
GO

-- ------------------------------
-- Tabla: SERVIDUMBRES
-- ------------------------------
CREATE TABLE SERVIDUMBRES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    tipo_servidumbre_id INT NOT NULL,
    descripcion NVARCHAR(255),
    fecha_registro DATE,
    CONSTRAINT FK_Servidumbres_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id),
    CONSTRAINT FK_Servidumbres_Tipos FOREIGN KEY (tipo_servidumbre_id)
        REFERENCES TIPOS_SERVIDUMBRES(id)
);
GO

-- ------------------------------
-- Tabla: COLINDANTES
-- ------------------------------
CREATE TABLE COLINDANTES (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    direccion NVARCHAR(255),
    propietario_colindante NVARCHAR(100),
    CONSTRAINT FK_Colindantes_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id)
);
GO

-- ------------------------------
-- Tabla: COORDENADAS
-- ------------------------------
CREATE TABLE COORDENADAS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_id INT NOT NULL,
    latitud DECIMAL(10, 6),
    longitud DECIMAL(10, 6),
    referencia NVARCHAR(255),
    CONSTRAINT FK_Coordenadas_Fincas FOREIGN KEY (finca_id)
        REFERENCES FINCAS(id)
);
GO

-- ------------------------------
-- Tabla: ACTOS_O_NEGOCIOS
-- ------------------------------
CREATE TABLE ACTOS_O_NEGOCIOS (
    id INT IDENTITY(1,1) PRIMARY KEY,
    finca_propietario_id INT NOT NULL,
    fecha DATE,
    valor_transaccion DECIMAL(18,2),
    notario NVARCHAR(100),
    descripcion NVARCHAR(255),
    CONSTRAINT FK_ActosFincaPropietario FOREIGN KEY (finca_propietario_id)
        REFERENCES FINCA_PROPIETARIO(id)
);
GO

-- ------------------------------
-- Tabla: COMPRAVENTA
-- ------------------------------
CREATE TABLE COMPRAVENTA (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    comprador_id INT NOT NULL,
    vendedor_id INT NOT NULL,
    precio DECIMAL(18,2),
    fecha DATE,
    CONSTRAINT FK_Compraventa_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_Compraventa_Comprador FOREIGN KEY (comprador_id)
        REFERENCES PROPIETARIOS(id),
    CONSTRAINT FK_Compraventa_Vendedor FOREIGN KEY (vendedor_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: DONACION
-- ------------------------------
CREATE TABLE DONACION (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    donante_id INT NOT NULL,
    donatario_id INT NOT NULL,
    condicion NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Donacion_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_Donacion_Donante FOREIGN KEY (donante_id)
        REFERENCES PROPIETARIOS(id),
    CONSTRAINT FK_Donacion_Donatario FOREIGN KEY (donatario_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: PERMUTA
-- ------------------------------
CREATE TABLE PERMUTA (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    propietario1_id INT NOT NULL,
    propietario2_id INT NOT NULL,
    descripcion NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Permuta_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_Permuta_Propietario1 FOREIGN KEY (propietario1_id)
        REFERENCES PROPIETARIOS(id),
    CONSTRAINT FK_Permuta_Propietario2 FOREIGN KEY (propietario2_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: SUCESION_HEREDITARIA_TESTAMENTARIA
-- ------------------------------
CREATE TABLE SUCESION_HEREDITARIA_TESTAMENTARIA (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    causante_id INT NOT NULL,
    heredero_id INT NOT NULL,
    testamento NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_SucesionTestamentaria_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_SucesionTestamentaria_Causante FOREIGN KEY (causante_id)
        REFERENCES PROPIETARIOS(id),
    CONSTRAINT FK_SucesionTestamentaria_Heredero FOREIGN KEY (heredero_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: SUCESION_HEREDITARIA_INTESTADA
-- ------------------------------
CREATE TABLE SUCESION_HEREDITARIA_INTESTADA (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    causante_id INT NOT NULL,
    heredero_id INT NOT NULL,
    resolucion_judicial NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_SucesionIntestada_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_SucesionIntestada_Causante FOREIGN KEY (causante_id)
        REFERENCES PROPIETARIOS(id),
    CONSTRAINT FK_SucesionIntestada_Heredero FOREIGN KEY (heredero_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: TITULACION_SUPLETORIA
-- ------------------------------
CREATE TABLE TITULACION_SUPLETORIA (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    solicitante_id INT NOT NULL,
    resolucion NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Titulacion_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_Titulacion_Solicitante FOREIGN KEY (solicitante_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: ADJUDICACION
-- ------------------------------
CREATE TABLE ADJUDICACION (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    beneficiario_id INT NOT NULL,
    motivo NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Adjudicacion_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_Adjudicacion_Beneficiario FOREIGN KEY (beneficiario_id)
        REFERENCES PROPIETARIOS(id)
);
GO

-- ------------------------------
-- Tabla: DESMEMBRACION
-- ------------------------------
CREATE TABLE DESMEMBRACION (
    id INT IDENTITY(1,1) PRIMARY KEY,
    acto_id INT NOT NULL,
    propietario_id INT NOT NULL,
    descripcion NVARCHAR(255),
    fecha DATE,
    CONSTRAINT FK_Desmembracion_Actos FOREIGN KEY (acto_id)
        REFERENCES ACTOS_O_NEGOCIOS(id),
    CONSTRAINT FK_Desmembracion_Propietario FOREIGN KEY (propietario_id)
        REFERENCES PROPIETARIOS(id)
);
GO
