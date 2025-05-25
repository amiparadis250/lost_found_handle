# 🧳 Lost and Found Items Management System

A web-based application built with **Java Servlet** and **MySQL** to manage lost and found items in institutions like universities, airports, or offices. The system allows users to report lost items, found items, and help return them to their rightful owners.

## 📌 Features

- 📝 Report Lost Item  
- 📦 Report Found Item  
- 🔍 Search Lost/Found Items  
- ✅ Match Lost Items with Found Items  
- 🔐 Admin Panel (view, approve, or delete entries)  
- 📬 Email notification (optional with JavaMail)

## 🛠️ Technologies Used

| Tech          | Description                           |
|---------------|---------------------------------------|
| Java Servlet  | Backend API and web handling          |
| JSP           | Frontend templating                   |
| MySQL         | Database for storing items and users  |
| JDBC          | Database connectivity with Java       |
| HTML/CSS/JS   | Frontend UI/UX                        |
| Apache Tomcat | Web server to deploy servlet app      |

## ⚙️ Installation & Setup

### 📁 Clone the repository
```bash
git clone https://github.com/yourusername/lost-found-system.git
cd lost-found-system
```

### 🧱 Database Setup

1. Open MySQL and create the database:
```sql
CREATE DATABASE lost_found_db;
```

2. Import the provided `schema.sql` file into your MySQL database:
```sql
USE lost_found_db;
-- run contents of schema.sql here
```

3. Configure DB credentials in `DBConnection.java`:
```java
private static final String DB_URL = "jdbc:mysql://localhost:3306/lost_found_db";
private static final String DB_USER = "root";
private static final String DB_PASSWORD = "yourpassword";
```

### 🖥️ Run the Project

1. Open the project in an IDE like **Eclipse** or **IntelliJ**.
2. Configure the server (Tomcat) and deploy the project.
3. Access the system at:  
```
http://localhost:8080/lost-found/
```

## 📂 Project Structure

```
lost-found/
├── src/
│   ├── com.lostfound.controllers/       # Servlet Controllers
│   ├── com.lostfound.models/            # POJO classes
│   └── com.lostfound.utils/             # DB helper, etc.
├── WebContent/
│   ├── JSP pages (home.jsp, report.jsp)
│   └── WEB-INF/
│       └── web.xml                      # Servlet config
```

## 🖼️ Screenshots (Optional)

> Add screenshots for Home Page, Lost/Found Item Forms, Admin Panel, etc.

## 👤 Roles (optional)
- **Users**: Can report lost or found items
- **Admin**: Can manage and verify listings

## ✅ Future Improvements
- Add login & user profiles  
- Image upload for items  
- Notification system  
- AI-based item matching  

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests.

## 📄 License

This project is licensed under the MIT License.