/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import telus.test.voting.entity.User;
import telus.test.voting.serviceImpl.UserServiceImpl;

/**
 *
 * @author elton
 */
@Controller
@RequestMapping("/")
public class HomeController {

    @Autowired
    private UserServiceImpl userService;
    
    @GetMapping("")
    public String index(Model model) {
        return "index";
    }

    @GetMapping("/home")
    public String home(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
        User user = userService.findByUsername(userName);
        model.addAttribute("elector", user.getElectorId());
        return "home";
    }

}
