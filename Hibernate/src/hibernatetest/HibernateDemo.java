package hibernatetest;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.junit.Test;

import study_hibernate2.User;
import utils2.HibernateUtils;

public class HibernateDemo {

	@Test
	public void testAdd(){
//		��һ��������hibernate���������ļ�
		//��src�����ҵ�������hibernate.cfg.xml
		//��hibernate�����װ����
//		Configuration cfg = new Configuration();
//		cfg.configure();
//		�ڶ���������SessionFactory����
		//��ȡhibernate���������ļ����ݴ���SessionFactory
		//�ڹ����У�����ӳ���ϵ�����������ݿ�����İѱ���
//		SessionFactory sessionFactory = cfg.buildSessionFactory();
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
//		��������ʹ��SessionFactory����session����
		//����������
		Session session = sessionFactory.openSession();
		
//		���Ĳ�����������
		Transaction tx = session.beginTransaction();
		
//		���岽��д�����߼�crud����
		//��ӵĹ���
		User user =new User();
		user.setUsername("����");
		user.setPassword("20");
		user.setAddress("����");
		//����session�ķ���ʵ�����
		session.save(user);
		
//		���������ύ����
		tx.commit();
		
//		���߲����ر���Դ
		session.close();
		sessionFactory.close();

	}
}
