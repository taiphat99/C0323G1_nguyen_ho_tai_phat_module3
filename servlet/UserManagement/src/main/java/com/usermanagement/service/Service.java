package com.usermanagement.service;

import com.usermanagement.model.User;
import com.usermanagement.repository.IRepository;
import com.usermanagement.repository.Repository;

import java.util.List;

public class Service implements IService{
    IRepository repository = new Repository();
    @Override
    public List<User> getList() {
        return repository.getList();
    }

    @Override
    public void add(User user) {
        repository.add(user);
    }

    @Override
    public List<User> searchByCountry(String country) {
        return repository.searchByCountry(country);
    }
}
