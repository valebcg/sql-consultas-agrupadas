PUNTO 1: ¿Cuántos registros hay?
SELECT COUNT (*) FROM inscritos;
R: 16 



PUNTO 2: ¿Cuántos inscritos hay en total?
 SELECT SUM(cantidad) FROM inscritos;
 R:774



PUNTO 3: ¿Cuál o cuáles son los registros de mayor antigüedad?
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
R: cantidad |   fecha    | fuente
----------+------------+--------
       44 | 2021-01-01 | Blog
       56 | 2021-01-01 | Página




PUNTO 4:¿Cuántos  inscritos hay por día? (entendiendo un día como una fecha distinta de 
ahora en adelante)
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha;
R: fecha    | sum
------------+-----
 2021-02-01 | 120
 2021-08-01 | 182
 2021-05-01 |  88
 2021-04-01 |  93
 2021-06-01 |  30
 2021-07-01 |  58
 2021-03-01 | 103
 2021-01-01 | 100




 PUNTO 5: ¿Cuántos inscritos hay por fuente?
SELECT fuente, SUM(cantidad) FROM inscritos GROUP BY fuente;
R:fuente| sum
--------+-----
 Página | 441
 Blog   | 333

 


PUNTO 6: ¿Qué  día  se  inscribieron  la  mayor  cantidad  de  personas  y cuántas personas se 
inscribieron en ese día?
SELECT fecha, SUM(cantidad) FROM inscritos GROUP BY fecha ORDER BY SUM(cantidad) DESC LIMIT 1;
R:  fecha    | sum
------------+-----
 2021-08-01 | 182


PUNTO 7: ¿Qué días se inscribieron la mayor cantidad de personas utilizando el blog y cuántas personas fueron?
SELECT fecha,fuente, SUM(cantidad) FROM inscritos  WHERE fuente = 'Blog' GROUP BY fecha,fuente ORDER BY SUM(cantidad) DESC LIMIT 1;
R: fecha    | fuente | sum
------------+--------+-----
 2021-08-01 | Blog   |  83


PUNTO 8 : ¿Cuántas personas en promedio se inscriben en un día?
SELECT AVG(cantidad) FROM (SELECT SUM(cantidad) AS cantidad FROM inscritos GROUP BY fecha ) AS cantidad_dias; 
R: 96.75


PUNTO 9: ¿Qué días se inscribieron más de 50 personas?
SELECT fecha, SUM(cantidad)  FROM inscritos GROUP BY fecha HAVING SUM(cantidad) > 50;
R: fecha    | sum
------------+-----
 2021-02-01 | 120
 2021-08-01 | 182
 2021-05-01 |  88
 2021-04-01 |  93
 2021-07-01 |  58
 2021-03-01 | 103
 2021-01-01 | 100


PUNTO 10:  ¿Cuántas personas se registraron en promedio cada día a partir del tercer día?
SELECT AVG(cantidad) FROM (SELECT SUM(cantidad) AS cantidad FROM inscritos WHERE fecha >= '2021-03-01' GROUP BY fecha) AS cantidad_dias;  
R:92.333
