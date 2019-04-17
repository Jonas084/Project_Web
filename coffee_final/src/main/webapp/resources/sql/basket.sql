create table basket_inform(
	basket_number number,
	userID varchar2(15),
	coffee_number NUMBER
);

CREATE SEQUENCE basket_inform_SEQ
START WITH 1
INCREMENT BY 1;

drop sequence basket_inform_SEQ;

drop table basket_inform purge;
select * from basket_inform