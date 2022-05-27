package la.bean;

public class CustomerBean {
	private int code;
	private String name;
	private String address;
	private String tel;
	private String email;
	
	private String card;
	private String bank;
	private String cash;
	
	public String getCard() {
		return card;
	}

	public void setCard(String card) {
		this.card = card;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getCash() {
		return cash;
	}

	public void setCash(String cash) {
		this.cash = cash;
	}

	public CustomerBean() {
		
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public CustomerBean(int code, String name, String address, String tel, String email) {
		super();
		this.code = code;
		this.name = name;
		this.address = address;
		this.tel = tel;
		this.email = email;
	}

	public CustomerBean(String card, String bank, String cash) {
		super();
		this.card = card;
		this.bank = bank;
		this.cash = cash;
	}

}
