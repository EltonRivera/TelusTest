/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.repository;

import java.io.Serializable;
import org.springframework.data.jpa.repository.JpaRepository;
import telus.test.voting.entity.Elector;

/**
 *
 * @author Admin
 */
public interface ElectorRepository extends JpaRepository<Elector, Serializable> {

}
