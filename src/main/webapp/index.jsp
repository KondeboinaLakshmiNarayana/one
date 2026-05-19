<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>NexusShop — Next-Gen E‑Commerce Experience</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;1,400&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- GSAP for animations -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js"></script>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --dark: #0a0a0a;
            --darker: #050505;
            --primary: #6c63ff;
            --primary-dark: #5a52d5;
            --accent: #ff6584;
            --accent-glow: #ff6584;
            --light: #ffffff;
            --gray: #1a1a1a;
            --glass: rgba(255, 255, 255, 0.05);
            --glass-border: rgba(255, 255, 255, 0.1);
            --gradient-1: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --gradient-2: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --gradient-3: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%);
            --success: #00d26a;
            --warning: #ffc107;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: var(--dark);
            color: var(--light);
            overflow-x: hidden;
            line-height: 1.6;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 10px;
        }

        ::-webkit-scrollbar-track {
            background: var(--gray);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--primary-dark);
        }

        /* Animated Background */
        .animated-bg {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -2;
            background: radial-gradient(circle at 20% 50%, rgba(108, 99, 255, 0.1) 0%, rgba(10, 10, 10, 1) 100%);
        }

        .animated-bg::before {
            content: '';
            position: absolute;
            width: 200%;
            height: 200%;
            top: -50%;
            left: -50%;
            background: radial-gradient(circle, rgba(108, 99, 255, 0.05) 0%, transparent 70%);
            animation: rotate 20s linear infinite;
        }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }

        /* Floating Particles */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: -1;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            background: var(--primary);
            border-radius: 50%;
            opacity: 0.1;
            animation: float linear infinite;
        }

        @keyframes float {
            0% {
                transform: translateY(100vh) rotate(0deg);
                opacity: 0;
            }
            10% {
                opacity: 0.3;
            }
            90% {
                opacity: 0.3;
            }
            100% {
                transform: translateY(-100vh) rotate(360deg);
                opacity: 0;
            }
        }

        /* Header */
        header {
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            background: rgba(10, 10, 10, 0.8);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--glass-border);
            transition: all 0.3s ease;
        }

        header.scrolled {
            background: rgba(5, 5, 5, 0.95);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
        }

        .header-inner {
            max-width: 1400px;
            margin: 0 auto;
            padding: 1rem 2rem;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 2rem;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-family: 'Space Grotesk', monospace;
            font-size: 1.8rem;
            font-weight: 700;
            background: linear-gradient(135deg, #fff 0%, var(--primary) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .brand i {
            font-size: 2rem;
            background: var(--gradient-1);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        /* Navigation */
        .nav-menu ul {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-menu a {
            color: var(--light);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            position: relative;
        }

        .nav-menu a::after {
            content: '';
            position: absolute;
            bottom: -5px;
            left: 0;
            width: 0;
            height: 2px;
            background: var(--primary);
            transition: width 0.3s ease;
        }

        .nav-menu a:hover::after {
            width: 100%;
        }

        .nav-menu a:hover {
            color: var(--primary);
        }

        /* Search Bar */
        .search-bar {
            display: flex;
            align-items: center;
            background: var(--glass);
            border-radius: 50px;
            padding: 0.5rem 1rem;
            border: 1px solid var(--glass-border);
            transition: all 0.3s ease;
        }

        .search-bar:focus-within {
            border-color: var(--primary);
            box-shadow: 0 0 20px rgba(108, 99, 255, 0.3);
        }

        .search-bar input {
            background: transparent;
            border: none;
            color: var(--light);
            padding: 0.5rem;
            outline: none;
            width: 250px;
        }

        .search-bar button {
            background: transparent;
            border: none;
            color: var(--light);
            cursor: pointer;
            transition: color 0.3s;
        }

        .search-bar button:hover {
            color: var(--primary);
        }

        /* Cart */
        .cart {
            position: relative;
            cursor: pointer;
            transition: transform 0.3s;
        }

        .cart:hover {
            transform: scale(1.1);
        }

        .cart-count {
            position: absolute;
            top: -8px;
            right: -12px;
            background: var(--accent);
            border-radius: 50%;
            width: 20px;
            height: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.7rem;
            font-weight: bold;
        }

        /* Hero Section */
        .hero {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
            overflow: hidden;
            padding: 6rem 2rem 4rem;
        }

        .hero-content {
            text-align: center;
            max-width: 800px;
            z-index: 2;
        }

        .hero-badge {
            display: inline-block;
            background: var(--glass);
            backdrop-filter: blur(10px);
            padding: 0.5rem 1rem;
            border-radius: 50px;
            font-size: 0.9rem;
            margin-bottom: 2rem;
            border: 1px solid var(--glass-border);
        }

        .hero h1 {
            font-size: 5rem;
            font-weight: 800;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #fff 0%, var(--primary) 50%, var(--accent) 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .hero p {
            font-size: 1.2rem;
            color: rgba(255, 255, 255, 0.8);
            margin-bottom: 2rem;
        }

        .hero-buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
        }

        .btn {
            padding: 1rem 2rem;
            border-radius: 50px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s ease;
            cursor: pointer;
            border: none;
            font-size: 1rem;
        }

        .btn-primary {
            background: var(--primary);
            color: white;
            box-shadow: 0 10px 30px rgba(108, 99, 255, 0.3);
        }

        .btn-primary:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 15px 40px rgba(108, 99, 255, 0.4);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid var(--primary);
            color: var(--primary);
        }

        .btn-outline:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-2px);
        }

        /* Stats Section */
        .stats {
            display: flex;
            justify-content: space-around;
            padding: 4rem 2rem;
            max-width: 1200px;
            margin: 0 auto;
            gap: 2rem;
            flex-wrap: wrap;
        }

        .stat-card {
            text-align: center;
            background: var(--glass);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            min-width: 200px;
            transition: transform 0.3s;
        }

        .stat-card:hover {
            transform: translateY(-10px);
        }

        .stat-number {
            font-size: 3rem;
            font-weight: 800;
            color: var(--primary);
        }

        /* Categories Section */
        .section {
            padding: 6rem 2rem;
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 3rem;
            margin-bottom: 1rem;
            font-weight: 800;
        }

        .section-subtitle {
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
            margin-bottom: 3rem;
        }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .category-card {
            background: var(--glass);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.3s ease;
            cursor: pointer;
            border: 1px solid var(--glass-border);
            position: relative;
            overflow: hidden;
        }

        .category-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.5s;
        }

        .category-card:hover::before {
            left: 100%;
        }

        .category-card:hover {
            transform: translateY(-10px);
            border-color: var(--primary);
            box-shadow: 0 10px 30px rgba(108, 99, 255, 0.2);
        }

        .category-icon {
            font-size: 3rem;
            margin-bottom: 1rem;
        }

        /* Products Grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .product-card {
            background: var(--glass);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            overflow: hidden;
            transition: all 0.3s ease;
            cursor: pointer;
            border: 1px solid var(--glass-border);
            position: relative;
        }

        .product-card:hover {
            transform: translateY(-10px) scale(1.02);
            border-color: var(--primary);
            box-shadow: 0 20px 40px rgba(108, 99, 255, 0.2);
        }

        .product-badge {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: var(--accent);
            padding: 0.3rem 0.8rem;
            border-radius: 50px;
            font-size: 0.8rem;
            font-weight: 600;
            z-index: 1;
        }

        .product-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            transition: transform 0.3s;
        }

        .product-card:hover .product-image {
            transform: scale(1.05);
        }

        .product-info {
            padding: 1.5rem;
        }

        .product-title {
            font-size: 1.2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: var(--primary);
            margin: 0.5rem 0;
        }

        .product-old-price {
            text-decoration: line-through;
            color: rgba(255, 255, 255, 0.5);
            font-size: 0.9rem;
            margin-left: 0.5rem;
        }

        .product-rating {
            color: var(--warning);
            margin-bottom: 1rem;
        }

        .product-actions {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .btn-add {
            flex: 1;
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.8rem;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-add:hover {
            background: var(--primary-dark);
            transform: scale(1.05);
        }

        .btn-wishlist {
            background: var(--glass);
            border: 1px solid var(--glass-border);
            padding: 0.8rem 1rem;
            border-radius: 10px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .btn-wishlist:hover {
            border-color: var(--accent);
            color: var(--accent);
        }

        /* Flash Sale Section */
        .flash-sale {
            background: linear-gradient(135deg, rgba(108, 99, 255, 0.1) 0%, rgba(255, 101, 132, 0.1) 100%);
            border-radius: 40px;
            padding: 3rem;
            margin-top: 2rem;
        }

        .sale-content {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 3rem;
            align-items: center;
        }

        .sale-image {
            width: 100%;
            border-radius: 20px;
            overflow: hidden;
        }

        .sale-image img {
            width: 100%;
            height: auto;
            transition: transform 0.3s;
        }

        .sale-image:hover img {
            transform: scale(1.05);
        }

        .timer {
            display: flex;
            gap: 1rem;
            margin: 2rem 0;
        }

        .time-box {
            background: var(--glass);
            backdrop-filter: blur(10px);
            padding: 1rem;
            border-radius: 15px;
            text-align: center;
            min-width: 80px;
            border: 1px solid var(--glass-border);
        }

        .time-number {
            font-size: 2rem;
            font-weight: 800;
            color: var(--primary);
        }

        /* Testimonials */
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .testimonial-card {
            background: var(--glass);
            backdrop-filter: blur(10px);
            padding: 2rem;
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            transition: transform 0.3s;
        }

        .testimonial-card:hover {
            transform: translateY(-10px);
        }

        .testimonial-text {
            font-style: italic;
            margin: 1rem 0;
            color: rgba(255, 255, 255, 0.9);
        }

        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-top: 1rem;
        }

        .author-avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            object-fit: cover;
        }

        /* Newsletter */
        .newsletter {
            background: linear-gradient(135deg, var(--primary) 0%, var(--accent) 100%);
            border-radius: 40px;
            padding: 4rem;
            text-align: center;
        }

        .newsletter h3 {
            font-size: 2rem;
            margin-bottom: 1rem;
        }

        .newsletter-form {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
            flex-wrap: wrap;
        }

        .newsletter-form input {
            padding: 1rem 1.5rem;
            border-radius: 50px;
            border: none;
            width: 300px;
            font-size: 1rem;
        }

        /* Footer */
        footer {
            background: var(--gray);
            padding: 3rem 2rem;
            margin-top: 4rem;
        }

        .footer-content {
            max-width: 1400px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .footer-links {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.7);
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--primary);
        }

        .social-links {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .social-links a {
            width: 40px;
            height: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: var(--glass);
            border-radius: 50%;
            transition: all 0.3s;
        }

        .social-links a:hover {
            background: var(--primary);
            transform: translateY(-5px);
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 {
                font-size: 2.5rem;
            }

            .header-inner {
                flex-wrap: wrap;
            }

            .nav-menu {
                display: none;
            }

            .sale-content {
                grid-template-columns: 1fr;
            }

            .categories-grid {
                grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
            }

            .products-grid {
                grid-template-columns: 1fr;
            }

            .timer {
                justify-content: center;
            }

            .stats {
                flex-direction: column;
            }
        }

        /* Animations */
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .fade-up {
            animation: fadeInUp 0.6s ease-out;
        }
    </style>
</head>

<body>
    <div class="animated-bg"></div>
    <div class="particles" id="particles"></div>

    <header id="header">
        <div class="header-inner">
            <div class="brand">
                <i class="fas fa-bolt"></i>
                <span>Nexus<span style="color: var(--primary);">Shop</span></span>
            </div>

            <div class="nav-menu">
                <ul>
                    <li><a href="#home">Home</a></li>
                    <li><a href="#products">Products</a></li>
                    <li><a href="#deals">Deals</a></li>
                    <li><a href="#about">About</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
            </div>

            <div style="display: flex; gap: 1rem; align-items: center;">
                <div class="search-bar">
                    <input type="text" id="searchInput" placeholder="Search products...">
                    <button id="searchBtn"><i class="fas fa-search"></i></button>
                </div>
                <div class="cart" id="cartBtn">
                    <i class="fas fa-shopping-cart fa-lg"></i>
                    <span class="cart-count" id="cartCount">0</span>
                </div>
            </div>
        </div>
    </header>

    <main>
        <!-- Hero Section -->
        <section class="hero" id="home">
            <div class="hero-content">
                <div class="hero-badge">
                    <i class="fas fa-fire"></i> Limited Time Offer
                </div>
                <h1>Experience Next-Gen Shopping</h1>
                <p>Discover curated collections from premium brands worldwide. Smart, fast, and secure — the future of e-commerce is here.</p>
                <div class="hero-buttons">
                    <button class="btn btn-primary" id="shopNowBtn">
                        <i class="fas fa-shopping-bag"></i> Shop Now
                    </button>
                    <button class="btn btn-outline" id="exploreBtn">
                        <i class="fas fa-play"></i> Explore
                    </button>
                </div>
            </div>
        </section>

        <!-- Stats Section -->
        <div class="stats">
            <div class="stat-card">
                <div class="stat-number" id="statProducts">0</div>
                <div>Products</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="statCustomers">0</div>
                <div>Happy Customers</div>
            </div>
            <div class="stat-card">
                <div class="stat-number" id="statCountries">0</div>
                <div>Countries</div>
            </div>
        </div>

        <!-- Categories Section -->
        <section class="section">
            <div class="container">
                <h2 class="section-title">Shop by Category</h2>
                <p class="section-subtitle">Explore our curated collections</p>
                <div class="categories-grid" id="categoriesGrid"></div>
            </div>
        </section>

        <!-- Products Section -->
        <section class="section" id="products">
            <div class="container">
                <h2 class="section-title">Featured Products</h2>
                <p class="section-subtitle">Hand-picked just for you</p>
                <div class="products-grid" id="productsGrid"></div>
            </div>
        </section>

        <!-- Flash Sale Section -->
        <section class="section" id="deals">
            <div class="container">
                <div class="flash-sale">
                    <div class="sale-content">
                        <div class="sale-image">
                            <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1200&q=80" alt="Flash Sale">
                        </div>
                        <div>
                            <h2 style="font-size: 2.5rem;">Flash Sale</h2>
                            <p style="font-size: 1.1rem;">Limited time offer! Get up to 50% off on selected items.</p>
                            <div class="timer">
                                <div class="time-box">
                                    <div class="time-number" id="days">00</div>
                                    <div>Days</div>
                                </div>
                                <div class="time-box">
                                    <div class="time-number" id="hours">00</div>
                                    <div>Hours</div>
                                </div>
                                <div class="time-box">
                                    <div class="time-number" id="minutes">00</div>
                                    <div>Mins</div>
                                </div>
                                <div class="time-box">
                                    <div class="time-number" id="seconds">00</div>
                                    <div>Secs</div>
                                </div>
                            </div>
                            <button class="btn btn-primary" id="grabDealBtn">
                                <i class="fas fa-bolt"></i> Grab Deal
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section -->
        <section class="section">
            <div class="container">
                <h2 class="section-title">What Our Customers Say</h2>
                <p class="section-subtitle">Join thousands of satisfied shoppers</p>
                <div class="testimonials-grid" id="testimonialsGrid"></div>
            </div>
        </section>

        <!-- Newsletter Section -->
        <section class="section">
            <div class="container">
                <div class="newsletter">
                    <h3>Stay in the Loop</h3>
                    <p>Subscribe to get exclusive offers and new arrivals</p>
                    <form class="newsletter-form" id="newsletterForm">
                        <input type="email" id="newsletterEmail" placeholder="Enter your email" required>
                        <button type="submit" class="btn btn-primary">Subscribe <i class="fas fa-paper-plane"></i></button>
                    </form>
                    <div id="newsletterMsg" style="margin-top: 1rem;"></div>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <div class="footer-content">
            <div>
                <div class="brand" style="margin-bottom: 1rem;">
                    <i class="fas fa-bolt"></i>
                    <span>NexusShop</span>
                </div>
                <p style="color: rgba(255,255,255,0.7);">Next-gen e-commerce experience</p>
                <div class="social-links">
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
            <div class="footer-links">
                <h4>Shop</h4>
                <a href="#">All Products</a>
                <a href="#">New Arrivals</a>
                <a href="#">Best Sellers</a>
                <a href="#">Sale</a>
            </div>
            <div class="footer-links">
                <h4>Support</h4>
                <a href="#">Help Center</a>
                <a href="#">Shipping Info</a>
                <a href="#">Returns</a>
                <a href="#">Contact Us</a>
            </div>
            <div class="footer-links">
                <h4>Company</h4>
                <a href="#">About Us</a>
                <a href="#">Careers</a>
                <a href="#">Press</a>
                <a href="#">Terms & Conditions</a>
            </div>
        </div>
        <div style="text-align: center; margin-top: 3rem; color: rgba(255,255,255,0.5);">
            <p>&copy; 2024 NexusShop. All rights reserved. <span id="year"></span></p>
        </div>
    </footer>

    <script>
        // Initialize GSAP ScrollTrigger
        gsap.registerPlugin(ScrollTrigger);

        // Sample Data
        const categories = [
            { id: 1, name: "Electronics", icon: "fa-microchip", color: "#6c63ff" },
            { id: 2, name: "Fashion", icon: "fa-tshirt", color: "#ff6584" },
            { id: 3, name: "Home & Living", icon: "fa-home", color: "#00d26a" },
            { id: 4, name: "Beauty", icon: "fa-spa", color: "#ffc107" },
            { id: 5, name: "Sports", icon: "fa-futbol", color: "#4facfe" },
            { id: 6, name: "Books", icon: "fa-book", color: "#764ba2" }
        ];

        const products = [
            { id: 1, name: "Ultrabook Pro X1", category: "Electronics", price: 1299, oldPrice: 1599, rating: 5, reviews: 128, image: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=600&q=80", badge: "Hot" },
            { id: 2, name: "Wireless Headphones", category: "Electronics", price: 299, oldPrice: 399, rating: 4.5, reviews: 234, image: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=600&q=80", badge: "Sale" },
            { id: 3, name: "Smart Watch Ultra", category: "Electronics", price: 449, rating: 4.8, reviews: 89, image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=600&q=80" },
            { id: 4, name: "Designer Sneakers", category: "Fashion", price: 189, oldPrice: 249, rating: 4.6, reviews: 167, image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?auto=format&fit=crop&w=600&q=80", badge: "Limited" },
            { id: 5, name: "Leather Jacket", category: "Fashion", price: 299, rating: 4.7, reviews: 92, image: "https://images.unsplash.com/photo-1551028719-00167b16eac5?auto=format&fit=crop&w=600&q=80" },
            { id: 6, name: "Minimalist Backpack", category: "Fashion", price: 79, oldPrice: 129, rating: 4.4, reviews: 203, image: "https://images.unsplash.com/photo-1553062407-98eeb64c6a62?auto=format&fit=crop&w=600&q=80", badge: "Sale" },
            { id: 7, name: "Coffee Maker Pro", category: "Home & Living", price: 199, rating: 4.9, reviews: 156, image: "https://images.unsplash.com/photo-1517668808822-9bba02b6f840?auto=format&fit=crop&w=600&q=80" },
            { id: 8, name: "Yoga Mat Premium", category: "Sports", price: 49, rating: 4.5, reviews: 312, image: "https://images.unsplash.com/photo-1592432678016-e910b452f9a2?auto=format&fit=crop&w=600&q=80" }
        ];

        const testimonials = [
            { name: "Sarah Johnson", role: "Verified Buyer", text: "Absolutely love the quality! Fast shipping and great customer service.", rating: 5, avatar: "https://randomuser.me/api/portraits/women/1.jpg" },
            { name: "Michael Chen", role: "Tech Enthusiast", text: "Best shopping experience ever. The products are exactly as described.", rating: 5, avatar: "https://randomuser.me/api/portraits/men/2.jpg" },
            { name: "Emily Rodriguez", role: "Fashion Blogger", text: "NexusShop has become my go-to for everything. Highly recommended!", rating: 5, avatar: "https://randomuser.me/api/portraits/women/3.jpg" }
        ];

        let cartCount = 0;

        // Render functions
        function renderCategories() {
            const grid = document.getElementById('categoriesGrid');
            grid.innerHTML = categories.map(cat => `
                <div class="category-card" data-category="${cat.name}">
                    <div class="category-icon" style="color: ${cat.color}">
                        <i class="fas ${cat.icon}"></i>
                    </div>
                    <h3>${cat.name}</h3>
                    <p style="color: rgba(255,255,255,0.6); font-size: 0.9rem;">Shop Now →</p>
                </div>
            `).join('');
        }

        function renderProducts(filter = '') {
            const grid = document.getElementById('productsGrid');
            let filteredProducts = products;
            if (filter) {
                filteredProducts = products.filter(p => 
                    p.name.toLowerCase().includes(filter.toLowerCase()) || 
                    p.category.toLowerCase().includes(filter.toLowerCase())
                );
            }
            
            grid.innerHTML = filteredProducts.map(product => `
                <div class="product-card">
                    ${product.badge ? `<div class="product-badge">${product.badge}</div>` : ''}
                    <img src="${product.image}" class="product-image" alt="${product.name}">
                    <div class="product-info">
                        <div class="product-title">${product.name}</div>
                        <div class="product-price">
                            $${product.price}
                            ${product.oldPrice ? `<span class="product-old-price">$${product.oldPrice}</span>` : ''}
                        </div>
                        <div class="product-rating">
                            ${'★'.repeat(Math.floor(product.rating))}${product.rating % 1 ? '½' : ''} 
                            <span style="color: rgba(255,255,255,0.5);">(${product.reviews})</span>
                        </div>
                        <div class="product-actions">
                            <button class="btn-add" onclick="addToCart(${product.id})">
                                <i class="fas fa-cart-plus"></i> Add to Cart
                            </button>
                            <button class="btn-wishlist" onclick="addToWishlist(${product.id})">
                                <i class="far fa-heart"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        function renderTestimonials() {
            const grid = document.getElementById('testimonialsGrid');
            grid.innerHTML = testimonials.map(t => `
                <div class="testimonial-card">
                    <div class="product-rating">
                        ${'★'.repeat(t.rating)}
                    </div>
                    <p class="testimonial-text">"${t.text}"</p>
                    <div class="testimonial-author">
                        <img src="${t.avatar}" class="author-avatar" alt="${t.name}">
                        <div>
                            <div style="font-weight: 600;">${t.name}</div>
                            <div style="color: rgba(255,255,255,0.5); font-size: 0.8rem;">${t.role}</div>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // Cart functions
        window.addToCart = function(productId) {
            cartCount++;
            document.getElementById('cartCount').textContent = cartCount;
            
            // Animation feedback
            const btn = event.target.closest('.btn-add');
            if (btn) {
                const originalText = btn.innerHTML;
                btn.innerHTML = '<i class="fas fa-check"></i> Added!';
                setTimeout(() => {
                    btn.innerHTML = originalText;
                }, 1000);
            }
            
            // Show notification
            showNotification('Item added to cart!', 'success');
        }

        window.addToWishlist = function(productId) {
            showNotification('Added to wishlist!', 'info');
        }

        function showNotification(message, type) {
            const notification = document.createElement('div');
            notification.style.cssText = `
                position: fixed;
                bottom: 20px;
                right: 20px;
                background: ${type === 'success' ? '#00d26a' : '#6c63ff'};
                color: white;
                padding: 1rem 2rem;
                border-radius: 10px;
                z-index: 10000;
                animation: slideIn 0.3s ease;
            `;
            notification.textContent = message;
            document.body.appendChild(notification);
            setTimeout(() => notification.remove(), 3000);
        }

        // Countdown timer
        function startCountdown() {
            const targetDate = new Date();
            targetDate.setDate(targetDate.getDate() + 2);
            targetDate.setHours(23, 59, 59, 999);
            
            function updateTimer() {
                const now = new Date();
                const diff = targetDate - now;
                
                const days = Math.floor(diff / (1000 * 60 * 60 * 24));
                const hours = Math.floor((diff % (24 * 60 * 60 * 1000)) / (60 * 60 * 1000));
                const minutes = Math.floor((diff % (60 * 60 * 1000)) / (60 * 1000));
                const seconds = Math.floor((diff % (60 * 1000)) / 1000);
                
                document.getElementById('days').textContent = String(days).padStart(2, '0');
                document.getElementById('hours').textContent = String(hours).padStart(2, '0');
                document.getElementById('minutes').textContent = String(minutes).padStart(2, '0');
                document.getElementById('seconds').textContent = String(seconds).padStart(2, '0');
            }
            
            updateTimer();
            setInterval(updateTimer, 1000);
        }

        // Animate stats counter
        function animateStats() {
            gsap.fromTo("#statProducts", 
                { innerText: 0 },
                { innerText: products.length, duration: 2, snap: { innerText: 1 }, scrollTrigger: { trigger: ".stats", start: "top 80%" } }
            );
            gsap.fromTo("#statCustomers", 
                { innerText: 0 },
                { innerText: 15234, duration: 2, snap: { innerText: 100 }, scrollTrigger: { trigger: ".stats", start: "top 80%" } }
            );
            gsap.fromTo("#statCountries", 
                { innerText: 0 },
                { innerText: 45, duration: 2, snap: { innerText: 1 }, scrollTrigger: { trigger: ".stats", start: "top 80%" } }
            );
        }

        // Create floating particles
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            for (let i = 0; i < 50; i++) {
                const particle = document.createElement('div');
                particle.classList.add('particle');
                const size = Math.random() * 5 + 2;
                particle.style.width = `${size}px`;
                particle.style.height = `${size}px`;
                particle.style.left = `${Math.random() * 100}%`;
                particle.style.animationDuration = `${Math.random() * 10 + 10}s`;
                particle.style.animationDelay = `${Math.random() * 5}s`;
                particlesContainer.appendChild(particle);
            }
        }

        // Header scroll effect
        window.addEventListener('scroll', () => {
            const header = document.getElementById('header');
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });

        // Search functionality
        document.getElementById('searchBtn').addEventListener('click', () => {
            const query = document.getElementById('searchInput').value;
            renderProducts(query);
        });

        document.getElementById('searchInput').addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                const query = e.target.value;
                renderProducts(query);
            }
        });

        // Category filter
        document.addEventListener('click', (e) => {
            const categoryCard = e.target.closest('.category-card');
            if (categoryCard) {
                const category = categoryCard.querySelector('h3').textContent;
                renderProducts(category);
                document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
            }
        });

        // Hero buttons
        document.getElementById('shopNowBtn').addEventListener('click', () => {
            document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
        });

        document.getElementById('exploreBtn').addEventListener('click', () => {
            document.getElementById('categoriesGrid').scrollIntoView({ behavior: 'smooth' });
        });

        document.getElementById('grabDealBtn').addEventListener('click', () => {
            showNotification('Limited offer added to cart!', 'success');
        });

        // Newsletter subscription
        document.getElementById('newsletterForm').addEventListener('submit', (e) => {
            e.preventDefault();
            const email = document.getElementById('newsletterEmail').value;
            if (email) {
                const msgDiv = document.getElementById('newsletterMsg');
                msgDiv.innerHTML = '<i class="fas fa-check-circle"></i> Thanks for subscribing!';
                msgDiv.style.color = '#00d26a';
                document.getElementById('newsletterEmail').value = '';
                setTimeout(() => {
                    msgDiv.innerHTML = '';
                }, 3000);
            }
        });

        // GSAP Animations
        gsap.from(".hero-content", {
            opacity: 0,
            y: 50,
            duration: 1,
            delay: 0.5
        });

        gsap.from(".stat-card", {
            scrollTrigger: {
                trigger: ".stats",
                start: "top 80%",
            },
            opacity: 0,
            y: 30,
            duration: 0.6,
            stagger: 0.2
        });

        // Initialize
        function init() {
            createParticles();
            renderCategories();
            renderProducts();
            renderTestimonials();
            startCountdown();
            animateStats();
            document.getElementById('year').textContent = new Date().getFullYear();
        }

        init();
    </script>
</body>

</html>
