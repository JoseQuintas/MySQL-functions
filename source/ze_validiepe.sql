CREATE FUNCTION ze_ValidIEPE
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 7 ), '11' ) <> SUBSTR( cInscricao, 8, 1 ) THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 8 ), '11' ) <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
