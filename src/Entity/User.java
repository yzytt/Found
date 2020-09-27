package Entity;
public class User {
		private int type;
		private String userName;
		private String password;
		public int getType() {
			return type;
		}
		public void setType(int type) {
			this.type = type;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public User(String userName,String password,int type)
		{
			this.userName=userName;
			this.password=password;
			this.type=type;
		}
}
