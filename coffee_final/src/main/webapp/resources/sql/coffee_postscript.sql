
CREATE TABLE coffee_postscript
(
    coffee_number    NUMBER            NOT NULL, 
    board_number     NUMBER            NOT NULL, 
    title            VARCHAR2(2000)    NULL, 
    writer           VARCHAR2(200)     NOT NULL, 
    click_count      NUMBER            NULL, 
    evaluation       VARCHAR2(100)     NULL, 
    content          VARCHAR2(2000)    NULL, 
    regdate          DATE              NULL, 
    CONSTRAINT POSTSCRIPT_PK PRIMARY KEY (board_number)
)
ALTER TABLE postscript
    ADD CONSTRAINT FK_postscript_coffee_number_co FOREIGN KEY (coffee_number)
        REFERENCES coffee_inform (coffee_number)
        
drop table coffee_postscript purge

select * from coffee_postscript




drop table CoBoard purge;

create table CoBoard(
   coboard_no number(7) primary key,
   coboard_sort varchar2(20),
   coboard_title varchar2(100) not null,
   coboard_cont varchar2(4000),
   coboard_name varchar2(50) not null,
   coboard_pwd varchar2(30) not null,
   coboard_hit number(7) default 0, /* 조회수 */
   coboard_ref number(7),         /* 답변글 그룹번호 */
   coboard_step number(7),     /* 답변글 단계번호 */
   coboard_level number(7),       /* 답변글 순서번호*/ /*이 쿼리에서 단계와 레벨의 역할이 뒤바뀐듯*/
   coboard_regdate date          /* 등록날짜 */
);

drop sequence CoBoard_seq;
drop sequence CoBoard_seq2;

create sequence CoBoard_seq
   increment by 1 start with 1 nocache;

create sequence CoBoard_seq2
   increment by 1 start with 1 nocache;
   
   
select * from CoBoard;
