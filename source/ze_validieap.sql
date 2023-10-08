CREATE FUNCTION ze_ValidIEAP
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11);
DECLARE nValor1, nValor2 INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) != 9 THEN
      RETURN 0;
ELSEIF LEFT( cInscricao, 2 ) != '03' THEN
      RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 8 ) < 3017001 THEN
   SET nValor1 := 5;
   SET nValor2 := 0;
ELSEIF SUBSTR( cInscricao, 1, 8 ) < 3019023 THEN
   SET nValor1 := 9;
   SET nValor2 := 1;
ELSE
   SET nValor1 := 0;
   SET nValor2 := 0;
END IF;
SET nSoma := nValor1 + ze_SomaModulo11( SUBSTR( cInscricao, 1, 8 ) );
SET nSoma := 11 - MOD( nSoma, 11 );
IF nSoma = 11 THEN
   SET nSoma := nValor2;
ELSEIF nSoma = 10 THEN
   SET nSoma := 0;
END IF;
IF nSoma != SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

RETURN 1;

END
