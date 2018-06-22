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
import telus.test.voting.entity.Committee;

/**
 *
 * @author Admin
 */
public interface CommitteeRepository extends JpaRepository<Committee, Serializable> {

    @Query("SELECT c FROM Committee AS c WHERE c.departmentId.id = ?1")
    public abstract List<Committee> findByDepartmentId(Integer id);
    
    public abstract Committee findById(Integer id);
}
