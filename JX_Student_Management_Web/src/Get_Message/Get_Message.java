package Get_Message;

import java.sql.*;

public class Get_Message {

	Connection con = null; // �������ݿ����
	ResultSet rs = null;
	PreparedStatement ps = null;
	Statement stmt = null;
	String sql = null;
	int exist = 0;

	public void Get_Message(){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("######��ȡ�����ɹ�######");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			con = DriverManager.getConnection("jdbc:mysql:"
					+ "//localhost:3306/Type_Speed?serverTimezone=Asia/Shanghai&userEnicode=true;characterEncoding=UTF-8; ",
					"root", "");
			System.out.println("######���ӳɹ�######");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//String IP = ;
		String Username = request.getParameter("Username");		//����
		/*String Sex = request.getParameter("Sex");		//�Ա�
		String Phone_Number = request.getParameter("Phone_Number");	//�ֻ���
		String Student_Number = request.getParameter("Student_Number");//ѧ��
		String College = request.getParameter("College");	//ѧԺ
		String Major = request.getParameter("Major");	//רҵ
		String Class = request.getParameter("Class");	//�༶
		String Department = request.getParameter("Department");		//����
		String Hobby = request.getParameter("Hobby");			//����
		String Technology = request.getParameter("Technology");	//����ѧ���ļ���
		*/System.out.println("�û���Ϣ��ȡ���");
		
		
		if (Username == null 
				/*|| Sex == null 
				|| Phone_Number == null 
				|| Student_Number == null 
				|| College == null 
				|| Major == null
				|| Class == null 
				|| Department == null 
				|| Hobby == null 
				|| Technology == null */) {	//�п��ֶ�
				System.out.println("��Ϣ�����������������롣");
		}else if(Username == null 
				/*&& Sex != null 
				&& Phone_Number != null 
				&& Student_Number != null 
				&& College != null 
				&& Major != null
				&& Class != null 
				&& Department != null 
				&& Hobby != null 
				&& Technology != null */){
			sql = "INSERT INTO Typing_Speed(Username,Student_Number,Typing_Speed) VALUES (?,?,?);";
			ps.setString(1, Username);
			/*System.out.println("������8%");
			ps.setString(2, Sex);
			System.out.println("������19%");
			ps.setString(4, Phone_Number);
			System.out.println("������28%");
			ps.setString(5, Student_Number);
			System.out.println("������37%");
			ps.setString(6, College);
			System.out.println("������49%");
			ps.setString(7, Major);
			System.out.println("������58%");
			ps.setString(8, Class);
			System.out.println("������68%");
			ps.setString(9, Department);
			System.out.println("������80%");
			ps.setString(10, Hobby);
			System.out.println("������91%");
			ps.setString(11, Technology);*/
			System.out.println("������100%");
			System.out.println("��Ϣ���봢�����");
			ps = con.prepareStatement(sql);
			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from get_message");
			while(rs.next()){
				System.out.println("Username:" + Username);
				if (Username == rs.getString("Username")) { //�û���ע��
					System.out.println("���û��Ѵ���");
					exist = 1;		//�û��Ѵ���
				}
			}
			if(exist == 0){	//�û�������
				ps.executeUpdate(sql);
			}
		}
	}

}
