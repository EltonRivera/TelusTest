/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.service;

import java.util.List;
import java.util.Optional;
import telus.test.voting.entity.Vote;

/**
 *
 * @author Admin
 */
public interface VoteService {

    void save(Vote vote);

    Optional<Vote> findVoteByIdElectorAndCommittee(int idElector, int idCommittee);
    
    List<Vote> findAll();
}
