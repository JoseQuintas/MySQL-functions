CREATE FUNCTION ze_ExtensoCentena( nValor INT )
RETURNS varchar(500)
BEGIN
DECLARE cTxt VARCHAR(500);
DECLARE nCentena INT;
DECLARE nDezena INT;
SET cTxt = '';
IF nValor > 0 THEN
   IF nValor = 100 THEN
      SET cTxt = 'CEM';
   ELSE
      SET nCentena = floor( nValor / 100 );
      SET nDezena = nValor - ( nCentena * 100 );
	   SET cTxt = (
	   CASE
	      WHEN nCentena = 1 THEN 'CENTO'
	      WHEN nCentena = 2 THEN 'DUZENTOS'
	      WHEN nCentena = 3 THEN 'TREZENTOS'
	      WHEN nCentena = 4 THEN 'QUATROCENTOS'
	      WHEN nCentena = 5 THEN 'QUINHENTOS'
	      WHEN nCentena = 6 THEN 'SEISSENTOS'
	      WHEN nCentena = 7 THEN 'SETECENTOS'
	      WHEN nCentena = 8 THEN 'OITOCENTOS'
	      WHEN nCentena = 9 THEN 'NOVECENTOS'
		ELSE ''
		END );
	   IF nDezena != 0 THEN
		   SET cTxt = CONCAT( cTxt, IF( nCentena = 0, '', ' E ' ), ze_ExtensoDezena( nDezena ) );
   	END IF;
	END IF;
END IF;
RETURN cTxt;
END
