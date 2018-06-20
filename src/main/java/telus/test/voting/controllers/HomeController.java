/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author elton
 */
@Controller
@RequestMapping("/")
public class HomeController {
    
    @GetMapping("")
    public String index(Model model, @RequestParam(name = "id", required = false) Integer id) {
        return "index";
    }
    
    @GetMapping("/home")
    public String home(Model model, @RequestParam(name = "id", required = false) Integer id) {
        model.addAttribute("test", "test");
        return "home";

    }

}
