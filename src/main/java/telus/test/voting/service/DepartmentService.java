/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.service;

import java.util.List;
import telus.test.voting.entity.Department;

/**
 *
 * @author Admin
 */
public interface DepartmentService {

    List<Department> findByCountryId(Integer id);


}
