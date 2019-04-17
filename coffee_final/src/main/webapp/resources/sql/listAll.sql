
CREATE TABLE listAll
(
	searchType		 VARCHAR2(200)     NOT NULL, 
	keyword			VARCHAR2(200)     NOT NULL, 
    coffee_number    NUMBER            NOT NULL, 
    board_number     NUMBER            NOT NULL, 
    title            VARCHAR2(2000)    NULL, 
    writer           VARCHAR2(200)     NOT NULL, 
    content          VARCHAR2(2000)    NULL, 
    regdate          DATE              NULL, 
    CONSTRAINT BOARD_ONLY PRIMARY KEY (board_number)
)
        
drop table coffee_postscript purge

select * from coffee_postscript



