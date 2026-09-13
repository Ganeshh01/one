<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>NexusShop — Animated Modern E‑Commerce</title>

    <!-- Fonts & Icons -->
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&family=Playfair+Display:ital,wght@0,600;0,700;1,400&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous">

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
            --purple-gradient: linear-gradient(135deg, #6366f1 0%, #a855f7 100%);
            --cyan-gradient: linear-gradient(135deg, #06b6d4 0%, #3b82f6 100%);
            --glass-bg: rgba(30, 34, 53, 0.75);
            --glass-border: rgba(255, 255, 255, 0.08);
            --success: #10b981;
            --warning: #f59e0b;
            --radius: 20px;
            --radius-sm: 12px;
            --shadow: 0 10px 30px -10px rgba(0, 0, 0, 0.5);
            --shadow-glow: 0 0 25px rgba(255, 94, 98, 0.25);
            --transition: all 0.35s cubic-bezier(0.4, 0, 0.2, 1);
            --container: 1280px;
        }

        /* ========== KEYFRAME ANIMATIONS ========== */
        @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-12px) rotate(1deg); }
        }

        @keyframes pulseGlow {
            0%, 100% { box-shadow: 0 0 15px rgba(255, 94, 98, 0.3); }
            50% { box-shadow: 0 0 35px rgba(255, 94, 98, 0.7); }
        }

        @keyframes meshGradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes shimmer {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(200%); }
        }

        @keyframes heartPop {
            0% { transform: scale(1); }
            50% { transform: scale(1.4); }
            100% { transform: scale(1); }
        }

        @keyframes toastIn {
            from { transform: translateY(100%) scale(0.8); opacity: 0; }
            to { transform: translateY(0) scale(1); opacity: 1; }
        }

        @keyframes toastOut {
            from { transform: translateY(0) scale(1); opacity: 1; }
            to { transform: translateY(100%) scale(0.8); opacity: 0; }
        }

        @keyframes shimmerBar {
            0% { background-position: -200px 0; }
            100% { background-position: 200px 0; }
        }

        /* ========== BASE RESET ========== */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }
        html {
            scroll-behavior: smooth;
        }
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

        /* ========== SCROLL REVEAL UTILITIES ========== */
        .reveal {
            opacity: 0;
            transform: translateY(40px);
            transition: opacity 0.8s cubic-bezier(0.16, 1, 0.3, 1), transform 0.8s cubic-bezier(0.16, 1, 0.3, 1);
            will-change: opacity, transform;
        }
        .reveal.active {
            opacity: 1;
            transform: translateY(0);
        }
        .reveal-scale {
            opacity: 0;
            transform: scale(0.9);
            transition: var(--transition);
        }
        .reveal-scale.active {
            opacity: 1;
            transform: scale(1);
        }

        /* ========== BUTTONS WITH SHIMMER ========== */
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
            z-index: 1;
        }
        .btn::after {
            content: '';
            position: absolute;
            top: 0; left: 0; width: 100%; height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
            transform: translateX(-100%);
            z-index: 2;
        }
        .btn:hover::after {
            animation: shimmer 1.2s infinite;
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
            border-color: rgba(255, 255, 255, 0.25);
        }

        /* ========== HEADER & NAV ========== */
        header {
            position: sticky;
            top: 0;
            z-index: 1000;
            background: rgba(15, 17, 26, 0.85);
            backdrop-filter: blur(20px);
            -webkit-backdrop-filter: blur(20px);
            border-bottom: 1px solid var(--glass-border);
            transition: var(--transition);
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
            letter-spacing: -0.5px;
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
            box-shadow: var(--shadow-glow);
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

        nav.main-nav ul {
            display: flex;
            gap: 8px;
            list-style: none;
        }
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
        nav.main-nav a.active {
            border: 1px solid var(--glass-border);
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .search-wrap {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            border-radius: 999px;
            padding: 4px 6px 4px 18px;
            transition: var(--transition);
            width: 240px;
        }
        .search-wrap:focus-within {
            width: 300px;
            background: rgba(255, 255, 255, 0.1);
            border-color: rgba(255, 94, 98, 0.5);
            box-shadow: 0 0 20px rgba(255, 94, 98, 0.2);
        }
        .search-wrap input {
            border: 0;
            background: transparent;
            outline: none;
            color: #fff;
            font-size: 14px;
            width: 100%;
        }
        .search-wrap input::placeholder { color: var(--muted-light); }
        .search-wrap button {
            width: 34px; height: 34px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: grid; place-items: center;
            color: #fff;
            transition: var(--transition);
        }
        .search-wrap button:hover { background: var(--accent); }

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
            transition: var(--transition);
            position: relative;
        }
        .icon-btn:hover {
            background: rgba(255, 255, 255, 0.12);
            transform: translateY(-2px);
            border-color: rgba(255, 255, 255, 0.2);
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
            box-shadow: var(--shadow-glow);
            transition: transform 0.2s cubic-bezier(0.175, 0.885, 0.32, 1.275);
        }

        .mobile-toggle {
            display: none;
            width: 44px; height: 44px;
            border-radius: 12px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            color: #fff; font-size: 20px;
        }

        /* ========== HERO SECTION WITH AMBIENT LIGHT ========== */
        .hero {
            position: relative;
            padding: 90px 0 70px;
            margin: 20px 24px 0;
            border-radius: 32px;
            overflow: hidden;
            background: var(--bg-surface);
            border: 1px solid var(--glass-border);
            box-shadow: var(--shadow);
        }
        .hero-glow-1 {
            position: absolute;
            top: -100px; right: -100px;
            width: 500px; height: 500px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(255, 94, 98, 0.25) 0%, transparent 70%);
            filter: blur(60px);
            pointer-events: none;
            animation: float 8s ease-in-out infinite;
        }
        .hero-glow-2 {
            position: absolute;
            bottom: -150px; left: -100px;
            width: 600px; height: 600px;
            border-radius: 50%;
            background: radial-gradient(circle, rgba(168, 85, 247, 0.2) 0%, transparent 70%);
            filter: blur(80px);
            pointer-events: none;
            animation: float 10s ease-in-out infinite reverse;
        }
        .hero-grid {
            display: grid;
            grid-template-columns: 1.2fr 0.8fr;
            gap: 40px;
            align-items: center;
            position: relative;
            z-index: 2;
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
            letter-spacing: 0.5px;
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
        .hero p {
            color: var(--muted);
            font-size: 18px;
            max-width: 540px;
            margin-bottom: 36px;
        }
        .hero-actions {
            display: flex;
            gap: 16px;
            flex-wrap: wrap;
        }
        .hero-visual {
            position: relative;
            display: flex;
            justify-content: center;
        }
        .hero-img-wrap {
            position: relative;
            width: 100%;
            max-width: 420px;
            border-radius: 28px;
            overflow: hidden;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.7);
            border: 1px solid var(--glass-border);
            animation: float 6s ease-in-out infinite;
        }
        .hero-img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transform: scale(1.05);
            transition: transform 0.7s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .hero-img-wrap:hover img { transform: scale(1.12); }
        .hero-float-card {
            position: absolute;
            bottom: -20px; left: -20px;
            background: rgba(30, 34, 53, 0.85);
            backdrop-filter: blur(16px);
            border: 1px solid var(--glass-border);
            padding: 16px 20px;
            border-radius: 20px;
            display: flex;
            align-items: center;
            gap: 14px;
            box-shadow: var(--shadow);
            animation: float 5s ease-in-out infinite 1s;
        }
        .hero-float-card i {
            width: 40px; height: 40px;
            border-radius: 50%;
            background: var(--purple-gradient);
            display: grid; place-items: center;
            font-size: 18px; color: #fff;
        }

        /* ========== SECTION STYLES ========== */
        .section { padding: 80px 0; }
        .section-header {
            display: flex;
            align-items: flex-end;
            justify-content: space-between;
            margin-bottom: 44px;
            flex-wrap: wrap;
            gap: 20px;
        }
        .section-header h2 {
            font-size: 36px;
            font-weight: 800;
            letter-spacing: -0.5px;
        }
        .section-header p {
            color: var(--muted);
            font-size: 16px;
            margin-top: 6px;
        }
        .view-all-link {
            display: flex;
            align-items: center;
            gap: 8px;
            font-weight: 700;
            color: var(--accent);
            font-size: 15px;
            transition: var(--transition);
        }
        .view-all-link:hover { gap: 14px; color: #fff; }

        /* ========== CATEGORY CARDS ========== */
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
            position: relative;
            overflow: hidden;
        }
        .cat-card::before {
            content: '';
            position: absolute;
            inset: 0;
            background: var(--accent-gradient);
            opacity: 0;
            transition: var(--transition);
            z-index: 0;
        }
        .cat-card:hover {
            transform: translateY(-10px) scale(1.03);
            border-color: rgba(255, 94, 98, 0.4);
            box-shadow: var(--shadow-glow);
        }
        .cat-card:hover::before { opacity: 0.08; }
        .cat-card-content { position: relative; z-index: 1; }
        .cat-icon {
            width: 64px; height: 64px;
            border-radius: 20px;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid var(--glass-border);
            display: grid; place-items: center;
            margin: 0 auto 16px;
            font-size: 26px;
            color: var(--accent);
            transition: var(--transition);
        }
        .cat-card:hover .cat-icon {
            background: var(--accent-gradient);
            color: #fff;
            transform: rotate(6deg) scale(1.1);
        }
        .cat-card h4 { font-size: 16px; font-weight: 700; margin-bottom: 4px; }
        .cat-card span { font-size: 13px; color: var(--muted); }

        /* ========== PRODUCT CARDS ========== */
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
            position: relative;
        }
        .product-card:hover {
            transform: translateY(-8px);
            border-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 40px -15px rgba(0, 0, 0, 0.6);
        }
        .product-img-wrap {
            position: relative;
            aspect-ratio: 1 / 1;
            overflow: hidden;
            background: var(--bg-surface);
        }
        .product-img-wrap img {
            width: 100%; height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }
        .product-card:hover .product-img-wrap img {
            transform: scale(1.08);
        }
        .product-tag {
            position: absolute;
            top: 14px; left: 14px;
            background: var(--accent-gradient);
            color: #fff;
            font-size: 11px; font-weight: 800;
            padding: 4px 12px;
            border-radius: 999px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            box-shadow: 0 4px 12px rgba(255, 94, 98, 0.4);
        }
        .wishlist-btn {
            position: absolute;
            top: 14px; right: 14px;
            width: 38px; height: 38px;
            border-radius: 50%;
            background: rgba(15, 17, 26, 0.7);
            backdrop-filter: blur(8px);
            border: 1px solid var(--glass-border);
            color: #fff;
            display: grid; place-items: center;
            font-size: 16px;
            transition: var(--transition);
        }
        .wishlist-btn:hover, .wishlist-btn.active {
            background: var(--accent);
            color: #fff;
            border-color: var(--accent);
            animation: heartPop 0.4s ease;
        }
        .product-info {
            padding: 20px;
            display: flex;
            flex-direction: column;
            flex: 1;
        }
        .product-category {
            font-size: 12px;
            color: var(--accent);
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-bottom: 6px;
        }
        .product-title {
            font-size: 16px;
            font-weight: 700;
            margin-bottom: 10px;
            line-height: 1.3;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .product-meta {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: auto;
            padding-top: 12px;
        }
        .product-price {
            font-size: 20px;
            font-weight: 800;
            color: #fff;
        }
        .product-price .old {
            font-size: 14px;
            color: var(--muted);
            text-decoration: line-through;
            margin-left: 6px;
            font-weight: 500;
        }
        .add-cart-btn {
            width: 42px; height: 42px;
            border-radius: 14px;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid var(--glass-border);
            color: #fff;
            display: grid; place-items: center;
            font-size: 16px;
            transition: var(--transition);
        }
        .add-cart-btn:hover {
            background: var(--accent-gradient);
            border-color: transparent;
            transform: scale(1.1) rotate(-5deg);
            box-shadow: var(--shadow-glow);
        }

        /* ========== FLASH DEAL CARD ========== */
        .deal-card {
            background: linear-gradient(135deg, #1e2235 0%, #161926 100%);
            border: 1px solid var(--glass-border);
            border-radius: 32px;
            overflow: hidden;
            box-shadow: var(--shadow);
            display: grid;
            grid-template-columns: 1fr 1fr;
            position: relative;
        }
        .deal-img-container {
            position: relative;
            min-height: 380px;
            overflow: hidden;
        }
        .deal-img-container img {
            width: 100%; height: 100%;
            object-fit: cover;
            transition: transform 0.8s ease;
        }
        .deal-card:hover .deal-img-container img { transform: scale(1.06); }
        .deal-details {
            padding: 50px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .deal-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 6px 16px;
            border-radius: 999px;
            background: rgba(245, 158, 11, 0.15);
            border: 1px solid rgba(245, 158, 11, 0.3);
            color: var(--warning);
            font-size: 13px; font-weight: 700;
            margin-bottom: 16px;
            align-self: flex-start;
        }
        .deal-details h3 {
            font-size: 34px;
            font-weight: 800;
            margin-bottom: 12px;
        }
        .deal-details p { color: var(--muted); margin-bottom: 24px; font-size: 16px; }

        /* Countdown timer */
        .timer-row {
            display: flex;
            gap: 14px;
            margin-bottom: 28px;
        }
        .timer-box {
            background: rgba(15, 17, 26, 0.8);
            border: 1px solid var(--glass-border);
            padding: 12px 18px;
            border-radius: 16px;
            min-width: 76px;
            text-align: center;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.3);
        }
        .timer-box .num {
            font-size: 28px;
            font-weight: 800;
            background: var(--accent-gradient);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .timer-box .lbl {
            font-size: 11px;
            color: var(--muted);
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        /* Stock progress bar */
        .stock-bar-wrap { margin-bottom: 28px; }
        .stock-label {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 8px;
        }
        .stock-bar {
            height: 10px;
            background: rgba(255, 255, 255, 0.08);
            border-radius: 999px;
            overflow: hidden;
        }
        .stock-progress {
            height: 100%;
            width: 75%;
            background: var(--accent-gradient);
            border-radius: 999px;
            position: relative;
            background-size: 200px 100%;
            animation: shimmerBar 2s linear infinite;
        }

        /* ========== TESTIMONIALS SLIDER ========== */
        .testimonials-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 24px;
        }
        .testimonial-card {
            background: var(--bg-card);
            border: 1px solid var(--glass-border);
            border-radius: var(--radius);
            padding: 32px;
            transition: var(--transition);
            position: relative;
        }
        .testimonial-card:hover {
            transform: translateY(-6px);
            border-color: rgba(255, 255, 255, 0.15);
            box-shadow: var(--shadow);
        }
        .stars { color: #f59e0b; font-size: 16px; margin-bottom: 16px; gap: 4px; display: flex; }
        .testimonial-card blockquote {
            font-size: 15px;
            color: #cbd5e1;
            line-height: 1.7;
            margin-bottom: 24px;
            font-style: italic;
        }
        .author-wrap {
            display: flex;
            align-items: center;
            gap: 14px;
        }
        .author-avatar {
            width: 48px; height: 48px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid var(--accent);
        }
        .author-name { font-weight: 700; font-size: 15px; }
        .author-role { font-size: 13px; color: var(--muted); }

        /* ========== NEWSLETTER BANNER ========== */
        .newsletter-card {
            background: linear-gradient(135deg, #1e2235 0%, #291e38 100%);
            border: 1px solid var(--glass-border);
            border-radius: 32px;
            padding: 60px 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }
        .newsletter-card::before {
            content: '';
            position: absolute;
            top: -50%; left: -20%;
            width: 400px; height: 400px;
            background: radial-gradient(circle, rgba(99, 102, 241, 0.25) 0%, transparent 70%);
            filter: blur(50px);
        }
        .newsletter-text h3 { font-size: 32px; font-weight: 800; margin-bottom: 8px; }
        .newsletter-text p { color: var(--muted); font-size: 16px; }
        .newsletter-form {
            display: flex;
            gap: 12px;
            flex: 1;
            max-width: 500px;
            position: relative;
            z-index: 2;
        }
        .newsletter-form input {
            flex: 1;
            padding: 16px 24px;
            border-radius: 999px;
            border: 1px solid var(--glass-border);
            background: rgba(15, 17, 26, 0.7);
            color: #fff;
            font-size: 15px;
            outline: none;
            transition: var(--transition);
        }
        .newsletter-form input:focus {
            border-color: var(--accent);
            box-shadow: 0 0 20px rgba(255, 94, 98, 0.25);
        }

        /* ========== CART DRAWER SLIDE-IN ========== */
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
        .cart-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-bottom: 20px;
            border-bottom: 1px solid var(--glass-border);
        }
        .cart-header h3 { font-size: 20px; font-weight: 800; }
        .close-cart {
            width: 36px; height: 36px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.08);
            display: grid; place-items: center;
            color: #fff; font-size: 18px;
            transition: var(--transition);
        }
        .close-cart:hover { background: var(--accent); transform: rotate(90deg); }
        .cart-items-list {
            flex: 1;
            overflow-y: auto;
            padding: 20px 0;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }
        .cart-item {
            display: flex;
            align-items: center;
            gap: 16px;
            background: var(--bg-card);
            border: 1px solid var(--glass-border);
            padding: 14px;
            border-radius: 16px;
        }
        .cart-item img {
            width: 64px; height: 64px;
            border-radius: 12px;
            object-fit: cover;
        }
        .cart-item-details { flex: 1; }
        .cart-item-title { font-weight: 700; font-size: 14px; margin-bottom: 4px; }
        .cart-item-price { color: var(--accent); font-weight: 800; font-size: 15px; }
        .cart-qty-ctrl {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 6px;
        }
        .cart-qty-ctrl button {
            width: 24px; height: 24px;
            border-radius: 6px;
            background: rgba(255, 255, 255, 0.1);
            color: #fff; font-size: 12px;
            display: grid; place-items: center;
        }
        .cart-footer {
            border-top: 1px solid var(--glass-border);
            padding-top: 20px;
        }
        .cart-subtotal {
            display: flex;
            justify-content: space-between;
            font-size: 18px;
            font-weight: 800;
            margin-bottom: 20px;
        }

        /* ========== TOAST NOTIFICATIONS ========== */
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
            font-weight: 600;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.5);
            animation: toastIn 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275) forwards;
        }
        .toast i { color: var(--success); font-size: 18px; }

        /* ========== FOOTER ========== */
        footer {
            margin-top: 80px;
            padding: 60px 0 30px;
            background: var(--bg-surface);
            border-top: 1px solid var(--glass-border);
        }
        .footer-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 40px;
            margin-bottom: 50px;
        }
        .footer-brand p { color: var(--muted); margin-top: 14px; max-width: 320px; }
        .footer-socials { display: flex; gap: 12px; margin-top: 20px; }
        .footer-socials a {
            width: 40px; height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid var(--glass-border);
            display: grid; place-items: center;
            color: var(--muted);
            transition: var(--transition);
        }
        .footer-socials a:hover {
            background: var(--accent-gradient);
            color: #fff;
            transform: translateY(-3px);
        }
        .footer-col h5 { font-size: 16px; font-weight: 700; margin-bottom: 18px; }
        .footer-col ul { list-style: none; display: flex; flex-direction: column; gap: 10px; }
        .footer-col a { color: var(--muted); transition: var(--transition); font-size: 14px; }
        .footer-col a:hover { color: #fff; transform: translateX(4px); }

        .footer-bottom {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid var(--glass-border);
            color: var(--muted-light);
            font-size: 14px;
        }

        /* ========== RESPONSIVE DESIGN ========== */
        @media (max-width: 1024px) {
            .hero h1 { font-size: 44px; }
            .hero-grid { grid-template-columns: 1fr; text-align: center; }
            .hero p { margin: 0 auto 30px; }
            .hero-actions { justify-content: center; }
            .hero-visual { display: none; }
            .categories-grid { grid-template-columns: repeat(3, 1fr); }
            .products-grid { grid-template-columns: repeat(2, 1fr); }
            .deal-card { grid-template-columns: 1fr; }
            .testimonials-grid { grid-template-columns: 1fr; }
            .newsletter-card { flex-direction: column; text-align: center; }
            .footer-grid { grid-template-columns: 1fr 1fr; }
        }
        @media (max-width: 768px) {
            nav.main-nav { display: none; }
            .mobile-toggle { display: grid; place-items: center; }
            .search-wrap { display: none; }
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
                <button class="mobile-toggle" id="mobileToggle" aria-label="Toggle Navigation">
                    <i class="fas fa-bars"></i>
                </button>
                <a href="#" class="brand">
                    <div class="brand-icon"><i class="fas fa-bolt"></i></div>
                    <span>Nexus<span class="accent">Shop</span></span>
                </a>
            </div>

            <nav class="main-nav">
                <ul>
                    <li><a href="#" class="active"><i class="fas fa-home"></i> Home</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#products"><i class="fas fa-fire"></i> Trending</a></li>
                    <li><a href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
                    <li><a href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
                </ul>
            </nav>

            <div class="header-actions">
                <div class="search-wrap">
                    <input type="search" id="searchInput" placeholder="Search products..." />
                    <button id="searchBtn" aria-label="Search"><i class="fas fa-search"></i></button>
                </div>

                <button class="icon-btn" title="Wishlist" id="wishlistHeaderBtn">
                    <i class="far fa-heart"></i>
                    <span class="badge-count" id="wishlistCount">0</span>
                </button>
                
                <button class="icon-btn" title="Cart" id="cartDrawerBtn">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="badge-count" id="cartCount">0</span>
                </button>
            </div>
        </div>
    </header>

    <!-- ===== MAIN CONTENT ===== -->
    <main>

        <!-- HERO SECTION -->
        <section class="hero">
            <div class="hero-glow-1"></div>
            <div class="hero-glow-2"></div>
            
            <div class="container hero-grid">
                <div class="hero-content reveal">
                    <div class="hero-tag"><i class="fas fa-sparkles"></i> Next-Gen Collection 2026</div>
                    <h1>Experience Shopping Reimagined</h1>
                    <p>Discover ultra-premium luxury tech, curated fashion, and lifestyle essentials with instant global shipping.</p>
                    <div class="hero-actions">
                        <button class="btn btn-primary" id="shopNow"><i class="fas fa-shopping-cart"></i> Explore Products</button>
                        <button class="btn btn-secondary" id="exploreDeals"><i class="fas fa-bolt"></i> View Flash Deals</button>
                    </div>
                </div>

                <div class="hero-visual reveal">
                    <div class="hero-img-wrap">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=800&q=80" alt="Premium Headphones">
                    </div>
                    <div class="hero-float-card">
                        <i class="fas fa-shield-alt"></i>
                        <div>
                            <div style="font-weight:700;font-size:14px;">2-Year Warranty</div>
                            <div style="font-size:12px;color:var(--muted);">On all premium tech</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- CATEGORIES SECTION -->
        <section class="section" id="categories">
            <div class="container">
                <div class="section-header reveal">
                    <div>
                        <h2>Featured Categories</h2>
                        <p>Explore high quality items across top categories</p>
                    </div>
                    <a href="#products" class="view-all-link">Browse All <i class="fas fa-arrow-right"></i></a>
                </div>

                <div class="categories-grid" id="categoriesGrid">
                    <!-- Dynamic rendering via JS -->
                </div>
            </div>
        </section>

        <!-- PRODUCTS SECTION -->
        <section class="section" id="products">
            <div class="container">
                <div class="section-header reveal">
                    <div>
                        <h2>Trending Innovations</h2>
                        <p>Hand-picked tech & gear trending worldwide</p>
                    </div>
                    <a href="#products" class="view-all-link">View Catalog <i class="fas fa-arrow-right"></i></a>
                </div>

                <div class="products-grid" id="productsGrid">
                    <!-- Dynamic rendering via JS -->
                </div>
            </div>
        </section>

        <!-- FLASH DEAL SECTION -->
        <section class="section" id="deals">
            <div class="container">
                <div class="deal-card reveal">
                    <div class="deal-img-container">
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=1000&q=80" alt="MacBook Air M2">
                    </div>
                    <div class="deal-details">
                        <div class="deal-badge"><i class="fas fa-bolt"></i> Flash Deal Of The Week</div>
                        <h3>MacBook Air M2 Pro</h3>
                        <p>Unmatched M2 processing speed wrapped in an ultra-thin aerospace aluminum chassis.</p>
                        
                        <div class="timer-row">
                            <div class="timer-box">
                                <div class="num" id="dealDays">00</div>
                                <div class="lbl">Days</div>
                            </div>
                            <div class="timer-box">
                                <div class="num" id="dealHours">00</div>
                                <div class="lbl">Hours</div>
                            </div>
                            <div class="timer-box">
                                <div class="num" id="dealMins">00</div>
                                <div class="lbl">Mins</div>
                            </div>
                            <div class="timer-box">
                                <div class="num" id="dealSecs">00</div>
                                <div class="lbl">Secs</div>
                            </div>
                        </div>

                        <div class="stock-bar-wrap">
                            <div class="stock-label">
                                <span>Stock Remaining</span>
                                <span style="color:var(--accent);">14 / 50 Left</span>
                            </div>
                            <div class="stock-bar">
                                <div class="stock-progress"></div>
                            </div>
                        </div>

                        <button class="btn btn-primary" id="claimDealBtn"><i class="fas fa-cart-plus"></i> Claim Special Offer ($999)</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- TESTIMONIALS SECTION -->
        <section class="section" id="testimonials">
            <div class="container">
                <div class="section-header reveal">
                    <div>
                        <h2>What Buyers Say</h2>
                        <p>Trusted by thousands of satisfied technology enthusiasts</p>
                    </div>
                </div>

                <div class="testimonials-grid" id="testimonialsGrid">
                    <!-- Dynamic rendering via JS -->
                </div>
            </div>
        </section>

        <!-- NEWSLETTER SECTION -->
        <section class="section">
            <div class="container">
                <div class="newsletter-card reveal">
                    <div class="newsletter-text">
                        <h3>Unlock VIP Member Deals</h3>
                        <p>Subscribe for secret discount codes and first access to new releases.</p>
                    </div>
                    <form class="newsletter-form" id="newsletterForm">
                        <input type="email" id="newsEmail" placeholder="Enter your email address..." required />
                        <button type="submit" class="btn btn-primary"><i class="fas fa-paper-plane"></i> Join VIP</button>
                    </form>
                </div>
            </div>
        </section>

    </main>

    <!-- ===== CART DRAWER SIDE MODAL ===== -->
    <div class="cart-overlay" id="cartOverlay">
        <div class="cart-drawer">
            <div class="cart-header">
                <h3>Your Shopping Cart (<span id="cartDrawerCount">0</span>)</h3>
                <button class="close-cart" id="closeCart"><i class="fas fa-times"></i></button>
            </div>
            <div class="cart-items-list" id="cartItemsList">
                <!-- Cart items rendered dynamically -->
            </div>
            <div class="cart-footer">
                <div class="cart-subtotal">
                    <span>Subtotal:</span>
                    <span id="cartSubtotal">$0.00</span>
                </div>
                <button class="btn btn-primary" style="width:100%;" id="checkoutBtn"><i class="fas fa-lock"></i> Proceed to Checkout</button>
            </div>
        </div>
    </div>

    <!-- ===== TOAST CONTAINER ===== -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- ===== FOOTER ===== -->
    <footer>
        <div class="container">
            <div class="footer-grid">
                <div class="footer-brand">
                    <a href="#" class="brand">
                        <div class="brand-icon"><i class="fas fa-bolt"></i></div>
                        <span>Nexus<span class="accent">Shop</span></span>
                    </a>
                    <p>Pioneering ultra-sleek, interactive, modern e-commerce storefront experiences built for maximum speed and beauty.</p>
                    <div class="footer-socials">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-youtube"></i></a>
                        <a href="#"><i class="fab fa-github"></i></a>
                    </div>
                </div>
                <div class="footer-col">
                    <h5>Categories</h5>
                    <ul>
                        <li><a href="#">Smartphones</a></li>
                        <li><a href="#">High-End Laptops</a></li>
                        <li><a href="#">Wearable Tech</a></li>
                        <li><a href="#">Audio & Sound</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h5>Customer Care</h5>
                    <ul>
                        <li><a href="#">Order Tracking</a></li>
                        <li><a href="#">Worldwide Shipping</a></li>
                        <li><a href="#">30-Day Returns</a></li>
                        <li><a href="#">Support Hub</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h5>Company</h5>
                    <ul>
                        <li><a href="#">About Nexus</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                    </ul>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; <span id="currentYear"></span> NexusShop Inc. All rights reserved.
            </div>
        </div>
    </footer>

    <!-- ===== JAVASCRIPT ANIMATIONS & LOGIC ===== -->
    <script>
        // ==========================================
        // DATA SOURCES
        // ==========================================
        const CATEGORIES = [
            { id: 'smartphones', name: 'Smartphones', icon: 'fa-mobile-alt', count: '28 Items' },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: '16 Items' },
            { id: 'audio', name: 'Audio Gear', icon: 'fa-headphones-alt', count: '34 Items' },
            { id: 'wearables', name: 'Wearables', icon: 'fa-clock', count: '22 Items' },
            { id: 'gaming', name: 'Gaming', icon: 'fa-gamepad', count: '19 Items' },
            { id: 'cameras', name: 'Cameras', icon: 'fa-camera-retro', count: '15 Items' }
        ];

        const PRODUCTS = [
            { id: 1, title: 'iPhone 15 Pro Max Titanium', price: 1199, oldPrice: 1299, category: 'Smartphones', tag: 'New', img: 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?auto=format&fit=crop&w=600&q=80' },
            { id: 2, title: 'Sony WH-1000XM5 Headphones', price: 399, oldPrice: 449, category: 'Audio Gear', tag: 'Bestseller', img: 'https://images.unsplash.com/photo-1546435770-a3e426bf472b?auto=format&fit=crop&w=600&q=80' },
            { id: 3, title: 'Apple Watch Ultra 2', price: 799, oldPrice: 849, category: 'Wearables', tag: 'Hot', img: 'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?auto=format&fit=crop&w=600&q=80' },
            { id: 4, title: 'ASUS ROG Gaming Laptop', price: 2199, oldPrice: 2499, category: 'Laptops', tag: 'Sale', img: 'https://images.unsplash.com/photo-1603302576837-37561b2e2302?auto=format&fit=crop&w=600&q=80' },
            { id: 5, title: 'Fujifilm X-T5 Mirrorless Camera', price: 1699, oldPrice: 1799, category: 'Cameras', tag: 'Pro', img: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?auto=format&fit=crop&w=600&q=80' },
            { id: 6, title: 'PlayStation 5 DualSense Edge', price: 199, oldPrice: 229, category: 'Gaming', tag: 'Popular', img: 'https://images.unsplash.com/photo-1606813907291-d86efa9b94db?auto=format&fit=crop&w=600&q=80' }
        ];

        const TESTIMONIALS = [
            { name: 'Marcus Vance', role: 'Tech Enthusiast', avatar: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80', text: 'The lightning-fast delivery and glassmorphism UI experience made shopping an absolute pleasure!' },
            { name: 'Elena Rostova', role: 'Product Designer', avatar: 'https://images.unsplash.com/photo-1517841905240-472988babdf9?auto=format&fit=crop&w=150&q=80', text: 'NexusShop is standard-setting. The product packaging and responsive support exceeded expectations.' },
            { name: 'David Chen', role: 'Software Engineer', avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80', text: 'Got my M2 MacBook Flash Deal without a hitch. Smooth animations and bulletproof user experience!' }
        ];

        // ==========================================
        // STATE MANAGEMENT
        // ==========================================
        let cartState = [];
        let wishlistState = new Set();

        // ==========================================
        // RENDERERS
        // ==========================================
        function renderCategories() {
            const container = document.getElementById('categoriesGrid');
            container.innerHTML = CATEGORIES.map((cat, idx) => `
                <div class="cat-card reveal" style="transition-delay: ${idx * 0.1}s">
                    <div class="cat-card-content">
                        <div class="cat-icon"><i class="fas ${cat.icon}"></i></div>
                        <h4>${cat.name}</h4>
                        <span>${cat.count}</span>
                    </div>
                </div>
            `).join('');
        }

        function renderProducts(list = PRODUCTS) {
            const container = document.getElementById('productsGrid');
            container.innerHTML = list.map((p, idx) => `
                <div class="product-card reveal" style="transition-delay: ${idx * 0.08}s">
                    <div class="product-img-wrap">
                        <img src="${p.img}" alt="${p.title}" loading="lazy">
                        ${p.tag ? `<span class="product-tag">${p.tag}</span>` : ''}
                        <button class="wishlist-btn ${wishlistState.has(p.id) ? 'active' : ''}" onclick="toggleWishlist(${p.id})">
                            <i class="${wishlistState.has(p.id) ? 'fas' : 'far'} fa-heart"></i>
                        </button>
                    </div>
                    <div class="product-info">
                        <span class="product-category">${p.category}</span>
                        <h4 class="product-title">${p.title}</h4>
                        <div class="product-meta">
                            <div class="product-price">
                                $${p.price} ${p.oldPrice ? `<span class="old">$${p.oldPrice}</span>` : ''}
                            </div>
                            <button class="add-cart-btn" onclick="addToCart(${p.id})">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
            `).join('');

            // Trigger scroll observer for dynamic items
            initScrollObserve();
        }

        function renderTestimonials() {
            const container = document.getElementById('testimonialsGrid');
            container.innerHTML = TESTIMONIALS.map((t, idx) => `
                <div class="testimonial-card reveal" style="transition-delay: ${idx * 0.12}s">
                    <div class="stars">
                        <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
                    </div>
                    <blockquote>"${t.text}"</blockquote>
                    <div class="author-wrap">
                        <img src="${t.avatar}" class="author-avatar" alt="${t.name}">
                        <div>
                            <div class="author-name">${t.name}</div>
                            <div class="author-role">${t.role}</div>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // ==========================================
        // CART DRAWER LOGIC
        // ==========================================
        function addToCart(productId) {
            const product = PRODUCTS.find(p => p.id === productId) || { id: 99, title: 'MacBook Air M2 Pro', price: 999, img: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=400&q=80' };
            const existing = cartState.find(item => item.id === product.id);

            if (existing) {
                existing.qty += 1;
            } else {
                cartState.push({ ...product, qty: 1 });
            }

            updateCartUI();
            showToast(`Added <strong>${product.title}</strong> to cart!`);
        }

        function updateCartQty(id, delta) {
            const item = cartState.find(i => i.id === id);
            if (!item) return;
            item.qty += delta;
            if (item.qty <= 0) {
                cartState = cartState.filter(i => i.id !== id);
            }
            updateCartUI();
        }

        function updateCartUI() {
            const totalQty = cartState.reduce((sum, item) => sum + item.qty, 0);
            const subtotal = cartState.reduce((sum, item) => sum + (item.price * item.qty), 0);

            // Update Header Counts with animation
            const cartBadge = document.getElementById('cartCount');
            cartBadge.textContent = totalQty;
            cartBadge.style.transform = 'scale(1.4)';
            setTimeout(() => cartBadge.style.transform = 'scale(1)', 200);

            document.getElementById('cartDrawerCount').textContent = totalQty;
            document.getElementById('cartSubtotal').textContent = `$${subtotal.toLocaleString()}`;

            // Render Drawer List
            const listContainer = document.getElementById('cartItemsList');
            if (cartState.length === 0) {
                listContainer.innerHTML = `<div style="text-align:center;color:var(--muted);padding:40px 0;">Your cart is empty.</div>`;
            } else {
                listContainer.innerHTML = cartState.map(item => `
                    <div class="cart-item">
                        <img src="${item.img}" alt="${item.title}">
                        <div class="cart-item-details">
                            <div class="cart-item-title">${item.title}</div>
                            <div class="cart-item-price">$${item.price}</div>
                            <div class="cart-qty-ctrl">
                                <button onclick="updateCartQty(${item.id}, -1)">-</button>
                                <span>${item.qty}</span>
                                <button onclick="updateCartQty(${item.id}, 1)">+</button>
                            </div>
                        </div>
                    </div>
                `).join('');
            }
        }

        function toggleWishlist(productId) {
            if (wishlistState.has(productId)) {
                wishlistState.delete(productId);
                showToast('Removed item from Wishlist');
            } else {
                wishlistState.add(productId);
                showToast('Added item to Wishlist! ❤️');
            }
            
            const badge = document.getElementById('wishlistCount');
            badge.textContent = wishlistState.size;
            badge.style.transform = 'scale(1.4)';
            setTimeout(() => badge.style.transform = 'scale(1)', 200);

            renderProducts();
        }

        // ==========================================
        // TOAST SYSTEM
        // ==========================================
        function showToast(message) {
            const container = document.getElementById('toastContainer');
            const toast = document.createElement('div');
            toast.className = 'toast';
            toast.innerHTML = `<i class="fas fa-check-circle"></i> <span>${message}</span>`;
            container.appendChild(toast);

            setTimeout(() => {
                toast.style.animation = 'toastOut 0.4s forwards';
                setTimeout(() => toast.remove(), 400);
            }, 3000);
        }

        // ==========================================
        // SCROLL OBSERVER ANIMATIONS
        // ==========================================
        function initScrollObserve() {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('active');
                    }
                });
            }, { threshold: 0.15 });

            document.querySelectorAll('.reveal').forEach(el => observer.observe(el));
        }

        // ==========================================
        // COUNTDOWN TIMER
        // ==========================================
        function startCountdown() {
            const target = new Date().getTime() + (3 * 24 * 60 * 60 * 1000);

            setInterval(() => {
                const now = new Date().getTime();
                const diff = target - now;

                const days = Math.floor(diff / (1000 * 60 * 60 * 24));
                const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
                const secs = Math.floor((diff % (1000 * 60)) / 1000);

                document.getElementById('dealDays').textContent = String(days).padStart(2, '0');
                document.getElementById('dealHours').textContent = String(hours).padStart(2, '0');
                document.getElementById('dealMins').textContent = String(mins).padStart(2, '0');
                document.getElementById('dealSecs').textContent = String(secs).padStart(2, '0');
            }, 1000);
        }

        // ==========================================
        // EVENT BINDINGS
        // ==========================================
        document.addEventListener('DOMContentLoaded', () => {
            renderCategories();
            renderProducts();
            renderTestimonials();
            initScrollObserve();
            startCountdown();
            document.getElementById('currentYear').textContent = new Date().getFullYear();

            // Cart Drawer open/close
            const cartOverlay = document.getElementById('cartOverlay');
            document.getElementById('cartDrawerBtn').addEventListener('click', () => cartOverlay.classList.add('active'));
            document.getElementById('closeCart').addEventListener('click', () => cartOverlay.classList.remove('active'));
            cartOverlay.addEventListener('click', (e) => {
                if (e.target === cartOverlay) cartOverlay.classList.remove('active');
            });

            // Claim deal button
            document.getElementById('claimDealBtn').addEventListener('click', () => addToCart(99));

            // Smooth scrolling CTA
            document.getElementById('shopNow').addEventListener('click', () => {
                document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
            });
            document.getElementById('exploreDeals').addEventListener('click', () => {
                document.getElementById('deals').scrollIntoView({ behavior: 'smooth' });
            });

            // Newsletter submit
            document.getElementById('newsletterForm').addEventListener('submit', (e) => {
                e.preventDefault();
                const email = document.getElementById('newsEmail').value;
                showToast(`VIP Access granted for <strong>${email}</strong>! ✨`);
                document.getElementById('newsEmail').value = '';
            });

            // Search filter
            document.getElementById('searchInput').addEventListener('input', (e) => {
                const query = e.target.value.toLowerCase().trim();
                const filtered = PRODUCTS.filter(p => p.title.toLowerCase().includes(query) || p.category.toLowerCase().includes(query));
                renderProducts(filtered);
            });
        });
    </script>
</body>
</html>
```
