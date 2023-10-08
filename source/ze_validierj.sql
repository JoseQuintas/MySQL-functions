CREATE FUNCTION ze_ValidIERJ
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 8 THEN
   RETURN 0;
END IF;

/* 2 a 7 diferente dos demais */
SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 1 ) ) + ze_SomaModulo11( SUBSTR( cInscricao, 2, 6 ) );
SET nSoma := 11 - MOD( nSoma, 11 );
IF nSoma > 9 THEN
   SET nSoma := 0;
END IF;
IF nSoma <> SUBSTR( cInscricao, 8, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
