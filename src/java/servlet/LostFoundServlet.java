package servlet;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.MultipartConfig;
import dao.LostItemDAO;
import dao.FoundItemDAO;
import dao.UserDAO;
import model.LostItem;
import model.FoundItem;
import model.User;

@WebServlet(urlPatterns = {
    "/lost/*",
    "/found/*",
    "/count/*",
    "/report/*"
})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 1,  // 1 MB
    maxFileSize = 1024 * 1024 * 10,       // 10 MB
    maxRequestSize = 1024 * 1024 * 100    // 100 MB
)
public class LostFoundServlet extends HttpServlet {

    private LostItemDAO lostItemDao;
    private FoundItemDAO foundItemDao;
    private UserDAO userDao;

    @Override
    public void init() throws ServletException {
        lostItemDao = new LostItemDAO();
        foundItemDao = new FoundItemDAO();
        userDao = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI().substring(request.getContextPath().length());

        try {
            if (path.startsWith("/lost/")) {
                handleLostRoutes(path, request, response);
            } else if (path.startsWith("/found/")) {
                handleFoundRoutes(path, request, response);
            } else if (path.startsWith("/count/")) {
                handleCountRoutes(path, request, response);
            } else if (path.startsWith("/report/")) {
                handleReportRoutes(path, request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getRequestURI().substring(request.getContextPath().length());

        try {
            if (path.startsWith("/lost/")) {
                handleLostRoutes(path, request, response);
            } else if (path.startsWith("/found/")) {
                handleFoundRoutes(path, request, response);
            } else if (path.startsWith("/count/")) {
                handleCountRoutes(path, request, response);
            } else if (path.startsWith("/report/")) {
                handleReportRoutes(path, request, response);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        } catch (Exception ex) {
            throw new ServletException(ex);
        }
    }

    private void handleLostRoutes(String path, HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        switch (path) {
            case "/lost/list":
                listLostItems(request, response);
                break;
            case "/lost/add":
                addLostItem(request, response);
                break;
            case "/lost/new":
                showLostItemForm(request, response);
                break;
            case "/lost/delete":
                deleteLostItem(request, response);
                break;
            case "/lost/edit":
                showEditLostItemForm(request, response);
                break;
            case "/lost/update":
                updateLostItem(request, response);
                break;
            case "/lost/details":
                showLostItemDetails(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleFoundRoutes(String path, HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        switch (path) {
            case "/found/list":
                listFoundItems(request, response);
                break;
            case "/found/add":
                addFoundItem(request, response);
                break;
            case "/found/new":
                showFoundItemForm(request, response);
                break;
            case "/found/delete":
                deleteFoundItem(request, response);
                break;
            case "/found/edit":
                showEditFoundItemForm(request, response);
                break;
            case "/found/update":
                updateFoundItem(request, response);
                break;
            case "/found/details":
                showFoundItemDetails(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleReportRoutes(String path, HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        switch (path) {
            case "/report/lost":
                listLostItemsUsers(request, response);
                break;
            case "/report/found":
                listFoundItemsUsers(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void handleCountRoutes(String path, HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        switch (path) {
            case "/count/users":
                countUsers(request, response);
                break;
            case "/count/lost":
                countLostItems(request, response);
                break;
            case "/count/found":
                countFoundItems(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void listLostItems(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<LostItem> lostItems = lostItemDao.selectAllLostItems();
        request.setAttribute("lostItems", lostItems);
        request.getRequestDispatcher("/WEB-INF/views/lost/list.jsp").forward(request, response);
    }

    private void listLostItemsUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<LostItem> lostItems = lostItemDao.selectAllLostItems();
        request.setAttribute("lostItems", lostItems);
        request.getRequestDispatcher("/WEB-INF/views/report_lost/list.jsp").forward(request, response);
    }

    private void listFoundItems(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<FoundItem> foundItems = foundItemDao.selectAllFoundItems();
        request.setAttribute("foundItems", foundItems);
        request.getRequestDispatcher("/WEB-INF/views/found/list.jsp").forward(request, response);
    }

    private void listFoundItemsUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        List<FoundItem> foundItems = foundItemDao.selectAllFoundItems();
        request.setAttribute("foundItems", foundItems);
        request.getRequestDispatcher("/WEB-INF/views/report_found/list.jsp").forward(request, response);
    }

    private void countUsers(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int userCount = userDao.selectUserCount();
        request.setAttribute("userCount", userCount);
        response.getWriter().write("Total Users: " + userCount);
    }

    private void countLostItems(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, IOException {
        int lostItemCount = lostItemDao.selectLostItemCount();
        request.setAttribute("lostItemCount", lostItemCount);
        response.getWriter().write("Total Lost Items: " + lostItemCount);
    }

    private void countFoundItems(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int foundItemCount = foundItemDao.selectFoundItemCount();
        request.setAttribute("foundItemCount", foundItemCount);
        response.getWriter().write("Total Found Items: " + foundItemCount);
    }

    private void showLostItemForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/report_lost/form.jsp").forward(request, response);
    }

    private void showFoundItemForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/report_found/form.jsp").forward(request, response);
    }

    private int getUserIdFromSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            User user = (User) session.getAttribute("user");
            if (user != null) {
                return user.getId();
            }
        }

        // Fallback to form parameter if session user is not available
        String userIdParam = request.getParameter("userId");
        if (userIdParam != null && !userIdParam.isEmpty()) {
            return Integer.parseInt(userIdParam);
        }

        return -1; // Invalid user ID
    }

   private void addLostItem(HttpServletRequest request, HttpServletResponse response)
        throws SQLException, ServletException, IOException {
    LostItem lostItem = new LostItem();

    int userId = getUserIdFromSession(request);
    if (userId == -1) {
        response.sendRedirect(request.getContextPath() + "/login");
        return;
    }

    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String location = request.getParameter("location");
    String photoUrl = request.getParameter("photo");
    double latitude = Double.parseDouble(request.getParameter("latitude"));
    double longitude = Double.parseDouble(request.getParameter("longitude"));

    lostItem.setTitle(title);
    lostItem.setDescription(description);
    lostItem.setLocation(location);
    lostItem.setUserId(userId);
    lostItem.setPhoto(photoUrl);
    lostItem.setLatitude(latitude);
    lostItem.setLongitude(longitude);

    lostItemDao.insertLostItem(lostItem);
    response.sendRedirect(request.getContextPath() + "/report/lost");
}


    private void addFoundItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        FoundItem foundItem = new FoundItem();

        int userId = getUserIdFromSession(request);
        if (userId == -1) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String photoUrl = request.getParameter("photo");
        double latitude = Double.parseDouble(request.getParameter("latitude"));
        double longitude = Double.parseDouble(request.getParameter("longitude"));

        foundItem.setTitle(title);
        foundItem.setDescription(description);
        foundItem.setLocation(location);
        foundItem.setUserId(userId);
        foundItem.setPhoto(photoUrl);
        foundItem.setLatitude(latitude);
        foundItem.setLongitude(longitude);

        foundItemDao.insertFoundItem(foundItem);
        response.sendRedirect(request.getContextPath() + "/report/found");
    }

    private void deleteLostItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        lostItemDao.deleteLostItem(id);
        response.sendRedirect(request.getContextPath() + "/lost/list");
    }

    private void deleteFoundItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        foundItemDao.deleteFoundItem(id);
        response.sendRedirect(request.getContextPath() + "/found/list");
    }

    private void showEditLostItemForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        LostItem lostItem = lostItemDao.selectLostItemById(id);
        request.setAttribute("lostItem", lostItem);
        request.getRequestDispatcher("/WEB-INF/views/lost/edit.jsp").forward(request, response);
    }

    private void showEditFoundItemForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        FoundItem foundItem = foundItemDao.selectFoundItemById(id);
        request.setAttribute("foundItem", foundItem);
        request.getRequestDispatcher("/WEB-INF/views/found/edit.jsp").forward(request, response);
    }

    private void updateLostItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        LostItem lostItem = new LostItem();
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String photoUrl = request.getParameter("photo");
//        double latitude = Double.parseDouble(request.getParameter("latitude"));
//        double longitude = Double.parseDouble(request.getParameter("longitude"));

        lostItem.setId(id);
        lostItem.setTitle(title);
        lostItem.setDescription(description);
        lostItem.setLocation(location);
        lostItem.setPhoto(photoUrl);
//        lostItem.setLatitude(latitude);
//        lostItem.setLongitude(longitude);

        lostItemDao.updateLostItem(lostItem);
        response.sendRedirect(request.getContextPath() + "/lost/list");
    }

    private void updateFoundItem(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        FoundItem foundItem = new FoundItem();
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        String location = request.getParameter("location");
        String photoUrl = request.getParameter("photo");
//        double latitude = Double.parseDouble(request.getParameter("latitude"));
//        double longitude = Double.parseDouble(request.getParameter("longitude"));

        foundItem.setId(id);
        foundItem.setTitle(title);
        foundItem.setDescription(description);
        foundItem.setLocation(location);
        foundItem.setPhoto(photoUrl);
//        foundItem.setLatitude(latitude);
//        foundItem.setLongitude(longitude);

        foundItemDao.updateFoundItem(foundItem);
        response.sendRedirect(request.getContextPath() + "/found/list");
    }

    private void showLostItemDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        LostItem lostItem = lostItemDao.selectLostItemById(id);
        request.setAttribute("lostItem", lostItem);
        request.getRequestDispatcher("/WEB-INF/views/report_lost/details.jsp").forward(request, response);
    }

    private void showFoundItemDetails(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        FoundItem foundItem = foundItemDao.selectFoundItemById(id);
        request.setAttribute("foundItem", foundItem);
        request.getRequestDispatcher("/WEB-INF/views/report_found/details.jsp").forward(request, response);
    }
}
