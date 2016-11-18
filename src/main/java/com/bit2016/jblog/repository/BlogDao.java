package com.bit2016.jblog.repository;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class BlogDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void insert(Long vo) {
		sqlSession.insert("blog.insert", vo);
	}
}
