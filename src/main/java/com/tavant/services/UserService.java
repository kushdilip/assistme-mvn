package com.tavant.services;

import com.tavant.domain.User;

public interface UserService {
	public void addUser(User user);

	public User selectByEmailId(String emailId);

	public boolean updatePassword(User user);
	public void updateUser(User user);
}
