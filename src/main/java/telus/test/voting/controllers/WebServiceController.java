/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import com.google.gson.Gson;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import telus.test.voting.entity.Department;
import telus.test.voting.entity.Vote;
import telus.test.voting.entity.VotingData;
import telus.test.voting.serviceImpl.VoteServiceImpl;

/**
 *
 * @author elton
 */
@RestController
@RequestMapping("/webservice")
public class WebServiceController {

    @Autowired
    private VoteServiceImpl voteService;
    
    @RequestMapping(value="/votingdata", method = RequestMethod.GET)
    public ResponseEntity <List<VotingData>> getVotingData() throws IOException{
        List<Vote> voteList = voteService.findAll();
        List<VotingData> data = new ArrayList<>();
        Gson gson = new Gson();
        for (int i = 0; i < voteList.size(); i++) {
            Vote vote = voteList.get(i);
            VotingData votingData = new VotingData();
            votingData.setName(vote.getCandidateId().getName());
            votingData.setSurnames(vote.getCandidateId().getSurname());
            votingData.setComitteeName(vote.getCandidateId().getCommitteeId().getName());
            Department department = vote.getCandidateId().getCommitteeId().getDepartmentId();
            votingData.setCountry(department.getAreaId().getCountryId().getName());
            votingData.setVoteDate(vote.getDate().toString());
            votingData.setDepartment(department.getName());
            votingData.setEmail(vote.getElectorId().getEmail());
            votingData.setIdDocument(vote.getElectorId().getIdDocument());
            data.add(votingData);
        }
        FileWriter fileWriter = new FileWriter("servicexxx.txt");
        PrintWriter printWriter = new PrintWriter(fileWriter);
        printWriter.print(gson.toJson(data));
        printWriter.close();
        return new ResponseEntity<>(data, HttpStatus.OK);
    }

}
