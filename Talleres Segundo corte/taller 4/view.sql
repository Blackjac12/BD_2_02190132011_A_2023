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
