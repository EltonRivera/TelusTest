/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import telus.test.voting.entity.Country;
import telus.test.voting.entity.User;
import telus.test.voting.repository.CountryRepository;
import telus.test.voting.service.UserService;
import telus.test.voting.repository.UserRepository;
import telus.test.voting.service.CountryService;
import java.util.List;

/**
 *
 * @author Admin
 */
@Service
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryRepository countryRepository;

    @Override
    public List<Country> findAll() {
        return this.countryRepository.findAll();
    }

    @Override
    public Country findById(Integer id) {
        return this.countryRepository.findById(id);
    }

    @Override
    public void save(Country user) {
        countryRepository.save(user);
    }

}
