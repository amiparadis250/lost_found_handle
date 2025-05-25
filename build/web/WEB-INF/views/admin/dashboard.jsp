<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Admin Dashboard | iFound</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <style>
    body {
      background-color: #f8f9fa;
    }
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
    .card-stat {
      transition: transform 0.3s;
    }
    .card-stat:hover {
      transform: translateY(-5px);
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
              <a class="nav-link active" href="#">
                <i class="fas fa-home"></i> Dashboard
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/lost/list">
                <i class="fas fa-search-minus"></i> Manage Lost Items
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/found/list">
                <i class="fas fa-search-plus"></i> Manage Found Items
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#">
                <i class="fas fa-link"></i> Confirm Matches
              </a>
            </li>
            <li class="nav-item">
               <a class="nav-link" href="${pageContext.request.contextPath}/user/list">
                <i class="fas fa-users"></i> Manage Users
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
          <h1 class="h2 text-primary"><i class="fas fa-home me-2"></i>Dashboard</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
              Welcome, ${user.username} <span class="badge bg-primary">Admin</span>
            </span>
            <a
                class="btn btn-sm btn-outline-secondary"
                href="${pageContext.request.contextPath}/logout"
              >
                <i class="fas fa-sign-out-alt"></i> Logout
              </a>
          </div>
        </div>

        <!-- Stats Cards -->
        <div class="row mb-4">
          <div class="col-md-4">
            <div class="card card-stat bg-primary text-white">
              <div class="card-body">
                <div class="d-flex justify-content-between">
                  <div>
                    <h5 class="card-title">Total Users</h5>
                    <h2 class="mb-0">${userCount}</h2>
                  </div>
                  <i class="fas fa-users fa-3x opacity-50"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-stat bg-danger text-white">
              <div class="card-body">
                <div class="d-flex justify-content-between">
                  <div>
                    <h5 class="card-title">Lost Items</h5>
                    <h2 class="mb-0">30</h2>
                  </div>
                  <i class="fas fa-search-minus fa-3x opacity-50"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-stat bg-success text-white">
              <div class="card-body">
                <div class="d-flex justify-content-between">
                  <div>
                    <h5 class="card-title">Found Items</h5>
                    <h2 class="mb-0">40</h2>
                  </div>
                  <i class="fas fa-search-plus fa-3x opacity-50"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Recent Items -->
        <div class="card mb-4">
          <div class="card-header bg-white">
            <h5 class="mb-0"><i class="fas fa-history me-2 text-primary"></i>Recently Reported Items</h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="table-light">
                  <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Title</th>
                    <th>Reported By</th>
                    <th>Location</th>
                    <th>Date</th>
                    <th>Image</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="item" items="${recentItems}">
                    <tr>
                      <td>${item.id}</td>
                      <td><span class="badge bg-${item.type == 'Lost' ? 'danger' : 'success'}">${item.type}</span></td>
                      <td>${item.title}</td>
                      <td>${item.reportedBy}</td>
                      <td>${item.location}</td>
                      <td>${item.date}</td>
                      <td><img src="${pageContext.request.contextPath}/${item.photoUrl}" alt="${item.title}" width="50" height="50"></td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
