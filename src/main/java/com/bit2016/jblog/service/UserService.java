package com.bit2016.jblog.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bit2016.jblog.repository.*;
import com.bit2016.jblog.vo.*;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private BlogDao blogDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	public void join(UserVo vo) {			// 회원가입을 할 때
		userDao.insert(vo);					// 회원 가입과 동시에
		blogDao.insert(vo.getNo());			// 블로그 생성과
		categoryDao.insert(vo.getNo());		// 카테고리 생성
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
