/*
Pregunta
===========================================================================

Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
columna 3. En otras palabras, cuántos registros hay que tengan la clave 
`aaa`?

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/
data = LOAD 'data.tsv' AS (letra:chararray, corchetes:chararray, lista:chararray);
columna_3 = FOREACH data GENERATE lista;
flatten_col3 = FOREACH columna_3 GENERATE FLATTEN(TOKENIZE(lista)) AS mapas;
replace_col3_1 = FOREACH flatten_col3 GENERATE REPLACE(mapas,'([^a-zA-Z\\s]+)','') AS mapas;
grupo_letras = GROUP replace_col3_1 BY mapas;
grupo_letras_count = FOREACH grupo_letras GENERATE group, COUNT(replace_col3_1);
STORE grupo_letras_count INTO 'output' using PigStorage(',');
