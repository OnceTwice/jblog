package com.bit2016.jblog.repository;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;

public class CategoryDao {

	@Autowired
	private SqlSession sqlSession;
	
	public void insert(Long vo) {
		sqlSession.insert("category.insert", vo);
	}

}
