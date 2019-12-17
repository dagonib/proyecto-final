package com.david.avv.dao;

import com.david.avv.model.User;

public interface IUserDetailsDAO {
	User findUserByUsername(String username);
}
