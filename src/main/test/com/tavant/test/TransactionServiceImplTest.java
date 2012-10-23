package com.tavant.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tavant.services.TransactionService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("test-servlet-context.xml")
public class TransactionServiceImplTest {
	
	@Autowired
	private TransactionService transactionService;
//	
	@Test
	public void testGetTotalAmounts() {
		System.out.println(transactionService.getTotalAmounts(3)[0]);
	}
}
