CREATE FUNCTION ze_ValidCPF( cCPF VARCHAR(20) )
RETURNS int(11)

BEGIN

DECLARE cNumero VARCHAR(20);
DECLARE lOk INT(11);
SET cNumero = ze_SoNumeros( CCPF );
IF LENGTH( cNumero ) <> 11 THEN
   RETURN IF( LENGTH( cNumero ) = 0, 1, 0 );
END IF;
SET cNumero = LPAD( cNumero, 11, '0' );
SET cNumero = SUBSTR( cNumero, 1, 9 );
SET cNumero = CONCAT( cNumero, ze_CalculaDigito( cNumero, 10 ) );
SET cNumero = CONCAT( cNumero, ze_CalculaDigito( cNumero, 10 ) );
SET lOK = ( RIGHT( cCPF, 2 ) = RIGHT( cNumero, 2 ) );
IF lOK THEN
   SET CCPF = CONCAT(
              SUBSTR( cNumero, 1, 3 ), '.',
              SUBSTR( CNUMERO, 4, 3 ), '.',
              SUBSTR( CNUMERO, 7, 3 ), '-',
              SUBSTR( cNumero, 10, 2 ) );
END IF;

RETURN lOk;

END
