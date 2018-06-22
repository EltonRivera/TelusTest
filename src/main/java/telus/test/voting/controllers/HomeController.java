/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
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
        String counter = "0";
        BufferedReader input; 
        try {
            String fileName = "visitorCounter.txt";
            input = new BufferedReader(new FileReader(fileName));
            String last = "", line;
            while ((line = input.readLine()) != null) {
                last = line;
            }
            if (!last.isEmpty()) {
                String fecha = last.split("\\|")[0];
                String dateFormat = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
                if (fecha.equals(dateFormat)) {
                    counter = last.split("\\|")[1];
                }
            }
        }   catch (FileNotFoundException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(HomeController.class.getName()).log(Level.SEVERE, null, ex);
        }
        model.addAttribute("elector", user.getElectorId());
        model.addAttribute("counter", counter);
        return "home";
    }

}
