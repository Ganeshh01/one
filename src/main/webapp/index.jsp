<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NexusShop — Curated Essentials</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Space+Grotesk:wght@500;600;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" crossorigin="anonymous">

<style>
:root{
  --ink:#101114;--paper:#f5f4ef;--white:#fff;--line:#deddd6;
  --lime:#c8ff3d;--purple:#7567ff;--muted:#73746f;--soft:#ebeae3;
  --danger:#ff5d5d;--success:#25a66f;--shadow:0 18px 50px rgba(16,17,20,.08);
  --radius:24px;--container:1320px;--ease:cubic-bezier(.2,.8,.2,1);
}
*{box-sizing:border-box;margin:0;padding:0}
html{scroll-behavior:smooth}
body{font-family:"DM Sans",sans-serif;background:var(--paper);color:var(--ink);line-height:1.5;-webkit-font-smoothing:antialiased}
a{text-decoration:none;color:inherit} button,input{font:inherit} button{border:0;background:none;cursor:pointer}
img{display:block;max-width:100%}
.container{width:min(var(--container),calc(100% - 48px));margin:auto}
.eyebrow{font-size:11px;font-weight:700;letter-spacing:.14em;text-transform:uppercase;color:var(--muted)}
.display{font-family:"Space Grotesk",sans-serif;letter-spacing:-.055em}
.btn{display:inline-flex;align-items:center;justify-content:center;gap:10px;padding:14px 22px;border-radius:999px;font-weight:700;transition:.25s var(--ease)}
.btn-dark{background:var(--ink);color:#fff}.btn-dark:hover{transform:translateY(-3px);box-shadow:0 12px 24px #10111422}
.btn-lime{background:var(--lime);color:var(--ink)}.btn-lime:hover{transform:translateY(-3px);box-shadow:0 12px 24px #c8ff3d55}
.btn-light{background:#fff;border:1px solid var(--line)}.btn-light:hover{border-color:var(--ink)}
.icon-btn{width:44px;height:44px;border:1px solid var(--line);border-radius:50%;display:grid;place-items:center;transition:.2s}
.icon-btn:hover{background:var(--ink);color:#fff;border-color:var(--ink)}
.badge-count{position:absolute;top:-3px;right:-3px;width:19px;height:19px;border-radius:50%;display:grid;place-items:center;background:var(--lime);font-size:10px;font-weight:800;border:2px solid var(--paper)}
.cart-wrap{position:relative}

/* announcement + header */
.announcement{background:var(--ink);color:#fff;font-size:12px;text-align:center;padding:9px 16px;letter-spacing:.03em}
.announcement strong{color:var(--lime)}
header{position:sticky;top:0;z-index:100;background:rgba(245,244,239,.88);backdrop-filter:blur(18px);border-bottom:1px solid #1011140d}
.header-inner{height:78px;display:grid;grid-template-columns:1fr auto 1fr;align-items:center;gap:28px}
.brand{font-family:"Space Grotesk";font-weight:700;font-size:24px;letter-spacing:-.06em;display:flex;align-items:center;gap:10px}
.brand-mark{width:34px;height:34px;background:var(--ink);color:var(--lime);border-radius:10px;display:grid;place-items:center;font-size:15px}
.brand .accent{color:var(--purple)}
.main-nav ul{display:flex;gap:5px;list-style:none}
.main-nav a{font-size:13px;font-weight:600;padding:9px 13px;border-radius:10px;color:#5e5f5a}
.main-nav a:hover,.main-nav a.active{background:var(--soft);color:var(--ink)}
.header-right{justify-self:end;display:flex;align-items:center;gap:8px}
.search-wrap{height:44px;width:235px;background:#fff;border:1px solid var(--line);border-radius:999px;display:flex;align-items:center;padding:0 14px;gap:9px}
.search-wrap:focus-within{border-color:var(--ink);box-shadow:0 0 0 4px #1011140b}
.search-wrap input{width:100%;border:0;outline:0;background:transparent;font-size:13px}
.search-wrap button{color:var(--muted)}
.mobile-toggle{display:none}

/* hero */
.hero{padding:30px 0 72px}
.hero-shell{min-height:560px;background:var(--ink);border-radius:32px;overflow:hidden;display:grid;grid-template-columns:1.05fr .95fr;position:relative}
.hero-copy{padding:72px 8% 68px;display:flex;flex-direction:column;justify-content:center;color:#fff;position:relative;z-index:2}
.hero-copy .eyebrow{color:var(--lime);margin-bottom:18px}
.hero h1{font-size:clamp(48px,6.3vw,88px);line-height:.94;max-width:700px}
.hero h1 em{font-style:normal;color:var(--lime)}
.hero-copy p{max-width:520px;color:#c7c8c4;font-size:17px;margin:25px 0 30px}
.hero-actions{display:flex;gap:10px;flex-wrap:wrap}
.hero-note{display:flex;align-items:center;gap:12px;margin-top:38px;color:#a9aaa5;font-size:12px}
.hero-note i{color:var(--lime)}
.hero-image{position:relative;min-height:520px;overflow:hidden}
.hero-image img{width:100%;height:100%;object-fit:cover}
.hero-image:after{content:"";position:absolute;inset:0;background:linear-gradient(90deg,var(--ink) 0%,transparent 38%)}
.hero-float{position:absolute;z-index:3;right:28px;bottom:28px;background:var(--lime);color:var(--ink);padding:18px 20px;border-radius:18px;max-width:190px}
.hero-float b{display:block;font-family:"Space Grotesk";font-size:25px;line-height:1}
.hero-float span{font-size:11px;font-weight:700;text-transform:uppercase;letter-spacing:.08em}

/* sections */
.section{padding:72px 0}
.section-head{display:flex;align-items:end;justify-content:space-between;gap:20px;margin-bottom:30px}
.section-head h2{font-size:40px;line-height:1;letter-spacing:-.05em}
.section-head p{color:var(--muted);font-size:14px;margin-top:8px}
.text-link{font-weight:700;font-size:13px;display:flex;align-items:center;gap:8px}
.text-link i{transition:.2s}.text-link:hover i{transform:translateX(5px)}

/* categories */
.categories-grid{display:grid;grid-template-columns:repeat(6,1fr);gap:10px}
.cat-card{background:#fff;border:1px solid var(--line);border-radius:18px;padding:24px 12px;text-align:center;transition:.3s var(--ease);cursor:pointer}
.cat-card:hover{background:var(--ink);color:#fff;border-color:var(--ink);transform:translateY(-6px)}
.cat-card .icon-wrap{width:52px;height:52px;border-radius:15px;background:var(--soft);margin:0 auto 14px;display:grid;place-items:center;font-size:20px;transition:.3s}
.cat-card:hover .icon-wrap{background:var(--lime);color:var(--ink)}
.cat-card h4{font-size:13px}.cat-card .count{font-size:11px;color:var(--muted);margin-top:4px}.cat-card:hover .count{color:#aaa}

/* products */
.products-grid{display:grid;grid-template-columns:repeat(4,1fr);gap:16px}
.product-card{background:#fff;border:1px solid var(--line);border-radius:22px;overflow:hidden;transition:.3s var(--ease)}
.product-card:hover{transform:translateY(-7px);box-shadow:var(--shadow);border-color:#c9c8c0}
.product-card .img-wrap{height:300px;background:#e9e8e1;position:relative;overflow:hidden}
.product-card .img-wrap img{width:100%;height:100%;object-fit:cover;transition:.5s var(--ease)}
.product-card:hover .img-wrap img{transform:scale(1.06)}
.product-card .badge{position:absolute;top:13px;left:13px;background:var(--lime);padding:6px 10px;border-radius:999px;font-size:10px;font-weight:800;text-transform:uppercase}
.product-card .badge.sale{background:var(--ink);color:#fff}
.product-card .wish-btn{position:absolute;top:11px;right:11px;width:38px;height:38px;background:#fff;border-radius:50%;display:grid;place-items:center;transition:.2s}
.product-card .wish-btn:hover{background:var(--ink);color:#fff}
.product-card .body{padding:17px 17px 12px}
.category-tag{font-size:10px;text-transform:uppercase;letter-spacing:.12em;font-weight:700;color:#969791}
.product-card h5{font-size:16px;margin:6px 0 11px;min-height:42px;line-height:1.3}
.price-row{display:flex;align-items:center;gap:9px}.price{font-family:"Space Grotesk";font-size:20px;font-weight:700}.old-price{font-size:12px;color:#a5a59f;text-decoration:line-through}
.rating{font-size:11px;color:#e1a52b;margin-top:7px}.rating span{color:#85867f}
.product-card .footer{padding:4px 17px 17px}
.add-btn{width:100%;height:42px;background:var(--soft);border-radius:12px;font-weight:700;font-size:12px;transition:.2s}
.add-btn:hover{background:var(--ink);color:#fff}.add-btn.added{background:var(--success);color:#fff}

/* deal */
.deal-wrap{background:var(--lime);border-radius:30px;display:grid;grid-template-columns:.9fr 1.1fr;overflow:hidden;min-height:420px}
.deal-img{min-height:420px}.deal-img img{width:100%;height:100%;object-fit:cover}
.deal-content{padding:58px 8%;display:flex;flex-direction:column;justify-content:center}
.deal-content .tag{align-self:flex-start;background:var(--ink);color:#fff;padding:7px 12px;border-radius:999px;font-size:10px;font-weight:800;text-transform:uppercase;letter-spacing:.08em}
.deal-content h3{font-size:48px;line-height:.98;letter-spacing:-.05em;margin:18px 0 12px}
.deal-content .desc{max-width:520px;color:#3e4533;font-size:15px}
.price-big{font-family:"Space Grotesk";font-size:38px;font-weight:700;margin-top:22px}.price-big .old{font-size:18px;color:#68705a;text-decoration:line-through;margin-left:8px}
.stock{font-size:12px;margin-top:3px}.stock strong{color:#a52d2d}
.timer-grid{display:flex;gap:8px;margin:24px 0}
.timer-box{min-width:70px;background:var(--ink);color:#fff;border-radius:14px;padding:11px 12px;text-align:center}
.timer-box .num{font-family:"Space Grotesk";font-size:24px;font-weight:700;line-height:1.1}.timer-box .label{font-size:9px;text-transform:uppercase;letter-spacing:.1em;color:#aaa}

/* reviews */
.testimonials-scroll{display:grid;grid-template-columns:repeat(4,1fr);gap:14px;overflow:visible}
.testimonial-card{background:#fff;border:1px solid var(--line);border-radius:20px;padding:24px;transition:.25s}
.testimonial-card:hover{transform:translateY(-5px);box-shadow:var(--shadow)}
.stars{color:#e1a52b;font-size:13px;letter-spacing:2px;margin-bottom:16px}
.testimonial-card blockquote{font-size:14px;line-height:1.65;min-height:92px}
.author{display:flex;align-items:center;gap:10px;border-top:1px solid var(--line);padding-top:15px}
.avatar{width:38px;height:38px;border-radius:50%;object-fit:cover}.name{font-size:12px;font-weight:700}.role{font-size:11px;color:var(--muted)}

/* newsletter */
.newsletter-wrap{background:var(--purple);color:#fff;border-radius:28px;padding:52px 6%;display:grid;grid-template-columns:1fr 1fr;align-items:center;gap:40px}
.newsletter-wrap h3{font-size:42px;line-height:1;letter-spacing:-.05em}.newsletter-wrap p{color:#dedcff;margin-top:10px}
.newsletter-wrap form{display:flex;gap:8px;position:relative}.newsletter-wrap input{min-width:0;flex:1;height:52px;border:0;border-radius:999px;padding:0 20px;outline:0}.newsletter-wrap .btn{height:52px}
#newsletterMsg{position:absolute;left:8px;top:62px;font-size:12px}

/* footer */
footer{background:var(--ink);color:#fff;padding:58px 0 24px}
.footer-grid{display:grid;grid-template-columns:2fr 1fr 1fr 1fr;gap:40px;padding-bottom:45px}
.footer-grid .brand{color:#fff}.footer-grid .brand-mark{background:var(--lime);color:var(--ink)}
.brand-col p{color:#8f918b;max-width:300px;font-size:13px;margin:13px 0 18px}
.socials{display:flex;gap:7px}.socials a{width:36px;height:36px;border:1px solid #ffffff22;border-radius:50%;display:grid;place-items:center;color:#aaa;transition:.2s}.socials a:hover{background:var(--lime);color:var(--ink);border-color:var(--lime)}
.footer-grid h5{font-size:12px;text-transform:uppercase;letter-spacing:.1em;margin-bottom:13px;color:#fff}
.footer-grid ul{list-style:none;display:grid;gap:8px}.footer-grid li a{color:#92938d;font-size:12px}.footer-grid li a:hover{color:var(--lime)}
.footer-bottom{border-top:1px solid #ffffff14;padding-top:18px;color:#676963;font-size:11px;display:flex;justify-content:space-between}

/* mobile */
#mobileMenu{display:none}
@media(max-width:1100px){
 .header-inner{grid-template-columns:auto 1fr auto}.main-nav{display:none}.mobile-toggle{display:grid;place-items:center}
 .header-right{justify-self:end}.search-wrap{width:190px}
 .hero-shell{grid-template-columns:1fr}.hero-image{display:none}.hero-copy{min-height:560px}
 .categories-grid{grid-template-columns:repeat(3,1fr)}.products-grid{grid-template-columns:repeat(2,1fr)}
 .testimonials-scroll{grid-template-columns:repeat(2,1fr)}
}
@media(max-width:700px){
 .container{width:min(var(--container),calc(100% - 28px))}
 .announcement{font-size:10px}.header-inner{height:68px}.brand{font-size:20px}.brand-mark{width:30px;height:30px}
 .search-wrap{width:44px;padding:0;justify-content:center;border-radius:50%;background:transparent;border:0}.search-wrap input{display:none}.search-wrap button{font-size:16px}
 .header-right .icon-btn{width:40px;height:40px}.header-right{gap:4px}
 #mobileMenu{background:var(--paper);border-top:1px solid var(--line);padding:10px 0 16px}
 #mobileMenu ul{list-style:none;display:grid;gap:3px}.mobile-link{display:flex;gap:12px;padding:12px;border-radius:10px;font-weight:600;font-size:13px}.mobile-link:hover{background:var(--soft)}
 .hero{padding:14px 0 45px}.hero-shell{border-radius:22px}.hero-copy{padding:55px 28px;min-height:540px}.hero h1{font-size:48px}.hero-copy p{font-size:15px}
 .hero-float{right:18px;bottom:18px}.section{padding:48px 0}.section-head h2{font-size:31px}
 .categories-grid{grid-template-columns:repeat(2,1fr)}.products-grid{grid-template-columns:1fr 1fr;gap:9px}
 .product-card{border-radius:16px}.product-card .img-wrap{height:210px}.product-card .body{padding:12px}.product-card h5{font-size:13px;min-height:34px}.price{font-size:17px}.product-card .footer{padding:3px 12px 12px}
 .deal-wrap{grid-template-columns:1fr}.deal-img{min-height:240px}.deal-content{padding:35px 25px}.deal-content h3{font-size:38px}.timer-box{min-width:57px}.timer-box .num{font-size:19px}
 .testimonials-scroll{grid-template-columns:1fr}.testimonial-card blockquote{min-height:auto;margin-bottom:18px}
 .newsletter-wrap{grid-template-columns:1fr;padding:36px 25px}.newsletter-wrap h3{font-size:34px}.newsletter-wrap form{flex-direction:column}.newsletter-wrap .btn{width:100%}
 .footer-grid{grid-template-columns:1fr 1fr;gap:30px}.footer-grid .brand-col{grid-column:1/-1}.footer-bottom{display:block}.footer-bottom span{display:block;margin-top:5px}
}
@media(max-width:420px){
 .products-grid{grid-template-columns:1fr 1fr}.product-card .img-wrap{height:180px}.cat-card{padding:18px 8px}.cat-card .icon-wrap{width:45px;height:45px}
 .hero h1{font-size:42px}.timer-grid{gap:5px}.timer-box{min-width:52px;padding:9px 7px}
}
</style>
</head>
<body>

<div class="announcement">FREE SHIPPING ON ORDERS OVER $75 <strong>•</strong> NEW MEMBERS GET 15% OFF</div>

<header>
  <div class="container header-inner">
    <div style="display:flex;align-items:center;gap:10px">
      <button class="mobile-toggle icon-btn" id="mobileToggle" aria-label="Toggle menu"><i class="fas fa-bars"></i></button>
      <a class="brand" href="#"><span class="brand-mark"><i class="fas fa-n"></i></span><span>Nexus<span class="accent">Shop</span></span></a>
    </div>
    <nav class="main-nav" aria-label="Main navigation">
      <ul>
        <li><a href="#" class="active">Home</a></li>
        <li><a href="#categories">Categories</a></li>
        <li><a href="#products">Trending</a></li>
        <li><a href="#deals">Deals</a></li>
        <li><a href="#testimonials">Reviews</a></li>
      </ul>
    </nav>
    <div class="header-right">
      <div class="search-wrap" role="search"><input type="search" id="searchInput" placeholder="Search..." aria-label="Search products"><button id="searchBtn" aria-label="Submit search"><i class="fas fa-search"></i></button></div>
      <button class="icon-btn" aria-label="Account"><i class="far fa-user"></i></button>
      <button class="icon-btn" aria-label="Wishlist"><i class="far fa-heart"></i></button>
      <div class="cart-wrap"><button class="icon-btn" id="cartBtn" aria-label="Cart"><i class="fas fa-bag-shopping"></i></button><span class="badge-count" id="cartCount">0</span></div>
    </div>
  </div>
  <div id="mobileMenu">
    <div class="container">
      <ul>
        <li><a class="mobile-link" href="#"><i class="fas fa-house"></i> Home</a></li>
        <li><a class="mobile-link" href="#categories"><i class="fas fa-grid-2"></i> Categories</a></li>
        <li><a class="mobile-link" href="#products"><i class="fas fa-fire"></i> Trending</a></li>
        <li><a class="mobile-link" href="#deals"><i class="fas fa-tag"></i> Deals</a></li>
        <li><a class="mobile-link" href="#testimonials"><i class="fas fa-star"></i> Reviews</a></li>
      </ul>
    </div>
  </div>
</header>

<main>
<section class="hero">
  <div class="container">
    <div class="hero-shell">
      <div class="hero-copy">
        <div class="eyebrow">NexusShop / New collection 2026</div>
        <h1 class="display">Less noise.<br><em>Better</em> things.</h1>
        <p>Curated tech, fashion and everyday essentials designed to make your next purchase feel effortless.</p>
        <div class="hero-actions">
          <button class="btn btn-lime" id="shopNow">Shop the collection <i class="fas fa-arrow-right"></i></button>
          <button class="btn btn-light" id="exploreDeals">View today's deals</button>
        </div>
        <div class="hero-note"><i class="fas fa-circle-check"></i> Free shipping · Easy returns · Secure checkout</div>
      </div>
      <div class="hero-image">
        <img src="https://images.unsplash.com/photo-1523275335684-37898b6baf30?auto=format&fit=crop&w=1100&q=85" alt="Premium watch">
        <div class="hero-float"><b>15% OFF</b><span>First order · No code needed</span></div>
      </div>
    </div>
  </div>
</section>

<section class="section" id="categories">
  <div class="container">
    <div class="section-head">
      <div><div class="eyebrow">Explore</div><h2 class="display">Shop by category</h2><p>Everything useful, all in one place.</p></div>
      <a href="#" class="text-link">All categories <i class="fas fa-arrow-right"></i></a>
    </div>
    <div class="categories-grid" id="categoriesGrid"></div>
  </div>
</section>

<section class="section" id="products">
  <div class="container">
    <div class="section-head">
      <div><div class="eyebrow">Editor's picks</div><h2 class="display">Trending now</h2><p>Popular pieces our community keeps coming back for.</p></div>
      <a href="#" class="text-link">View all <i class="fas fa-arrow-right"></i></a>
    </div>
    <div class="products-grid" id="productsGrid" aria-live="polite"></div>
  </div>
</section>

<section class="section" id="deals">
  <div class="container">
    <div class="section-head"><div><div class="eyebrow">Limited time</div><h2 class="display">The flash edit</h2></div></div>
    <div class="deal-wrap">
      <div class="deal-img"><img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=900&q=85" alt="MacBook Air M2"></div>
      <div class="deal-content">
        <span class="tag"><i class="fas fa-bolt"></i> Limited offer</span>
        <h3 class="display">MacBook Air M2</h3>
        <p class="desc">Thin, light and incredibly powerful. A clean everyday machine with serious performance.</p>
        <div class="price-big">$999 <span class="old">$1,199</span></div>
        <p class="stock">Only <strong>12</strong> items left — hurry.</p>
        <div class="timer-grid" id="dealTimer">
          <div class="timer-box"><div class="num" id="dealDays">0</div><div class="label">Days</div></div>
          <div class="timer-box"><div class="num" id="dealHours">00</div><div class="label">Hours</div></div>
          <div class="timer-box"><div class="num" id="dealMinutes">00</div><div class="label">Mins</div></div>
          <div class="timer-box"><div class="num" id="dealSeconds">00</div><div class="label">Secs</div></div>
        </div>
        <button class="btn btn-dark" id="buyDeal"><i class="fas fa-bag-shopping"></i> Add to cart</button>
      </div>
    </div>
  </div>
</section>

<section class="section" id="testimonials">
  <div class="container">
    <div class="section-head"><div><div class="eyebrow">Community</div><h2 class="display">Loved by shoppers</h2><p>Real words from real customers.</p></div></div>
    <div class="testimonials-scroll" id="testimonialsList"></div>
  </div>
</section>

<section class="section">
  <div class="container">
    <div class="newsletter-wrap">
      <div><div class="eyebrow" style="color:#c8ff3d">Stay connected</div><h3 class="display">Good things,<br>occasionally.</h3><p>New arrivals, private offers and useful finds. No inbox clutter.</p></div>
      <form id="newsletterForm" onsubmit="return false;">
        <input type="email" id="newsletterEmail" placeholder="Your email address" aria-label="Email" required>
        <button class="btn btn-lime" id="subscribeBtn">Subscribe <i class="fas fa-arrow-right"></i></button>
        <div id="newsletterMsg"></div>
      </form>
    </div>
  </div>
</section>
</main>

<footer>
  <div class="container">
    <div class="footer-grid">
      <div class="brand-col">
        <div class="brand"><span class="brand-mark"><i class="fas fa-n"></i></span><span>Nexus<span class="accent">Shop</span></span></div>
        <p>A modern e-commerce concept for better everyday shopping. Curated products, clean design, simple experience.</p>
        <div class="socials"><a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a><a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a><a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a><a href="#" aria-label="YouTube"><i class="fab fa-youtube"></i></a></div>
      </div>
      <div class="col"><h5>Shop</h5><ul><li><a href="#products">Trending</a></li><li><a href="#categories">Categories</a></li><li><a href="#deals">Deals</a></li><li><a href="#">New arrivals</a></li></ul></div>
      <div class="col"><h5>Help</h5><ul><li><a href="#">Help center</a></li><li><a href="#">Shipping</a></li><li><a href="#">Returns</a></li><li><a href="#">Contact</a></li></ul></div>
      <div class="col"><h5>Company</h5><ul><li><a href="#">About</a></li><li><a href="#">Careers</a></li><li><a href="#">Privacy</a></li><li><a href="#">Terms</a></li></ul></div>
    </div>
    <div class="footer-bottom"><span>© <span id="year"></span> NexusShop. All rights reserved.</span><span>Made for modern shoppers.</span></div>
  </div>
</footer>

<script>

        // ============================================================
        // DATA
        // ============================================================
        const CATEGORIES = [
            { id: 'phones', name: 'Smartphones', icon: 'fa-mobile-alt', count: 24 },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop', count: 18 },
            { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt', count: 42 },
            { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones', count: 31 },
            { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints', count: 27 },
            { id: 'accessories', name: 'Accessories', icon: 'fa-watch', count: 39 }
        ];

        const PRODUCTS = [
            { id: 1, title: 'iPhone 14 Pro Max', price: 1099, oldPrice: 1199, rating: 5, reviews: 128, badge: 'New', img: 'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category: 'Smartphones' },
            { id: 2, title: 'MacBook Pro 14"', price: 1999, rating: 4, reviews: 86, badge: '', img: 'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category: 'Laptops' },
            { id: 3, title: 'Apple Watch Series 8', price: 349, oldPrice: 399, rating: 5, reviews: 214, badge: 'Sale', img: 'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category: 'Accessories' },
            { id: 4, title: 'Nike Air Max 270', price: 150, rating: 4, reviews: 53, badge: '', img: 'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category: 'Footwear' },
            { id: 5, title: 'Sony A7 IV Camera', price: 2499, rating: 5, reviews: 42, badge: 'New', img: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category: 'Gadgets' },
            { id: 6, title: 'Chanel No. 5', price: 120, rating: 5, reviews: 189, badge: '', img: 'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category: 'Accessories' },
            { id: 7, title: 'Travel Backpack', price: 79, oldPrice: 99, rating: 4, reviews: 67, badge: 'Sale', img: 'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category: 'Accessories' },
            { id: 8, title: 'Sony WH-1000XM5', price: 399, rating: 5, reviews: 156, badge: '', img: 'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category: 'Gadgets' }
        ];

        const TESTIMONIALS = [
            { name: 'Ava Martin', role: 'Verified Buyer', avatar: 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80', text: 'Fast shipping and excellent support. The product exceeded my expectations!', stars: 5 },
            { name: 'Michael Lee', role: 'Frequent Shopper', avatar: 'https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80', text: 'Great selection and smooth checkout. Will definitely shop again.', stars: 4 },
            { name: 'Sophia Chen', role: 'Designer', avatar: 'https://images.unsplash.com/photo-1494790108378-be9c29b29330?auto=format&fit=crop&w=80&q=80', text: 'Love the quality and the packaging. Everything arrived in perfect condition.', stars: 5 },
            { name: 'James Wilson', role: 'Tech Enthusiast', avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80', text: 'Amazing prices on electronics. The M2 MacBook deal was unbeatable.', stars: 5 }
        ];

        // ============================================================
        // STATE
        // ============================================================
        let cartCount = 0;

        // ============================================================
        // DOM REFS
        // ============================================================
        const categoriesGrid = document.getElementById('categoriesGrid');
        const productsGrid = document.getElementById('productsGrid');
        const cartCountEl = document.getElementById('cartCount');
        const searchInput = document.getElementById('searchInput');
        const searchBtn = document.getElementById('searchBtn');
        const mobileToggle = document.getElementById('mobileToggle');
        const mobileMenu = document.getElementById('mobileMenu');
        const newsletterForm = document.getElementById('newsletterForm');
        const newsletterEmail = document.getElementById('newsletterEmail');
        const newsletterMsg = document.getElementById('newsletterMsg');
        const testimonialsList = document.getElementById('testimonialsList');

        // ============================================================
        // RENDER FUNCTIONS
        // ============================================================
        function renderCategories() {
            categoriesGrid.innerHTML = '';
            CATEGORIES.forEach(cat => {
                const el = document.createElement('div');
                el.className = 'cat-card';
                el.innerHTML = `<div class="icon-wrap"><i class="fas ${cat.icon}"></i></div><h4>${cat.name}</h4><div class="count">${cat.count} items</div>`;
                el.addEventListener('click', () => {
                    searchInput.value = cat.name;
                    filterProducts(cat.name);
                    document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
                });
                categoriesGrid.appendChild(el);
            });
        }

        function renderProducts(list) {
            productsGrid.innerHTML = '';
            if (!list.length) {
                productsGrid.innerHTML = `<p style="grid-column:1/-1;text-align:center;padding:40px;color:var(--muted);">No products found.</p>`;
                return;
            }
            list.forEach(p => {
                const el = document.createElement('article');
                el.className = 'product-card';
                const badgeClass = p.badge === 'Sale' ? 'sale' : '';
                const badgeHtml = p.badge ? `<span class="badge ${badgeClass}">${p.badge}</span>` : '';
                const oldPriceHtml = p.oldPrice ? `<span class="old-price">$${p.oldPrice.toLocaleString()}</span>` : '';
                const stars = '★'.repeat(Math.round(p.rating)) + '☆'.repeat(5 - Math.round(p.rating));
                el.innerHTML = `
                    <div class="img-wrap">
                        <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy">
                        ${badgeHtml}
                        <button class="wish-btn" aria-label="Add to wishlist"><i class="far fa-heart"></i></button>
                    </div>
                    <div class="body">
                        <div class="category-tag">${p.category}</div>
                        <h5>${escapeHtml(p.title)}</h5>
                        <div class="price-row"><span class="price">$${p.price.toLocaleString()}</span>${oldPriceHtml}</div>
                        <div class="rating">${stars} <span>(${p.reviews})</span></div>
                    </div>
                    <div class="footer"><button class="add-btn" data-id="${p.id}"><i class="fas fa-cart-plus"></i> Add</button></div>
                `;
                productsGrid.appendChild(el);
            });

            productsGrid.querySelectorAll('.add-btn').forEach(btn => {
                btn.addEventListener('click', function(e) {
                    e.stopPropagation();
                    const id = Number(this.dataset.id);
                    addToCart(id, this);
                });
            });
        }

        function renderTestimonials() {
            testimonialsList.innerHTML = '';
            TESTIMONIALS.forEach(t => {
                const stars = '★'.repeat(t.stars) + '☆'.repeat(5 - t.stars);
                const el = document.createElement('div');
                el.className = 'testimonial-card';
                el.innerHTML = `
                    <div class="stars">${stars}</div>
                    <blockquote>“${escapeHtml(t.text)}”</blockquote>
                    <div class="author">
                        <img class="avatar" src="${t.avatar}" alt="${escapeHtml(t.name)}" loading="lazy">
                        <div><div class="name">${escapeHtml(t.name)}</div><div class="role">${escapeHtml(t.role)}</div></div>
                    </div>
                `;
                testimonialsList.appendChild(el);
            });
        }

        // ============================================================
        // UTILITY
        // ============================================================
        function escapeHtml(text) {
            return String(text).replace(/[&<>"']/g, s => ({ '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;' } [s]));
        }

        function updateCartCount() {
            cartCountEl.textContent = cartCount;
            cartCountEl.style.transform = 'scale(1.3)';
            setTimeout(() => cartCountEl.style.transform = 'scale(1)', 200);
        }

        function addToCart(productId, btnEl) {
            const p = PRODUCTS.find(x => x.id === productId);
            if (!p) return;
            cartCount++;
            updateCartCount();
            if (btnEl) {
                const orig = btnEl.innerHTML;
                btnEl.innerHTML = '<i class="fas fa-check"></i> Added';
                btnEl.classList.add('added');
                setTimeout(() => { btnEl.innerHTML = orig;
                    btnEl.classList.remove('added'); }, 1500);
            }
            document.getElementById('cartBtn').style.color = 'var(--accent)';
            setTimeout(() => document.getElementById('cartBtn').style.color = '', 400);
        }

        function filterProducts(query) {
            const q = String(query || '').trim().toLowerCase();
            if (!q) { renderProducts(PRODUCTS); return; }
            const filtered = PRODUCTS.filter(p => p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q));
            renderProducts(filtered);
        }

        // ============================================================
        // DEAL TIMER
        // ============================================================
        (function setupDealTimer() {
            const now = new Date();
            const target = new Date(now.getTime() + (24 * 60 + 36) * 60 * 1000);

            function tick() {
                const diff = target - new Date();
                if (diff <= 0) {
                    document.getElementById('dealDays').textContent = '0';
                    document.getElementById('dealHours').textContent = '00';
                    document.getElementById('dealMinutes').textContent = '00';
                    document.getElementById('dealSeconds').textContent = '00';
                    return;
                }
                document.getElementById('dealDays').textContent = Math.floor(diff / (24 * 3600 * 1000));
                document.getElementById('dealHours').textContent = String(Math.floor((diff % (24 * 3600 * 1000)) / (3600 * 1000))).padStart(2, '0');
                document.getElementById('dealMinutes').textContent = String(Math.floor((diff % (3600 * 1000)) / (60 * 1000))).padStart(2, '0');
                document.getElementById('dealSeconds').textContent = String(Math.floor((diff % (60 * 1000)) / 1000)).padStart(2, '0');
            }
            tick();
            setInterval(tick, 1000);
        })();

        // ============================================================
        // EVENT BINDINGS
        // ============================================================
        searchBtn.addEventListener('click', () => filterProducts(searchInput.value));
        searchInput.addEventListener('keydown', (e) => { if (e.key === 'Enter') filterProducts(e.target.value); });

        mobileToggle.addEventListener('click', () => {
            const isOpen = mobileMenu.style.display === 'block';
            mobileMenu.style.display = isOpen ? 'none' : 'block';
            mobileToggle.innerHTML = isOpen ? '<i class="fas fa-bars"></i>' : '<i class="fas fa-times"></i>';
        });

        mobileMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                mobileMenu.style.display = 'none';
                mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
            });
        });

        document.getElementById('shopNow').addEventListener('click', () => {
            document.getElementById('products').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });
        document.getElementById('exploreDeals').addEventListener('click', () => {
            document.getElementById('deals').scrollIntoView({ behavior: 'smooth', block: 'start' });
        });

        document.getElementById('buyDeal').addEventListener('click', function() {
            cartCount++;
            updateCartCount();
            const orig = this.innerHTML;
            this.innerHTML = '<i class="fas fa-check"></i> Added!';
            this.style.background = 'var(--success)';
            setTimeout(() => { this.innerHTML = orig;
                this.style.background = ''; }, 1600);
        });

        newsletterForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const email = newsletterEmail.value.trim();
            if (!email || !email.includes('@')) {
                newsletterMsg.textContent = 'Please enter a valid email address.';
                newsletterMsg.style.color = '#ffb3b3';
                newsletterMsg.style.display = 'block';
                return;
            }
            newsletterMsg.textContent = '🎉 Thanks for subscribing!';
            newsletterMsg.style.color = '#a8e6cf';
            newsletterMsg.style.display = 'block';
            newsletterEmail.value = '';
            setTimeout(() => { newsletterMsg.style.display = 'none'; }, 3500);
        });

        document.getElementById('cartBtn').addEventListener('click', () => {
            alert(`🛒 Your cart has ${cartCount} item${cartCount !== 1 ? 's' : ''}.`);
        });

        document.getElementById('year').textContent = new Date().getFullYear();

        // ============================================================
        // INIT
        // ============================================================
        renderCategories();
        renderProducts(PRODUCTS);
        renderTestimonials();
        updateCartCount();

        window.addEventListener('resize', () => {
            if (window.innerWidth > 768) {
                mobileMenu.style.display = 'none';
                mobileToggle.innerHTML = '<i class="fas fa-bars"></i>';
            }
        });

        console.log('🚀 NexusShop — modern e‑commerce demo loaded.');
    
</script>
</body>
</html>
