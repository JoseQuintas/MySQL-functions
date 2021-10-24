CREATE FUNCTION ze_AliquotaICMS( cUF1 VARCHAR(2), cUF2 VARCHAR(2) )
RETURNS DECIMAL(10,2)

BEGIN

DECLARE nAliquota DECIMAL(10,2);

SELECT ALIQUOTA
INTO nAliquota
FROM
(
SELECT 'AC' as ORIGEM, 'AC' AS DESTINO, CAST( 12 AS DECIMAL(10,2) ) AS ALIQUOTA
UNION SELECT 'AL', 'AL', 18
UNION SELECT 'AM', 'AM', 18
UNION SELECT 'AP', 'AP', 18
UNION SELECT 'BA', 'BA', 18
UNION SELECT 'CE', 'CE', 18
UNION SELECT 'DF', 'DF', 18
UNION SELECT 'ES', 'ES', 17
UNION SELECT 'GO', 'GO', 17
UNION SELECT 'MA', 'MA', 18
UNION SELECT 'MG', 'MG', 18
UNION SELECT 'MG', 'PR', 12
UNION SELECT 'MG', 'RJ', 12
UNION SELECT 'MG', 'RS', 12
UNION SELECT 'MG', 'SC', 12
UNION SELECT 'MG', 'SP', 12
UNION SELECT 'MG', '**', 7
UNION SELECT 'MT', 'MT', 17
UNION SELECT 'MS', 'MS', 17
UNION SELECT 'PA', 'PA', 17
UNION SELECT 'PB', 'PB', 18
UNION SELECT 'PE', 'PE', 18
UNION SELECT 'PI', 'PI', 18
UNION SELECT 'PR', 'PR', 18
UNION SELECT 'RJ', 'RJ', 20
UNION SELECT 'RJ', 'MG', 12
UNION SELECT 'RJ', 'PR', 12
UNION SELECT 'RJ', 'RS', 12
UNION SELECT 'RJ', 'SC', 12
UNION SELECT 'RJ', 'SP', 12
UNION SELECT 'RJ', '**', 7
UNION SELECT 'RN', 'RN', 18
UNION SELECT 'RO', 'RO', 17.5
UNION SELECT 'RR', 'RR', 17
UNION SELECT 'RS', 'RS', 18
UNION SELECT 'RS', 'MG', 12
UNION SELECT 'RS', 'PR', 12
UNION SELECT 'RS', 'MS', 12
UNION SELECT 'RS', 'SC', 12
UNION SELECT 'RS', 'SP', 12
UNION SELECT 'RS', '**', 7
UNION SELECT 'SC', 'SC', 17
UNION SELECT 'SC', 'MG', 12
UNION SELECT 'SC', 'PR', 12
UNION SELECT 'SC', 'MS', 12
UNION SELECT 'SC', 'PB', 12
UNION SELECT 'SC', 'RS', 12
UNION SELECT 'SC', 'SP', 12
UNION SELECT 'SC', '**', 7
UNION SELECT 'SP', 'SP', 18
UNION SELECT 'SP', 'MG', 12
UNION SELECT 'SP', 'PR', 12
UNION SELECT 'SP', 'RJ', 12
UNION SELECT 'SP', 'RS', 12
UNION SELECT 'SP', 'SC', 12
UNION SELECT 'SP', '**', 7
UNION SELECT 'SE', 'SE', 18
UNION SELECT 'TO', 'TO', 18
UNION SELECT '**', '**', 12
) AS TABELA
INNER JOIN ( SELECT cUF1 AS ORIGEM, cUF2 AS DESTINO ) AS PROCURA
ON TABELA.ORIGEM IN ( PROCURA.ORIGEM, '**' ) AND TABELA.DESTINO IN ( PROCURA.DESTINO, '**' )
LIMIT 1;

RETURN nAliquota;

END