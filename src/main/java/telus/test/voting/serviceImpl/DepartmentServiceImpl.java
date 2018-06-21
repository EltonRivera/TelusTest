/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import telus.test.voting.entity.Department;
import telus.test.voting.repository.DepartmentRepository;
import telus.test.voting.service.DepartmentService;

/**
 *
 * @author Admin
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {

    @Autowired
    private DepartmentRepository departmentRepository;

    @Override
    public List<Department> findByCountryId(Integer id) {
        return departmentRepository.findByCountryId(id);
    }


}
