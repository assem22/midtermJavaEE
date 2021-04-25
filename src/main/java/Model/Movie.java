package Model;

import java.io.Serializable;

public class Movie implements Serializable {
    private int movieId;

    private String movieName;

    private double moviePrice;

    private int movieYear;

    public Movie(){
    }

//    public Movie(int movieId, String movieName, double moviePrice, int movieYear) {
//        this.movieId = movieId;
//        this.movieName = movieName;
//        this.moviePrice = moviePrice;
//        this.movieYear = movieYear;
//    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public double getMoviePrice() {
        return moviePrice;
    }

    public void setMoviePrice(double moviePrice) {
        this.moviePrice = moviePrice;
    }

    public int getMovieYear() {
        return movieYear;
    }

    public void setMovieYear(int movieYear) {
        this.movieYear = movieYear;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "movieId=" + movieId +
                ", movieName='" + movieName + '\'' +
                ", moviePrice='" + moviePrice + '\'' +
                ", movieYear=" + movieYear +
                '}';
    }
}
