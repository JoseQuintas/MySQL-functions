CREATE FUNCTION ze_ValidIERO
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 AND LENGTH( cInscricao ) <> 14 THEN
   RETURN 0;
END IF;

IF LENGTH( cInscricao ) = 9 THEN
   SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 8 ) );
   SET nSoma := 11 - MOD( nSoma, 11 );
   SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
   IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
      RETURN 0;
   END IF;
ELSE
   SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 13 ) );
   SET nSoma := 11 - MOD( nSoma, 11 );
   SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
   IF nSoma <> SUBSTR( cInscricao, 14, 1 ) THEN
      RETURN 0;
   END IF;
END IF;

RETURN 1;

END
