CREATE FUNCTION ze_ValidIETO
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

SET cInscricao = ze_SoNumeros( cInscricao );

IF NOT LENGTH( cInscricao ) IN ( 9, 11 ) THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 2 )  <> '29' THEN
   RETURN 0;
END IF;

IF LENGTH( cInscricao ) = 11 AND NOT SUBSTR( cInscricao, 3, 2 ) IN ( '01', '02', '03', '99' ) THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( CONCAT( SUBSTR( cInscricao, 1, 2 ), SUBSTR( cInscricao, LENGTH( cInscricao ) - 6, 6 ) ), '11' ) != RIGHT( cInscricao, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
