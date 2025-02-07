-- Category seed data
INSERT INTO categories (gender, main_category, sub_category, created_at, updated_at)
VALUES 
('men', 'tops', 'fleece', NOW(), NOW()),
('men', 'tops', 'hoodies', NOW(), NOW()),
('men', 'tops', 'sweatshirts', NOW(), NOW()),
('men', 'tops', 'shirts', NOW(), NOW()),
('men', 'tops', 'tshirts', NOW(), NOW()),
('men', 'tops', 'vests', NOW(), NOW()),
('men', 'tops', 'jumpers', NOW(), NOW()),
('men', 'bottoms', 'trousers', NOW(), NOW()),
('men', 'bottoms', 'shorts', NOW(), NOW()),
('men', 'bottoms', 'swimwear', NOW(), NOW()),
('men', 'jackets', 'insulated', NOW(), NOW()),
('men', 'jackets', 'waterproof', NOW(), NOW()),
('men', 'jackets', 'changing robes', NOW(), NOW()),
('men', 'jackets', 'ponchos', NOW(), NOW()),
('men', 'jackets', 'overshirts', NOW(), NOW());

INSERT INTO products (name, description, created_at, updated_at, category_id, price)
VALUES
('Set Off Recycled Polar 1/4 Zip Fleece', 'The Set Off takes classic heritage-inspired style and function to new levels with responsible materials and mindful manufacturing processes.
Built for escapism, built for comfort and made to roam.', NOW(), NOW(), 1, 6495),
('Heritage Recycled Cotton Sweatshirt', 'The Heritage is a go to layer with classic style. Featuring classic branding and made in Recycled and Organic cotton, there''s no way you can go wrong. A solid base layer for transitional days.', NOW(), NOW(), 3, 5495),
('Vita Organic Cotton Hoodie', 'We all need that go to road trip layer. The Vita hoodie is it, with soft brushback organic cotton.', NOW(), NOW(), 2, 69.95),
('Swell Knitted Jumper', 'The Swell is a classic, casual knit ready for those transitional days of autumn. Made in a textured Organic Cotton blend and styled for everyday wear.', NOW(), NOW(), 7, 5995),
('Backcountry Cord Shirt', 'Our Backcountry shirt is a solid mid layer, super wearable for when you need a bit of style and function combined.
Made with soft Cotton Corduroy it has a classic feel and fit with a strong escapism vibes. Perfect for those in between season days.', NOW(), NOW(), 4, 6495),
('Classic Logo Recycled Cotton T-Shirt', 'Crafted with our Recycled & Organic Cotton blend.
Featuring a water-based print and cut in our signature everyday fit. For every order, you plant a tree', NOW(), NOW(), 5, 2195),
('Escapism Recycled Cotton Vest', 'The Escapism Recycled Cotton Vest has a classic feel and fit perfect for adventure. Made from a blend of recycled and organic cotton.', NOW(), NOW(), 6, 2795),
('Adventurer Organic Canvas Trouser', 'Meet the Adventurer Organic Canvas Trouser, perfect for those hazy days roaming between waves and trees. With a relaxed fit, adjustable front fastening, and plenty of pockets, these trousers are your go-to for comfort and style.', NOW(), NOW(), 8, 7495),
('365 Organic Cotton Short', 'The 365 Short is the warmer weather brother of popular 365 Trouser.
With a soft garment dye finish and 2% Elastane for just a touch of stretch, they''re smart enough for casual days and comfy enough for your next adventure. A solid option, any day.', NOW(), NOW(), 9, 5995),
('Core All Purpose Short', 'Discover the Core All Purpose Short, designed to be at home amongst tall pines, in calming seas, and distant peaks. These stretch shorts feature an elasticated waistband and a blend of organic cotton and recycled polyester, ensuring comfort wherever your adventures take you.', NOW(), NOW(), 10, 5995),
('Baltic Recycled Insulated Parka', 'The Baltic has been a community favourite for a long time, and with good reason. This season we are bringing you the new and improved Baltic, the perfect parka style jacket.
With an upgrade in the fabric department, a new quilted lining and the addition of an internal mesh back panel and vent for breathability, you will want this jacket with you on every adventure. You asked and we listened.', NOW(), NOW(), 11, 15995),
('Downpour Recycled Waterproof Jacket', 'We’ve all been there, up sh*t creek without a waterproof. Packable and fully seam sealed the Downpour keeps you dry when you need it, packing down small to fit in your backpack and out in a flash when the wind picks up and the skies darken.

Then the steep climb begins and venting heat is a must. That''s why we added underarm zips to stop overheating, no more ''on off on off''.

All of our waterproof gear is treated with PFC-free durable water repellents (DWRs). Committing to PFC-free puts less stress on the environment and zero reliance on forever chemicals.', NOW(), NOW(), 12, 13995),
('Waves Recycled Sherpa Lined Changing Robe', 'Already a solid favourite this changing robe has a super soft, cosy and snug sherpa fleece lining. Featuring zip chest pocket, cosy concealed hand pockets and drawcord hood to keep out the elements. Get changed anywhere in privacy and comfort, dry off, stay warm and keep the elements at bay. Built from recycled materials with a PFC-Free water resistant coating.', NOW(), NOW(), 13, 11995);