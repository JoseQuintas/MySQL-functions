CREATE FUNCTION ze_ValidIERR
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;
DECLARE nCont INT(11) DEFAULT 1;

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 2 ) <> '24' THEN
   RETURN 0;
END IF;

WHILE nCont < 9 DO
   SET nSoma := nSoma + ( SUBSTR( cInscricao, nCont, 1 ) * nCont );
   SET nCont := nCont + 1;
END WHILE;
SET nSoma := MOD( nSoma, 9 );
IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
