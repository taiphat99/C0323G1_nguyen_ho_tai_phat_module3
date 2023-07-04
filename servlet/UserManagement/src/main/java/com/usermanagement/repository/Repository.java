package com.usermanagement.repository;

import com.usermanagement.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Repository implements IRepository {
    public static final String SELECT = "SELECT * FROM user_management.user";
    public static final String INSERT = "INSERT INTO user(name,email,country)" + "values(?,?,?)";
    public static final String SEARCH_BY_COUNTRY_SELECT = "SELECT * FROM user_management.user WHERE country like ?";

    @Override
    public List<User> getList() {
        List<User> userList = new ArrayList<>();
        Connection connection = BaseRepository.getConnection();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                userList.add(new User(id, name, email, country));
            }
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return userList;
    }

    @Override
    public void add(User user) {
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getCountry());
            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> searchByCountry(String country) {
        List<User> countryList = new ArrayList<>();
        String str = "%" + country + "%";
        Connection connection = BaseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_BY_COUNTRY_SELECT);
            preparedStatement.setString(1,str);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country_column = resultSet.getString("country");
                countryList.add(new User(id, name, email, country_column));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return countryList;
    }


}
