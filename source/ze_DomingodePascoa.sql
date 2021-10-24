CREATE FUNCTION ze_DomingoDePascoa( nAno INT(11) )
RETURNS DATE

BEGIN

DECLARE nA, nB, nC, nD, nE, nF, nG, nH, nI, nK, nL, nM, nMes, nDia INT;
DECLARE dData DATE;

SET nA    = MOD( nAno, 19 );
SET nB    = FLOOR( nAno / 100 );
SET nC    = MOD( nAno, 100 );
SET nD    = FLOOR( nB / 4 );
SET nE    = MOD( nB, 4 );
SET nF    = FLOOR( ( nB + 8 ) / 25 );
SET nG    = FLOOR( ( nB - nF + 1 ) / 3 );
SET nH    = MOD( 19 * nA + nB - nD - nG + 15, 30 );
SET nI    = FLOOR( nC / 4 );
SET nK    = MOD( nC, 4 );
SET nL    = MOD( 32 + 2 * nE + 2 * nI - nH - nK, 7 );
SET nM    = FLOOR( ( nA + 11 * nH + 22 * nL ) / 451 );
SET nMes  = FLOOR( ( nH + nL - 7 * nM + 114 ) / 31 );
SET nDia  = MOD( nH + nL - 7 * nM + 114, 31 ) + 1;
SET dData = CONCAT( LPAD( nAno, 4, '0' ), '-', + LPAD( nMes, 2, '0' ), '-', LPAD( nDia, 2, '0' ) );

RETURN dData;

END
