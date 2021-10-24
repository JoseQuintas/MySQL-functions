CREATE FUNCTION ze_ValidIE
(
   cInscricao VARCHAR(20),
   cUF VARCHAR(2)
)
RETURNS INT(11)

BEGIN

DECLARE lOk INT(11);
DECLARE nLen INT(11);

IF cInscricao IN ( 'ISENTO', 'NAO CONTRIBUINTE' ) THEN
   RETURN 1;
END IF;

SET nLen = LENGTH( cInscricao );

SET cInscricao = ze_SoNumeros( cInscricao );

IF cUF = 'AC' THEN
BEGIN
END;

ELSEIF cUF = 'AL' THEN
BEGIN
END;

ELSEIF cUF = 'AM' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 6 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'AP' THEN
BEGIN
END;

ELSEIF cUF = 'BA' THEN
BEGIN
END;

ELSEIF cUF = 'CE' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 6 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'DF' THEN
BEGIN
END;

ELSEIF cUF = 'ES' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 3 ), '.', SUBSTR( cInscricao, 4, 3 ), '.', SUBSTR( cInscricao, 7, 2 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;

END;

ELSEIF cUF = 'GO' THEN
BEGIN
END;

ELSEIF cUF = 'MA' THEN
BEGIN
END;

ELSEIF cUF = 'MG' THEN
BEGIN
END;

ELSEIF cUF = 'MS' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 2 ) <> '28' THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 3 ), '.', SUBSTR( cInscricao, 6, 3 ), '.', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;

END;

ELSEIF cUF = 'MT' THEN
BEGIN
IF LENGTH( cInscricao ) > 11 THEN
   RETURN 0;
END IF;

SET cInscricao = LPAD( cInscricao, 11, '0' );

IF ze_CalculaDigito( Substr( cInscricao, 1, 10 ), '11' ) <> Substr( cInscricao, 11, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 10 ), '-', SUBSTR( cInscricao, 11, 1 ) );

RETURN 1;

END;

ELSEIF cUF = 'PA' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 2 ) <> '15' THEN
   RETURN 0;
END IF;
IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '-', SUBSTR( cInscricao, 3, 6 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'PB' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 8 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'PE' THEN
BEGIN
END;

ELSEIF cUF = 'PI' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 3 ), '.', SUBSTR( cInscricao, 6, 3 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'PR' THEN
BEGIN
END;

ELSEIF cUF = 'RJ' THEN
BEGIN
END;

ELSEIF cUF = 'RN' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 3 ), '.', SUBSTR( cInscricao, 6, 3 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'RO' THEN
BEGIN
END;

ELSEIF cUF = 'RR' THEN
BEGIN
END;

ELSEIF cUF = 'RS' THEN
BEGIN
IF LENGTH( cInscricao ) <> 10 THEN
   RETURN 0;
END IF;

IF SUBSTR( cInscricao, 1, 3 ) < '001' THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 9 ), '11' ) <> Substr( cInscricao, 10, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 3 ), '/', SUBSTR( cInscricao, 4, 7 ) );

RETURN 1;
END;

ELSEIF cUF = 'SC' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( Substr( cInscricao, 1, 8 ), '11' ) <> Substr( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 3 ), '.', SUBSTR( cInscricao, 4, 3 ), '.', SUBSTR( cInscricao, 7, 3 ) );

RETURN 1;
END;

ELSEIF cUF = 'SE' THEN
BEGIN
IF LENGTH( cInscricao ) <> 9 THEN
   RETURN 0;
END IF;

IF ze_CalculaDigito( SUBSTR( cInscricao, 1, 8 ), '11' ) <> SUBSTR( cInscricao, 9, 1 ) THEN
   RETURN 0;
END IF;

SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 3 ), '.', SUBSTR( cInscricao, 6, 3 ), '-', SUBSTR( cInscricao, 9, 1 ) );

RETURN 1;
END;

ELSEIF cUF = 'SP' THEN
BEGIN
END;

ELSEIF cUF = 'TO' THEN
BEGIN
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

IF LENGTH( cInscricao ) = 11 THEN
   SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 2 ), '.', SUBSTR( cInscricao, 5, 6 ), '-', SUBSTR( cInscricao, 11, 1 ) );
ELSE
   SET cInscricao = CONCAT( SUBSTR( cInscricao, 1, 2 ), '.', SUBSTR( cInscricao, 3, 2 ), '.', SUBSTR( cInscricao, 5, 3 ), '-', SUBSTR( cInscricao, 8, 1 ) );
END IF;

RETURN 1;

END;

ELSE
RETURN 0;
END IF;

END
