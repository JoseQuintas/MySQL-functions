CREATE FUNCTION ze_TercaDeCarnaval( nAno INT(11) )
RETURNS DATE

BEGIN

DECLARE dData DATE;

SET dData = DATE_SUB( ze_DomingoDePascoa( nAno ), INTERVAL 47 DAY );

RETURN dData;

END
