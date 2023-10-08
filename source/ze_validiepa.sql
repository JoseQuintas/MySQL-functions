CREATE FUNCTION ze_ValidIEPA
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE lOk INT(11);
DECLARE nLen INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 2 ) <> '15' THEN
   RETURN 0;
END IF;
IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 8 ), '11' ) <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
