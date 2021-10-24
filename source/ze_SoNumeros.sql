CREATE FUNCTION ze_SoNumeros(
   cValue VARCHAR(20)
   )
RETURNS varchar(20) CHARSET latin1
BEGIN
DECLARE cReturn VARCHAR(20) DEFAULT '';
DECLARE nCont INT(11) DEFAULT 1;
WHILE nCont <= LENGTH( cValue ) DO
   IF SUBSTR( cValue, nCont, 1 ) IN ( '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' ) THEN
      set creturn = CONCAT( creturn, SUBSTR( cvalue, ncont, 1 ) );
   END if;
   SET ncont = ncont + 1;
END WHILE;
RETURN creturn;

END
