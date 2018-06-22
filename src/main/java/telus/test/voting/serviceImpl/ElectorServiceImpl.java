/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import telus.test.voting.entity.Elector;
import telus.test.voting.entity.SummaryVote;
import telus.test.voting.repository.ElectorRepository;
import telus.test.voting.service.ElectorService;

/**
 *
 * @author Admin
 */
@Service
public class ElectorServiceImpl implements ElectorService {

    @Autowired
    private ElectorRepository electorRepository;

    @Override
    public void save(Elector elector) {
        electorRepository.save(elector);
    }

}
