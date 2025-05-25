<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Edit Lost Item | iFound</title>
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
    .edit-form {
      background-color: #f8f9fa;
      border-radius: 0.5rem;
      padding: 1.5rem;
      box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
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
              <a class="nav-link active" href="${pageContext.request.contextPath}/lost/list">
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
          <h1 class="h2 text-danger"><i class="fas fa-edit me-2"></i>Edit Lost Item</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
              Welcome, ${sessionScope.user.username} <span class="badge bg-primary">Admin</span>
            </span>
            <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>

        <!-- Edit Lost Item Form -->
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card edit-form mb-4">
              <div class="card-header bg-danger text-white">
                <h5 class="mb-0"><i class="fas fa-edit me-2"></i>Edit Lost Item</h5>
              </div>
              <div class="card-body">
                <form action="${pageContext.request.contextPath}/lost/update" method="post">
                  <input type="hidden" name="id" value="${lostItem.id}">
                  <div class="mb-3">
                    <label for="title" class="form-label">Title</label>
                    <input type="text" class="form-control" id="title" name="title" value="${lostItem.title}" required>
                  </div>
                  <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea class="form-control" id="description" name="description" required>${lostItem.description}</textarea>
                  </div>
                  <div class="mb-3">
                    <label for="location" class="form-label">Location</label>
                    <input type="text" class="form-control" id="location" name="location" value="${lostItem.location}" required>
                  </div>
                  <div class="mb-3">
                    <label for="photo" class="form-label">Photo URL</label>
                    <input type="text" class="form-control" id="photo" name="photo" value="${lostItem.photo}" required>
                  </div>
                  <div class="d-grid gap-2 d-md-flex justify-content-md-end mt-4">
                    <button type="submit" class="btn btn-primary me-md-2">
                      <i class="fas fa-save me-1"></i>Save Changes
                    </button>
                    <a href="${pageContext.request.contextPath}/lost/list" class="btn btn-outline-secondary">
                      <i class="fas fa-times me-1"></i>Cancel
                    </a>
                  </div>
                </form>
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
