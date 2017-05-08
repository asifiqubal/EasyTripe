package adapters;

import java.sql.ResultSet;
import java.util.ArrayList;

import models.Login;
import models.Users;

public class UsersAdapter {
	
	public Users getLogin(String username, String password){
		Login lg=new Login();
		LoginAdapter la=new LoginAdapter();
		lg=la.login(username,password);
		if(lg==null)
		{
			return null;
		}else{
		int userid=lg.getUserid();
		
		String sql = "SELECT * FROM users WHERE userid="+userid;
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		Users user = new Users();
		try {
			if(rs.next())
			{
				user.setUserid(rs.getInt("userid"));
				user.setName(rs.getString("name"));
				user.setAddress(rs.getString("address"));
				user.setPhone(rs.getString("phone"));
				user.setDob(rs.getString("dob"));
				user.setEmail(rs.getString("email"));
				user.setType(rs.getString("type"));
				user.setStatus(rs.getString("status"));
				
				return user;
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
	}
	
	public ArrayList<Users>getAllUserList()
	{
		String sql = "SELECT * FROM users Where userid!=0 ";
		DataAccess da = new DataAccess();
		ResultSet rs = da.getResultSet(sql);
		ArrayList<Users> userlist = new ArrayList<Users>();
		try {
			while(rs.next())
			{
				Users ul = new Users();
				ul.setUserid(rs.getInt("userid"));
				ul.setName(rs.getString("name"));
				ul.setEmail(rs.getString("email"));
				ul.setPhone(rs.getString("phone"));
				ul.setStatus(rs.getString("status"));
				
				userlist.add(ul);
			}
			return userlist;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Users getUserbyId(int userid) {
		String sql="SELECT * from users where userid="+userid;
		DataAccess da = new DataAccess();
		ResultSet rs=da.getResultSet(sql);
		try {
			Users ud = new Users();
			if(rs.next())
			{
				
				ud.setUserid(rs.getInt("userid"));
				ud.setName(rs.getString("name"));
				ud.setAddress(rs.getString("address"));
				ud.setDob(rs.getString("dob"));
				ud.setEmail(rs.getString("email"));
				ud.setPhone(rs.getString("phone"));
				ud.setStatus(rs.getString("status"));
				ud.setType(rs.getString("type"));
				
			}
			return ud;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public void update(Users u)
	{
		String sql = "UPDATE users SET NAME ='"+u.getName()+"' , email = '"+u.getEmail()+"',dob='"+u.getDob()+"',phone = '"+u.getPhone()+"', address = '"+u.getAddress()+"', TYPE = 'user', STATUS = '"+u.getStatus()+"' WHERE userid ="+u.getUserid();
		DataAccess da = new DataAccess();
		da.executeQuery(sql);
		System.out.println(sql);
	}
	public void userUpdate(Users u)
	{
		String sql = "UPDATE users SET phone = '"+u.getPhone()+"', address = '"+u.getAddress()+"' ,dob='"+u.getDob()+"' WHERE userid ="+u.getUserid();
		DataAccess da = new DataAccess();
		da.executeQuery(sql);
		System.out.println(sql);
	}
	
	public void deleteUser(int userid) {
		String sql = "DELETE From users WHERE userid ="+userid;
		DataAccess da = new DataAccess();
		da.executeQuery(sql);
		System.out.println(sql);
	}
	
	public void Insurt(Users us, String username,String password) {
		String sql="INSERT INTO users VALUES(null,'"+us.getName()+"','"+us.getEmail()+"','"+us.getPhone()+"','"+us.getAddress()+"','"+us.getDob()+"','user','active');";
		DataAccess da=new DataAccess();
		da.executeQuery(sql);
		String sql1="SELECT userid from users WHERE email='"+us.getEmail()+"' and phone='"+us.getPhone()+"';";
		System.out.println(sql1);
		
		ResultSet rs=da.getResultSet(sql1);
		try {
			int userid;
			if(rs.next()){
				userid=rs.getInt("userid");
				String sql2="INSERT INTO login VALUES("+userid+",'"+username+"','"+password+"');";
				da.executeQuery(sql2);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
}
