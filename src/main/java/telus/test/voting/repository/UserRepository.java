/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.repository;

import java.io.Serializable;
import org.springframework.data.repository.CrudRepository;
import telus.test.voting.entity.User;

/**
 *
 * @author Admin
 */
public interface UserRepository extends CrudRepository<User, Serializable> {

    public User findByUserAndPassword(String user, String password);

    public User findByUser(String user);
}
