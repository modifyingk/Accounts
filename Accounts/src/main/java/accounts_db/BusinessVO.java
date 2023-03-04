package accounts_db;

public class BusinessVO {
	private String bsn_id;
	private String bsn_name;
	private String bsn_rep;
	private String bsn_addr;
	private String bsn_indus;
	private String bsn_type;
	
	public String getBsn_id() {
		return bsn_id;
	}
	public void setBsn_id(String bsn_id) {
		this.bsn_id = bsn_id;
	}
	public String getBsn_name() {
		return bsn_name;
	}
	public void setBsn_name(String bsn_name) {
		this.bsn_name = bsn_name;
	}
	public String getBsn_rep() {
		return bsn_rep;
	}
	public void setBsn_rep(String bsn_rep) {
		this.bsn_rep = bsn_rep;
	}
	public String getBsn_addr() {
		return bsn_addr;
	}
	public void setBsn_addr(String bsn_addr) {
		this.bsn_addr = bsn_addr;
	}
	public String getBsn_indus() {
		return bsn_indus;
	}
	public void setBsn_indus(String bsn_indus) {
		this.bsn_indus = bsn_indus;
	}
	public String getBsn_type() {
		return bsn_type;
	}
	public void setBsn_type(String bsn_type) {
		this.bsn_type = bsn_type;
	}
	
	@Override
	public String toString() {
		return "BusinessVO [bsn_id=" + bsn_id + ", bsn_name=" + bsn_name + ", bsn_rep=" + bsn_rep + ", bsn_addr="
				+ bsn_addr + ", bsn_indus=" + bsn_indus + ", bsn_type=" + bsn_type + "]";
	}
}
