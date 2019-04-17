package spring.fin.model;

public class SearchCriteriaDTO {
	
	private String searchType;	// 검색 타입
	private String keyword;		// 검색 키워드
	
	//  제목
    private String title;
    //  작성자
    private String writer;
    //  내용
    private String content;
	
    
	// getter & setter
	public String getSearchType() {
		return searchType;
	}


	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getWriter() {
		return writer;
	}


	public void setWriter(String writer) {
		this.writer = writer;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}
}
