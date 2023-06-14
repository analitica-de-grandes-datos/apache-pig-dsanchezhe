/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Genere una relación con el apellido y su longitud. Ordene por longitud y 
por apellido. Obtenga la siguiente salida.

  Hamilton,8
  Garrett,7
  Holcomb,7
  Coffey,6
  Conway,6

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
--columna_2 = FOREACH data GENERATE fid, nombre AS col_2;
apellido_tabla = FOREACH data GENERATE apellido AS col_1, SIZE(apellido) AS col_2;
ordenar = ORDER apellido_tabla BY col_2 desc, col_1 asc;
ordenar_n = LIMIT ordenar 5;
STORE ordenar_n INTO 'output' using PigStorage(',');
