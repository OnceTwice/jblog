package com.bit2016.jblog.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;

import com.bit2016.jblog.service.*;
import com.bit2016.jblog.vo.*;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/join")
	public String joinForm(@ModelAttribute UserVo vo, BindingResult result) {
		if(result.hasErrors()) {
			return "/user/join"; 
		}
		userService.join(vo);
		
		return "redirect:/user/joinsuccess";
	}
	
	@RequestMapping("login")
	public String loginForm() {
		return "/user/login";
	}
	
	@RequestMapping("/joinsuccess")
	public String joinSuccess() {
		return "/user/joinsuccess";
	}
}
