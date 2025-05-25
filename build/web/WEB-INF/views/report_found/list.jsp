<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Found Items | iFound</title>
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
    .btn-float {
      position: fixed;
      right: 2rem;
      bottom: 2rem;
      width: 60px;
      height: 60px;
      border-radius: 50%;
      font-size: 24px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
      z-index: 100;
      display: flex;
      align-items: center;
      justify-content: center;
    }
    .item-image {
      width: 80px;
      height: 80px;
      object-fit: cover;
      border-radius: 4px;
    }
    .card {
      border-radius: 0.5rem;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }
    .card:hover {
      transform: translateY(-5px);
    }
    .item-card {
      margin-bottom: 1.5rem;
    }
    .item-badge {
      position: absolute;
      top: 10px;
      right: 10px;
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
              <a class="nav-link active" href="${pageContext.request.contextPath}/report/found">
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
              <a class="nav-link " href="${pageContext.request.contextPath}/profile/view">
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
          <h1 class="h2 text-success"><i class="fas fa-search-plus me-2"></i>Found Items</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
              Welcome, ${user.username} <span class="badge bg-primary">User</span>
            </span>
            <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>

        <!-- Search Bar -->
        <div class="row mb-4">
          <div class="col-12">
            <div class="card">
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/found/search" method="get" class="row g-3">
                  <div class="col-md-4">
                    <input type="text" class="form-control" name="keyword" placeholder="Search by keywords..." />
                  </div>
                  <div class="col-md-3">
                    <select class="form-select" name="location">
                      <option value="">All Locations</option>
                      <option value="Library">Library</option>
                      <option value="Cafeteria">Cafeteria</option>
                      <option value="Lecture Halls">Lecture Halls</option>
                      <option value="Dorms">Dormitories</option>
                      <option value="Sports Complex">Sports Complex</option>
                    </select>
                  </div>
                  <div class="col-md-3">
                    <select class="form-select" name="date">
                      <option value="">Any Date</option>
                      <option value="today">Today</option>
                      <option value="week">This Week</option>
                      <option value="month">This Month</option>
                    </select>
                  </div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-primary w-100">
                      <i class="fas fa-search me-2"></i>Search
                    </button>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>

        <!-- Add New Item Button -->
        <div class="d-flex justify-content-end mb-4">
          <a href="${pageContext.request.contextPath}/found/new" class="btn btn-success">
            <i class="fas fa-plus me-2"></i>Report New Found Item
          </a>
        </div>

        <!-- Found Items Grid -->
        <div class="row">
          <c:forEach var="item" items="${foundItems}">
            <div class="col-md-6 col-lg-4 item-card">
              <div class="card h-100">
                <span class="badge bg-success item-badge">Found</span>
                <c:choose>
                  <c:when test="${not empty item.photo}">
                    <img src="${item.photo}" class="card-img-top" alt="${item.title}" style="height: 200px; object-fit: cover;">
                  </c:when>
                  <c:otherwise>
                    <div class="bg-light d-flex align-items-center justify-content-center" style="height: 200px;">
                      <i class="fas fa-image fa-3x text-secondary"></i>
                    </div>
                  </c:otherwise>
                </c:choose>
                <div class="card-body">
                  <h5 class="card-title">${item.title}</h5>
                  <p class="card-text text-truncate">${item.description}</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <small class="text-muted">
                      <i class="fas fa-map-marker-alt me-1"></i>${item.location}
                    </small>
                    <small class="text-muted">
                      <i class="far fa-calendar-alt me-1"></i>${item.createdAt}
                    </small>
                  </div>
                </div>
                <div class="card-footer bg-white border-top-0">
                  <a href="${pageContext.request.contextPath}/found/details?id=${item.id}" class="btn btn-outline-primary btn-sm w-100">
                    <i class="fas fa-info-circle me-1"></i>View Details
                  </a>
<!--                  <a href="${pageContext.request.contextPath}/found/edit?id=${item.id}" class="btn btn-outline-secondary btn-sm w-100 mt-2">
                    <i class="fas fa-edit me-1"></i>Edit
                  </a>-->
                </div>
              </div>
            </div>
          </c:forEach>

          <!-- Empty State -->
          <c:if test="${empty foundItems}">
            <div class="col-12 text-center py-5">
              <i class="fas fa-search fa-4x text-secondary mb-3"></i>
              <h3>No found items reported</h3>
              <p class="text-muted">No items have been reported found yet.</p>
              <a href="${pageContext.request.contextPath}/found/new" class="btn btn-success mt-3">
                <i class="fas fa-plus me-2"></i>Report a Found Item
              </a>
            </div>
          </c:if>
        </div>

        <!-- Floating Add Button for Mobile -->
        <a href="${pageContext.request.contextPath}/found/new" class="btn btn-success btn-float d-md-none">
          <i class="fas fa-plus"></i>
        </a>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
