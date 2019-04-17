package spring.fin.model;

import java.sql.Date;

public class CoffeePostscriptDTO {

    //  커피 번호
    private Integer coffee_number;
    //  게시글번호
    private Integer board_number;
    //  제목
    private String title;
    //  작성자
    private String writer;
    //  클릭수
    private Integer click_count;
    //  평점
    private String evaluation;
    //  내용
    private String content;
    //  등록날짜
    private Date regdate;

    public Integer getCoffee_number() {
        return coffee_number;
    }

    public void setCoffee_number(Integer coffee_number) {
        this.coffee_number = coffee_number;
    }

    public Integer getBoard_number() {
        return board_number;
    }

    public void setBoard_number(Integer board_number) {
        this.board_number = board_number;
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

    public Integer getClick_count() {
        return click_count;
    }

    public void setClick_count(Integer click_count) {
        this.click_count = click_count;
    }

    public String getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(String evaluation) {
        this.evaluation = evaluation;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getRegdate() {
        return regdate;
    }

    public void setRegdate(Date regdate) {
        this.regdate = regdate;
    }

    // Postscript 모델 복사
    public void CopyData(CoffeePostscriptDTO param)
    {
        this.coffee_number = param.getCoffee_number();
        this.board_number = param.getBoard_number();
        this.title = param.getTitle();
        this.writer = param.getWriter();
        this.click_count = param.getClick_count();
        this.evaluation = param.getEvaluation();
        this.content = param.getContent();
        this.regdate = param.getRegdate();
    }

}
