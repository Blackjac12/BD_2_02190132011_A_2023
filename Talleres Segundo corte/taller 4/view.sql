CREATE VIEW regsitrados As  
SELECT c2.nombre ,c2.apellido ,c.carrera , i.puntaje as puntaje_de_ifeces ,r.sede 
FROM registro r ,carrera c ,ifeces i,contacto c2 
WHERE r.id_concto  = c2.id 
and r.id_carrera = c.id 
and r.id_ifeces = i.id ;


CREATE VIEW aprovados  As  
SELECT c2.nombre ,c2.apellido ,c.carrera ,r.sede ,a.aprovados 
FROM registro r ,carrera c ,contacto c2 ,Aprovados a 
WHERE r.id_concto  = c2.id 
and r.id_carrera = c.id 
AND a.id_registrados = r.id 
and a.aprovados = 1;


CREATE VIEW becados  As 
Select c.nombre ,c.apellido ,r.sede ,c2.carrera, b.becados
FROM  contacto c , carrera c2 ,registro r ,Aprovados a ,beca b 
WHERE r.id_concto  = c.id 
and r.id_carrera =c2.id 
AND a.id_registrados = r.id 
AND  a.id_registrados =r.id 
AND  b.id_aprovados = a.id 
AND b.becados = 1;


CREATE  view materias as
SELECT m.nombre,m.creditos  ,c.carrera 
FROM  materia m , carrera c 
WHERE m.id_carrera = c.id 
    
CREATE  view odern As 
Select *
FROM  contacto c  
ORDER BY c.nombre  ASC
    
    
CREATE  view Orden_materias as
SELECT m.nombre,m.creditos  ,c.carrera 
FROM  materia m , carrera c 
WHERE m.id_carrera = c.id 
ORDER BY m.nombre  ASC 
    
    
CREATE VIEW aprovados_ordanasos  As  
SELECT c2.nombre ,c2.apellido ,c.carrera ,r.sede ,a.aprovados 
FROM registro r ,carrera c ,contacto c2 ,Aprovados a 
WHERE r.id_concto  = c2.id 
and r.id_carrera = c.id 
AND a.id_registrados = r.id 
and a.aprovados = 1
ORDER BY c2.nombre ASC  


CREATE  view pines_pagos as
Select p.perido , p.año , p.valor_pagar 
FROM pin p 
ORDER BY p.valor_pagar  DESC



CREATE  view   peor_puntaje as
SELECT c2.nombre ,c2.apellido ,c.carrera , i.puntaje as puntaje_de_ifeces ,r.sede 
FROM registro r ,carrera c ,ifeces i,contacto c2 
WHERE r.id_concto  = c2.id 
and r.id_carrera = c.id 
and r.id_ifeces = i.id
ORDER BY i.puntaje  ASC
 
CREATE  view estudiantes_materias as
select c.nombre ,c.apellido ,m.nombre  as materia ,m.creditos,c2.carrera,r.sede  
FROM  registro r ,contacto c ,carrera c2 ,materia m 
WHERE r.id_concto  = c.id 
and r.id_carrera = c2.id 
AND m.id_carrera = c2.id 
 
 
    
