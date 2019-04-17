CREATE TABLE buy_record
(
    buy_number       NUMBER          NOT NULL, 
    userID           VARCHAR2(15)    NOT NULL, 
    coffee_number    NUMBER          NULL, 
    gift_number      NUMBER          NULL, 
    buy_price        NUMBER          NULL, 
   buy_count        NUMBER          NULL, 
    buydate          DATE            NULL, 
    CONSTRAINT BUY_RECORD_PK PRIMARY KEY (buy_number)
)

CREATE SEQUENCE buy_record_SEQ
START WITH 1
INCREMENT BY 1;

drop sequence buy_record_SEQ;

drop table buy_record purge;
select * from buy_record

CREATE OR REPLACE TRIGGER buy_record_buy_number_AI_TRG
BEFORE INSERT ON buy_record 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT buy_record_SEQ.NEXTVAL
    INTO: NEW.buy_number
    FROM DUAL;
END;

ALTER TABLE buy_record
    ADD CONSTRAINT FK_buy_record_userID_member_us FOREIGN KEY (userID)
        REFERENCES member (userID)
/

ALTER TABLE buy_record
    ADD CONSTRAINT FK_buy_record_coffee_number_co FOREIGN KEY (coffee_number)
        REFERENCES coffee_inform (coffee_number)
/


ALTER TABLE buy_record
    ADD CONSTRAINT FK_buy_record_userID_member_us FOREIGN KEY (userID)
        REFERENCES member (userID)
/

ALTER TABLE buy_record
    ADD CONSTRAINT FK_buy_record_coffee_number_co FOREIGN KEY (coffee_number)
        REFERENCES coffee_inform (coffee_number)
/

