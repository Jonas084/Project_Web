package spring.fin.model;


public class MemberDTO {
//  회원정보

    //  회원번호
    private Integer user_number;

    //  ID
    private String userID;

    //  비밀번호
    private String userPW;

    //  이름
    private String userName;

    //  주소
    private String userAddress;

    //  폰번호
    private String userPhone;

    //  이메일
    private String userEmail;

    //  쿠폰적립액
    private Integer userCoupon;

    //  포인트(후기작성시 적립되는 금액)
    private Integer userPoint;

	public Integer getUser_number() {
		return user_number;
	}

	public void setUser_number(Integer user_number) {
		this.user_number = user_number;
	}

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String getUserPW() {
		return userPW;
	}

	public void setUserPW(String userPW) {
		this.userPW = userPW;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Integer getUserCoupon() {
		return userCoupon;
	}

	public void setUserCoupon(Integer userCoupon) {
		this.userCoupon = userCoupon;
	}

	public Integer getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(Integer userPoint) {
		this.userPoint = userPoint;
	}

   

}
