package hibernatetest2;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import study_hibernate2.User;
import utils2.HibernateUtils;

public class HibernateDemo {
	
	@Test
	public void testDelete(){
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//4.�޸Ĳ���
		//��һ�֣�����id�������
		User user = session.get(User.class, 3);
		session.delete(user);
		
		//�ڶ��֣�
		User user2 = new User();
		user2.setUid(3);
		session.delete(user2);
		
		tx.commit();
		session.close();
		sessionFactory.close();
	}
	@Test
	public void testUpdate(){
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		//4.�޸Ĳ���
		//�޸�uid==2��¼usernameֵ
		//4.1����id��ѯ
		User user = session.get(User.class, 2);
		//4.2�򷵻ص�user�������������޸�֮���ֵ
		user.setUsername("��������");
		//4.3����session��update�����޸�
		session.update(user);//session.save(user);
		//ִ�еĹ��̣���user�����У��ҵ�uid��ֵ������uid�����޸�
		
		tx.commit();
		session.close();
		sessionFactory.close();
	}
	
	@Test
	public void testGet(){
		//1.���ù������ȡsessionFactory
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		//2.��ȡsession����
		Session session = sessionFactory.openSession();
		//3.��������
		Transaction tx = session.beginTransaction();
		//4.����id��ѯ
		//��һ��������ʵ���������class
		//�ڶ���������idֵ
		User user = session.get(User.class, 2);
		
		System.out.println(user);
		//5.�ύ����
		tx.commit();
		//6.�ر�
		session.close();
		sessionFactory.close();

	}
}
