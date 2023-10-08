CREATE FUNCTION ze_ValidIEMT
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE lOk INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );
IF LENGTH( cInscricao ) > 11 THEN
   RETURN 0;
END IF;

SET cInscricao = LPAD( cInscricao, 11, '0' );

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 10 ), '11' ) <> SUBSTR( cInscricao, 11, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
