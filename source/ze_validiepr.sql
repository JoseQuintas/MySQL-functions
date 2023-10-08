CREATE FUNCTION ze_ValidIEPR
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 10 THEN
   RETURN 0;
END IF;

SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 2 ) ) + ze_SomaModulo11( SUBSTR( cInscricao, 3, 6 ) );
SET nSoma := 11 - MOD( nSoma, 11 );
SET nSoma := IF( nSoma > 9, 0, nSoma );
IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;
SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 3 ) ) + ze_SomaModulo11( SUBSTR( cInscricao, 4, 6 ) );
SET nSoma := 11 - MOD( nSoma, 11 );
SET nSoma := IF( nSoma > 9, 0, nSoma );
IF nSoma <> SUBSTR( cInscricao, 10, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
