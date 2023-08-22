package com.amenity.admin.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("adminVO")
public class AdminVO {

	String a_id;
	String a_pw;
	String u_id;
	String u_pw;
	String b_no;
	String b_pw;
	String bookmarked;
	int parentNO;
	int articleNO;
	String title;
	String content;
	String recontent;
	String file;
	Date writedate;
	int tel1;
	int tel2;
	int tel3;
	String name;
	String addr;
	String email;
	int account;
	Date joinDate;
	String company;
	String room;
	String main_img;
	String sub_img;
	int price;
	int totalprice;
	String detail;
	int couponNO;
	String method;
	String discount;
	int disprice;
	int couponvol;
	Date deadline;
	String couponname;
	String userange;
	String location;
	String grade;
	int varmile;
	String varstate;
	int milage;
	Date vardate;
	String image;
	String way;
	String payop;
	Date resdate;
	int resNO;
	String loginstate;
	String roomNO;
	String resForm;
	Date checkin;
	Date checkout;
	String paymentState;
	String nickname;
	String temppw;
	String recotent;
	Date birth;
	String bookmark;
	int mileage;
	int coupon;
	Date credate;
	String category;
	
	public AdminVO() {
		System.out.println("AdminVO �깮�꽦");
	}
	
	public String getA_id() {
		return a_id;
	}
	public void setA_id(String a_id) {
		this.a_id = a_id;
	}
	public String getA_pw() {
		return a_pw;
	}
	public void setA_pw(String a_pw) {
		this.a_pw = a_pw;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}
	public String getU_pw() {
		return u_pw;
	}
	public void setU_pw(String u_pw) {
		this.u_pw = u_pw;
	}
	public String getB_no() {
		return b_no;
	}
	public void setB_no(String b_no) {
		this.b_no = b_no;
	}
	public String getB_pw() {
		return b_pw;
	}
	public void setB_pw(String b_pw) {
		this.b_pw = b_pw;
	}
	public String getBookmarked() {
		return bookmarked;
	}
	public void setBookmarked(String bookmarked) {
		this.bookmarked = bookmarked;
	}
	public int getParentNO() {
		return parentNO;
	}
	public void setParentNO(int parentNO) {
		this.parentNO = parentNO;
	}
	public int getArticleNO() {
		return articleNO;
	}
	public void setArticleNO(int articleNO) {
		this.articleNO = articleNO;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRecontent() {
		return recontent;
	}
	public void setRecontent(String recontent) {
		this.recontent = recontent;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public int getTel1() {
		return tel1;
	}
	public void setTel1(int tel1) {
		this.tel1 = tel1;
	}
	public int getTel2() {
		return tel2;
	}
	public void setTel2(int tel2) {
		this.tel2 = tel2;
	}
	public int getTel3() {
		return tel3;
	}
	public void setTel3(int tel3) {
		this.tel3 = tel3;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getSub_img() {
		return sub_img;
	}
	public void setSub_img(String sub_img) {
		this.sub_img = sub_img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getCouponNO() {
		return couponNO;
	}
	public void setCouponNO(int couponNO) {
		this.couponNO = couponNO;
	}
	public String getMethod() {
		return method;
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public int getDisprice() {
		return disprice;
	}
	public void setDisprice(int disprice) {
		this.disprice = disprice;
	}
	public int getCouponvol() {
		return couponvol;
	}
	public void setCouponvol(int couponvol) {
		this.couponvol = couponvol;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getCouponname() {
		return couponname;
	}
	public void setCouponname(String couponname) {
		this.couponname = couponname;
	}
	public String getUserange() {
		return userange;
	}
	public void setUserange(String userange) {
		this.userange = userange;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getVarmile() {
		return varmile;
	}
	public void setVarmile(int varmile) {
		this.varmile = varmile;
	}
	public String getVarstate() {
		return varstate;
	}
	public void setVarstate(String varstate) {
		this.varstate = varstate;
	}
	public int getMilage() {
		return milage;
	}
	public void setMilage(int milage) {
		this.milage = milage;
	}
	public Date getVardate() {
		return vardate;
	}
	public void setVardate(Date vardate) {
		this.vardate = vardate;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getWay() {
		return way;
	}
	public void setWay(String way) {
		this.way = way;
	}
	public String getPayop() {
		return payop;
	}
	public void setPayop(String payop) {
		this.payop = payop;
	}
	public Date getResdate() {
		return resdate;
	}
	public void setResdate(Date resdate) {
		this.resdate = resdate;
	}
	public int getResNO() {
		return resNO;
	}
	public void setResNO(int resNO) {
		this.resNO = resNO;
	}
	public String getLoginstate() {
		return loginstate;
	}
	public void setLoginstate(String loginstate) {
		this.loginstate = loginstate;
	}
	public String getRoomNO() {
		return roomNO;
	}
	public void setRoomNO(String roomNO) {
		this.roomNO = roomNO;
	}
	public String getResForm() {
		return resForm;
	}
	public void setResForm(String resForm) {
		this.resForm = resForm;
	}
	public Date getCheckin() {
		return checkin;
	}
	public void setCheckin(Date checkin) {
		this.checkin = checkin;
	}
	public Date getCheckout() {
		return checkout;
	}
	public void setCheckout(Date checkout) {
		this.checkout = checkout;
	}
	public String getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(String paymentState) {
		this.paymentState = paymentState;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getTemppw() {
		return temppw;
	}
	public void setTemppw(String temppw) {
		this.temppw = temppw;
	}
	public String getRecotent() {
		return recotent;
	}
	public void setRecotent(String recotent) {
		this.recotent = recotent;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	public String getBookmark() {
		return bookmark;
	}
	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getCoupon() {
		return coupon;
	}
	public void setCoupon(int coupon) {
		this.coupon = coupon;
	}
	public Date getCredate() {
		return credate;
	}
	public void setCredate(Date credate) {
		this.credate = credate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
