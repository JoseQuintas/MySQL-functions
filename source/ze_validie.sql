CREATE FUNCTION ze_ValidIE
(
   cInscricao VARCHAR(20),
   cUF VARCHAR(2)
)
RETURNS INT(11)

BEGIN

DECLARE lOk INT(11);

IF cInscricao IN ( 'ISENTO', 'NAO CONTRIBUINTE', 'NAOCONTRIBUINTE' ) THEN
   RETURN 1;
END IF;

SET cInscricao = ze_SoNumeros( cInscricao );

SET lOk :=
CASE
WHEN cUF = 'AC' THEN ze_ValidIEAC( cInscricao )
WHEN cUF = 'AL' THEN ze_ValidIEAL( cInscricao )
WHEN cUF = 'AM' THEN ze_ValidIEAM( cInscricao )
WHEN cUF = 'AP' THEN ze_ValidIEAP( cInscricao )
WHEN cUF = 'BA' THEN ze_ValidIEBA( cInscricao )
WHEN cUF = 'CE' THEN ze_ValidIECE( cInscricao )
WHEN cUF = 'DF' THEN ze_ValidIEDF( cInscricao )
WHEN cUF = 'ES' THEN ze_ValidIEES( cInscricao )
WHEN cUF = 'GO' THEN ze_ValidIEGO( cInscricao )
WHEN cUF = 'MA' THEN ze_ValidIEMA( cInscricao )
WHEN cUF = 'MG' THEN ze_ValidIEMG( cInscricao )
WHEN cUF = 'MS' THEN ze_ValidIEMS( cInscricao )
WHEN cUF = 'MT' THEN ze_ValidIEMT( cInscricao )
WHEN cUF = 'PA' THEN ze_ValidIEPA( cInscricao )
WHEN cUF = 'PB' THEN ze_ValidIEPB( cInscricao )
WHEN cUF = 'PE' THEN ze_ValidIEPE( cInscricao )
WHEN cUF = 'PI' THEN ze_ValidIEPI( cInscricao )
WHEN cUF = 'PR' THEN ze_ValidIEPR( cInscricao )
WHEN cUF = 'RJ' THEN ze_ValidIERJ( cInscricao )
WHEN cUF = 'RN' THEN ze_ValidIERN( cInscricao )
WHEN cUF = 'RO' THEN ze_ValidIERO( cInscricao )
WHEN cUF = 'RR' THEN ze_ValidIERR( cInscricao )
WHEN cUF = 'RS' THEN ze_ValidIERS( cInscricao )
WHEN cUF = 'SC' THEN ze_ValidIESC( cInscricao )
WHEN cUF = 'SE' THEN ze_ValidIESE( cInscricao )
WHEN cUF = 'SP' THEN ze_ValidIESP( cInscricao )
WHEN cUF = 'TO' THEN ze_ValidIETO( cInscricao )
ELSE 0
END;

RETURN lOk;

END
