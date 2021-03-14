package UserController;

import DAO.MyDao;
import Model.Movie;
import Model.Ticket;
import Model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/BuyTicketServlet")
public class BuyTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Ticket ticket = new Ticket();
        boolean status = false;
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");

        User user = new User();
        Movie movie = new Movie();
        movie = (Movie) request.getSession().getAttribute("movie");

        String amount = request.getParameter("amount");
        String user_email = request.getParameter("user_email");

        if(movie.getMovieId() != 0  && user_email != null && !(user_email.equals(""))){
            try {
                movie = new MyDao().selectOne(movie.getMovieId());
                user = new MyDao().selectUser(user_email);
                request.getSession().setAttribute("user_session", user);
            } catch (Exception e) {
                request.getSession().setAttribute("exception",e.getMessage());
            }
        }else{
            request.getSession().setAttribute("message", "Error !!!! Please select one Category!!!!!!");
            response.sendRedirect("user/Menu.jsp");
        }

        HttpSession userSession = request.getSession(false);

        if(amount != null && user.getUser_id() != 0
                && movie.getMovieName() != null && movie.getMoviePrice() != 0){
            ticket.setMovie_name(movie.getMovieName());
            ticket.setCost(movie.getMoviePrice());
            ticket.setAmount(Integer.parseInt(amount));
            ticket.setTotal_cost(Double.parseDouble(String.valueOf(movie.getMoviePrice()*Integer.parseInt(amount))));
            ticket.setUser_id(user.getUser_id());
            try {
                status = new MyDao().buyTicket(ticket);
            } catch (Exception e) {
                userSession.setAttribute("exception",e);
                e.printStackTrace();
            }
            if(status){
                String path = "/TicketsServlet";
                ServletContext servletContext = getServletContext();
                RequestDispatcher requestDispatcher = servletContext.getRequestDispatcher(path);
                requestDispatcher.forward(request, response);
                out.println("<script>alert('You Have Succesfully Added new Movie !!!')</script>");
                userSession.setAttribute("message","You Have Succesfully Added new Movie !!!" );
//                response.sendRedirect("user/MyTickets.jsp");
            }else{
                out.println("<script>alert('Error !!! You Have Added duplicate Movie  !!!')</script>");
                userSession.setAttribute("message","Error !!! You Have Added duplicate Movie !!!" );
                response.sendRedirect("user/Menu.jsp");
            }
        }else{
            out.println("<script>alert('Write Movie Details Again !!!')</script>");
            response.sendRedirect("Login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String movieId = request.getParameter("movieId");
        Movie movie = new Movie();

        if(movieId != null && !(movieId.equals(""))){
            try {
                movie = new MyDao().selectOne(Integer.parseInt(movieId));
            } catch (Exception e) {
                request.getSession().setAttribute("exception",e.getMessage());
            }
            request.getSession().setAttribute("movie", movie);
            response.sendRedirect("user/Order.jsp");
        }else{
            request.getSession().setAttribute("message", "Error !!!! Please select one Category!!!!!!");
            response.sendRedirect("user/Menu.jsp");
        }

    }
}
