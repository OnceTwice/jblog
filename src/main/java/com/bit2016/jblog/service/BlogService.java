package com.bit2016.jblog.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.bit2016.jblog.repository.*;

@Service
public class BlogService {

	@Autowired
	private BlogDao blogDao;
	
	
}
