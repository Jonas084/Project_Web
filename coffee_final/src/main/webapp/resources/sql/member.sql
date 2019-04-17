-- 테이블 삭제
drop table member purge;

-- 테이블 생성
CREATE TABLE member
(
    user_number    INT             NOT NULL, 
    userID         VARCHAR2(15)    NOT NULL, 
    userPW         VARCHAR2(15)    NOT NULL, 
    userName       VARCHAR2(20)    NOT NULL, 
    userAddress    VARCHAR2(50)    NOT NULL, 
    userPhone      VARCHAR2(50)    NOT NULL, 
    userEmail      VARCHAR2(50)    NOT NULL, 
    userCoupon     NUMBER          NULL, 
    userPoint      NUMBER          NULL, 
    CONSTRAINT MEMBER_PK PRIMARY KEY (user_number)
);

INSERT INTO MEMBER VALUES(1, 'admin123', 'admin123', '호잇', '경기도 남양주', '010-1111-1111', 'a@a.com', 0, 0 )
update member set userPoint = 60000 where user_number=1;
select * from member

-- 회원 번호 시퀀스
CREATE SEQUENCE member_SEQ
START WITH 1
INCREMENT BY 1;

-- 회원번호 트리거
CREATE OR REPLACE TRIGGER member_user_number_AI_TRG
BEFORE INSERT ON member 
REFERENCING NEW AS NEW FOR EACH ROW 
BEGIN 
    SELECT member_SEQ.NEXTVAL
    INTO: NEW.user_number
    FROM DUAL;
END;

DROP trigger member_user_number_AI_TRG;


-- 외래키 
ALTER TABLE member
    ADD CONSTRAINT FK_member_user_number_Cart_use FOREIGN KEY (user_number)
        REFERENCES Cart (user_number)