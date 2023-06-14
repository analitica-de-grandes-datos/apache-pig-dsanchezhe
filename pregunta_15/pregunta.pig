/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Escriba el código equivalente a la siguiente consulta SQL.

   SELECT 
       firstname,
       color
   FROM 
       u 
   WHERE color = 'blue' AND firstname LIKE 'Z%';

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
nombre_color_tabla = FOREACH data GENERATE nombre AS col_1, color AS col_2;
color_coinc = FILTER nombre_color_tabla BY STARTSWITH(col_2,'blue') AND STARTSWITH(col_1,'Z');
STORE color_coinc INTO 'output' using PigStorage(' ');
