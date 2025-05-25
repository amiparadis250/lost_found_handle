package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.LostItem;

public class LostItemDAO {
    private Connection connection;

    public LostItemDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ifound", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertLostItem(LostItem lostItem) throws SQLException {
        String sql = "INSERT INTO lost_items (user_id, title, description, location, photo) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, lostItem.getUserId());
            stmt.setString(2, lostItem.getTitle());
            stmt.setString(3, lostItem.getDescription());
            stmt.setString(4, lostItem.getLocation());
            stmt.setString(5, lostItem.getPhoto()); // Set TEXT data
            stmt.executeUpdate();
        }
    }

    public List<LostItem> selectAllLostItems() throws SQLException {
        List<LostItem> lostItems = new ArrayList<>();
        String sql = "SELECT * FROM lost_items";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                LostItem lostItem = new LostItem();
                lostItem.setId(rs.getInt("id"));
                lostItem.setUserId(rs.getInt("user_id"));
                lostItem.setTitle(rs.getString("title"));
                lostItem.setDescription(rs.getString("description"));
                lostItem.setLocation(rs.getString("location"));
                lostItem.setPhoto(rs.getString("photo")); // Retrieve TEXT data
                lostItem.setCreatedAt(rs.getString("created_at"));
                lostItems.add(lostItem);
            }
        }
        return lostItems;
    }

    public void deleteLostItem(int id) throws SQLException {
        String sql = "DELETE FROM lost_items WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public int selectLostItemCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM lost_items";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                int count = rs.getInt("count");
                System.out.println("Lost Item Count: " + count);
                return count;
            }
        }
        return 0;
    }

    public void updateLostItem(LostItem lostItem) throws SQLException {
        String sql = "UPDATE lost_items SET title = ?, description = ?, location = ?, photo = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, lostItem.getTitle());
            stmt.setString(2, lostItem.getDescription());
            stmt.setString(3, lostItem.getLocation());
            stmt.setString(4, lostItem.getPhoto()); // Set TEXT data
            stmt.setInt(5, lostItem.getId());
            stmt.executeUpdate();
        }
    }

    public LostItem selectLostItemById(int id) throws SQLException {
        String sql = "SELECT * FROM lost_items WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    LostItem lostItem = new LostItem();
                    lostItem.setId(rs.getInt("id"));
                    lostItem.setUserId(rs.getInt("user_id"));
                    lostItem.setTitle(rs.getString("title"));
                    lostItem.setDescription(rs.getString("description"));
                    lostItem.setLocation(rs.getString("location"));
                    lostItem.setPhoto(rs.getString("photo")); // Retrieve TEXT data
                    lostItem.setCreatedAt(rs.getString("created_at"));
                    return lostItem;
                }
            }
        }
        return null;
    }
}
