package com.java.todoapp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.java.todoapp.model.LoginBean;
import com.java.todoapp.utils.JDBCUtils;

public class LoginDao {

    private static final String LOGIN_SQL =
            "SELECT * FROM user WHERE username = ? AND password = ?";

    public boolean validate(LoginBean loginBean) {

        boolean status = false;

        try (Connection connection = JDBCUtils.getConnection();
             PreparedStatement preparedStatement =
                     connection.prepareStatement(LOGIN_SQL)) {

            preparedStatement.setString(1, loginBean.getUsername());
            preparedStatement.setString(2, loginBean.getPassword());

            System.out.println(preparedStatement);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                status = rs.next();
            }

        } catch (SQLException e) {
            JDBCUtils.printSQLException(e);
        }

        return status;
    }
}