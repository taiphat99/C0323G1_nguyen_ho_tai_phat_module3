package com.usermanagement.service;

import com.usermanagement.model.User;

import java.util.List;

public interface IService {
    List<User> getList();
    void add(User user);
    List<User> searchByCountry(String country);
    List<User> getSortList();


}
