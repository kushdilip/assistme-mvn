package com.tavant.test;


import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tavant.db.impl.AnniversaryDAO;
import com.tavant.db.impl.TransactionDAO;
import com.tavant.db.impl.UserDAO;
import com.tavant.domain.Transaction;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("test-servlet-context.xml")
public class TransactionDAOTest {
	
	private static TransactionDAO traDAO;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		traDAO = new TransactionDAO();
	}
	
	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		traDAO = null;
	}
	
	@Test
	public void testInsert() {
		Transaction transaction = new Transaction("2010-12-12", "shopping", 36,"ramesh", 1200, 3);
//		System.out.println(transaction);
//		traDAO.insert(transaction);
	}
	
	@Test
	public void toGiveTest() {
		System.out.println(traDAO.toGive(1));
		System.out.println(traDAO.toCollect(1));
		
	}
	
	
	
}
