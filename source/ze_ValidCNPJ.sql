CREATE FUNCTION ze_ValidCNPJ( cCnpj VARCHAR(20) )
RETURNS int(11)

BEGIN

DECLARE cNumero VARCHAR(20);
DECLARE lOk INT(11);
SET cNumero = ze_SoNumeros( cCnpj );
IF LENGTH( cNumero ) <> 14 THEN
   RETURN IF( LENGTH( cNumero ) = 0, 1, 0 );
END IF;
SET cNumero = LPAD( cNumero, 14, '0' );
SET cNumero = SUBSTR( cNumero, 1, 12 );
SET cNumero = CONCAT( cNumero, ze_CalculaDigito( cNumero, 11 ) );
SET cNumero = CONCAT( cNumero, ze_CalculaDigito( cNumero, 11 ) );
SET lOk =  ( Right( cCnpj, 2 ) = Right( cNumero, 2 ) );
IF lOk THEN
   SET cCnpj = CONCAT( SUBSTR( cNumero, 1, 2 ), '.',
               SUBSTR( cNumero, 3, 3 ), '.',
               SUBSTR( cNumero, 6, 3 ), '/',
               SUBSTR( cNumero, 9, 4 ), '-',
               SUBSTR( cNumero, 13, 2 ) );
END IF;

RETURN lOk;

END
