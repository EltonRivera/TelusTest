/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.service;

import java.util.List;
import telus.test.voting.entity.Candidate;
import telus.test.voting.entity.SummaryVote;

/**
 *
 * @author Admin
 */
public interface CandidateService {

    List<Candidate> findByCommitteeId(Integer id);
    List<SummaryVote> findElectorVotes(int committee);
    Candidate findById(Integer id);
}
