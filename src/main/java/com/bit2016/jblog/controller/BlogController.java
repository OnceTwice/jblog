package com.bit2016.jblog.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.bit2016.jblog.service.*;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Autowired
	private BlogService blogService;
	
	@RequestMapping("blog-main")
	public String blogMain() {
		return "/blog/blog-main";
	}
}
