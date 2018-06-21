/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.service;

import telus.test.voting.entity.User;

/**
 *
 * @author Admin
 */
public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
