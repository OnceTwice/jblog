package com.bit2016.jblog.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bit2016.jblog.repository.*;
import com.bit2016.jblog.vo.*;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	public void join(UserVo vo) {
		userDao.insert(vo);
	}
	
	public UserVo login(String id, String password) {
		UserVo userVo = null;		// 로컬 변수 초기화
		userVo = userDao.get(id, password);
		
		return userVo;
	}
	
	public UserVo getUser(Long no) {
		return userDao.get(no);
	}
	
	public boolean idExists(String id) {
		return (userDao.get(id) != null);
	}
}
