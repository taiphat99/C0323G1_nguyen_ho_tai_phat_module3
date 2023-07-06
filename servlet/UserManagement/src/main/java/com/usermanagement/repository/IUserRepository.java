package com.usermanagement.repository;

import com.usermanagement.model.User;

import java.util.List;

public interface IUserRepository {
    List<User> getList();
    void add(User user);
    List<User> searchByCountry(String country);
    List<User> getSortList();
    User findById(int id);
    void delete(int id);
    void update(User user);
    List<User> searchByName(String name);
}
