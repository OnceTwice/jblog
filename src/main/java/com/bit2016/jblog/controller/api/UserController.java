package com.bit2016.jblog.controller.api;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.bit2016.dto.*;
import com.bit2016.jblog.service.*;

@Controller("userAPIController")
@RequestMapping("user/api")
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@ResponseBody
	@RequestMapping("/checkid")
	public JSONResult checkId(@RequestParam(value="id", required=true, defaultValue="") String id) {
		// SingletonClass sc = SingletonClass.getInstance();
		boolean result = userService.idExists(id);
		
		return JSONResult.success(result ? "exist" : "not exist");
	}
}
