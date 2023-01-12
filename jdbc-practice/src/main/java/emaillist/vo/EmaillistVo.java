package emaillist.vo;

public class EmaillistVo {
	private Long no;
	private String FirstName;
	private String LastName;
	private String Email;
	public Long getNo() {
		return no;
	}
	public void setNo(Long no) {
		this.no = no;
	}
	public String getFirstName() {
		return FirstName;
	}
	public void setFirstName(String firstName) {
		FirstName = firstName;
	}
	public String getLastName() {
		return LastName;
	}
	public void setLastName(String lastName) {
		LastName = lastName;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	@Override
	public String toString() {
		return "EmaillistVo [no=" + no + ", FirstName=" + FirstName + ", LastName=" + LastName + ", Email=" + Email
				+ "]";
	}
	
}
