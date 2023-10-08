CREATE FUNCTION ze_Extenso( nValor DECIMAL(18,2) )
RETURNS TEXT CHARSET latin1

BEGIN

DECLARE cTxt TEXT;
DECLARE nInteiro DECIMAL(18,0);
DECLARE nDecimal DECIMAL(5,0);

SET cTxt := '';
SET nInteiro := FLOOR( nValor );
SET nDecimal := FLOOR( ( nValor - nInteiro ) * 100 );
IF nInteiro != 0 THEN
   SET cTxt := CONCAT( cTxt, ze_ExtensoNumero( nInteiro ), ' ', IF( nInteiro > 1, 'REAIS', 'REAL' ) );
END IF;
IF nInteiro != 0 AND nDecimal != 0 THEN
   SET cTxt := CONCAT( cTxt, ' E ' );
END IF;
IF nDecimal != 0 THEN
   SET cTxt := CONCAT( cTxt, ze_ExtensoNumero( nDecimal ), ' ', IF( nDecimal > 1, 'CENTAVOS', 'CENTAVO' ) );
   IF nInteiro = 0 THEN
      SET cTxt := CONCAT( cTxt, ' DE REAL' );
   END IF;
END IF;
SET cTxt := REPLACE( cTxt, 'ILHAO REAIS', 'ILHAO DE REAIS' );
SET cTxt := REPLACE( cTxt, 'ILHOES REAIS', 'ILHOES DE REAIS' );

RETURN cTxt;

END
