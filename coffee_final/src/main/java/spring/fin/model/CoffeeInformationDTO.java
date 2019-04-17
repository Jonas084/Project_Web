package spring.fin.model;

public class CoffeeInformationDTO {
    //  번호
    private Integer coffee_number;
    //  이름
    private String coffee_name;
    //  가격
    private Integer price;
    //  이미지1
    private String main_img;
    //  이미지2
    private String inform_img_a;
    //  이미지3
    private String inform_img_b;
    //  이미지4
    private String inform_img_c;
    //  이미지5
    private String inform_img_d;
    //  클릭수
    private Integer click_count;
    
	public Integer getCoffee_number() {
		return coffee_number;
	}
	public void setCoffee_number(Integer coffee_number) {
		this.coffee_number = coffee_number;
	}
	public String getCoffee_name() {
		return coffee_name;
	}
	public void setCoffee_name(String coffee_name) {
		this.coffee_name = coffee_name;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getInform_img_a() {
		return inform_img_a;
	}
	public void setInform_img_a(String inform_img_a) {
		this.inform_img_a = inform_img_a;
	}
	public String getInform_img_b() {
		return inform_img_b;
	}
	public void setInform_img_b(String inform_img_b) {
		this.inform_img_b = inform_img_b;
	}
	public String getInform_img_c() {
		return inform_img_c;
	}
	public void setInform_img_c(String inform_img_c) {
		this.inform_img_c = inform_img_c;
	}
	public String getInform_img_d() {
		return inform_img_d;
	}
	public void setInform_img_d(String inform_img_d) {
		this.inform_img_d = inform_img_d;
	}
	public Integer getClick_count() {
		return click_count;
	}
	public void setClick_count(Integer click_count) {
		this.click_count = click_count;
	}

    

}
