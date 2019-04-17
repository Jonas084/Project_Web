package spring.fin.model;

import java.sql.Date;

public class BuyRecordDTO {
//  구매번호
    private Integer buy_number;

    //  회원ID
    private String userid;

    //  커피번호
    private Integer coffee_number;

    //  기프티콘번호
    private Integer gift_number;

    //  가격
    private Integer buy_price;
    //  구매갯수
    private Integer buy_count;

    //  구매날짜
    private Date buydate;
    
    
    public Integer getBuy_count() {
		return buy_count;
	}

	public void setBuy_count(Integer buy_count) {
		this.buy_count = buy_count;
	}

	public Date getBuydate() {
		return buydate;
	}

	public void setBuydate(Date buydate) {
		this.buydate = buydate;
	}

	public Integer getBuy_number() {
        return buy_number;
    }

    public void setBuy_number(Integer buy_number) {
        this.buy_number = buy_number;
    }

    public String getUserid() {
        return userid;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public Integer getCoffee_number() {
        return coffee_number;
    }

    public void setCoffee_number(Integer coffee_number) {
        this.coffee_number = coffee_number;
    }

    public Integer getGift_number() {
        return gift_number;
    }

    public void setGift_number(Integer gift_number) {
        this.gift_number = gift_number;
    }

    public Integer getBuy_price() {
        return buy_price;
    }

    public void setBuy_price(Integer buy_price) {
        this.buy_price = buy_price;
    }

    // BuyRecord 모델 복사
    public void CopyData(BuyRecordDTO param)
    {
        this.buy_number = param.getBuy_number();
        this.userid = param.getUserid();
        this.coffee_number = param.getCoffee_number();
        this.gift_number = param.getGift_number();
        this.buy_price = param.getBuy_price();
    }
}
