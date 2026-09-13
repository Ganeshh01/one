<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NexusShop — Animated Modern E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&amp;family=Playfair+Display:ital,wght@0,600;0,700;1,400&amp;display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous" />

    <style>
        /* ========== ROOT VARIABLES & ANIMATIONS ========== */
        :root {
            --bg: #0f111a;
            --bg-surface: #161926;
            --bg-card: #1e2235;
            --primary: #ffffff;
            --muted: #94a3b8;
            --muted-light: #64748b;
            --accent: #ff5e62;
            --accent-gradient: linear-gradient(135deg, #ff9966 0%, #ff5e62 100%);
            --glass-bg: rgba(30, 34, 53, 0.75);
            --glass-border: rgba(255, 255, 255, 0.08);
            --success: #10b981;
            --warning: #f59e0b;
            --radius: 20px;
            --shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.5);
            --shadow-glow: 0 0 25px rgba(255, 94, 98, 0.25);
            --transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
            --container: 1280px;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-12px) rotate(1deg); }
        }

        @keyframes pulseGlow {
            0%, 100% { box-shadow: 0 0 15px rgba(255, 94, 98, 0.3); }
            50% { box-shadow: 0 0 35px rgba(255, 94, 98, 0.7); }
        }

        @keyframes toastIn {
            from { transform: translateY(100%) scale(0.8); opacity: 0; }
            to { transform: translateY(0) scale(1); opacity: 1; }
        }

        @keyframes toastOut {
            from { transform: translateY(0) scale(1); opacity: 1; }
            to { transform: translateY(100%) scale(0.8); opacity: 0; }
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        html { scroll-behavior: smooth; }
        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg);
            color: var(--primary);
            line-height: 1.6;
            overflow-x: hidden;
            -webkit-font-smoothing: antialiased;
        }
        a { color: inherit; text-decoration: none; }
        button { cursor: pointer; font-family: inherit; border: none; background: none; color: inherit; }
        input { font-family: inherit; }

        .container {
            width: 100%;
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        .reveal {
            opacity: 0;
            transform: translateY(40px);
            transition: opacity 0.8s cubic-bezier(0.16, 1, 0.3, 1), transform 0.8s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .reveal.active {
            opacity: 1;
            transform: translateY(0);
        }

        .btn {
            position: relative;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            padding: 14px 32px;
            border-radius: 999px;
            font-weight: 700;
            font-size: 15px;
            transition: var(--transition);
            overflow: hidden;
        }
        .btn-primary {
            background: var(--accent-gradient);
            color: #fff;
            box-shadow: 0 8px 25px rgba(255, 94, 98, 0.35);
        }
        .btn-primary:hover {
            transform: translateY(-3px) scale(1.02);
            box-shadow: 0 12px 35px rgba(255, 94, 98, 0.5);
        }
        .btn-secondary {
            background: rgba(255, 255, 255, 0.08);
            color: #fff;
            border: 1px solid var(--glass-border);
            backdrop-filter: blur(10px);
        }
        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.16);
            transform: translateY(-3px);
        }

        header {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: rgba(15, 17, 26, 0.85);
            backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--glass-border);
        }
        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            padding: 16px 0;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 12px;
            font-weight: 800;
            font-size: 24px;
        }
        .brand-icon {
            width: 42px;
            height: 42px;
            border-radius: 12px;
            background: var(--accent-gradient);
            display: grid;
            place-items: center;
            color: #fff;
            font-size: 20px;
            animation: pulseGlow 3s infinite;
        }
        .brand span {
            background: linear-gradient(135deg, #ffffff 0%, #cbd5e1 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .brand .accent {
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        nav.main-nav ul { display: flex; gap: 8px; list-style: none; }
        nav.main-nav a {
            padding: 10px 18px;
            border-radius: 999px;
            font-weight: 600;
            font-size: 14px;
            color: var(--muted);
            transition: var(--transition);
            display: flex;
            align-items: center;
            gap: 8px;
        }
        nav.main-nav a:hover, nav.main-nav a.active {
            color: #fff;
            background: rgba(255, 255, 255, 0.08);
        }

        .header-actions { display: flex; align-items: center; gap: 12px; }
        .search-wrap {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            border-radius: 999px;
            padding: 4px 6px 4px 18px;
            width: 240px;
            transition: var(--transition);
        }
        .search-wrap input {
            border: 0;
            background: transparent;
            outline: none;
            color: #fff;
            font-size: 14px;
            width: 100%;
        }
        .search-wrap button {
            width: 34px; height: 34px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: grid; place-items: center;
            color: #fff;
        }

        .icon-btn {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            display: grid;
            place-items: center;
            font-size: 17px;
            color: #fff;
            position: relative;
            transition: var(--transition);
        }
        .badge-count {
            position: absolute;
            top: -4px; right: -4px;
            background: var(--accent-gradient);
            color: #fff;
            font-size: 11px;
            font-weight: 800;
            width: 22px; height: 22px;
            border-radius: 50%;
            display: grid; place-items: center;
            border: 2px solid var(--bg);
        }

        .hero {
            position: relative;
            padding: 90px 0 70px;
            margin: 20px 24px 0;
            border-radius: 32px;
            overflow: hidden;
            background: var(--bg-surface);
            border: 1px solid var(--glass-border);
        }
        .hero-grid {
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 40px;
            align-items: center;
        }
        .hero-tag {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 20px;
            border-radius: 999px;
            background: rgba(255, 94, 98, 0.12);
            border: 1px solid rgba(255, 94, 98, 0.3);
            color: var(--accent);
            font-size: 13px;
            font-weight: 700;
            margin-bottom: 24px;
        }
        .hero h1 {
            font-family: 'Playfair Display', serif;
            font-size: 58px;
            font-weight: 700;
            line-height: 1.1;
            margin-bottom: 20px;
            background: linear-gradient(135deg, #ffffff 30%, #94a3b8 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .hero p { color: var(--muted); font-size: 18px; margin-bottom: 36px; }
        .hero-actions { display: flex; gap: 16px; flex-wrap: wrap; }
        .hero-img-wrap {
            position: relative;
            width: 100%;
            max-width: 420px;
            border-radius: 28px;
            overflow: hidden;
            border: 1px solid var(--glass-border);
            animation: float 6s ease-in-out infinite;
        }
        .hero-img-wrap img { width: 100%; height: 100%; object-fit: cover; }

        .section { padding: 80px 0; }
        .section-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            margin-bottom: 44px;
            flex-wrap: wrap;
            gap: 20px;
        }
        .section-header h2 { font-size: 36px; font-weight: 800; }
        .section-header p { color: var(--muted); font-size: 16px; margin-top: 6px; }

        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 20px;
        }
        .cat-card {
            background: var(--bg-card);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius);
            padding: 28px 20px;
            text-align: center;
            transition: var(--transition);
            cursor: pointer;
        }
        .cat-card:hover {
            transform: translateY(-10px);
            border-color: rgba(255, 94, 98, 0.4);
            box-shadow: var(--shadow-glow);
        }
        .cat-icon {
            width: 64px; height: 64px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.06);
            display: grid; place-items: center;
            margin: 0 auto 16px;
            font-size: 26px;
            color: var(--accent);
        }
        .cat-card h4 { font-size: 16px; font-weight: 700; margin-bottom: 4px; }
        .cat-card span { font-size: 13px; color: var(--muted); }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
        }
        .product-card {
            background: var(--bg-card);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius);
            overflow: hidden;
            transition: var(--transition);
            display: flex;
            flex-direction: column;
        }
        .product-card:hover { transform: translateY(-8px); }
        .product-img-wrap {
            position: relative;
            aspect-ratio: 1 / 1;
            overflow: hidden;
            background: var(--bg-surface);
        }
        .product-img-wrap img { width: 100%; height: 100%; object-fit: cover; }
        .product-tag {
            position: absolute;
            top: 14px; left: 14px;
            background: var(--accent-gradient);
            color: #fff;
            font-size: 11px; font-weight: 800;
            padding: 4px 12px;
            border-radius: 999px;
            text-transform: uppercase;
        }
        .product-info { padding: 20px; display: flex; flex-direction: column; flex: 1; }
        .product-category { font-size: 12px; color: var(--accent); font-weight: 700; text-transform: uppercase; }
        .product-title { font-size: 16px; font-weight: 700; margin: 6px 0 12px; }
        .product-meta { display: flex; align-items: center; justify-content: space-between; margin-top: auto; }
        .product-price { font-size: 20px; font-weight: 800; }
        .add-cart-btn {
            width: 42px; height: 42px;
            border-radius: 14px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid var(--glass-border);
            color: #fff;
            display: grid; place-items: center;
            transition: var(--transition);
        }
        .add-cart-btn:hover { background: var(--accent-gradient); border-color: transparent; }

        .deal-card {
            background: linear-gradient(135deg, #1e2235 0%, #161926 100%);
            border: 1px solid var(--glass-border);
            border-radius: 32px;
            overflow: hidden;
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
        .deal-img-container { min-height: 380px; }
        .deal-img-container img { width: 100%; height: 100%; object-fit: cover; }
        .deal-details { padding: 50px; display: flex; flex-direction: column; justify-content: center; }
        .deal-details h3 { font-size: 34px; font-weight: 800; margin-bottom: 12px; }
        .deal-details p { color: var(--muted); margin-bottom: 24px; }
        .timer-row { display: flex; gap: 14px; margin-bottom: 28px; }
        .timer-box {
            background: rgba(15, 17, 26, 0.8);
            border: 1px solid var(--glass-border);
            padding: 12px 18px;
            border-radius: 16px;
            min-width: 76px;
            text-align: center;
        }
        .timer-box .num { font-size: 28px; font-weight: 800; color: var(--accent); }
        .timer-box .lbl { font-size: 11px; color: var(--muted); text-transform: uppercase; }

        .cart-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(8px);
            z-index: 2000;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.4s ease;
        }
        .cart-overlay.active { opacity: 1; pointer-events: auto; }
        .cart-drawer {
            position: fixed;
            top: 0; right: 0; bottom: 0;
            width: 100%; max-width: 440px;
            background: var(--bg-surface);
            border-left: 1px solid var(--glass-border);
            z-index: 2001;
            transform: translateX(100%);
            transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            display: flex;
            flex-direction: column;
            padding: 28px;
        }
        .cart-overlay.active .cart-drawer { transform: translateX(0); }
        .cart-header { display: flex; align-items: center; justify-content: space-between; padding-bottom: 20px; border-bottom: 1px solid var(--glass-border); }
        .cart-items-list { flex: 1; overflow-y: auto; padding: 20px 0; display: flex; flex-direction: column; gap: 16px; }

        .toast-container {
            position: fixed;
            bottom: 24px; right: 24px;
            z-index: 3000;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }
        .toast {
            background: var(--bg-card);
            border: 1px solid var(--glass-border);
            padding: 16px 22px;
            border-radius: 16px;
            color: #fff;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
            animation: toastIn 0.4s forwards;
        }

        footer {
            margin-top: 80px;
            padding: 60px 0 30px;
            background: var(--bg-surface);
            border-top: 1px solid var(--glass-border);
        }
        .footer-grid { display: grid; grid-template-columns: 2fr 1fr 1fr 1fr; gap: 40px; margin-bottom: 50px; }
        .footer-bottom { text-align: center; padding-top: 30px; border-top: 1px solid var(--glass-border); color: var(--muted-light); }

        @media (max-width: 1024px) {
            .hero-grid { grid-template-columns: 1fr; text-align: center; }
            .categories-grid { grid-template-columns: repeat(3, 1fr); }
            .products-grid { grid-template-columns: repeat(2, 1fr); }
            .deal-card { grid-template-columns: 1fr; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 768px) {
            nav.main-nav { display: none; }
            .categories-grid { grid-template-columns: repeat(2, 1fr); }
            .products-grid { grid-template-columns: repeat(1, 1fr); }
            .footer-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>

<body>

    <!-- ===== HEADER ===== -->
    <header>
        <div class="container header-inner">
            <div style="display:flex;align-items:center;gap:16px;">
                <a href="#" class="brand">
                    <span class="brand-icon"><i class="fas fa-bolt" aria-hidden="true"></i></span>
                    <span>Nexus<span class="accent">Shop</span></span>
                </a>
            </div>

            <nav class="main-nav" aria-label="Main Navigation">
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-home" aria-hidden="true"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large" aria-hidden="true"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire" aria-hidden="true"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag" aria-hidden="true"></i> Deals</a></li>
                </ul>
            </nav>

            <div class="header-actions">
                <div class="search-wrap">
                    <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search products" />
                    <button id="searchBtn" aria-label="Search"><i class="fas fa-search" aria-hidden="true"></i></button>
                </div>

                <button class="icon-btn" title="Wishlist" id="wishlistHeaderBtn" aria-label="View Wishlist">
                    <i class="far fa-heart" aria-hidden="true"></i>
                    <span class="badge-count" id="wishlistCount">0</span>
                </button>
                
                <button class="icon-btn" title="Cart" id="cartDrawerBtn" aria-label="View Shopping Cart">
                    <i class="fas fa-shopping-bag" aria-hidden="true"></i>
                    <span class="badge-count" id="cartCount">0</span>
                </button>
            </div>
        </div>
    </header>

    <!-- ===== MAIN CONTENT ===== -->
    <main>
        <!-- HERO -->
        <section class="hero">
            <div class="container hero-grid">
                <div class="hero-content reveal">
                    <div class="hero-tag"><i class="fas fa-sparkles" aria-hidden="true"></i> Next-Gen Collection 2026</div>
                    <h1>Experience Shopping Reimagined</h1>
                    <p>Discover ultra-premium luxury tech, curated fashion, and lifestyle essentials with instant global shipping.</p>
                    <div class="hero-actions">
                        <button class="btn btn-primary" id="shopNow"><i class="fas fa-shopping-cart" aria-hidden="true"></i> Explore Products</button>
                        <button class="btn btn-secondary" id="exploreDeals"><i class="fas fa-bolt" aria-hidden="true"></i> View Flash Deals</button>
                    </div>
                </div>

                <div class="hero-visual reveal">
                    <div class="hero-img-wrap">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&amp;fit=crop&amp;w=800&amp;q=80" alt="Premium Headphones Showcase" />
                    </div>
                </div>
            </div>
        </section>

        <!-- CATEGORIES -->
        <section class="section" id="categories">
            <div class="container">
                <div class="section-header reveal">
                    <div>
                        <h2>Featured Categories</h2>
                        <p>Explore high quality items across top categories</p>
                    </div>
                </div>
                <div class="categories-grid" id="categoriesGrid"></div>
            </div>
        </section>

        <!-- PRODUCTS -->
        <section class="section" id="products">
            <div class="container">
                <div class="section-header reveal">
                    <div>
                        <h2>Trending Innovations</h2>
                        <p>Hand-picked tech &amp; gear trending worldwide</p>
                    </div>
                </div>
                <div class="products-grid" id="productsGrid"></div>
            </div>
        </section>

        <!-- FLASH DEAL -->
        <section class="section" id="deals">
            <div class="container">
                <div class="deal-card reveal">
                    <div class="deal-img-container">
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&amp;fit=crop&amp;w=1000&amp;q=80" alt="MacBook Air M2 Pro Deal" />
                    </div>
                    <div class="deal-details">
                        <h3>MacBook Air M2 Pro</h3>
                        <p>Unmatched M2 processing speed wrapped in an ultra-thin aerospace aluminum chassis.</p>
                        
                        <div class="timer-row">
                            <div class="timer-box"><div class="num" id="dealDays">00</div><div class="lbl">Days</div></div>
                            <div class="timer-box"><div class="num" id="dealHours">00</div><div class="lbl">Hours</div></div>
                            <div class="timer-box"><div class="num" id="dealMins">00</div><div class="lbl">Mins</div></div>
                            <div class="timer-box"><div class="num" id="dealSecs">00</div><div class="lbl">Secs</div></div>
                        </div>

                        <button class="btn btn-primary" id="claimDealBtn"><i class="fas fa-cart-plus" aria-hidden="true"></i> Claim Offer ($999)</button>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- ===== CART DRAWER ===== -->
    <div class="cart-overlay" id="cartOverlay">
        <div class="cart-drawer">
            <div class="cart-header">
                <h3>Shopping Cart (<span id="cartDrawerCount">0</span>)</h3>
                <button class="close-cart" id="closeCart" aria-label="Close Cart"><i class="fas fa-times" aria-hidden="true"></i></button>
            </div>
            <div class="cart-items-list" id="cartItemsList"></div>
            <div style="border-top:1px solid var(--glass-border);padding-top:20px;">
                <div style="display:flex;justify-content:space-between;font-size:18px;font-weight:800;margin-bottom:20px;">
                    <span>Subtotal:</span>
                    <span id="cartSubtotal">$0.00</span>
                </div>
                <button class="btn btn-primary" style="width:100%;"><i class="fas fa-lock" aria-hidden="true"></i> Proceed to Checkout</button>
            </div>
        </div>
    </div>

    <!-- ===== TOAST CONTAINER ===== -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- ===== FOOTER ===== -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div>
                    <a href="#" class="brand">
                        <span class="brand-icon"><i class="fas fa-bolt" aria-hidden="true"></i></span>
                        <span>Nexus<span class="accent">Shop</span></span>
                    </a>
                    <p style="color:var(--muted);margin-top:14px;">Pioneering ultra-sleek storefront experiences.</p>
                </div>
                <div>
                    <h5>Categories</h5>
                    <p style="color:var(--muted);font-size:14px;margin-top:8px;">Smartphones &bull; Laptops &bull; Audio</p>
                </div>
                <div>
                    <h5>Customer Care</h5>
                    <p style="color:var(--muted);font-size:14px;margin-top:8px;">Shipping &bull; Returns &bull; Support</p>
                </div>
                <div>
                    <h5>Legal</h5>
                    <p style="color:var(--muted);font-size:14px;margin-top:8px;">Privacy &bull; Terms</p>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; <span id="currentYear"></span> NexusShop Inc. All rights reserved.
            </div>
        </div>
    </footer>

    <!-- ===== JAVASCRIPT ===== -->
    <script>
        var CATEGORIES = [
            { id: 'smartphones', name: 'Smartphones', icon: 'fa-mobile-alt', count: '28 Items' },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: '16 Items' },
            { id: 'audio', name: 'Audio Gear', icon: 'fa-headphones-alt', count: '34 Items' },
            { id: 'wearables', name: 'Wearables', icon: 'fa-clock', count: '22 Items' },
            { id: 'gaming', name: 'Gaming', icon: 'fa-gamepad', count: '19 Items' },
            { id: 'cameras', name: 'Cameras', icon: 'fa-camera-retro', count: '15 Items' }
        ];

        var PRODUCTS = [
            { id: 1, title: 'iPhone 15 Pro Max', price: 1199, category: 'Smartphones', tag: 'New', img: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=600&q=80' },
            { id: 2, title: 'Sony WH-1000XM5', price: 399, category: 'Audio Gear', tag: 'Bestseller', img: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&w=600&q=80' },
            { id: 3, title: 'Apple Watch Ultra 2', price: 799, category: 'Wearables', tag: 'Hot', img: 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?auto=format&fit=crop&w=600&q=80' },
            { id: 4, title: 'ASUS ROG Gaming Laptop', price: 2199, category: 'Laptops', tag: 'Sale', img: 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=600&q=80' }
        ];

        var cartState = [];

        function renderCategories() {
            var container = document.getElementById('categoriesGrid');
            var html = '';
            for (var i = 0; i < CATEGORIES.length; i++) {
                var cat = CATEGORIES[i];
                html += '<div class="cat-card reveal">' +
                            '<div class="cat-icon"><i class="fas ' + cat.icon + '"></i></div>' +
                            '<h4>' + cat.name + '</h4>' +
                            '<span>' + cat.count + '</span>' +
                        '</div>';
            }
            container.innerHTML = html;
        }

        function renderProducts(list) {
            if (!list) list = PRODUCTS;
            var container = document.getElementById('productsGrid');
            var html = '';
            for (var i = 0; i < list.length; i++) {
                var p = list[i];
                html += '<div class="product-card reveal">' +
                            '<div class="product-img-wrap">' +
                                '<img src="' + p.img + '" alt="' + p.title + '" loading="lazy" />' +
                                '<span class="product-tag">' + p.tag + '</span>' +
                            '</div>' +
                            '<div class="product-info">' +
                                '<span class="product-category">' + p.category + '</span>' +
                                '<h4 class="product-title">' + p.title + '</h4>' +
                                '<div class="product-meta">' +
                                    '<div class="product-price">$' + p.price + '</div>' +
                                    '<button class="add-cart-btn" onclick="addToCart(' + p.id + ')">' +
                                        '<i class="fas fa-plus"></i>' +
                                    '</button>' +
                                '</div>' +
                            '</div>' +
                        '</div>';
            }
            container.innerHTML = html;
            initScrollObserve();
        }

        function addToCart(productId) {
            var product = null;
            for (var i = 0; i < PRODUCTS.length; i++) {
                if (PRODUCTS[i].id === productId) {
                    product = PRODUCTS[i];
                    break;
                }
            }
            if (!product) {
                product = { id: 99, title: 'MacBook Air M2 Pro', price: 999, img: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80' };
            }

            var existing = null;
            for (var j = 0; j < cartState.length; j++) {
                if (cartState[j].id === product.id) {
                    existing = cartState[j];
                    break;
                }
            }

            if (existing) {
                existing.qty += 1;
            } else {
                cartState.push({ id: product.id, title: product.title, price: product.price, img: product.img, qty: 1 });
            }
            updateCartUI();
            showToast('Added item to shopping cart!');
        }

        function updateCartUI() {
            var totalQty = 0;
            var subtotal = 0;
            for (var i = 0; i < cartState.length; i++) {
                totalQty += cartState[i].qty;
                subtotal += (cartState[i].price * cartState[i].qty);
            }

            document.getElementById('cartCount').textContent = totalQty;
            document.getElementById('cartDrawerCount').textContent = totalQty;
            document.getElementById('cartSubtotal').textContent = '$' + subtotal.toLocaleString();

            var listContainer = document.getElementById('cartItemsList');
            if (cartState.length === 0) {
                listContainer.innerHTML = '<div style="text-align:center;color:var(--muted);padding:40px 0;">Cart is empty.</div>';
            } else {
                var html = '';
                for (var k = 0; k < cartState.length; k++) {
                    var item = cartState[k];
                    html += '<div style="display:flex;align-items:center;gap:14px;background:var(--bg-card);padding:12px;border-radius:12px;">' +
                                '<img src="' + item.img + '" alt="' + item.title + '" style="width:50px;height:50px;border-radius:8px;object-fit:cover;" />' +
                                '<div>' +
                                    '<div style="font-weight:700;font-size:14px;">' + item.title + '</div>' +
                                    '<div style="color:var(--accent);font-weight:800;">$' + item.price + ' x ' + item.qty + '</div>' +
                                '</div>' +
                            '</div>';
                }
                listContainer.innerHTML = html;
            }
        }

        function showToast(message) {
            var container = document.getElementById('toastContainer');
            var toast = document.createElement('div');
            toast.className = 'toast';
            toast.innerHTML = '<i class="fas fa-check-circle"></i> <span>' + message + '</span>';
            container.appendChild(toast);
            setTimeout(function() {
                toast.style.animation = 'toastOut 0.4s forwards';
                setTimeout(function() { toast.remove(); }, 400);
            }, 3000);
        }

        function initScrollObserve() {
            var observer = new IntersectionObserver(function(entries) {
                for (var i = 0; i < entries.length; i++) {
                    if (entries[i].isIntersecting) {
                        entries[i].target.classList.add('active');
                    }
                }
            }, { threshold: 0.1 });

            var reveals = document.querySelectorAll('.reveal');
            for (var j = 0; j < reveals.length; j++) {
                observer.observe(reveals[j]);
            }
        }

        function startCountdown() {
            var target = new Date().getTime() + (3 * 24 * 60 * 60 * 1000);
            setInterval(function() {
                var now = new Date().getTime();
                var diff = target - now;
                if (diff <= 0) return;

                var days = Math.floor(diff / (1000 * 60 * 60 * 24));
                var hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                var mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
                var secs = Math.floor((diff % (1000 * 60)) / 1000);

                document.getElementById('dealDays').textContent = String(days).padStart(2, '0');
                document.getElementById('dealHours').textContent = String(hours).padStart(2, '0');
                document.getElementById('dealMins').textContent = String(mins).padStart(2, '0');
                document.getElementById('dealSecs').textContent = String(secs).padStart(2, '0');
            }, 1000);
        }

        document.addEventListener('DOMContentLoaded', function() {
            renderCategories();
            renderProducts();
            initScrollObserve();
            startCountdown();
            document.getElementById('currentYear').textContent = new Date().getFullYear();

            var cartOverlay = document.getElementById('cartOverlay');
            document.getElementById('cartDrawerBtn').addEventListener('click', function() { cartOverlay.classList.add('active'); });
            document.getElementById('closeCart').addEventListener('click', function() { cartOverlay.classList.remove('active'); });
            document.getElementById('claimDealBtn').addEventListener('click', function() { addToCart(99); });

            document.getElementById('shopNow').addEventListener('click', function() {
                document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
            });
            document.getElementById('exploreDeals').addEventListener('click', function() {
                document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
            });
        });
    </script>
</body>
</html>
