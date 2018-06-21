/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.repository;

import java.io.Serializable;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import telus.test.voting.entity.Country;
import telus.test.voting.entity.User;

/**
 *
 * @author Admin
 */
public interface CountryRepository extends JpaRepository<Country, Serializable> {

    public abstract Country findById(Integer id);
}
