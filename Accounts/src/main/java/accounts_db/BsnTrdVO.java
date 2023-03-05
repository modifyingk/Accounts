package accounts_db;

public class BsnTrdVO {
	private String trd_date;
	private String bsn_name;
	private String trd_item;
	private int trd_total;
	
	public String getTrd_date() {
		return trd_date;
	}
	public void setTrd_date(String trd_date) {
		this.trd_date = trd_date;
	}
	public String getBsn_name() {
		return bsn_name;
	}
	public void setBsn_name(String bsn_name) {
		this.bsn_name = bsn_name;
	}
	public String getTrd_item() {
		return trd_item;
	}
	public void setTrd_item(String trd_item) {
		this.trd_item = trd_item;
	}
	public int getTrd_total() {
		return trd_total;
	}
	public void setTrd_total(int trd_total) {
		this.trd_total = trd_total;
	}
	
	@Override
	public String toString() {
		return "BsnTrdVO [trd_date=" + trd_date + ", bsn_name=" + bsn_name + ", trd_item=" + trd_item + ", trd_total="
				+ trd_total + "]";
	}
}
