/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.repository;

import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import telus.test.voting.entity.Committee;

/**
 *
 * @author Admin
 */
public interface CommitteRepository extends JpaRepository<Committee, Serializable> {

    public abstract List<Committee> findByDepartmentId(Integer id);
}
