package spring.fin.model;

public class UserBasketDTO {
	private int basket_number;
	private String userID;
	private String main_img;
	private String inform_img_a;
	private String coffee_name;
	private int price;
	
	public int getBasket_number() {
		return basket_number;
	}
	public void setBasket_number(int basket_number) {
		this.basket_number = basket_number;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
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
	public String getCoffee_name() {
		return coffee_name;
	}
	public void setCoffee_name(String coffee_name) {
		this.coffee_name = coffee_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	
}
