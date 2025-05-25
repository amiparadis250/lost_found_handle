<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sign Up | I found</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <base href="${pageContext.request.contextPath}/" />
    <style>
        body, html {
            height: 100%;
            margin: 0;
            background: linear-gradient(rgba(74, 107, 255, 0.8), rgba(255, 255, 255, 0.8)), url('https://res.cloudinary.com/dv9cz01fi/image/upload/v1747340110/coverImages/zhfwzp9wnzq87fleocst.jpg') no-repeat center center fixed;
            background-size: cover;
        }

        .card {
            border: none;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(74, 107, 255, 0.1);
            background-color: rgba(255, 255, 255, 0.9);
        }

        .card-title {
            color: #4a6bff;
        }

        .btn-primary {
            background-color: #4a6bff;
            border-color: #4a6bff;
        }

        .btn-primary:hover {
            background-color: #3a56d4;
            border-color: #3a56d4;
        }

        .form-control:focus {
            border-color: #4a6bff;
            box-shadow: 0 0 0 0.25rem rgba(74, 107, 255, 0.25);
        }

        .alert-danger {
            background-color: #f8d7da;
            border-color: #f5c6cb;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center mt-5">
            <div class="col-md-6 col-lg-4">
                <div class="card shadow">
                    <div class="card-body p-4">
                        <div class="text-center mb-4">
                            <h2 class="card-title">Ifound System</h2>
                            <p class="text-muted">Create your account</p>
                        </div>

                        <form action="${pageContext.request.contextPath}/signup" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" name="email" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                                <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary">Sign Up</button>
                            </div>
                        </form>

                        <c:if test="${not empty error}">
                            <div class="alert alert-danger mt-3">${error}</div>
                        </c:if>
                        <div class="text-center mt-3">
                            <p>Already have an account? <a href="${pageContext.request.contextPath}/login">Login</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
