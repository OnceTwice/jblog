package com.bit2016.jblog.controller;

import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class MainController {
	
	@RequestMapping("")
	public String index() {
		return "main/index";
	}

	@ResponseBody
	@RequestMapping("/hello")
	public String hello() {
		return "안녕 jRevel";
	}
}
