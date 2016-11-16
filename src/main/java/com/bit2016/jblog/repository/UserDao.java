package com.bit2016.jblog.repository;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bit2016.jblog.vo.*;

@Repository
public class UserDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(UserVo vo) {
		System.out.println("인설트전" + vo);
		sqlSession.insert("user.insert", vo);
		System.out.println("인설트후" + vo);
	}
	
	// 인증(로그인)
	public UserVo get(String id, String password) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		map.put("password", password);
		
		return sqlSession.selectOne("user.getByIdAndPassword", map);
	}
	
	// 사용자 가져오기
	public UserVo get(Long no) {
		return sqlSession.selectOne("user.getByNo", no);
	}
}
