package UserController;

import DAO.MyDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TicketsServlet")
public class TicketsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MyDao movieDao = new MyDao();
        List<?> tickets = null;
        try {
            tickets = movieDao.select();
        } catch (Exception e) {
            request.getSession().setAttribute("exception",e.getMessage());
        }
        request.getSession().setAttribute("tickets",tickets);
        response.sendRedirect("user/Menu.jsp");
    }
}
