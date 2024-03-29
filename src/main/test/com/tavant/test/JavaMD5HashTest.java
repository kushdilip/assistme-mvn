package com.tavant.test;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.tavant.services.JavaMD5HashService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("test-servlet-context.xml")
public class JavaMD5HashTest {
	
	@Autowired
	private JavaMD5HashService jMd5HashService;

	@Test
	public void testMd5() {
		String password = "password";
		System.out.println("MD5 in hex: " + jMd5HashService.md5(password));
		System.out.println("MD5 in hex:" + jMd5HashService.md5(null));
		System.out.println("MD5 in hex: " + jMd5HashService.md5("The quick brown fox jumps over the lazy dog"));
            //= 9e107d9d372bb6826bd81d3542a419d6
	}

}
