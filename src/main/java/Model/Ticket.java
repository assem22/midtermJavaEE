package Model;

import java.io.Serializable;

public class Ticket implements Serializable {
    private int ticket_id;
    private int amount;
    private String movie_name;
    private double cost;
    private double total_cost;
    private int user_id;

    public Ticket(){}

//    public Ticket(int ticket_id, int amount, String movie_name, double cost, double total_cost, int user_id) {
//        this.ticket_id = ticket_id;
//        this.amount = amount;
//        this.movie_name = movie_name;
//        this.cost = cost;
//        this.total_cost = total_cost;
//        this.user_id = user_id;
//    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getTicket_id() {
        return ticket_id;
    }

    public void setTicket_id(int ticket_id) {
        this.ticket_id = ticket_id;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getMovie_name() {
        return movie_name;
    }

    public void setMovie_name(String movie_name) {
        this.movie_name = movie_name;
    }

    public double getCost() {
        return cost;
    }

    public void setCost(double cost) {
        this.cost = cost;
    }

    public double getTotal_cost() {
        return total_cost;
    }

    public void setTotal_cost(double total_cost) {
        this.total_cost = total_cost;
    }

    @Override
    public String toString() {
        return "Ticket{" +
                "ticket_id=" + ticket_id +
                ", amount=" + amount +
                ", movie_name='" + movie_name + '\'' +
                ", cost=" + cost +
                ", total_cost=" + total_cost +
                ", user_id=" + user_id +
                '}';
    }
}
