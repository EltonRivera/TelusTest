/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.serviceImpl;

import java.util.List;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import telus.test.voting.entity.SummaryVote;
import telus.test.voting.entity.User;
import telus.test.voting.entity.Vote;
import telus.test.voting.repository.VoteRepository;
import telus.test.voting.service.VoteService;

/**
 *
 * @author Admin
 */
@Service
public class VoteServiceImpl implements VoteService {

    @Autowired
    private VoteRepository voteRepository;

    @Override
    public void save(Vote vote) {
       
        voteRepository.save(vote);
    }

    @Override
    public Optional<Vote> findVoteByIdElectorAndCommittee(int idElector, int idCommittee) {
        return voteRepository.findVoteByIdElectorAndCommittee(idElector, idCommittee);
    }

    @Override
    public List<Vote> findAll() {
        return voteRepository.findAll();
    }
}
