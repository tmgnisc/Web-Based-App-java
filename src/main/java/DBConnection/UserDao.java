package DBConnection;

import Model.AppMessage;
import Model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import static DBConnection.DBConnection.connect;

public class UserDao {
    private static final String INSERT_USERS_SQL = "INSERT INTO users (name, email, address, department, password) VALUES (?, ?, ?, ?, ?)";
    private static final String SELECT_USERS_BY_ID = "select id, name, email, address, department, password from users where id =?";
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String SELECT_USER_BY_EMAIL = "select * from users where email = ?";
    private static final String DELETE_USERS_SQL = "delete from users where id = ?;";
    private static final String Update_USERS_SQL = "update users set name = ?, address =?, department =?, password =? where id = ?;";


    //create or insert user
    public AppMessage insertUser(User user) {
        System.out.println("preparing to save user, " + user);
        User fetchedUser = findUserByEmail(user.getEmail());
        if (fetchedUser != null) {
            return new AppMessage(false, "User already exists by email: " + user.getEmail());
        }

        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USERS_SQL)) {
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getAddress());
            preparedStatement.setString(4, user.getDepartment());
            preparedStatement.setString(5, user.getPassword());
            preparedStatement.execute();

            return new AppMessage(true, "User inserted successfully");
        } catch (Exception e) {
            return new AppMessage(false, e.getMessage());
        }
    }

    public User findUserByEmail(String email) {
        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_EMAIL)) {
            preparedStatement.setString(1, email);

            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()){
                return null;
            }

            return new User(resultSet.getString("name"),
                    resultSet.getString("email"),
                    resultSet.getString("address"),
                    resultSet.getString("department"));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return null;
    }

    //update user
    public AppMessage updateUser(User user) {
        try (Connection connection = connect();
             PreparedStatement statement = connection.prepareStatement(Update_USERS_SQL);) {
            statement.setString(1, user.getName());
            statement.setString(2, user.getAddress());
            statement.setString(3, user.getDepartment());
            statement.setString(4, user.getPassword());
            statement.setInt(5, user.getId());

            if (statement.executeUpdate() > 0) {
                return new AppMessage(true, "user updated successfully");
            }

            return new AppMessage(false, "cannot update user");
        } catch (SQLException e) {
            return new AppMessage(false, e.getMessage());
        }
    }
    public int getNoOfRecords() {
        int count = 0;
        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT COUNT(*) FROM users");) {
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    // select user by id
    public User selectUser(int id) {
        User user = null;
        //step 1: Establishing a connection
        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USERS_BY_ID);) {
            preparedStatement.setInt(1, id);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String department = rs.getString("department");
                String password = rs.getString("password");
                user = new User(id, name, email, address, department, password);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    //select users

    public List<User> selectALlUsers(int i, int recordsPerPage) {
        List<User> users = new ArrayList<>();
        try (Connection connection = connect();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String address = rs.getString("address");
                String department = rs.getString("department");
                String password = rs.getString("password");
                User user = new User(id, name, email, address, department, password);
                users.add(user);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return users;
    }

    //delete user
    public boolean deleteUser(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = connect();
             PreparedStatement statement = connection.prepareStatement(DELETE_USERS_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
}
