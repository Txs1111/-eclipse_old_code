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
		//4.修改操作
		//第一种：根据id查出对象
		User user = session.get(User.class, 3);
		session.delete(user);
		
		//第二种：
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
		//4.修改操作
		//修改uid==2记录username值
		//4.1根据id查询
		User user = session.get(User.class, 2);
		//4.2向返回的user对象里面设置修改之后的值
		user.setUsername("东方不败");
		//4.3调用session的update方法修改
		session.update(user);//session.save(user);
		//执行的过程：到user对象中，找到uid的值，根据uid进行修改
		
		tx.commit();
		session.close();
		sessionFactory.close();
	}
	
	@Test
	public void testGet(){
		//1.调用工具类获取sessionFactory
		SessionFactory sessionFactory = HibernateUtils.getSessionFactory();
		//2.获取session对象
		Session session = sessionFactory.openSession();
		//3.开启事务
		Transaction tx = session.beginTransaction();
		//4.根据id查询
		//第一个参数：实体类里面的class
		//第二个参数：id值
		User user = session.get(User.class, 2);
		
		System.out.println(user);
		//5.提交事务
		tx.commit();
		//6.关闭
		session.close();
		sessionFactory.close();

	}
}
