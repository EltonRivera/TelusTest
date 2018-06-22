/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.repository;

import java.io.Serializable;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import telus.test.voting.entity.Vote;

/**
 *
 * @author Admin
 */
public interface VoteRepository extends JpaRepository<Vote, Serializable> {
    
    @Query(value = "SELECT v.* FROM Vote AS v "
            + " INNER JOIN Candidate AS c ON c.id = v.candidate_id"
            + " INNER JOIN Committee AS co ON co.id = c.committee_id"
            + " WHERE v.elector_id = :elector and co.id = :committee", nativeQuery = true)
    public abstract Optional<Vote> findVoteByIdElectorAndCommittee(@Param("elector") int elector, @Param("committee") int committee);
}
