CREATE FUNCTION ze_ValidIEDF
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 13 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 11 ), '11' ) <> SUBSTR( cInscricao, 12, 1 ) THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 12 ), '11' ) <> SUBSTR( cInscricao, 13, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
