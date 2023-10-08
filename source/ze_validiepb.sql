CREATE FUNCTION ze_ValidIEPB
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

SET nSoma := ze_CalculaDigito( SUBSTR( cInscricao, 1, 8 ), '11' );
IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
