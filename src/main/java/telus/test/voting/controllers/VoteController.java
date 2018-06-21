/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import telus.test.voting.entity.Committee;
import telus.test.voting.entity.User;
import telus.test.voting.serviceImpl.CommitteServiceImpl;
import telus.test.voting.serviceImpl.DepartmentServiceImpl;
import telus.test.voting.serviceImpl.UserServiceImpl;

/**
 *
 * @author elton
 */
@Controller
@RequestMapping("/vote")
public class VoteController {

    @Autowired
    private UserServiceImpl userService;
    
    @Autowired
    private DepartmentServiceImpl departmentService;
    
    @Autowired
    private CommitteServiceImpl committeService;
    
    @GetMapping("")
    public String index(Model model,@PathVariable("id") Optional<Integer> idDepartment) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
        User user = userService.findByUsername(userName);
        List<Committee> commitees = new ArrayList<>();
        model.addAttribute("departments", departmentService.findByCountryId(user.getElectorId().getCountryId().getId()));
        if(idDepartment.isPresent()){
            commitees = committeService.findByDepartmentId(idDepartment.get());
        }
        model.addAttribute("committes", commitees);
        return "vote";
    }

    @GetMapping("/vote")
    public String vote(Model model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
        User user = userService.findByUsername(userName);
        model.addAttribute("elector", user.getElectorId());
        return "home";
    }

}
