CREATE FUNCTION ze_XmlNode(
	cXml TEXT,
	cNode TEXT
)
RETURNS TEXT

BEGIN

DECLARE nInicio, nFim INT(11);
DECLARE cValue TEXT;

SET cValue := '';

SET nInicio := INSTR( cXml, CONCAT( '<', cNode ) );
IF INSTR( cNode, ' ' ) != 0 THEN
   SET cNode := SUBSTR( cNode, 1, INSTR( cNode, ' ' ) - 1 );
END IF;
IF nInicio != 0 THEN
   SET nInicio := nInicio + LENGTH( cNode ) + 2;
   IF nInicio != 1 AND SUBSTR( cXml, nInicio - 1, 1 ) != '>' THEN
      SET nInicio := nInicio + INSTR( SUBSTR( cXml, nInicio ), '>' );
   END IF;
   SET nFim := INSTR( cXml, CONCAT( '</', cNode, '>' ) );
   IF nFim != 0 THEN
      SET cValue := SUBSTR( cXml, nInicio, nFim - nInicio );
   END IF;
END IF;

RETURN cValue;

END
