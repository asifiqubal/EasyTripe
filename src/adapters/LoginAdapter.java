package adapters;

import java.sql.ResultSet;

import models.Login;
import models.Users;

public class LoginAdapter {
	public Login login(String username, String password){
		String sql = "SELECT * FROM login WHERE username='"+username+"' and password='"+password+"' ";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		Login login=new Login();
		try {
			if(rs.next())
			{
				login.setUserid(rs.getInt("userid"));
				
				return login;
			}
			else
			{
				return null;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public boolean checkPass(Login lg){
		String sql="select * from login where userid="+lg.getUserid()+" AND password='"+lg.getPassword()+"';";
		DataAccess da=new DataAccess();
		ResultSet rs=da.getResultSet(sql);
		try {
			if(rs.next()){
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
	public void update(Login lg,String newpassword){
		
		String sql="Update login set password='"+newpassword+"' where userid="+lg.getUserid();
		DataAccess da = new DataAccess();
		da.executeQuery(sql);

	}
}
