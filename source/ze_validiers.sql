CREATE FUNCTION ze_ValidIERS
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 10 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 3 ) < '001' THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 9 ), '11' ) <> SUBSTR( cInscricao, 10, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
