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
@RequestMapping("/vote")
public class VoteController {

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
            System.out.println("val"+idDepartment.get());
            committees = committeeService.findByDepartmentId(idDepartment.get());
        }
        model.addAttribute("committees", committees);
        return "vote";
    }

    @GetMapping("/committee")
    public String committee(Model model, @RequestParam("idCommittee") Integer idCommittee) {
        Committee committee = committeeService.findById(idCommittee);
        model.addAttribute("committee", committee);
        model.addAttribute("candidates", candidateService.findByCommitteeId(idCommittee));
        return "vote-committe";
    }
    
    @RequestMapping(value = "/vote", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String vote(Model model, @RequestParam("idCandidate") Integer idCandidate) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
        User user = userService.findByUsername(userName);
        String status = "OK";
        String message = "";
        boolean valid = true;
        Candidate candidate = candidateService.findById(idCandidate);
        Optional<Vote> vote = voteService.findVoteByIdElectorAndCommittee(user.getElectorId().getId(), candidate.getCommitteeId().getId());
        
        if (vote.isPresent()) {
            valid = false;
            message = "You already vote for a candidate in this committee";
            status = "WARNING";
        }else{
            Vote newVote = new Vote();
            newVote.setCandidateId(candidate);
            newVote.setElectorId(user.getElectorId());
            newVote.setDate(new Date());
            voteService.save(newVote);
        }
        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("message", message);
        jsonResponse.put("status", status);
        return jsonResponse.toJSONString();
    }

}
