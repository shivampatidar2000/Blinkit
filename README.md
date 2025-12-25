# README
# 🛒 Blinkit Clone (Ruby on Rails)

A basic Blinkit-like web application built using **Ruby on Rails**, demonstrating
**role-based access**, **order flow**, and **MVC architecture**.

This project supports three roles:
- **Customer**
- **Seller**
- **Rider**

The UI is intentionally simple using **HTML + CSS**, focusing on backend logic and clean design.

---

## 🚀 Features

### 👤 Authentication
- User signup & login using **Devise**
- Role-based redirection after login

### 🏪 Seller
- Create and manage items
- View own listed products

### 🛍 Customer
- Create delivery address
- Browse items
- Add items to cart
- Place orders
- View own orders

### 🚴 Rider
- View placed orders
- Deliver orders

---

## 🧱 Tech Stack

- Ruby 3.x
- Ruby on Rails 7.x
- SQLite (development)
- Devise (authentication)
- HTML + CSS (no frontend framework)

---

## 🗂 Database Design

### User
```text
id | name | email | role

id | name | price | quantity | seller_id

### item

id | name | price | quantity | seller_id

 Address

 id | street | city | pincode | user_id

cart 
id | user_id

cartItem
id | cart_id | item_id | quantity

order 
id | user_id | address_id | status | rider_id


🔐 User Roles
Role	Permissions
Customer	Address, Cart, Orders
Seller	Items
Rider	Deliver Orders
🔀 Role-based Redirect After Login
Role	Redirect Path
Seller	/items
Customer	/addresses/new
Rider	/orders

Implemented using Devise hooks:

after_sign_in_path_for

after_sign_up_path_for