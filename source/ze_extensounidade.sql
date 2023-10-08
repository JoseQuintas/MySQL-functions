CREATE FUNCTION ze_ExtensoUnidade( nValor INT(11) )
RETURNS TEXT CHARSET latin1

BEGIN

DECLARE cTxt TEXT;

SET cTxt = (
CASE
   WHEN nValor = 1 THEN 'UM'
   WHEN nValor = 2 THEN 'DOIS'
   WHEN nValor = 3 THEN 'TRES'
   WHEN nValor = 4 THEN 'QUATRO'
   WHEN nValor = 5 THEN 'CINCO'
   WHEN nValor = 6 THEN 'SEIS'
   WHEN nValor = 7 THEN 'SETE'
   WHEN nValor = 8 THEN 'OITO'
   WHEN nValor = 9 THEN 'NOVE'
   WHEN nValor = 10 THEN 'DEZ'
   WHEN nValor = 11 THEN 'ONZE'
   WHEN nValor = 12 THEN 'DOZE'
   WHEN nValor = 13 THEN 'TREZE'
   WHEN nValor = 14 THEN 'QUATORZE'
   WHEN nValor = 15 THEN 'QUINZE'
   WHEN nValor = 16 THEN 'DEZESSEIS'
   WHEN nValor = 17 THEN 'DEZESSETE'
   WHEN nValor = 18 THEN 'DEZOITO'
   WHEN nValor = 19 THEN 'DEZENOVE'
ELSE ''
END );

RETURN cTxt;

END
