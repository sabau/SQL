DROP PROCEDURE IF EXISTS calendar;
DELIMITER |
CREATE PROCEDURE calendar( pstart datetime, pstop datetime, pdays int )
DETERMINISTIC
  BEGIN
    DECLARE thisdate datetime;
    DROP TABLE IF EXISTS cal;
    CREATE TABLE cal( dt datetime );
    SET thisdate=pstart;
    INSERT INTO cal VALUES(pstart);
    WHILE thisdate < pstop DO
      SET thisdate = adddate( thisdate, INTERVAL pdays DAY );
      INSERT INTO cal VALUES( thisdate );
    END WHILE;
  END |
DELIMITER ;
CALL calendar('2010-1-1 00:00:00', '2020-1-1 00:00:00', 1);
