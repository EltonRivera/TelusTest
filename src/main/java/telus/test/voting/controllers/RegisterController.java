/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package telus.test.voting.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import telus.test.voting.entity.Elector;
import telus.test.voting.entity.User;
import telus.test.voting.serviceImpl.CountryServiceImpl;
import telus.test.voting.serviceImpl.ElectorServiceImpl;
import telus.test.voting.serviceImpl.UserServiceImpl;
import net.minidev.json.JSONObject;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author elton
 */
@Controller
@RequestMapping("/register")
public class RegisterController {

    @Autowired
    private CountryServiceImpl countryService;
    @Autowired
    private ElectorServiceImpl electorService;
    @Autowired
    private UserServiceImpl userService;

    @GetMapping("")
    public String index(Model model) {
        model.addAttribute("countries", countryService.findAll());
        return "register";
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = "application/json")
    @ResponseBody
    public String save(Model model,
            @RequestParam() String user,
            @RequestParam() String password,
            @RequestParam() String password2,
            @RequestParam() String name,
            @RequestParam() String surnames,
            @RequestParam() String email,
            @RequestParam() String idDocument,
            @RequestParam() Integer countryId) {
        String status = "OK";
        String message = "";
        boolean valid = true;
        if (!password.equals(password2)) {
            valid = false;
            message = "The confirm password don't match";
        }
        if (valid) {
            Elector elector = new Elector();
            elector.setCountryId(countryService.findById(countryId));
            elector.setEmail(email);
            elector.setIdDocument(idDocument);
            elector.setName(name);
            elector.setSurnames(surnames);
            electorService.save(elector);
            User userEntity = new User();
            userEntity.setElectorId(elector);
            userEntity.setUser(user);
            userEntity.setPassword(password);
            userService.save(userEntity);
        }else{
            status = "WARNING";
        }

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("message", message);
        jsonResponse.put("status", status);

        return jsonResponse.toJSONString();
    }

}
