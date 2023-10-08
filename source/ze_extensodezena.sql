CREATE FUNCTION ze_ExtensoDezena( nValor INT(11) )
RETURNS TEXT CHARSET latin1

BEGIN

DECLARE cTxt TEXT;
DECLARE nDezena, nUnidade INT(11);

SET cTxt := '';

IF nValor > 0 THEN
   IF nValor < 20 THEN
      SET cTxt := ze_ExtensoUnidade( nValor );
   ELSE
      SET nDezena := floor( nValor / 10 );
      SET nUnidade := nValor - ( nDezena * 10 );
      SET cTxt := (
      CASE
         WHEN nDezena = 2 THEN 'VINTE'
         WHEN nDezena = 3 THEN 'TRINTA'
         WHEN nDezena = 4 THEN 'QUARENTA'
         WHEN nDezena = 5 THEN 'CINQUENTA'
         WHEN nDezena = 6 THEN 'SESSENTA'
         WHEN nDezena = 7 THEN 'SETENTA'
         WHEN nDezena = 8 THEN 'OITENTA'
         WHEN nDezena = 9 THEN 'NOVENTA'
      ELSE ''
      END );
      IF nUnidade != 0 THEN
         SET cTxt := CONCAT( cTxt, ' E ', ze_ExtensoUnidade( nUnidade ) );
      END IF;
   END IF;
END IF;

RETURN cTxt;

END
