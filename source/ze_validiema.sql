CREATE FUNCTION ze_ValidIEMA
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 2 ) <> '12' THEN
   RETURN 0;
END IF;

SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 8 ) );
SET nSoma := 11 - MOD( nSoma, 11 );
IF nSoma > 9 THEN
   SET nSoma := 0;
END IF;
IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
