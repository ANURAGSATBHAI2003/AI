create database area;
use area;
create table calc(length int,breadth int,area int);
DELIMITER $
CREATE PROCEDURE calculate_area_and_perimeter()
BEGIN
 DECLARE v_length INT;
 DECLARE v_breadth INT;
 DECLARE v_areaf INT;
 DECLARE v_perimeter INT;
 
 SET v_breadth := 10;
 SET v_length := 10;
 
 WHILE v_length <= 20 DO
 
 SET v_areaf := v_length * v_breadth;
 SET v_perimeter := 2 * (v_length + v_breadth);
 
 INSERT INTO calc VALUES (v_length, v_breadth, v_areaf);
 SELECT CONCAT('Length: ', v_length, ', Breadth: ', v_breadth, ', Area: ', v_areaf, ', Perimeter: ', v_perimeter);
 
 SET v_length := v_length + 1;
 END WHILE;
END $
DELIMITER ;
CALL calculate_area_and_perimeter()
