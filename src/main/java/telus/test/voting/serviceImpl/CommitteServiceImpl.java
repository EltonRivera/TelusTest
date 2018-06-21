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
import telus.test.voting.repository.CommitteRepository;
import telus.test.voting.service.CommitteService;

/**
 *
 * @author Admin
 */
@Service
public class CommitteServiceImpl implements CommitteService {

    @Autowired
    private CommitteRepository committeRepository;

    @Override
    public List<Committee> findByDepartmentId(Integer id) {
        return committeRepository.findByDepartmentId(id);
    }

    

}
