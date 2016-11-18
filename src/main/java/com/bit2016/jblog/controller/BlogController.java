package com.bit2016.jblog.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@RequestMapping("")
	public String blogMain() {
		return "/blog/blog-main";
	}
	
	@RequestMapping("blog-admin-basic")
	public String blogAdmin() {
		return "/blog/blog-admin-basic";
	}
	
	@RequestMapping("blog-admin-category")
	public String blogCategory() {
		return "/blog/blog-admin-category";
	}
	
	@RequestMapping("blog-admin-write")
	public String blogWrite() {
		return "/blog/blog-admin-write";
	}
}
