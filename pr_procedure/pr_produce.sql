USE Evento;
GO
CREATE OR ALTER PROCEDURE CrearBaseDatos
AS
BEGIN
	DECLARE @sql NVARCHAR(MAX);
	SET @sql = '
	USE EVENTO;
	CREATE TABLE Empresa(
		id_empresa INT PRIMARY KEY NOT NULL,
		nombre VARCHAR (40) NOT NULL,
		Descripcion VARCHAR (100) NOT NULL,
		NIT INT NOT NULL
	);
	CREATE TABLE Visitantes(
		id_visitante INT PRIMARY KEY NOT NULL,
		nombre VARCHAR(40) NOT NULL,
		telefono INT,
		correo VARCHAR(60),
		tipo_entrada VARCHAR(20) NOT NULL,
		rol VARCHAR(20)NOT NULL
	);
	CREATE TABLE Pabellon (
		id_pabellon INT PRIMARY KEY NOT NULL,
		tipo VARCHAR(20) NOT NULL
	);
	CREATE TABLE Productos (
		id_producto INT PRIMARY KEY NOT NULL,
		id_empresa INT NOT NULL,
		nombre VARCHAR(40) NOT NULL,
		descripcion VARCHAR(70),
		tipo VARCHAR(30) NOT NULL,
		costoProd INT NOT NULL,
		cantidad INT NOT NULL,
		FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa)
	);
	CREATE TABLE Stand (
		id_stand INT PRIMARY KEY NOT NULL,
		id_pabellon INT NOT NULL,
		id_producto INT NOT NULL,
		id_empresa INT NOT NULL,
		id_visitante INT NOT NULL,
		FOREIGN KEY (id_pabellon) REFERENCES Pabellon(id_pabellon),
		FOREIGN KEY (id_producto) REFERENCES Productos(id_producto),
		FOREIGN KEY (id_empresa) REFERENCES Empresa(id_empresa),
		FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante)
	);
	CREATE TABLE Charlas(
		id_charla INT PRIMARY KEY NOT NULL,
		id_visitante INT NOT NULL,
		tipo VARCHAR(50) NOT NULL,
		descripcion VARCHAR(100) NOT NULL,
		FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante)
	);
	CREATE TABLE VisitantesCharlas(
		id_visicharla INT PRIMARY KEY NOT NULL,
		id_visitante INT NOT NULL,
		id_charla INT NOT NULL,
		FOREIGN KEY (id_visitante) REFERENCES Visitantes(id_visitante),
		FOREIGN KEY (id_charla) REFERENCES Charlas(id_charla)
	);
    
    -- Insert Empresa
    INSERT INTO Empresa VALUES
    (1, ''Sentech'', ''tecnologia'', 702443),
    (2, ''Edatronic'', ''comida'', 28943),
    (3, ''kmtech'', ''tecnologia'', 38562),
    (4, ''TecnoFood'', ''comida'', 12345),
    (5, ''InnovaSoft'', ''software'', 67890),
    (6, ''GadgetPro'', ''hardware'', 54321),
    (7, ''SmartSolutions'', ''iot'', 98765),
    (8, ''TechWorld'', ''tecnologia'', 11223),
    (9, ''Foodies'', ''comida'', 44556),
    (10, ''CodeCrafters'', ''software'', 77889);

    -- Insert Visitantes
    INSERT INTO Visitantes VALUES
    (1, ''Juan'', 37454893, ''juan@gmail.com'', ''estudiante'', ''visitante''),
    (2, ''Alondra'', 320287, ''aleja@gmail.com'', ''especial'', ''ponente''),
    (3, ''Alvaro'', 380247, ''alvaro@gmail.com'', ''especial'', ''responsable''),
    (4, ''Camila'', 310256, ''cami@gmail.com'', ''general'', ''visitante''),
    (5, ''Luis'', 300145, ''liu@gmail.com'', ''estudiante'', ''visitante''),
    (6, ''Sofia'', 320789, ''sofi@gmai.com'', ''general'', ''visitante''),
    (7, ''Mateo'', 310456, ''mateo@gmail.com'', ''especial'', ''ponente''),
    (8, ''Valentina'', 300987, ''valen@gmail.com'',''general'',''visitante''),
    (9, ''Antonella'', 3002948,''Anto@gmail.com'',''general'',''visitante''),
    (10, ''Jhon'',3006170,''jhon@gmail.com'',''especial'',''responsable'');

    -- Insert Pabellon
    INSERT INTO Pabellon VALUES
    (1, ''Software''),
    (2, ''Hardware''),
    (3, ''IOT''),
    (4, ''Innovacion''); 

    -- Insert Productos
    INSERT INTO Productos VALUES
    (1, 1, ''Producto A'', ''Producto tecnologia'', ''tecnologia'', 72000, 10),
    (2, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 10000, 5),
    (3, 3, ''Dron'', ''Dron volador'', ''tecnologia'', 650000, 2),
    (4, 4, ''Producto B'', ''Producto tex'', ''tecnologia'', 54000, 5),
    (5, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 23000, 7),
    (6, 1, ''Producto A'', ''Producto tecnologia'', ''tecnologia'', 10000, 3),
    (7, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 23000, 7),
    (8, 2, ''Producto B'', ''Producto tex'', ''tecnologia'', 10000, 9),
    (9, 1, ''Producto A'', ''Producto tecnologia'', ''tecnologia'', 10000, 3),
    (10, 3, ''Dron'', ''Producto tex'', ''tecnologia'', 10000, 5);

    -- Insert Stand
    INSERT INTO Stand VALUES
    (1, 1, 1, 1, 10),
    (2, 2, 2, 2, 3),
    (3, 3, 3, 3, 3),
    (4, 2, 6, 3, 3),
    (5, 1, 4, 3, 3),
    (6, 4, 8, 3, 10), 
    (7, 3, 10, 3, 3),
    (8, 2, 2, 3, 10),
    (9, 1, 5, 3, 3),
    (10, 1, 3, 3, 10);

    -- Insert Charlas
    INSERT INTO Charlas VALUES
    (1,2, ''economia'', ''economia mundial''),
    (2,2, ''educacion'', ''educacion en colombia''),
    (3,3, ''tecnologia'', ''el sena''),
    (4,3, ''Cocina'', ''En colombia''),
    (5,3, ''Celulares'', ''En Chia''),
    (6,3, ''tecnologia'', ''Evolucion''),
    (7,3,''Iforamtica'', ''Evolucion''),
    (8,3,''Pintura'', ''Paisajes''),
    (9,3,''Magisterio'', ''Pensiones''),
    (10,3, ''Mineria'', ''Medio Ambiente'');

    -- Insert VisitantesCharlas
    INSERT INTO VisitantesCharlas VALUES
    (1,2, 3),
    (2,1, 4),
    (3,2, 2),
    (4,3, 1),
    (5,4, 4),
    (6,4, 1),
    (7,8, 6),
    (8,7, 10),
    (9,5, 2),
    (10,2, 1);
     -- Cantidad de visitantes estuvieron en el evento
    SELECT COUNT(*) AS cantidad_de_visitantes 
    FROM Visitantes;

    -- Que visitantes eran estudiantes
    SELECT id_visitante, nombre, tipo_entrada 
    FROM Visitantes 
    WHERE tipo_entrada = ''estudiante'';

    -- El producto mas caro
    SELECT nombre, costoProd 
    FROM Productos 
    WHERE costoProd = (SELECT MAX(costoProd) FROM Productos);

    -- Visitante con mas charlas asistidas
    SELECT TOP 1 v.nombre, COUNT(*) AS AsistenciaCharlas 
    FROM Visitantes v
    INNER JOIN VisitantesCharlas vc 
        ON v.id_visitante = vc.id_visitante
    GROUP BY v.nombre
    ORDER BY AsistenciaCharlas DESC;

    -- Charlas con mas visitantes
    SELECT TOP 1 c.tipo, COUNT(*) AS VisitantesEnLaCharla 
    FROM Charlas c
    INNER JOIN VisitantesCharlas vc 
        ON c.id_charla = vc.id_charla
    GROUP BY c.tipo
    ORDER BY VisitantesEnLaCharla DESC;'
	exec (@sql);
END;
GO
exec CrearBaseDatos;