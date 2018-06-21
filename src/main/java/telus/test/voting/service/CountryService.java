/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.service;

import java.util.List;
import telus.test.voting.entity.Country;

/**
 *
 * @author Admin
 */
public interface CountryService {

    List<Country> findAll();

    Country findById(Integer id);

    void save(Country user);
}
