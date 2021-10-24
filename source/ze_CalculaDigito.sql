CREATE FUNCTION ze_CalculaDigito(
	cNumero VARCHAR(100),
	nModulo INT(11)
   )
RETURNS VARCHAR(1)

BEGIN

DECLARE nFator INT(11);
DECLARE nSoma INT(11);
DECLARE nCont INT(11);
DECLARE nResto INT(11);

IF LENGTH( cNumero ) < 1 THEN
   RETURN '';
END IF;

SET nFator = 2;
SET nSoma = 0;
SET nCont = LENGTH( cNumero );

IF nModulo = 10 THEN
   WHILE nCont > 0 DO
      SET nSoma = nSoma + ( CAST( SUBSTR( cNumero, nCont, 1 ) AS SIGNED ) * nFator ) ;
      SET nFator = nFator + 1;
      SET nCont = nCont - 1;
   END WHILE;
ELSE
   WHILE nCont > 0 DO
      SET nSoma = nSoma + ( CAST( SUBSTR( cNumero, nCont, 1 ) AS SIGNED ) * nFator ) ;
      IF nFator = 9 THEN
         SET nFator = 2;
      ELSE
         SET nFator = nFator + 1;
      END IF;
      SET nCont = nCont - 1;
   END WHILE;
END IF;

SET nResto = 11 - MOD( nSoma, 11 );
IF nResto > 9 THEN
   SET nResto = 0;
END IF;

RETURN CAST( nResto AS CHAR(1) );

END
