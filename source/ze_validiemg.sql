CREATE FUNCTION ze_ValidIEMG
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;
DECLARE cValida VARCHAR(20);
DECLARE nCont INT(11) DEFAULT 1;
DECLARE nMultiplica INT(11);
DECLARE nValor INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 13 THEN
   RETURN 0;
END IF;

SET cValida := CONCAT( SUBSTR( cInscricao, 1, 3 ), "0", Substr( cInscricao, 4, 8 ) );

SET nMultiplica := 1;
WHILE nCont < 13 DO
   SET nValor := SUBSTR( cValida, nCont, 1 ) * nMultiplica;
   SET nSoma := nSoma + FLOOR( nValor / 10 ) + nValor - ( FLOOR( nValor / 10 ) * 10 );
   SET nMultiplica := IF( nMultiplica = 1, 2, 1 );
   SET nCont := nCont + 1;
END WHILE;
SET nSoma := 10 - MOD( nSoma, 10 );
SET nSoma := IF( nSoma = 10, 0, nSoma );
IF nSoma <> SUBSTR( cInscricao, 12, 1 ) THEN
   RETURN 0;
END IF;
SET nCont := 12;
SET nMultiplica := 2;
SET nSoma := 0;
WHILE nCont > 0 DO
   SET nSoma := nSoma + ( nMultiplica * SUBSTR( cInscricao, nCont, 1 ) );
   SET nMultiplica := nMultiplica + 1;
   SET nMultiplica := IF( nMultiplica = 12, 2, nMultiplica );
   SET nCont := nCont - 1;
END WHILE;
SET nSoma := 11 - MOD( nSoma, 11 );
SET nSoma := IF( nSoma > 9, 0, nSoma );
IF nSoma <> SUBSTR( cInscricao, 13, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
