# flutter_application_sample

A new Flutter project.

# POS Demo App (Flutter)

This project is a **POS browsing and cart demo application** built in Flutter, following **Clean Architecture** and **industry-standard practices**.

The app demonstrates how to design scalable features.


##  Implemented Features

###  Authentication (Login)
- Secure login flow
- Network connectivity handling
- Proper exception mapping (Network, Server, Auth)
- Clean separation of concerns (Data / Domain / Presentation)

###  Product Browsing (In Progress)
- Product Categories (API: `pos-main`)
- Products by Category with Pagination (API: `products_by_category`)
- Search within selected category
- Add to Cart interaction (UI-driven)
- Shimmer loading for categories & products
- Token-based authorization (Bearer)

> ⚠️ Note: API endpoints are protected and currently return `200 OK` with `success: false (Access denied)`.
> Models and data layers are designed **defensively** based on UI needs and common REST conventions.

---

##  Architecture

This project follows **Clean Architecture**:




lib/
├── core/
│ ├── network/
│ ├── error/
│ ├── utils/
│ └── widgets/  **All folders are not included here**:
│
├── features/
│ ├── login/
│ │ ├── data/
│ │ ├── domain/
│ │ └── presentation/
│ │
│ └── product_catalog/
│ ├── data/
│ ├── domain/
│ └── presentation/
│
└── main.dart



---

## Design Decisions

- **UI-driven modeling**: Domain entities are based on UI requirements, not unstable API responses
- **Defensive JSON parsing** to avoid crashes
- **Separation of DTOs & Entities**
- **Mock-ready data sources** for blocked APIs
- **Bloc -based state management**

---

## 🚀 Tech Stack

- Flutter
- Dart
- Bloc
- Clean Architecture
- REST APIs
- Token-based Auth
- Shimmer loading

---

##  Status

-  Login feature completed
-  Product catalog feature in progress
-  UI polish pending (design to be added later)

---

##  Notes

This repository is part of a technical assignment.  
