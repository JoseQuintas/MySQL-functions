CREATE FUNCTION ze_ValidIEGO
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;

SET cInscricao = ze_SoNumeros( cInscricao );

IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 8 ) );
SET nSoma := MOD( nSoma, 11 );
IF SUBSTR( cInscricao, 1, 8 ) = "11094402" THEN
   IF NOT SUBSTR( cInscricao, 9, 1 ) IN ( 0, 1 ) THEN
      RETURN 0;
   ELSE
      IF nSoma = 0 THEN
         IF SUBSTR( cInscricao, 9, 1 ) <> 0 THEN
            RETURN 0;
         END IF;
      ELSEIF nSoma = 1 THEN
         IF SUBSTR( cInscricao, 1, 8 ) >= '10103105' AND SUBSTR( cInscricao, 1, 8 ) <= '10119997' THEN
            IF SUBSTR( cInscricao, 9, 1 ) <> 1 THEN
               RETURN 0;
            END IF;
         ELSE
            IF SUBSTR( cInscricao, 9, 1 ) <> 0 THEN
               RETURN 0;
            END IF;
         END IF;
      ELSE
         SET nSoma := 11 - nSoma;
         IF SUBSTR( cInscricao, 9, 1 ) <> nSoma THEN
            RETURN 0;
         END IF;
      END IF;
   END IF;
END IF;

RETURN 1;

END
