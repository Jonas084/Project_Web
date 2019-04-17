package spring.fin.model;

public class CoffeeTasteDTO {
//  커피맛

    //  원두이름
    private String coffee_name;
    //  신맛
    private Integer sourness;
    //  쓴맛
    private Integer bitters;
    //  단맛
    private Integer sweetness;
    //  향
    private Integer aroma;
    //  바디감
    private Integer body;
    //  밸런스
    private Integer balance;
    //  번호
    private Integer coffee_number;

    
    public String getCoffee_name() {
        return coffee_name;
    }

    public void setCoffee_name(String coffee_name) {
        this.coffee_name = coffee_name;
    }

    public Integer getSourness() {
        return sourness;
    }

    public void setSourness(Integer sourness) {
        this.sourness = sourness;
    }

    public Integer getBitters() {
        return bitters;
    }

    public void setBitters(Integer bitters) {
        this.bitters = bitters;
    }

    public Integer getSweetness() {
        return sweetness;
    }

    public void setSweetness(Integer sweetness) {
        this.sweetness = sweetness;
    }

    public Integer getAroma() {
        return aroma;
    }

    public void setAroma(Integer aroma) {
        this.aroma = aroma;
    }

    public Integer getBody() {
        return body;
    }

    public void setBody(Integer body) {
        this.body = body;
    }

    public Integer getBalance() {
        return balance;
    }

    public void setBalance(Integer balance) {
        this.balance = balance;
    }

    public Integer getCoffee_number() {
        return coffee_number;
    }

    public void setCoffee_number(Integer coffee_number) {
        this.coffee_number = coffee_number;
    }

    // Taste 모델 복사
    public void CopyData(CoffeeTasteDTO param)
    {
        this.coffee_name = param.getCoffee_name();
        this.sourness = param.getSourness();
        this.bitters = param.getBitters();
        this.sweetness = param.getSweetness();
        this.aroma = param.getAroma();
        this.body = param.getBody();
        this.balance = param.getBalance();
        this.coffee_number = param.getCoffee_number();
    }

}
