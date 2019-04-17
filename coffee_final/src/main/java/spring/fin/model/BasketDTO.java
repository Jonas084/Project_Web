package spring.fin.model;

public class BasketDTO {
	int basket_number;
	String userID;
	int coffee_number;
	
	
	
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
	public int getCoffee_number() {
		return coffee_number;
	}
	public void setCoffee_number(int coffee_number) {
		this.coffee_number = coffee_number;
	}
	
}
