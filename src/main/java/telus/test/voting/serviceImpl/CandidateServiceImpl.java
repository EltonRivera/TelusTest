/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.serviceImpl;

import java.math.BigInteger;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import telus.test.voting.entity.Candidate;
import telus.test.voting.entity.SummaryVote;
import telus.test.voting.repository.CandidateRepository;
import telus.test.voting.service.CandidateService;

/**
 *
 * @author Admin
 */
@Service
public class CandidateServiceImpl implements CandidateService {

    @Autowired
    private CandidateRepository candidateRepository;

    @Override
    public List<Candidate> findByCommitteeId(Integer id) {
        return candidateRepository.findByCommitteeId(id);
    }

    @Override
    public Candidate findById(Integer id) {
        return candidateRepository.findById(id);
    }

    @Override
    public List<SummaryVote> findElectorVotes(int committee) {
        List<SummaryVote> list = new ArrayList<>();
        Object[][] data = candidateRepository.findElectorVotes(committee);
      for (Object[] reg : data) {
          SummaryVote summaryVote = new SummaryVote();
          summaryVote.setName((String) reg[0]);
          summaryVote.setSurnames((String) reg[1]);
          summaryVote.setVotes(((BigInteger) reg[2]).intValue());
          list.add(summaryVote);
      }
        return list;
    }


    

}
