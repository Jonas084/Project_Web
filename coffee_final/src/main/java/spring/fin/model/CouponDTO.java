package spring.fin.model;

public class CouponDTO {
//  쿠폰

    //  쿠폰번호
    private String couponNumber;

    //  쿠폰가격
    private Integer money;

    public String getCouponNumber() {
        return couponNumber;
    }

    public void setCouponNumber(String couponNumber) {
        this.couponNumber = couponNumber;
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }

    // Coupon 모델 복사
    public void CopyData(CouponDTO param)
    {
        this.couponNumber = param.getCouponNumber();
        this.money = param.getMoney();
    }
}

