CREATE FUNCTION ze_FieldExists( cField VARCHAR(50), cTable VARCHAR(50) )
RETURNS INT(11)
BEGIN
DECLARE nYes INT(11) ;
SET nYes = ( SELECT COUNT(*) FROM information_schema.columns
             WHERE table_schema = DATABASE() AND TABLE_NAME = cTable
				 AND COLUMN_NAME = cField );
RETURN IF( nYes > 0, 1, 0 );
END
