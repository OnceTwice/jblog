package com.bit2016.jblog.controller;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.bit2016.jblog.service.*;
import com.bit2016.jblog.vo.*;

@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping("/joinform")
	public String joinForm() {
		return "user/join";
	}
	
	@RequestMapping("/join")
	public String joinForm(@ModelAttribute UserVo vo) {
		userService.join(vo);
		return "redirect:/user/joinsuccess";
	}
	
	@RequestMapping("/loginform")
	public String loginForm() {
		System.out.println("안녕안녕");
		return "user/login";
	}

	@RequestMapping("/joinsuccess")
	public String joinSuccess() {
		return "user/joinsuccess";
	}
	
	/*
	@RequestMapping("/login")
	public String login(HttpSession session, 
						@RequestParam(value="id", required=true, defaultValue="") String id,
						@RequestParam(value="password", required=true, defaultValue="") String password) {
		
		UserVo userVo = userService.login(id, password);
		if(userVo == null) {
			return "redirect:/";
		}

		// 인증 처리
		session.setAttribute("authUser", userVo);
		System.out.println("user컨트롤러 인증처리 후 " + userVo);
		
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("authUser");
		session.invalidate();
		System.out.println("로그아웃되었습니다.");
		return "redirect:/";
	}
	*/
}
