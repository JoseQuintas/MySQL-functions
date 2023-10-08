CREATE FUNCTION ze_ValidIEBA
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;
DECLARE nPos INT(11);
DECLARE cTMP VARCHAR(20);
DECLARE nModulo INT(11);

SET cInscricao = ze_SoNumeros( cInscricao );

IF NOT LENGTH( cInscricao ) IN ( 8, 9 ) THEN
   RETURN 0;
END IF;

IF LENGTH( cInscricao ) = 8 THEN
   IF SUBSTR( cInscricao, 1, 1 ) IN ( 0, 1, 2, 3, 4, 5, 8 ) THEN
      SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 6 ) );
      SET nSoma := 10 - MOD( nSoma, 10 );
      SET nSoma := IF( nSoma = 10, 0, nSoma );
      IF nSoma <> SUBSTR( cInscricao, 8, 1 ) THEN
         RETURN 0;
      END IF;
      SET nSoma := ze_SomaModulo11( CONCAT( SUBSTR( cInscricao, 1, 6 ), SUBSTR( cInscricao, 8, 1 ) ) );
      SET nSoma := 10 - MOD( nSoma, 10 );
      SET nSoma := IF( nSoma = 10, 0, nSoma );
      IF nSoma <> SUBSTR( cInscricao, 7, 1 ) THEN
         RETURN 0;
      END IF;
   ELSE
      IF ze_CalculaDigito( CONCAT( SUBSTR( cInscricao, 1, 6 ), SUBSTR( cInscricao, 8, 1 ) ), '11' ) <> SUBSTR( cInscricao, 7, 1 ) THEN
         RETURN 0;
      END IF;
   END IF;
ELSE
   SET nSoma := 0;
   SET nModulo := IF( SUBSTR( cInscricao, 2, 1 ) IN ( 0, 1, 2, 3, 4, 5, 8 ), 10, 11 );
   SET nPos := 7;
   WHILE nPos > 0 DO
      SET nSoma := nSoma + ( SUBSTR( cInscricao, nPos, 1 ) * ( 9 - nPos ) );
      SET nPos := nPos - 1;
   END WHILE;
   SET nSoma := nModulo - MOD( nSoma, nModulo );
   SET nSoma := IF( nSoma > 9, 0, nSoma );
   IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
      RETURN 0;
   END IF;
   SET nSoma := 0;
   SET cTMP := CONCAT( SUBSTR( cInscricao, 1, 7 ), SUBSTR( cInscricao, 9, 1 ) );
   SET nPos := 8;
   WHILE nPos > 0 DO
      SET nSoma := nSoma + ( SUBSTR( cTMP, nPos, 1 ) * ( 10 - nPos ) );
      SET nPos := nPos - 1;
   END WHILE;
   SET nSoma := nModulo - MOD( nSoma, nModulo );
   SET nSoma := IF( nSoma > 9, 0, nSoma );
   IF nSoma <> SUBSTR( cInscricao, 8, 1 ) THEN
      RETURN 0;
   END IF;
END IF;

RETURN 1;

END
