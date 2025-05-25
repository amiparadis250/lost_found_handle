<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Lost Item Details | iFound</title>
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
    .form-card {
      border-radius: 0.5rem;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s ease;
    }
    .form-card:hover {
      transform: translateY(-5px);
    }
    .preview-image {
      max-height: 200px;
      max-width: 100%;
      display: none;
      margin-top: 10px;
      border-radius: 4px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .clickable-card {
      cursor: pointer;
    }
    #map {
      height: 300px;
      width: 100%;
      margin-top: 10px;
      border-radius: 4px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
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
              <a class="nav-link active" href="${pageContext.request.contextPath}/report/lost">
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
          <h1 class="h2 text-danger"><i class="fas fa-info-circle me-2"></i>Lost Item Details</h1>
          <div class="btn-toolbar">
            <span class="navbar-text me-3 text-secondary">
              Welcome, ${user.username} <span class="badge bg-primary">User</span>
            </span>
            <a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/logout">
              <i class="fas fa-sign-out-alt"></i> Logout
            </a>
          </div>
        </div>

        <!-- Details Card -->
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card form-card mb-4 clickable-card">
              <div class="card-header bg-danger text-white">
                <h5 class="mb-0"><i class="fas fa-info-circle me-2"></i>Item Details</h5>
              </div>
              <div class="card-body">
                <div class="mb-3">
                  <label class="form-label">Item Name</label>
                  <p class="form-control-static">${lostItem.title}</p>
                </div>

                <div class="mb-3">
                  <label class="form-label">Description</label>
                  <p class="form-control-static">${lostItem.description}</p>
                </div>

                <div class="mb-3">
                  <label class="form-label">Location</label>
                  <p class="form-control-static">${lostItem.location}</p>
                </div>

                <div class="mb-3">
                  <label class="form-label">Photo</label>
                  <c:choose>
                    <c:when test="${not empty lostItem.photo}">
                      <img src="${lostItem.photo}" class="img-fluid" alt="${lostItem.title}" style="max-height: 200px;">
                    </c:when>
                    <c:otherwise>
                      <p class="form-control-static">No image available</p>
                    </c:otherwise>
                  </c:choose>
                </div>

                <div class="mb-3">
                  <label class="form-label">Reported At</label>
                  <p class="form-control-static">${lostItem.createdAt}</p>
                </div>

                <div class="mb-3">
                  <label class="form-label">Location on Map</label>
                  <div id="map"></div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </main>
    </div>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    function initMap() {
      // Coordinates for UR CST
      const latitude = -1.9446;
      const longitude = 30.0619;
      const location = { lat: latitude, lng: longitude };
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 15,
        center: location,
      });
      new google.maps.Marker({
        position: location,
        map: map,
      });
    }
  </script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC3Yz41S3FuCixGeMyDfQIOd67GjQDTyfI&callback=initMap"></script>
</body>
</html>
