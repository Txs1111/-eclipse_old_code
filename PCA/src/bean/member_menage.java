package bean;

import java.sql.SQLException;
import java.util.ArrayList;

import dao.MySQL_connect;

public class member_menage {
	public String ID = "";
	public MySQL_connect con = new MySQL_connect();
	public int datanum = 0;
	public ArrayList<String> allID = new ArrayList<>();
	public ArrayList<String> allname = new ArrayList<>();
	public ArrayList<String> allrole = new ArrayList<>();
	public int showdata=0;

	public member_menage(String ID) {
		this.ID = ID;
	}

	public String[] getroles() {
		String sql = "select role from user_role";
		String role[] = null;
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			int num = 0;
			while (this.con.result.next()) {
				num++;
			}
			String roles[] = new String[num];
			this.con.result.beforeFirst();
			num = 0;
			while (this.con.result.next()) {
				roles[num] = this.con.result.getString("role");
				num++;
			}
			role = roles;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return role;
	}

	public ArrayList<String> getIDs(String name, String ID, String role, String page) {
		String sql = "";
		ArrayList<String> result = null;
		if (name == null) {
			name = "";
		}
		if (ID == null) {
			ID = "";
		}
		if (role == null) {
			role = "";
		}
		sql = "select ID from user_personal_data where name like'%" + name + "%' and ID like'%" + ID + "%'";
		try {
			this.con.result = this.con.usercommend.executeQuery(sql);
			ArrayList<String> IDs2 = new ArrayList<String>();
			while (this.con.result.next()) {

				IDs2.add(this.con.result.getString("ID"));
			}
			result = IDs2;
			this.datanum = IDs2.size();
			if (!"".equals(role)) {
				ArrayList<String> IDs = new ArrayList<String>();
				for (int a = 0; a < IDs2.size(); a++) {
					sql = "select role from users_login where ID='" + IDs2.get(a) + "'";
					this.con.result = this.con.usercommend.executeQuery(sql);
					this.con.result.next();
					if (role.equals(this.con.result.getString("role"))) {

						IDs.add(IDs2.get(a));
					}
				}
				result = IDs;
				this.datanum = IDs.size();

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		int num = result.size();
		int showpage = Integer.parseInt(page);
		num = num - (showpage - 1) * 20;
		if (num > 20) {
			num = 20;
		}
		ArrayList<String> allID = new ArrayList<>();
		this.showdata=num;
		for (int a = (showpage - 1) * 20; a < num + (showpage - 1) * 20; a++) {
			allID.add(result.get(a));
			sql="select name from user_personal_data where ID='"+result.get(a)+"'";
			try {
				this.con.result=this.con.usercommend.executeQuery(sql);
				this.con.result.next();
				this.allname.add(this.con.result.getString("name"));
				sql="select role from users_login where ID='"+result.get(a)+"'";
				this.con.result=this.con.usercommend.executeQuery(sql);
				this.con.result.next();
				this.allrole.add(this.con.result.getString("role"));
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		this.allID = allID;
		System.out.println(this.allID);
		System.out.println(this.allname);
		System.out.println(this.allrole);
		return allID;
	}

}
