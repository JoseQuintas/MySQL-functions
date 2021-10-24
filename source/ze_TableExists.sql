CREATE FUNCTION ze_TableExists( cName VARCHAR(50) )
RETURNS INT(11)

BEGIN

DECLARE nYes INT(11) ;
SET nYes = ( SELECT COUNT(*) FROM information_schema.tables
             WHERE table_schema=DATABASE() AND TABLE_NAME = cName );
RETURN IF( nYes > 0, 1, 0 );

END
