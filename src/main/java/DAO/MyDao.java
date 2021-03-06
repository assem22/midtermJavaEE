package DAO;

import Model.Admin;
import Model.Movie;
import Model.Ticket;
import Model.User;

import java.sql.*;
import java.util.ArrayList;

public class MyDao {
    private static final String url = "jdbc:postgresql://localhost:5432/midkaJavaEE";
    private static final String user = "admin";
    private static final String password = "admin";

    public static boolean getAdminAuthenticate(String adminUsername, String adminPassword) {
        ArrayList<Admin> admins = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM admins");
                while(resultSet.next()){

                    int id = resultSet.getInt(1);
                    String username = resultSet.getString(2);
                    String password = resultSet.getString(3);
//                    Admin admin = new Admin(id, username, password);
                    Admin admin = new Admin();
                    admin.setAdminId(id);
                    admin.setAdminUsername(username);
                    admin.setAdminPassword(password);
                    admins.add(admin);
                }
            }
            for (Admin admin: admins){
                if (admin.getAdminUsername().equals(adminUsername)
                        && admin.getAdminPassword().equals(adminPassword)){
                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public static boolean getUserAuthenticate(String username, String userPassword) {
        ArrayList<User> users = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM users");
                while(resultSet.next()){

                    int id = resultSet.getInt(1);
                    String user_username = resultSet.getString(2);
                    String password = resultSet.getString(3);
                    String user_email = resultSet.getString(4);
//                    User user = new User(id, user_username, password, user_email);
                    User user = new User();
                    user.setUser_id(id);
                    user.setUsername(user_username);
                    user.setUser_password(password);
                    user.setEmail(user_email);
                    users.add(user);
                }
            }
            for (User user: users){
                if (user.getEmail().equals(username)
                        && user.getUser_password().equals(userPassword)){
                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public static boolean addNewUser(User newUser) {
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "INSERT INTO users (username, user_password, user_email) Values (?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, newUser.getUsername());
                    preparedStatement.setString(2, newUser.getUser_password());
                    preparedStatement.setString(3, newUser.getEmail());
                    preparedStatement.executeUpdate();

                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }


    public ArrayList<Movie> select() {

        ArrayList<Movie> movies = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM movies");
                while(resultSet.next()){
                    int id = resultSet.getInt(1);
                    String name = resultSet.getString(2);
                    double price = resultSet.getInt(3);
                    int year = resultSet.getInt(4);
//                    Movie movie = new Movie(id, name, price, year);
                    Movie movie = new Movie();
                    movie.setMovieId(id);
                    movie.setMovieName(name);
                    movie.setMoviePrice(price);
                    movie.setMovieYear(year);
                    movies.add(movie);
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return movies;
    }

    public ArrayList<Ticket> ticketList(int user_id) {

        ArrayList<Ticket> tickets = new ArrayList<>();
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                Statement statement = conn.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT * FROM tickets WHERE user_id="+user_id);
                while(resultSet.next()){
                    int id = resultSet.getInt(1);
                    int amount = resultSet.getInt(2);
                    String movieName = resultSet.getString(3);
                    double price = resultSet.getDouble(4);
                    double total = resultSet.getDouble(5);
                    int userId = resultSet.getInt(6);
//                    Ticket ticket = new Ticket(id, amount, movieName, price, total, userId);
                    Ticket ticket = new Ticket();
                    ticket.setTicket_id(id);
                    ticket.setAmount(amount);
                    ticket.setMovie_name(movieName);
                    ticket.setCost(price);
                    ticket.setTotal_cost(total);
                    ticket.setUser_id(userId);
                    tickets.add(ticket);
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return tickets;
    }

    public Movie selectOne(int id) {

        Movie movie = null;
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "SELECT * FROM movies WHERE movie_id=?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){

                        int movId = resultSet.getInt(1);
                        String name = resultSet.getString(2);
                        double price = resultSet.getInt(3);
                        int year = resultSet.getInt(4);
//                        movie = new Movie(movId, name, price, year);
                        movie = new Movie();
                        movie.setMovieId(movId);
                        movie.setMovieName(name);
                        movie.setMoviePrice(price);
                        movie.setMovieYear(year);
                    }
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return movie;
    }

    public boolean insert(Movie movie) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "INSERT INTO movies (movie_name, movie_price, movie_year) Values (?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, movie.getMovieName());
                    preparedStatement.setDouble(2, movie.getMoviePrice());
                    preparedStatement.setInt(3, movie.getMovieYear());
                    preparedStatement.executeUpdate();

                    return true;
//                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean buyTicket(Ticket ticket) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "INSERT INTO tickets (amount, movie_name, ticket_cost, total_cost, user_id)" +
                        " Values (?, ?, ?, ?, ?)";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, ticket.getAmount());
                    preparedStatement.setString(2, ticket.getMovie_name());
                    preparedStatement.setDouble(3, ticket.getCost());
                    preparedStatement.setDouble(4, ticket.getTotal_cost());
                    preparedStatement.setInt(5, ticket.getUser_id());
                    preparedStatement.executeUpdate();

                    return true;
//                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean update(Movie movie) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "UPDATE movies SET movie_name = ?, movie_price = ?, movie_year = ? WHERE movie_id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, movie.getMovieName());
                    preparedStatement.setDouble(2, movie.getMoviePrice());
                    preparedStatement.setInt(3, movie.getMovieYear());
                    preparedStatement.setInt(4, movie.getMovieId());
                    preparedStatement.executeUpdate();

                    return true;
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public boolean delete(int id) {

        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "DELETE FROM movies WHERE movie_id = ?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setInt(1, id);
                    preparedStatement.executeUpdate();
                    return true;
//                    return  preparedStatement.executeUpdate();
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return false;
    }

    public User selectUser(String user_email) {
        User user1 = null;
        try{
            Class.forName("org.postgresql.Driver").getDeclaredConstructor().newInstance();
            try (Connection conn = DriverManager.getConnection(url, user, password)){

                String sql = "SELECT * FROM users WHERE user_email=?";
                try(PreparedStatement preparedStatement = conn.prepareStatement(sql)){
                    preparedStatement.setString(1, user_email);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    if(resultSet.next()){

                        int userId = resultSet.getInt(1);
                        String name = resultSet.getString(2);
                        String user_password = resultSet.getString(3);
                        String userEmail = resultSet.getString(4);
//                        user1 = new User(userId, name, user_password, userEmail);
                        user1 = new User();
                        user1.setUser_id(userId);
                        user1.setUsername(name);
                        user1.setUser_password(user_password);
                        user1.setEmail(userEmail);
                    }
                }
            }
        }
        catch(Exception ex){
            System.out.println(ex);
        }
        return user1;
    }
}
