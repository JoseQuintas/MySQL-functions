CREATE FUNCTION ze_XmlTag( cTag TEXT, cValue TEXT )
RETURNS TEXT CHARSET latin1

BEGIN

DECLARE cXml TEXT;

SET cXml := '';

IF LENGTH( TRIM( cValue ) ) = 0 THEN
   SET cXml := CONCAT( '<', cTag, '/>' );
ELSE
   SET cXml := CONCAT( '<', cTag, '>', cValue, '</', cTag, '>' );
END IF;

RETURN cXml;

END
