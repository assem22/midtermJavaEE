package UserController;

import DAO.MyDao;
import Model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/TicketsServlet")
public class TicketsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyDao movieDao = new MyDao();
        User user = (User) request.getSession().getAttribute("user_session");
        List<?> tickets = null;
        if (user.getUser_id() != 0) {
            try {
                tickets = movieDao.ticketList(user.getUser_id());
            } catch (Exception e) {
                request.getSession().setAttribute("exception", e.getMessage());
            }
            request.getSession().setAttribute("tickets", tickets);
            response.sendRedirect("user/MyTickets.jsp");
        }
    }
}
