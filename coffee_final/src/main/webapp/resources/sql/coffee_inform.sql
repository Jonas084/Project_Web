CREATE TABLE coffee_inform
(
    coffee_number    NUMBER          NOT NULL, 
    coffee_name      VARCHAR2(100)    NOT NULL, 
    price            NUMBER          NOT NULL, 
    main_img         VARCHAR2(100)    NULL, 
    inform_img_a     VARCHAR2(100)    NULL, 
    inform_img_b     VARCHAR2(100)    NULL, 
    inform_img_c     VARCHAR2(100)    NULL, 
    inform_img_d     VARCHAR2(100)    NULL, 
    click_count		NUMBER, 
    CONSTRAINT COFFEE_INFORM_PK PRIMARY KEY (coffee_number)
);
select * from coffee_inform
drop table coffee_inform purge;

CREATE TABLE taste
(
	coffee_number    NUMBER          NOT NULL, 
    coffee_name      VARCHAR2(50)    NOT NULL, 
    sourness         NUMBER          NOT NULL, 
    bitters          NUMBER          NOT NULL, 
    sweetness        NUMBER          NOT NULL, 
    aroma            NUMBER          NOT NULL, 
    body             NUMBER          NOT NULL, 
    balance          NUMBER          NOT NULL, 
    CONSTRAINT TASTE_PK PRIMARY KEY (coffee_name, coffee_number)
);
ALTER TABLE taste
    ADD CONSTRAINT FK_taste_coffee_number_coffee_ FOREIGN KEY (coffee_number)
        REFERENCES coffee_inform (coffee_number)
select * from taste
drop table taste purge;
        
insert into coffee_inform values(1,'볼리비아 카라나비',9400,'bolibia_kara_main.jpg','bolibia_kara_a.jpg','b','c','d',18);
insert into coffee_inform values(2,'브라질 세하도',8400,'brazil_cerrado_main.jpg','brazil_cerrado_a.jpg','b','c','d',17);
insert into coffee_inform values(3,'콜롬비아 수프리모',7400,'col_supremo_main.jpg','col_supremo_a.jpg','b','c','d',16);
insert into coffee_inform values(4,'코스타리카 따라주',9500,'costarica_tta_main.jpg','costarica_tta_a.jpg','b','c','d',15);
insert into coffee_inform values(5,'엘살바도르 SHG',9000,'elsal_shg_main.jpg','elsal_shg_a.jpg','b','c','d',14);
insert into coffee_inform values(6,'에티오피아 예가체프',8500,'eti_yega_main.jpg','eti_yega_a.jpg','b','c','d',13);
insert into coffee_inform values(7,'과테말라 안티구아',7700,'gwate_anti_main.jpg','gwate_anti_a.jpg','b','c','d',12);
insert into coffee_inform values(8,'하와이 코나',10400,'hawaii_kona_main.jpg','hawaii_kona_a.jpg','b','c','d',11);
insert into coffee_inform values(9,'온두라스 SHG',8800,'honduras_shg_main.jpg','honduras_shg_a.jpg','b','c','d',10);
insert into coffee_inform values(10,'인도네시아 만델링',8500,'indonesia_mand_main.jpg','indonesia_mand_a.jpg','b','c','d',9);
insert into coffee_inform values(11,'케냐 AA',9200,'kenya_aa_main.jpg','kenya_aa_a.jpg','b','c','d',8);
insert into coffee_inform values(12,'멕시코 치아파스',8100,'maxico_chi_main.jpg','maxico_chi_a.jpg','b','c','d',7);
insert into coffee_inform values(13,'파나마 게이샤',7000,'panama_gey_main.jpg','panama_gey_a.jpg','b','c','d',6);
insert into coffee_inform values(14,'파푸아뉴기니 시그리',8900,'papuanew_sigri_main.jpg','papuanew_sigri_a.jpg','b','c','d',5);
insert into coffee_inform values(15,'페루 찬차마요',7500,'peru_chanchamayo_main.jpg','peru_chanchamayo_a.jpg','b','c','d',4);
insert into coffee_inform values(16,'르완다 버번',7100,'rwanda_ber_main.jpg','rwanda_ber_a.jpg','b','c','d',3);
insert into coffee_inform values(17,'탄자니아 AA',8600,'tanzaniaAA_main.jpg','tanzaniaAA_a.jpg','b','c','d',2);
insert into coffee_inform values(18,'베트남 하마',7000,'vietnam_sai_main.jpg','vietnam_sai_a.jpg','b','c','d',1);


insert into taste values(1,'볼리비아 카라나비',8,8,8,5,8,8.5);
insert into taste values(2,'브라질 세하도',4,5,6,7,6,5);
insert into taste values(3,'콜롬비아 수프리모',6,8,8.5,6,7,8);
insert into taste values(4,'코스타리카 따라주',7.5,8,7,8,7,7);
insert into taste values(5,'엘살바도르 SHG',5,4,6,7,6,5);
insert into taste values(6,'에티오피아 예가체프',8,8,8,9,5.5,7.5);
insert into taste values(7,'과테말라 안티구아',7,5,7,8,7.5,8);
insert into taste values(8,'하와이 코나',7.5,7,7.5,8,7.5,8);
insert into taste values(9,'온두라스 SHG',7,7,7.5,7.5,7.5,7.5);
insert into taste values(10,'인도네시아 만델링',3,5,7,8,8,6);
insert into taste values(11,'케냐 AA',8,8,8,8.5,9,8);
insert into taste values(12,'멕시코 치아파스',4,5,6,6,7,6);
insert into taste values(13,'파나마 게이샤',3,5,9,5,9,9);
insert into taste values(14,'파푸아뉴기니 시그리',7,4,5,7,4,4);
insert into taste values(15,'페루 찬차마요',5,5,7,8,6,5);
insert into taste values(16,'르완다 버번',6,4,6,7,6,6);
insert into taste values(17,'탄자니아 AA',6,5,6,7,7,7);
insert into taste values(18,'베트남 하마',2,4,7,4,5,4);


