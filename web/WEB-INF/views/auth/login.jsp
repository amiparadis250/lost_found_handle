<%--  Document   : index  Created on : May 19, 2025, 6:53:27 AM  Author     : ISHIMWE Ami Paradis --%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>iFound - The Smart Lost & Found System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <base href="${pageContext.request.contextPath}/" />
    <style>
        .hero-section {
            color: #333;
            padding: 10rem 0;
            animation: fadeIn 1.5s ease-in-out;
        }

        .hero-section.parallax {
            background: linear-gradient(rgba(74, 107, 255, 0.8), rgba(255, 255, 255, 0.8)), url('https://res.cloudinary.com/dv9cz01fi/image/upload/v1747340110/coverImages/zhfwzp9wnzq87fleocst.jpg');
            background-attachment: fixed;
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
        }

        .feature-card {
            border-radius: 10px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            height: 100%;
            animation: slideIn 1s ease-in-out;
            background-color: #ffffff;
            border: 1px solid #4a6bff;
        }

        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(74, 107, 255, 0.2);
        }

        .feature-icon {
            font-size: 2.5rem;
            margin-bottom: 1rem;
            color: #4a6bff;
        }

        .how-it-works-section {
            background-color: #f8f9ff;
            padding: 5rem 0;
        }

        .step-card {
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(74, 107, 255, 0.1);
            background-color: white;
            height: 100%;
            animation: slideIn 1s ease-in-out;
            border: 1px solid #4a6bff;
        }

        .step-number {
            width: 40px;
            height: 40px;
            background-color: #4a6bff;
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            margin-bottom: 1rem;
        }

        .cta-section {
            background: linear-gradient(135deg, #4a6bff, #ffffff);
            color: #333;
            padding: 5rem 0;
        }

        .navbar {
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: 0 2px 10px rgba(74, 107, 255, 0.1);
        }

        .footer {
            background-color: #343a40;
            color: white;
            padding: 3rem 0;
        }

        .footer a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
        }

        .footer a:hover {
            color: white;
        }

        .btn-primary {
            background-color: #4a6bff;
            border-color: #4a6bff;
        }

        .btn-primary:hover {
            background-color: #3a56d4;
            border-color: #3a56d4;
        }

        .badge-trust {
            background-color: #4a6bff;
            color: white;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            font-weight: bold;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideIn {
            from { transform: translateY(20px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        .hero-image {
            max-width: 300px;
            height: auto;
        }

        .login-form {
            background-color: rgba(255, 255, 255, 0.9);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(74, 107, 255, 0.1);
            animation: slideInFromRight 1s ease-in-out;
        }

        .intro-text {
            animation: slideInFromLeft 1s ease-in-out;
        }

        @keyframes slideInFromLeft {
            from { transform: translateX(-20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }

        @keyframes slideInFromRight {
            from { transform: translateX(20px); opacity: 0; }
            to { transform: translateX(0); opacity: 1; }
        }
    </style>
</head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top">
        <div class="container">
            <a class="navbar-brand" href="#">
                <span class="fw-bold text-primary">i</span>Found
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#features">Features</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#how-it-works">How It Works</a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-primary ms-2" href="${pageContext.request.contextPath}/signup">Sign Up</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section with Parallax -->
    <section class="hero-section parallax">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <h1 class="display-4 fw-bold mb-4 intro-text">Reunite with Your Lost Items</h1>
                    <p class="lead mb-4 intro-text">iFound is a smart lost & found platform that connects people who have lost items with those who have found them, through a simple and secure process.</p>
                    <div class="d-flex gap-3">
                        <a href="${pageContext.request.contextPath}/signup" class="btn btn-light btn-lg">Get Started</a>
                        <a href="#how-it-works" class="btn btn-outline-light btn-lg">Learn More</a>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="login-form">
                        <form action="login" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <button type="submit" class="btn btn-primary w-100">Sign in</button>
                        </form>
                        <div class="text-center mt-3">
                            <p>Don't have an account? <a href="${pageContext.request.contextPath}/signup">Sign Up</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5" id="features">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">Key Features</h2>
                <p class="lead text-muted">Designed to help you find what matters most</p>
            </div>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card p-4 shadow-sm">
                        <div class="feature-icon">
                            <i class="fas fa-search"></i>
                        </div>
                        <h3>Easy Reporting</h3>
                        <p>Report lost or found items quickly with photos, descriptions, and location details.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card p-4 shadow-sm">
                        <div class="feature-icon">
                            <i class="fas fa-link"></i>
                        </div>
                        <h3>Smart Matching</h3>
                        <p>Our system automatically matches lost items with found reports based on descriptions and location.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card p-4 shadow-sm">
                        <div class="feature-icon">
                            <i class="fas fa-bell"></i>
                        </div>
                        <h3>Real-time Notifications</h3>
                        <p>Get instant alerts when a potential match for your lost item is found.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card p-4 shadow-sm">
                        <div class="feature-icon">
                            <i class="fas fa-comments"></i>
                        </div>
                        <h3>Secure Messaging</h3>
                        <p>Connect safely with item finders through our private messaging system.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card p-4 shadow-sm">
                        <div class="feature-icon">
                            <i class="fas fa-star"></i>
                        </div>
                        <h3>Trust Rating System</h3>
                        <p>Build your reputation by honestly returning items and rating other users.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card p-4 shadow-sm">
                        <div class="feature-icon">
                            <i class="fas fa-gift"></i>
                        </div>
                        <h3>Rewards Program</h3>
                        <p>Earn prizes and recognition for being an honest finder with high trust ratings.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works-section" id="how-it-works">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold">How It Works</h2>
                <p class="lead text-muted">Recovering your items in 4 simple steps</p>
            </div>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="step-card">
                        <div class="step-number">1</div>
                        <h4>Report</h4>
                        <p>Create a detailed report about your lost item or an item you've found.</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="step-card">
                        <div class="step-number">2</div>
                        <h4>Match</h4>
                        <p>Our system will automatically find potential matches based on your description and location.</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="step-card">
                        <div class="step-number">3</div>
                        <h4>Connect</h4>
                        <p>Use our secure messaging system to connect with the finder or owner.</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="step-card">
                        <div class="step-number">4</div>
                        <h4>Reunite</h4>
                        <p>Arrange a safe meetup to recover the item and rate your experience.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Trust System Section -->
    <section class="py-5 bg-white">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-6 order-md-2">
                    <h2 class="display-5 fw-bold mb-4">Trust & Safety First</h2>
                    <p class="lead mb-4">Our unique trust rating system ensures honesty and safety for all users.</p>
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-3">
                            <span class="badge-trust me-3">Trust Level</span>
                            <h5 class="mb-0">Build Your Reputation</h5>
                        </div>
                        <p>Each successful return increases your trust level, showcasing your reliability to the community.</p>
                    </div>
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-3">
                            <span class="badge-trust me-3">Rewards</span>
                            <h5 class="mb-0">Earn While Helping</h5>
                        </div>
                        <p>Top-rated finders receive rewards and recognition for their honesty and helpfulness.</p>
                    </div>
                </div>
                <div class="col-md-6 order-md-1 mb-4 mb-md-0">
                    <img src="https://res.cloudinary.com/dv9cz01fi/image/upload/v1747370419/coverImages/nxhfd17enjdxlttz0m5i.jpg" alt="Trust system illustration" class="img-fluid rounded shadow hero-image">
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row text-center">
                <div class="col-md-4 mb-4 mb-md-0">
                    <h2 class="display-4 fw-bold text-primary">85%</h2>
                    <p class="lead">Recovery rate for reported items</p>
                </div>
                <div class="col-md-4 mb-4 mb-md-0">
                    <h2 class="display-4 fw-bold text-primary">10,000+</h2>
                    <p class="lead">Active users in the community</p>
                </div>
                <div class="col-md-4">
                    <h2 class="display-4 fw-bold text-primary">5,000+</h2>
                    <p class="lead">Items successfully returned</p>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container text-center">
            <h2 class="display-5 fw-bold mb-4">Ready to Find What You've Lost?</h2>
            <p class="lead mb-4">Join thousands of users who have successfully recovered their belongings with iFound.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="${pageContext.request.contextPath}/signup" class="btn btn-light btn-lg">Sign Up Now</a>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-light btn-lg">Log In</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 mb-4 mb-lg-0">
                    <h4 class="mb-4"><span class="fw-bold text-primary">i</span>Found</h4>
                    <p>A smart lost & found system that connects people who have lost items with those who have found them.</p>
                    <div class="d-flex gap-3 mt-3">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="col-lg-2 col-md-4 mb-4 mb-md-0">
                    <h5 class="mb-4">Quick Links</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#">Home</a></li>
                        <li class="mb-2"><a href="#features">Features</a></li>
                        <li class="mb-2"><a href="#how-it-works">How It Works</a></li>
                    </ul>
                </div>
                <div class="col-lg-2 col-md-4 mb-4 mb-md-0">
                    <h5 class="mb-4">Resources</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><a href="#">User Guide</a></li>
                        <li class="mb-2"><a href="#">FAQs</a></li>
                        <li class="mb-2"><a href="#">Blog</a></li>
                        <li class="mb-2"><a href="#">Contact Support</a></li>
                    </ul>
                </div>
                <div class="col-lg-4 col-md-4">
                    <h5 class="mb-4">Contact Us</h5>
                    <ul class="list-unstyled">
                        <li class="mb-2"><i class="fas fa-map-marker-alt me-2"></i> 123 University Ave, Campus Center</li>
                        <li class="mb-2"><i class="fas fa-envelope me-2"></i> support@ifound.com</li>
                        <li class="mb-2"><i class="fas fa-phone me-2"></i> (123) 456-7890</li>
                    </ul>
                </div>
            </div>
            <hr class="mt-4 mb-4 bg-light">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p class="mb-0">© 2025 iFound. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <ul class="list-inline mb-0">
                        <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
                        <li class="list-inline-item">•</li>
                        <li class="list-inline-item"><a href="#">Terms of Use</a></li>
                        <li class="list-inline-item">•</li>
                        <li class="list-inline-item"><a href="#">Cookie Policy</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Add padding to body for fixed navbar
        document.addEventListener('DOMContentLoaded', function() {
            const navbar = document.querySelector('.navbar');
            document.body.style.paddingTop = navbar.offsetHeight + 'px';

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();

                    const targetId = this.getAttribute('href');
                    if (targetId === '#') return;

                    const targetElement = document.querySelector(targetId);
                    if (targetElement) {
                        window.scrollTo({
                            top: targetElement.offsetTop - navbar.offsetHeight,
                            behavior: 'smooth'
                        });
                    }
                });
            });
        });
    </script>
</body>
</html>
