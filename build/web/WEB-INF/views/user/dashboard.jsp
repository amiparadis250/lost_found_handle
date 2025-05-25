<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>User Dashboard | iFound</title>
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
          <h1 class="h2 text-primary"><i class="fas fa-home me-2"></i>User Dashboard</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
            Welcome, ${user.username} <span class="badge bg-primary">User</span>
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
            <div class="card card-stat bg-info text-white">
              <div class="card-body">
                <div class="d-flex justify-content-between">
                  <div>
                    <h5 class="card-title">Lost Reported</h5>
                    <h2 class="mb-0">5</h2>
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
                    <h5 class="card-title">Found Reported</h5>
                    <h2 class="mb-0">3</h2>
                  </div>
                  <i class="fas fa-search-plus fa-3x opacity-50"></i>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card card-stat bg-primary text-white">
              <div class="card-body">
                <div class="d-flex justify-content-between">
                  <div>
                    <h5 class="card-title">Matches Found</h5>
                    <h2 class="mb-0">2</h2>
                  </div>
                  <i class="fas fa-link fa-3x opacity-50"></i>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- My Reports Table -->
        <div class="card mb-4">
          <div class="card-header bg-white">
            <h5 class="mb-0"><i class="fas fa-file-alt me-2 text-primary"></i>My Recent Reports</h5>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table class="table table-hover">
                <thead class="table-light">
                  <tr>
                    <th>ID</th>
                    <th>Type</th>
                    <th>Title</th>
                    <th>Status</th>
                    <th>Location</th>
                    <th>Date</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>204</td>
                    <td><span class="badge bg-danger">Lost</span></td>
                    <td>USB Flash Drive</td>
                    <td><span class="badge bg-warning">Pending</span></td>
                    <td>ICT Lab</td>
                    <td>2025-05-10</td>
                  </tr>
                  <tr>
                    <td>205</td>
                    <td><span class="badge bg-success">Found</span></td>
                    <td>Earbuds</td>
                    <td><span class="badge bg-success">Matched</span></td>
                    <td>Library</td>
                    <td>2025-05-09</td>
                  </tr>
                  <tr>
                    <td>206</td>
                    <td><span class="badge bg-danger">Lost</span></td>
                    <td>Student Card</td>
                    <td><span class="badge bg-secondary">Unmatched</span></td>
                    <td>Main Gate</td>
                    <td>2025-05-08</td>
                  </tr>
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
