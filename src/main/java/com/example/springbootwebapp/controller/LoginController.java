package com.example.springbootwebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("name")
public class LoginController {

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginPage(ModelMap map) {
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginMessage(@RequestParam String name, @RequestParam String password, ModelMap map) {
		map.put("name", name);
		if (name.equalsIgnoreCase("Dhinesh") && password.equals("Daylord@1")) {
			return "welcome";
		}
		map.put("errorMessage", "Invalid Credentials");
		return "redirect:/login";
	}

}