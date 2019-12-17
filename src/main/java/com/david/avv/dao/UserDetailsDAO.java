package com.david.avv.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.david.avv.model.User;

@Repository
public class UserDetailsDAO implements IUserDetailsDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User findUserByUsername(String username) {
		return sessionFactory.getCurrentSession().get(User.class, username);
	}

}
