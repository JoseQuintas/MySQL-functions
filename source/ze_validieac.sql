CREATE FUNCTION ze_ValidIEAC
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) != 13 AND LENGTH( cInscricao ) != 9 THEN
   RETURN 0;
END IF;

IF LEFT( cInscricao, 2 ) != '01' THEN
   RETURN 0;
END IF;

IF LENGTH( cInscricao ) = 9 THEN
   SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 8 ) );
   SET nSoma := nSoma - MOD( nSoma, 11 );
   SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
   SET nSoma := IF( nSoma = SUBSTR( cInscricao, 9, 1 ), 1, 0 );
ELSE
   IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 11 ), '11' ) != SUBSTR( cInscricao, 12, 1 ) THEN
      RETURN 0;
   END IF;
   IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 12 ), '11' ) != SUBSTR( cInscricao, 13, 1 ) THEN
      RETURN 0;
   END IF;
END IF;

RETURN 1;

END
