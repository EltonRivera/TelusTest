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
import telus.test.voting.entity.Country;
import telus.test.voting.entity.Department;

/**
 *
 * @author Admin
 */
public interface DepartmentRepository extends JpaRepository<Department, Serializable> {
    @Query("SELECT d FROM Department AS d INNER JOIN d.areaId AS a WHERE a.countryId.id = ?1") 
    public abstract List<Department> findByCountryId(Integer id);
}
