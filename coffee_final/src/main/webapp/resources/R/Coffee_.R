############ 인스타그램 태그 분석 ############

# 인스타그램 동적 파싱 -> 전처리 -> 분석 & 워드클라우드 만들기  


# 1. 인스타그램 동적 파싱

# # 패키지 설치
# install.packages("RSelenium")   
# install.packages('xml2')

library(RSelenium)   # 동적 크롤링 패키지 - 셀레니움 
library(rvest)       # 패키지 로드2 - html로 생성된 웹페이지의 경우 rvest 패키지로 스크래핑 가능 
library(dplyr)       # 전처리 패키지 
library(xml2)        # HTML 읽어올 때 사용 


# 크롤링할 서버 체크 
checkForServer()  #  A utility function to check if the Selenium Server stanalone binary is present.

# 웹 크롤링할 드라이버 설정 (크롬 드라이버)
# remoteDriver Class uses the JsonWireProtocol to communicate with the Selenium Server
remDr <- remoteDriver(remoteServerAddr = 'localhost', 
                      port = 4445L, 
                      browserName = "chrome") 

# 드라이버 오픈 (브라우저 오픈)
remDr$open() 


# 크롤링 할 웹사이트 
remDr$navigate('http://www.instagram.com/accounts/login/') 


# 로그인 칸 저장
id <- remDr$findElement(using ="name", value="username" ) 
pw <- remDr$findElement(using="name", value="password") 

# 입력란에 아이디와 비밀번호 입력하기 
id$sendKeysToElement(list("123.123123.123123")) 
pw$sendKeysToElement(list("testadmin123"))


# 로그인 버튼 클릭
btn <- remDr$findElement(using = "class name", value = "_qv64e")
btn$clickElement()
Sys.sleep(3)

# 팝업창 버튼 클릭
btnPopup <- remDr$findElement(using = "class name", value = "_dbnr9")
btnPopup$clickElement()



# 검색 창 클릭
searchTag <- remDr$findElement(using = "class name", value = "_avvq0")
searchTag$clickElement()



# 검색할 태그 입력 
searchTag$sendKeysToElement(list("이태원카페"))
Sys.sleep(3)    # 검색 시간 기다

# 카페 태그 클릭 
clickTag <- remDr$findElement(value = '//a[@href = "/explore/tags/이태원카페/"]')
clickTag$clickElement()          


# 무한스크롤 내리기
webElem <- remDr$findElement("css", "body")

# 스크롤 50번 내림 
for(i in 1:50){
  webElem$sendKeysToElement(list(key = "end"))
  Sys.sleep(3)
}

# 게시물 긁어오기
html <- remDr$getPageSource()[[1]]      # 현재 URL 받아오기.
html <- read_html(html)   # UTF-8 방식으로 html 읽어오기


# 해시태그 위치 찾아가서 추출

# 인기게시물
sWords <- html %>% 
  html_nodes("body") %>% 
  html_nodes("span") %>% 
  html_nodes("section") %>% 
  html_nodes("main") %>% 
  html_nodes("article") %>% 
  html_nodes("._21z45") %>% 
  html_nodes("._havey") %>% 
  html_nodes("._6d3hm") %>% 
  html_nodes("._mck9w a") %>% 
  html_nodes("._e3il2") %>%
  html_nodes("._4rbun") %>% 
  html_nodes("img") %>% 
  html_attr("alt")

#sWords

# [2] "너 하나\xf0\u009f\u0098\u0098 나 하나\xf0\u009f\u0098\u008d\n같이 먹으면 더 맛있는 마리웨일 마카롱\n-\n#마리웨일237 #마리웨일마카롱 #마리웨일 #마카롱 #디저트 #카페 #일상 #선물 #정해인 #럽스타그램" 


# 최근게시물
lastTag <- html %>% 
  html_nodes("body") %>% 
  html_nodes("span") %>% 
  html_nodes("section") %>% 
  html_nodes("main") %>% 
  html_nodes("article") %>% 
  html_nodes("div") %>% 
  html_nodes("._havey") %>% 
  html_nodes("._6d3hm") %>% 
  html_nodes("._mck9w a") %>% 
  html_nodes("._e3il2") %>%
  html_nodes("._4rbun") %>% 
  html_nodes("img") %>% 
  html_attr("alt")


#lastTag # 최대 54개 가져옴. 반복적으로 데이터 축적 필요 

# 크롤링 종료
#remDr$close() 


# # 2. 전처리

library(KoNLP)
library(stringr)
library(tm)


# 사전 사용 (태그 그대로 사용한다면 필요없을 것)
#useNIADic()

# 앞 뒤 공백 제거
sWords <- str_trim(sWords)
lastTag <- str_trim(lastTag)
# 결과
# [1] "Angry Valrhona au Lait\xf0\u009f\u0098�\u2615\n오늘 얌순이 할랬도니.,\n노브랜드가 안도와주고 그르네.,\xf0\u009f\u0091\u008a\xf0\u009f\u0091�\xf0\u009f\u0091\u008a!!\n.\n.\n.\n1960s Japan cappuccino cup set.\n\xf0\u009f\u0091\u0089@bracket_table (오늘 업로드예정)\n.\n.\n.\n\xf0\u009f\u008e� Eddie Higgins - Am I Blue"                                   #[2] "너 하나\xf0\u009f\u0098\u0098 나 하나\xf0\u009f\u0098\u008d\n같이 먹으면 더 맛있는 마리웨일 마카롱\n-\n#마리웨일237 #마리웨일마카롱 #마리웨일 #마카롱 #디저트 #카페 #일상 #선물 #정해인 #럽스타그램"                


                      
                      
                      # unlist 형태 - 소용없음 
                      # UnlistPtags <- unlist(sWords)
                      # UnlistPtags
                      # 
                      # View(UnlistPtags)
                      # View(sWords)

# 하나의 변수에 인기게시물, 최근게시물 합치기
#all.tags <- c()
all.tags <- c(all.tags, sWords, lastTag)
#View(all.tags)

# #이 붙은 텍스트 추출
x <- str_extract_all(all.tags, "#\\S+")
#View(x)

# 리스트 형태 제거
xunlist <- unlist(x)
#View(xunlist)


# '#' 기준으로 나누기 
splitx <-str_split(xunlist, "#")
#View(splitx)

# 리스트 형태 제거 - 띄어쓰기 없이 태그 여러개 쓴 게시물을 태그별로 분리.
Unlitx <- unlist(splitx)
#View(Unlitx)


#cat(Unlitx, file ="C:/workspaces/R/Project/output/coffee.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/cafe.txt", append = T)


#cat(Unlitx, file ="C:/workspaces/R/Project/output/Seong-su.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/Gang-nam.txt", append = T)
cat(Unlitx, file ="C:/workspaces/R/Project/output/new.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/Ik-seon.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/HongIk-Univ.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/Dae-gu.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/Byeol-nea.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/IteaWon.txt", append = T)

#cat(Unlitx, file ="C:/workspaces/R/Project/output/starbucks.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/twoSome.txt", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/Ediya.txt", append = T)

#cat(Unlitx, file ="C:/workspaces/R/Project/output/", append = T)
#cat(Unlitx, file ="C:/workspaces/R/Project/output/", append = T)

#cat(Unlitx, file ="C:/workspaces/R/Project/output/data_x1.txt", append = T)

getwd()



# R - Eclips 연동 
# 반드시 먼저 켜줘야 함!! 
#install.packages("Rserve")
library(Rserve)

Rserve(FALSE,port=6311,args='--RS-encoding utf8 --no-save --slave --encoding utf8  --internet2')

Rserve(args="--RS- encoding utf8")




# 태그 정리된텍스트 읽어오기 & 전처리
# 전처리 
library(KoNLP)
library(stringr)
library(tm)

setwd("C:/workspaces/R/Project/output")

listTag <- readLines("data_x1.txt")
View(listTag)

# 공백으로 나누기
splitTag <-str_split(listTag, "\t")
UnlistTag <- unlist(splitTag) # 리스트 형태 풀기 
View(UnlistTag)

# 빈도표 생성
wordcount <- table(UnlistTag)
View(wordcount)

# 데이터 프레임 형태로 만들기
df_word <- as.data.frame(wordcount, stringsAsFactors = F)
df_word
View(df_word)

# 변수명 수정
df_word <- rename(df_word, 
                  word = UnlistTag, 
                  freq = Freq)

# 없는 행 추출
df_word <- filter(df_word, nchar(word) >= 2)

# 상위 태그 20개 추출
top_20 <- df_word %>% 
  arrange(desc(freq)) %>% 
  head(20)

# 전체 태그 빈도수로 정렬 
arrangeTag <- df_word %>% 
  arrange(desc(freq))

View(top_20)
View(arrangeTag)

getwd()


 ###### 워드클라우드 만들기 ######
# 패키
library(KoNLP)
library(stringr)
library(tm)
library(qgraph)
require(devtools)
install_github("lchiffon/wordcloud2")
library(wordcloud2)

wordcloud2(arrangeTag, figPath = "coffee_shape.png", fontFamily="정음체", color=rep_len( c("sienna", "darkred", 
                                                                                        "dimgrey", "antiquewhite", "darkolivegreen", "goldenrod","peru"), nrow(arrangeTag) ))


colors()







