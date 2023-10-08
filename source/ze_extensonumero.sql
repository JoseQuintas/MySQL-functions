CREATE FUNCTION ze_ExtensoNumero( nValor DECIMAL(18,0) )
RETURNS TEXT

BEGIN

DECLARE cTxt TEXT;
DECLARE nGrupo INT(11) DEFAULT 0;
DECLARE nValGrupo, nValResto DECIMAL(15,0);
DECLARE cStrValor, cTxtGrupo VARCHAR(20);
DECLARE cTxtThis TEXT;

IF nValor = 0 THEN
   RETURN '*ZERO*';
END IF ;

SET cTxt := '';
SET cStrValor = LPAD( ABS( nValor ), 18, '0' );
SET nGrupo = 0;
LOOP_GRUPOS: LOOP

   SET nGrupo := nGrupo + 1;
   IF nGrupo > 6 THEN
      LEAVE LOOP_GRUPOS;
   END IF;
   SET cTxtGrupo := '';
   SET cTxtThis := '';
   SET nValGrupo := CAST( SUBSTR( cStrValor, ( nGrupo * 3 ) - 2, 3 ) AS DECIMAL(5,0) );
   IF LENGTH( cStrValor ) <= nGrupo * 3 + 4 THEN
      SET nValResto := 0;
   ELSE
      SET nValResto := CAST( SUBSTR( cStrValor, ( nGrupo * 3 ) + 1, 3 ) AS DECIMAL(18,0) );
   END IF;
   IF nValGrupo > 0 THEN
      SET cTxtGrupo := (
      CASE
         WHEN nGrupo = 6 THEN ''
         WHEN nGrupo = 5 THEN 'MIL'
         WHEN nGrupo = 4 THEN 'MILHAO'
         WHEN nGrupo = 3 THEN 'BILHAO'
         WHEN nGrupo = 2 THEN 'TRILHAO'
         WHEN nGrupo = 1 THEN 'QUATRILHAO'
         WHEN nGrupo = 0 THEN 'QUINTILHAO'
         WHEN nGrupo = 0 THEN 'SEPTILHAO'
         WHEN nGrupo = 0 THEN 'OCTILHAO'
         WHEN nGrupo = 0 THEN 'NONILHAO'
         WHEN nGrupo = 0 THEN 'DECILHAO'
      ELSE ''
      END );
      IF nValGrupo > 1 THEN
         SET cTxtGrupo := REPLACE( cTxtGrupo, 'AO', 'OES' );
      END IF ;
      IF LENGTH( cTxt ) <> 0 THEN
         IF nValGrupo = FLOOR( nValGrupo / 100 ) * 100 THEN
            SET cTxt := CONCAT( cTxt, ' E' );
         END IF;
      END IF;
      IF NOT ( nGrupo = 5 AND nValGrupo = 1 ) THEN
         SET cTxt := CONCAT( cTxt, ' ', ze_ExtensoCentena( nValGrupo ), ' ' );
      END IF;
      SET cTxt := CONCAT( cTxt, cTxtGrupo );
   END IF;

END LOOP LOOP_GRUPOS;

RETURN cTxt;

END
