/*
Pregunta
===========================================================================

Para responder la pregunta use el archivo `data.csv`.

Obtenga los apellidos que empiecen por las letras entre la 'd' y la 'k'. La 
salida esperada es la siguiente:

  (Hamilton)
  (Holcomb)
  (Garrett)
  (Fry)
  (Kinney)
  (Klein)
  (Diaz)
  (Guy)
  (Estes)
  (Jarvis)
  (Knight)

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.csv' USING PigStorage(',') AS (fid:int, nombre:chararray, apellido:chararray, fecha:chararray, color:chararray, num:int);
apellido_tabla = FOREACH data GENERATE apellido AS col_1;
apellido_coinc = FILTER apellido_tabla BY STARTSWITH(col_1,'D') OR STARTSWITH(col_1,'E') OR STARTSWITH(col_1,'F') OR STARTSWITH(col_1,'G') OR STARTSWITH(col_1,'H') OR STARTSWITH(col_1,'I') OR STARTSWITH(col_1,'J') OR STARTSWITH(col_1,'K');
STORE apellido_coinc INTO 'output' using PigStorage(',');
