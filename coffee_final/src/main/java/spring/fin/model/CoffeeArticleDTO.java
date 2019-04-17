package spring.fin.model;

public class CoffeeArticleDTO {
	
	// 순서
	private Integer coffee_order;
	// 링크주소
	private String coffee_link;
	// 이미지
	private String coffee_img;
	// 제목
	private String coffee_title;
	// 링크주소2
	
	// 본문내용
	private String coffee_contents;
	// 날짜
	private String coffee_date;
	
	public Integer getCoffee_order() {
		return coffee_order;
	}
	public void setCoffee_order(Integer coffee_order) {
		this.coffee_order = coffee_order;
	}
	public String getCoffee_link() {
		return coffee_link;
	}
	public void setCoffee_link(String coffee_link) {
		this.coffee_link = coffee_link;
	}
	public String getCoffee_img() {
		return coffee_img;
	}
	public void setCoffee_img(String coffee_img) {
		this.coffee_img = coffee_img;
	}
	public String getCoffee_title() {
		return coffee_title;
	}
	public void setCoffee_title(String coffee_title) {
		this.coffee_title = coffee_title;
	}
	
	public String getCoffee_contents() {
		return coffee_contents;
	}
	public void setCoffee_contents(String coffee_contents) {
		this.coffee_contents = coffee_contents;
	}
	public String getCoffee_date() {
		return coffee_date;
	}
	public void setCoffee_date(String coffee_date) {
		this.coffee_date = coffee_date;
	}
	
}
