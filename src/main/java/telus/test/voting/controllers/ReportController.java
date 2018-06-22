/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import telus.test.voting.entity.Candidate;
import telus.test.voting.entity.Committee;
import telus.test.voting.entity.SummaryVote;
import telus.test.voting.entity.User;
import telus.test.voting.entity.Vote;
import telus.test.voting.serviceImpl.CandidateServiceImpl;
import telus.test.voting.serviceImpl.CommitteeServiceImpl;
import telus.test.voting.serviceImpl.DepartmentServiceImpl;
import telus.test.voting.serviceImpl.UserServiceImpl;
import telus.test.voting.serviceImpl.VoteServiceImpl;

/**
 *
 * @author elton
 */
@Controller
@RequestMapping("/report")
public class ReportController {

    @Autowired
    private UserServiceImpl userService;
    
    @Autowired
    private DepartmentServiceImpl departmentService;
    
    @Autowired
    private CommitteeServiceImpl committeeService;
    
    @Autowired
    private CandidateServiceImpl candidateService;
    
    @Autowired
    private VoteServiceImpl voteService;
    
    @GetMapping("")
    public String index(Model model,@RequestParam("idDepartment") Optional<Integer> idDepartment) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
        User user = userService.findByUsername(userName);
        List<Committee> committees = new ArrayList<>();
        model.addAttribute("departments", departmentService.findByCountryId(user.getElectorId().getCountryId().getId()));
        if(idDepartment.isPresent()){
            committees = committeeService.findByDepartmentId(idDepartment.get());
        }
        model.addAttribute("committees", committees);
        return "report";
    }

    @GetMapping("/summary")
    public String summary(Model model, @RequestParam("idCommittee") Integer idCommittee) {
        Committee committee = committeeService.findById(idCommittee);
        int total = 0;
        List<SummaryVote> list = candidateService.findElectorVotes(idCommittee);
        model.addAttribute("committee", committee);
        model.addAttribute("candidates", list);
        for (SummaryVote reg : list) {
            total = total + reg.getVotes();
        }
        model.addAttribute("total", total);
        return "summary";
    }

}
