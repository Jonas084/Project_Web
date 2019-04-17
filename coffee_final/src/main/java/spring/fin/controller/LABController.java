package spring.fin.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.rosuda.REngine.RList;
import org.rosuda.REngine.Rserve.RConnection;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import spring.fin.model.InstaTagDTO;

@Controller
public class LABController {

	@RequestMapping(value = "/LABrequest.do")
	public ModelAndView LABrequest(HttpServletRequest request, HttpServletResponse response) {

		// 태그 리스트 담을 List
		List<InstaTagDTO> tagList = InstaTagList();
		

		ModelAndView mv = new ModelAndView();
		mv.setViewName("LAB");
		mv.addObject("TagList", tagList);
		
		return mv;
	}

	public List<InstaTagDTO> InstaTagList() {

		RConnection connection = null;

		String tagName = "익선동카페";
		System.out.println(tagName);

		float countSum = 0;
		List<InstaTagDTO> tagList = new ArrayList<InstaTagDTO>();
		InstaTagDTO tag;

		try {
			connection = new RConnection();
			// R 코드
			// 사전에 쌓아놓은 데이터를 사용해 상위 태그 20개 추출

			// 패키지 준비
			connection.eval("library(KoNLP)");
			connection.eval("library(stringr)");
			connection.eval("library(dplyr)");
			connection.eval("library(tm)");

			// working directory 설정
			System.out.println("working directory 설정");
			connection.eval("setwd('C:/workspace/spring/coffee/src/main/webapp/resources/R')");
			//connection.eval("setwd('C:/workspaces/R/Project/output')");

			// 쌓아놓은 데이터 가져오기
			System.out.println("쌓아놓은 데이터 가져오기");
			connection.eval("listTag <- readLines('data_x1.txt')");
			//connection.eval("listTag <- readLines('new.txt')");
			

			// 탭으로 단어 나누기
			System.out.println("탭으로 단어 나누기");
			connection.eval("splitTag <-str_split(listTag, '\t')");

			// 리스트 형태 풀기
			System.out.println("리스트 형태 풀기");
			connection.eval("UnlistTag <- unlist(splitTag)");

			// 빈도표 생성
			System.out.println("빈도표 생성");
			connection.eval("wordcount <- table(UnlistTag)");

			// 데이터 프레임 형태로 만들기
			System.out.println("데이터 프레임 형태로 만들기");
			connection.eval("df_word <- as.data.frame(wordcount, stringsAsFactors = F)");

			// 변수명 수정
			System.out.println("변수명 수정");
			connection.eval("df_word <- rename(df_word, " + "word = UnlistTag, " + "freq = Freq)");

			// 두 글자 이상의 텍스트 추출
			System.out.println("두 글자 이상의 텍스트 추출");
			connection.eval("df_word <- filter(df_word, nchar(word) >= 2)");

			// 상위 20개 태그 추출 - RList 로 받아오기
			System.out.println("상위 20개 태그 추출 - RList 로 받아오기");
			RList RtagList = connection.eval("top_20 <- df_word %>% " + "arrange(desc(freq)) %>% " + "head(20)")
					.asList();

			// Java 배열 크기 받기
			int rows = RtagList.size();
			System.out.println("rows = " + rows);
			int cols = RtagList.at(0).length();
			System.out.println("cols = " + cols);

			String[][] tagArray = new String[rows][];

			// java 1차원 배열로 RList 값 받아오기
			for (int i = 0; i < rows; i++) {

				tagArray[i] = RtagList.at(i).asStrings();
		
			}

			// 2 * 20 배열
			for (int i = 0; i < rows; i++) {

				for (int j = 0; j < cols; j++) {

					System.out.println(tagArray[i][j]);

				}
			}

			// 점유율 계산 위해 태그 빈도수 합 계산
			for (int i = 1; i < rows; i++) {
				for (int j = 0; j < cols; j++) {
					
					
						// 점유율 계산 위해 태그 빈도수 합 계산
						countSum += Integer.parseInt(tagArray[i][j]);
						System.out.println(countSum);
						
				}
			}
			
			// 2 * 20 배열
			for (int i = 0; i < rows-1; i++) {
				for (int j = 0; j < cols; j++) {
					
					tag = new InstaTagDTO();
					
					// 태그 번호 저장 
					tag.setTag_Number(j+1);
					//System.out.println("태그번호: " + (j+1));

					// 0행: 태그 이름 저장 
					tag.setTagname(tagArray[i][j]);
					tag.setTagcount(Integer.parseInt(tagArray[i+1][j]));
					
					float share = (Integer.parseInt(tagArray[i+1][j]) / countSum) * 100;				
					tag.setTagshare((int)(share * 100 + 0.5) / (float)100.0);

					System.out.println("========DTO=========");
					System.out.println("번호: " + tag.getTag_Number());
					System.out.println("이름: " + tag.getTagname());
					System.out.println("빈도수: " + tag.getTagcount());
					System.out.println("점유율: " + tag.getTagshare());
					
					tagList.add(tag);
				}
			}

			return tagList;

			/*
			 * connection.eval("library(RSelenium)");
			 * connection.eval("library(RSelenium)");
			 * connection.eval("library(RSelenium)");
			 */

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		System.out.println("연결");

		return null;

	}

}
