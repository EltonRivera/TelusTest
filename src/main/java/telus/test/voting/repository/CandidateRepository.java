/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.repository;

import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import telus.test.voting.entity.Candidate;
import telus.test.voting.entity.SummaryVote;

/**
 *
 * @author Admin
 */
public interface CandidateRepository extends JpaRepository<Candidate, Serializable> {

    @Query("SELECT c FROM Candidate AS c WHERE c.committeeId.id = ?1")
    public abstract List<Candidate> findByCommitteeId(Integer id);
    
    @Query(value = "SELECT c.name as name, c.surname as surnames, COUNT(DISTINCT v.elector_id) AS votes FROM Candidate c"
            + " INNER JOIN Committee co ON c.committee_id = co.id"
            + " LEFT JOIN Vote v ON v.candidate_id = c.id"
            + " WHERE co.id = :committee"
            + " GROUP BY c.id", nativeQuery = true)
  public abstract Object[][] findElectorVotes(@Param("committee") int committee);
    
    public abstract Candidate findById(Integer id);
}
