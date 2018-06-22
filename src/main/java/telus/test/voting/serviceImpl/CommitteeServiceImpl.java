/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
import telus.test.voting.entity.Committee;
import telus.test.voting.repository.CommitteeRepository;
import telus.test.voting.service.CommitteeService;

/**
 *
 * @author Admin
 */
@Service
public class CommitteeServiceImpl implements CommitteeService {

    @Autowired
    private CommitteeRepository committeRepository;

    @Override
    public List<Committee> findByDepartmentId(Integer id) {
        return committeRepository.findByDepartmentId(id);
    }

    @Override
    public Committee findById(Integer id) {
        return committeRepository.findById(id);
    }

    

}
