drop table coffee_article purge;

create table coffee_article(
	coffee_order		NUMBER,
	coffee_link			VARCHAR2(500),
	coffee_img			VARCHAR2(50),
	coffee_title		VARCHAR2(500),
	coffee_contents	VARCHAR2(2000),
	coffee_date		VARCHAR2(50),
	CONSTRAINT COFFEE_ARTICLE_PK PRIMARY KEY (coffee_order)
);

insert into coffee_article values(1, 'http://bwissue.com/news/387489' ,'article_1.png', '【MAP】 카운터컬쳐 커피, 각 커피 산지별 수확시기 및 입고 시기를 알려주는 맵 공개',  
				--'http://bwissue.com/news/387489',
				'카운터컬쳐 커피, 각 커피 산지별 수확시기 및 입고 시기를 알려주는 맵 공개 실제 지도 보기 링크 미국의 유명 로스터리인 카운터컬쳐 커피에서 자사에서 사용하는 커피 맵을 공개했다.
				카운터컬쳐 커피 블로그를 통해 공개된 이 자료는 각 커피 산지에서 이뤄지는 수확 시기와 가공 시기 등을 국가별...', '2018-02-13' );
insert into coffee_article values(2, 'http://bwissue.com/index.php?mid=news&amp;page=6&amp;document_srl=288806' ,'article_2.png',
				'행사소식 : 다양한 커피 행사가 열리는 도쿄의 특별한 한 주, SCAJ부터 TOKYO COFFEE FESTIVAL까지', --'http://bwissue.com/index.php?mid=news&amp;page=6&amp;document_srl=288806',
				'다양한 커피 행사가 열리는 도쿄의 특별한 한 주 - SCAJ 20일부터 22일까지, - TOKYO COFFEE FESTIVAL 23일,24일
				일본의 아시아 최대급의 스페셜티 커피 행사인 Specialty Coffee Association of Japan (SCAJ) 가 오늘부터 3일간 22일까지 도쿄 빅사이트에서 개최됩니다. SCAJ 에서는 매년 JAPAN BARIS...', '2017-09-20');					
insert into coffee_article values(3, 'http://bwissue.com/index.php?mid=news&page=10&document_srl=254132' ,'article_3.png', '2017 부다페스트 커피 이벤트를 위한 가이드',
				--'http://bwissue.com/index.php?mid=news&amp;page=10&amp;document_srl=254132',
				'2017 부다페스트 커피 이벤트를 위한 가이드 부다페스트는 다뉴브 강 유역의 아름답고 역사적인 도시로, 오는 13일부터 시작되는 2017 World of Coffee 행사로 인해 많은 커피 관련 종사자들이 방문할 것으로
				예상이 된다. 이에 블랙워터이슈와 유럽 미디어 파트너로 협력하고 있는 유로피언 커피트립...', '2017-06-09');
insert into coffee_article values(4, 'http://bwissue.com/index.php?mid=news&page=13&document_srl=239403' ,'article_4.png', '2017 서울커피엑스포에서 선보인 신제품들',
				--'http://bwissue.com/index.php?mid=news&amp;category=53177&amp;page=4&amp;document_srl=239403'
				'2017 서울커피엑스포에서 선보인 신제품들 지난 6일(목)부터 오는 일요일까지 서울 코엑스에서 진행되는 2017 서울커피엑스포에서 선보인 새로운 신제품들을 공개한다.
				국내 상반기 최대의 커피 전시회로 자리매김한 서울커피엑스포에서 스페셜티 커피 마켓에 집중된 몇 가지 제품들을 볼 수 있었다. A...', '2017-04-07');


select * from coffee_article;