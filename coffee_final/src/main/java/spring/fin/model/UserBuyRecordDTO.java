package spring.fin.model;

import java.sql.Date;

public class UserBuyRecordDTO {
	private String main_img;
	 private String coffee_name;
	 private Integer price;
	 private Integer buy_count;
	 private Integer buy_price;
	 private Date buydate;
	 
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
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
	public Integer getBuy_count() {
		return buy_count;
	}
	public void setBuy_count(Integer buy_count) {
		this.buy_count = buy_count;
	}
	public Integer getBuy_price() {
		return buy_price;
	}
	public void setBuy_price(Integer buy_price) {
		this.buy_price = buy_price;
	}
	public Date getBuydate() {
		return buydate;
	}
	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}
}
