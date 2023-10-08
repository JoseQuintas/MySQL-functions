CREATE FUNCTION ze_ValidIEAL
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) != 9 THEN
   RETURN 0;
ELSEIF LEFT( cInscricao, 2 ) != '24' THEN
   RETURN 0;
ELSEIF NOT SUBSTR( cInscricao, 3, 1 ) IN ( '0', '2', '3', '5', '7', '8' ) THEN
   RETURN 0;
END IF;

SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 8 ) );
SET nSoma := nSoma * 10;
SET nSoma := MOD( nSoma, 11 );
SET nSoma := IF( nSoma = 10, 0, nSoma );
IF nSoma != SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
