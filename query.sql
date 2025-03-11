SELECT * FROM departamentos;

SELECT 
    direccion, 
    area_total,
    COUNT(*) AS CantidadDuplicados
FROM FINCAS
GROUP BY direccion, area_total
HAVING COUNT(*) > 1;

SELECT 
    fm.numero_finca AS FincaMatriz, 
    d.descripcion AS Desmembracion, 
    d.fecha, 
    p.nombre AS NuevoPropietario
FROM DESMEMBRACION d
JOIN ACTOS_O_NEGOCIOS a 
    ON d.acto_id = a.id
JOIN FINCA_PROPIETARIO fp 
    ON a.finca_propietario_id = fp.id
JOIN FINCAS fm 
    ON fp.finca_id = fm.id
JOIN PROPIETARIOS p 
    ON d.propietario_id = p.id
ORDER BY fm.numero_finca, d.fecha;

SELECT 
    f.numero_finca, 
    COUNT(*) AS VecesCambiado
FROM COMPRAVENTA cv
JOIN ACTOS_O_NEGOCIOS a 
    ON cv.acto_id = a.id
JOIN FINCA_PROPIETARIO fp 
    ON a.finca_propietario_id = fp.id
JOIN FINCAS f 
    ON fp.finca_id = f.id
GROUP BY f.numero_finca
ORDER BY VecesCambiado DESC;

SELECT 
    f.numero_finca, 
    f.direccion, 
    g.descripcion AS GravamenDescripcion, 
    eg.estado AS EstadoGravamen
FROM FINCAS f
JOIN GRAVAMENES g 
    ON f.id = g.finca_id
JOIN TIPOS_GRAVAMENES tg 
    ON g.tipo_id = tg.id
JOIN ESTADOS_GRAVAMENES eg 
    ON g.estado_id = eg.id
WHERE tg.nombre = 'Hipoteca';

SELECT DISTINCT 
    f.numero_finca, 
    f.direccion, 
    a.descripcion AS Anotacion
FROM FINCAS f
JOIN ANOTACIONES a 
    ON f.id = a.finca_id
WHERE a.descripcion LIKE '%litigio%' 
   OR a.descripcion LIKE '%juicio%';

SELECT 
    f.numero_finca, 
    f.area_total, 
    SUM(ph.area) AS SumaAreasSubdivididas
FROM FINCAS f
JOIN PROPIEDADES_HORIZONTALES ph 
    ON f.id = ph.finca_id
GROUP BY f.numero_finca, f.area_total
HAVING f.area_total <> SUM(ph.area);
