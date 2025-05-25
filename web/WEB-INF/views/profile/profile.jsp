<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Profile | iFound</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    :root {
      --primary-color: #3f51b5;
      --secondary-color: #ff4081;
      --dark-color: #303f9f;
      --light-color: #f5f5f5;
      --accent-color: #ff9800;
    }

    body {
      background-color: #f0f2f5;
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    /* Keep original sidebar styles */
    .sidebar {
      min-height: 100vh;
      background: #e3f2fd;
      border-right: 1px solid #cfd8dc;
    }
    
    .sidebar .nav-link {
      color: #0d47a1;
      border-radius: 0.25rem;
      margin: 0.25rem 0;
      font-weight: 500;
    }
    
    .sidebar .nav-link:hover,
    .sidebar .nav-link.active {
      color: white;
      background: #1976d2;
    }
    
    .sidebar .nav-link i {
      width: 20px;
      margin-right: 10px;
      text-align: center;
    }

    .profile-card {
      border-radius: 1rem;
      border: none;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      overflow: hidden;
      transition: transform 0.3s ease;
    }

    .profile-card:hover {
      transform: translateY(-5px);
    }

    .profile-header {
      background: linear-gradient(135deg, var(--primary-color), var(--dark-color));
      padding: 2rem;
      position: relative;
      text-align: center;
    }

    .profile-image-wrapper {
      position: relative;
      margin-bottom: -60px;
    }

    .profile-image {
      width: 120px;
      height: 120px;
      border-radius: 50%;
      border: 5px solid white;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
      background-color: #e0e0e0;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 2.5rem;
      color: #9e9e9e;
    }

    .profile-content {
      padding-top: 70px;
      padding-bottom: 2rem;
    }

    .info-item {
      padding: 1rem;
      margin-bottom: 1rem;
      background-color: #f8f9fa;
      border-radius: 0.5rem;
      border-left: 4px solid var(--primary-color);
    }

    .info-label {
      font-size: 0.85rem;
      text-transform: uppercase;
      color: #6c757d;
      font-weight: 600;
      margin-bottom: 0.5rem;
    }

    .info-value {
      font-size: 1.1rem;
      font-weight: 500;
      color: #343a40;
    }

    .member-badge {
      background-color: var(--accent-color);
      color: white;
      padding: 0.5rem 1rem;
      border-radius: 1rem;
      font-size: 0.8rem;
      position: relative;
      top: -10px;
      display: inline-block;
      margin-bottom: 1rem;
    }

    .btn-edit {
      background-color: var(--secondary-color);
      color: white;
      border: none;
      border-radius: 0.5rem;
      padding: 0.5rem 1.5rem;
      font-weight: 500;
      transition: all 0.3s ease;
    }

    .btn-edit:hover {
      background-color: #d81b60;
      transform: translateY(-2px);
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
      color: white;
    }

    .header-bar {
      background-color: white;
      box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
      border-radius: 0.5rem;
      padding: 1rem;
      margin-bottom: 2rem;
    }

    .page-title {
      font-weight: 600;
      color: var(--dark-color);
    }

    main {
      padding: 2rem;
    }
  </style>
</head>
<body>
  <div class="container-fluid">
    <div class="row">
      <!-- Sidebar -->
      <div class="col-md-3 col-lg-2 sidebar">
        <div class="position-sticky pt-3">
          <ul class="nav flex-column">
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">
                <i class="fas fa-home"></i> Dashboard
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/report/lost">
                <i class="fas fa-search-minus"></i> Report Lost Item
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/report/found">
                <i class="fas fa-search-plus"></i> Report Found Item
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-file-alt"></i> My Reports
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-link"></i> Matches
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-comments"></i> Messages
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-star"></i> Trust & Ratings
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" href="${pageContext.request.contextPath}/profile">
                <i class="fas fa-user"></i> Profile
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
            </li>
          </ul>
        </div>
      </div>

      <!-- Main Content -->
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 py-4">
        <div class="d-flex justify-content-between align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2"><i class="fas fa-user me-2"></i>Profile</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
              Welcome, ${user.username} <span class="badge bg-primary">User</span>
            </span>
            <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>

        <!-- Profile Card -->
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card profile-card mb-4">
              <div class="card-header bg-primary text-white">
                <h5 class="mb-0"><i class="fas fa-user-circle me-2"></i>User Profile</h5>
              </div>
              <div class="card-body text-center">
                <div class="mb-3">
                  <div class="profile-image mx-auto">
                    <i class="fas fa-user"></i>
                  </div>
                </div>
                
                <div class="member-badge mt-3 mb-4">
                  <i class="fas fa-calendar-check me-1"></i> Member since April 2025
                </div>
                
                <div class="mb-3">
                  <label class="form-label">Username</label>
                  <p class="form-control-static">${user.username}</p>
                </div>
                <div class="mb-3">
                  <label class="form-label">Email</label>
                  <p class="form-control-static">${user.email}</p>
                </div>
                <div class="mb-3">
                  <label class="form-label">Role</label>
                  <p class="form-control-static">${user.role}</p>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-center mt-4">
                  <a href="${pageContext.request.contextPath}/user/edit?id=${user.id}" class="btn btn-outline-secondary me-md-2">
                    <i class="fas fa-edit me-1"></i>Edit Profile
                  </a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>