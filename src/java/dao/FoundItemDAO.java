package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.FoundItem;

public class FoundItemDAO {
    private Connection connection;

    public FoundItemDAO() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ifound", "root", "");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void insertFoundItem(FoundItem foundItem) throws SQLException {
        String sql = "INSERT INTO found_items (user_id, title, description, location, photo, latitude, longitude) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, foundItem.getUserId());
            stmt.setString(2, foundItem.getTitle());
            stmt.setString(3, foundItem.getDescription());
            stmt.setString(4, foundItem.getLocation());
            stmt.setString(5, foundItem.getPhoto());
            stmt.setDouble(6, foundItem.getLatitude());
            stmt.setDouble(7, foundItem.getLongitude());
            stmt.executeUpdate();
        }
    }

    public List<FoundItem> selectAllFoundItems() throws SQLException {
        List<FoundItem> foundItems = new ArrayList<>();
        String sql = "SELECT * FROM found_items";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            while (rs.next()) {
                FoundItem foundItem = new FoundItem();
                foundItem.setId(rs.getInt("id"));
                foundItem.setUserId(rs.getInt("user_id"));
                foundItem.setTitle(rs.getString("title"));
                foundItem.setDescription(rs.getString("description"));
                foundItem.setLocation(rs.getString("location"));
                foundItem.setPhoto(rs.getString("photo"));
                foundItem.setCreatedAt(rs.getString("created_at"));
                foundItem.setLatitude(rs.getDouble("latitude"));
                foundItem.setLongitude(rs.getDouble("longitude"));
                foundItems.add(foundItem);
            }
        }
        return foundItems;
    }

    public void deleteFoundItem(int id) throws SQLException {
        String sql = "DELETE FROM found_items WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public int selectFoundItemCount() throws SQLException {
        String sql = "SELECT COUNT(*) AS count FROM found_items";
        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            if (rs.next()) {
                int count = rs.getInt("count");
                System.out.println("Found Item Count: " + count);
                return count;
            }
        }
        return 0;
    }

    public void updateFoundItem(FoundItem foundItem) throws SQLException {
        String sql = "UPDATE found_items SET title = ?, description = ?, location = ?, photo = ?, latitude = ?, longitude = ? WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setString(1, foundItem.getTitle());
            stmt.setString(2, foundItem.getDescription());
            stmt.setString(3, foundItem.getLocation());
            stmt.setString(4, foundItem.getPhoto());
            stmt.setDouble(5, foundItem.getLatitude());
            stmt.setDouble(6, foundItem.getLongitude());
            stmt.setInt(7, foundItem.getId());
            stmt.executeUpdate();
        }
    }

    public FoundItem selectFoundItemById(int id) throws SQLException {
        String sql = "SELECT * FROM found_items WHERE id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    FoundItem foundItem = new FoundItem();
                    foundItem.setId(rs.getInt("id"));
                    foundItem.setUserId(rs.getInt("user_id"));
                    foundItem.setTitle(rs.getString("title"));
                    foundItem.setDescription(rs.getString("description"));
                    foundItem.setLocation(rs.getString("location"));
                    foundItem.setPhoto(rs.getString("photo"));
                    foundItem.setCreatedAt(rs.getString("created_at"));
                    foundItem.setLatitude(rs.getDouble("latitude"));
                    foundItem.setLongitude(rs.getDouble("longitude"));
                    return foundItem;
                }
            }
        }
        return null;
    }
}
