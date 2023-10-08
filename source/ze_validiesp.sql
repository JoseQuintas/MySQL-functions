CREATE FUNCTION ze_ValidIESP
(
   cInscricao VARCHAR(20)
)
RETURNS INT(11)

BEGIN

DECLARE nSoma INT(11) DEFAULT 0;
DECLARE lOk INT(11) DEFAULT 1;

SET cInscricao = ze_SoNumeros( cInscricao );

IF NOT LENGTH( cInscricao ) IN ( 12, 13 ) THEN
   RETURN 0;
END IF;

IF LENGTH( cInscricao ) = 13 THEN
   IF SUBSTR( cInscricao, 1, 1 ) <> 'P' THEN
      RETURN 0;
   END IF;
   SET nSoma :=
      SUBSTR( cInscricao, 2, 1 ) +
      ( SUBSTR( cInscricao, 3, 1 ) * 3 ) +
      ( SUBSTR( cInscricao, 4, 1 ) * 4 ) +
      ( SUBSTR( cInscricao, 5, 1 ) * 5 ) +
      ( SUBSTR( cInscricao, 6, 1 ) * 6 ) +
      ( SUBSTR( cInscricao, 7, 1 ) * 7 ) +
      ( SUBSTR( cInscricao, 8, 1 ) * 8 ) +
      ( SUBSTR( cInscricao, 9, 1 ) * 10 );
   SET nSoma := MOD( nSoma, 11 );
   SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
   IF nSoma <> SUBSTR( cInscricao, 10, 1 ) THEN
      RETURN 0;
   END IF;
ELSE
   SET lOk := 1;
   SET nSoma :=
      SUBSTR( cInscricao, 1, 1 ) +
      ( SUBSTR( cInscricao, 2, 1 ) * 3 ) +
      ( SUBSTR( cInscricao, 3, 1 ) * 4 ) +
      ( SUBSTR( cInscricao, 4, 1 ) * 5 ) +
      ( SUBSTR( cInscricao, 5, 1 ) * 6 ) +
      ( SUBSTR( cInscricao, 6, 1 ) * 7 ) +
      ( SUBSTR( cInscricao, 7, 1 ) * 8 ) +
      ( SUBSTR( cInscricao, 8, 1 ) * 10 );
   SET nSoma := MOD( nSoma, 11 );
   SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
   IF nSoma <> SUBSTR( cInscricao, 9, 1 ) THEN
      SET lOk := 0;
   ELSE
      SET nSoma := ze_SomaModulo11( SUBSTR( cInscricao, 1, 2 ) ) + ( SUBSTR( cInscricao, 3, 1 ) * 10 ) +
         ze_SomaModulo11( SUBSTR( cInscricao, 4, 8 ) );
      SET nSoma := MOD( nSoma, 11 );
      SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
      IF nSoma <> SUBSTR( cInscricao, 12, 1 ) THEN
         SET lOk := 0;
      END IF;
   END IF;
   IF lOk = 0 THEN /* pode ser produtor rural sem iniciar com P */
      IF SUBSTR( cInscricao, 1, 1 ) <> 0 THEN
         RETURN 0;
      END IF;
      SET nSoma :=
         SUBSTR( cInscricao, 1, 1 ) +
         ( SUBSTR( cInscricao, 2, 1 ) * 3 ) +
         ( SUBSTR( cInscricao, 3, 1 ) * 4 ) +
         ( SUBSTR( cInscricao, 4, 1 ) * 5 ) +
         ( SUBSTR( cInscricao, 5, 1 ) * 6 ) +
         ( SUBSTR( cInscricao, 6, 1 ) * 6 ) +
         ( SUBSTR( cInscricao, 7, 1 ) * 7 ) +
         ( SUBSTR( cInscricao, 8, 1 ) * 8 ) +
         ( SUBSTR( cInscricao, 9, 1 ) * 10 );
      SET nSoma := nSoma - MOD( nSoma, 11 );
      SET nSoma := IF( nSoma > 9, nSoma - 10, nSoma );
      IF nSoma <> SUBSTR( cInscricao, 10, 1 ) THEN
         SET lOk := 0;
      END IF;
   END IF;
   RETURN lOk;
END IF;

RETURN 1;

END
