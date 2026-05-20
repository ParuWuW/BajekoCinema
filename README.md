# 🎬 BajekoCinema

A full-stack cinema booking web application built with Java EE (Jakarta EE), JSP, and MySQL. BajekoCinema allows users to browse movies, select seats, and book tickets online, while providing administrators with a complete management dashboard.

---

## 📖 Table of Contents

- [Project Concept](#project-concept)
- [Tech Stack](#tech-stack)
- [MVC Architecture](#mvc-architecture)
- [Team Members](#team-members)
- [Features](#features)
- [Database Schema](#database-schema)
- [Project File Structure](#project-file-structure)
- [Installation & Setup](#installation--setup)
- [License](#license)

---

## 🎯 Project Concept

BajekoCinema is a cinema ticketing platform that replicates a real-world movie booking experience. 
**Users** can explore currently showing and upcoming movies, pick a theatre and showtime, choose their seats on an interactive layout, and confirm a booking. 
**Admins** manage movies, shows, users, and bookings through a dedicated dashboard.

The project demonstrates a layered enterprise Java web application using the MVC pattern with servlet controllers, service classes, DAO-based data access, filter, utility packages and JSP views.

---

## 🛠 Tech Stack

| Layer | Technology |
|---|---|
| Frontend | HTML5, CSS3, JSP (Jakarta Server Pages), JSTL |
| Backend | Java EE / Jakarta EE 10, HTTP Servlets |
| Database | MySQL (MariaDB 10.4) via JDBC |
| Security | BCrypt password hashing (`jBCrypt`), cookie-based session management |
| Build Tool | Maven (or your IDE's project builder) |
| Server | Apache Tomcat 10+ |
| IDE | Eclipse / IntelliJ IDEA |

---

## MVC Architecture

The application is structured in strict MVC layers. Each HTTP request flows through the following pipeline:

```
Browser Request
      │
      ▼
AuthenticationFilter  ──── validates SESSION_ID cookie on every request
      │
      ▼
Controller (Servlet)  ──── receives request, calls Service, sets attributes
      │
      ▼
Service Layer         ──── business logic, orchestrates DAO calls
      │
      ▼
DAO Layer             ──── SQL queries via JDBC (DBconfig)
      │
      ▼
Database (MySQL)
      │
      ▼
Model (POJO)          ──── data returned up the chain
      │
      ▼
Controller            ──── forwards to JSP view
      │
      ▼
JSP View              ──── renders HTML with JSTL/EL
```

### Layer Responsibilities

**Controllers** (`com.bajekocinema.controller`)
Servlets annotated with `@WebServlet`. Each servlet handles a specific URL pattern, reads request parameters, invokes the appropriate service method, sets request attributes, and forwards/redirects to the correct JSP.

**Services** (`com.bajekocinema.services`)
Plain Java classes containing business logic. They validate data, coordinate multiple DAO calls, and encapsulate rules (e.g., `SeatBookingService` wraps booking creation in a transaction).

**DAOs** (`com.bajekocinema.dao`)
Data Access Objects execute all SQL via `PreparedStatement`. They map `ResultSet` rows to model objects and return typed results to the service layer.

**Models** (`com.bajekocinema.model`)
Plain Java POJOs (getters/setters only) representing domain entities: `UserModel`, `MovieModel`, `BookingModel`, `ShowModel`, `SeatModel`, etc.

**Views** (`src/main/webapp/WEB-INF/pages/`)
JSP files organised by role (`public/`, `user/`, `admin/`, `auth/`, `common/`). They use JSTL `<c:forEach>`, `<c:if>`, `<c:choose>`, and EL `${...}` to render dynamic content.

**Filter** (`com.bajekocinema.filter.AuthenticationFilter`)
A `@WebFilter("/*")` that intercepts every request, validates the session cookie against the database, injects `loggedInUser` / `loggedInRole` request attributes, and enforces public / guest-only / protected / admin access rules.

---

## 👥 Team Members

| Name | Role |
|---|---|
| Khushi Shrestha | Creative Director |
| Pragun Bhattarai | Chief Operations |
| Darsheel Bam | Technical Lead |
| Sichu Maharjan | Experience Designer |
| Aviyaan Shrestha | Strategic Vision |

---

## ✨ Features

### 🌐 Public (No Login Required)

- **Home Page** — hero banner, now-showing and coming-soon movie grids, live title search
- **Now Showing** — filterable by date chips and genre pills; only shows movies with scheduled future shows
- **Coming Soon** — upcoming releases filterable by genre
- **About Us** — team introduction
- **Contact Us** — contact form UI and company contact cards
- **FAQ** — accordion-style frequently asked questions
- **Privacy Policy & Terms of Service** — static legal pages
- **Error Pages** — custom 404 and 500 error pages

### 🔐 Auth

- **Register** — user sign-up with BCrypt-hashed password, optional profile photo upload, phone/email uniqueness validation
- **Login** — email + password authentication; role-aware redirect (admin → dashboard, user → home)
- **Logout** — deactivates session in DB, deletes cookie

### 👤 User (Login Required)

- **Movie Booking Flow**
  - Select theatre → select date → select showtime → interactive seat grid (available / sold-out / selected states)
  - Seats are marked sold-out per-show using confirmed bookings only
  - Pending booking created atomically (booking + ticket + ticket_seat rows in a single transaction)
- **Booking Review** — summary page showing movie, hall, theatre, date/time, selected seats, and total amount; confirm or cancel
- **Previous Bookings** — booking history table with status colour coding
- **User Profile** — view and edit name, email, phone, password, profile photo

### 🛠 Admin (Admin Role Required)

- **Admin Dashboard** — navigation cards linking to all management sections
- **Movie Management** — list all movies, add new movie (with genre, duration, release date, description), delete movie
- **Show Management** — list all scheduled shows, schedule a new show (movie + hall + time)
- **User Management** — list all registered users with their details
- **Booking Management** — list all bookings; update booking status (pending / confirmed / cancelled); delete booking; two-step modal to book a show manually (filter by movie → select show)

---

## 🗄 Database Schema

The database is named `bajekocinema`.

### Tables

#### `user`
| Column | Type | Notes |
|---|---|---|
| userID | INT PK AUTO_INCREMENT | |
| fullName | VARCHAR(100) | |
| email | VARCHAR(150) UNIQUE | |
| phone | VARCHAR(20) UNIQUE | |
| password | VARCHAR(255) | BCrypt hash |
| isVerified | TINYINT(1) | 1 = verified |
| role | VARCHAR(10) | `'user'` or `'admin'` |
| image | TEXT | relative path to profile image |

#### `movie`
| Column | Type | Notes |
|---|---|---|
| movie_id | INT PK AUTO_INCREMENT | |
| title | VARCHAR(200) | |
| genre | VARCHAR(20) | FK → `genre.genre_name` |
| description | TEXT | |
| duration_min | INT | |
| release_date | DATE | |
| poster_url | TEXT | |
| trailer_url | TEXT | |
| imdb_score | DECIMAL(3,1) | |
| status | ENUM | `'upcoming'`, `'now_showing'`, `'ended'` |

#### `genre`
| Column | Type |
|---|---|
| genre_name | VARCHAR(20) PK |

#### `theatre`
| Column | Type |
|---|---|
| theatre_id | INT PK AUTO_INCREMENT |
| theatre_name | VARCHAR(150) |
| address | TEXT |
| phone | VARCHAR(20) |
| email | VARCHAR(150) |

#### `hall`
| Column | Type | Notes |
|---|---|---|
| hall_id | INT PK AUTO_INCREMENT | |
| theatre_id | INT FK → `theatre` | CASCADE DELETE/UPDATE |
| hall_name | VARCHAR(50) | |
| total_seats | SMALLINT | |

#### `seat`
| Column | Type |
|---|---|
| seat_id | INT PK AUTO_INCREMENT |
| hall_id | INT FK → `hall` |
| row_label | CHAR(2) |
| seat_number | INT |
| is_booked | TINYINT(1) DEFAULT 0 |

#### `shows`
| Column | Type | Notes |
|---|---|---|
| show_id | INT PK AUTO_INCREMENT | |
| movie_id | INT FK → `movie` | |
| theatre_id | INT FK → `theatre` | |
| hall_id | INT FK → `hall` | |
| show_date | DATE | |
| start_time | TIME | |
| status | ENUM | `'scheduled'`, `'cancelled'`, `'completed'` |

#### `booking`
| Column | Type | Notes |
|---|---|---|
| booking_id | INT PK AUTO_INCREMENT | |
| user_id | INT FK → `user` | |
| show_id | INT FK → `shows` | |
| booking_time | TIMESTAMP DEFAULT NOW() | |
| total_amount | DECIMAL(10,2) | |
| status | ENUM | `'pending'`, `'confirmed'`, `'cancelled'` |

#### `ticket`
| Column | Type | Notes |
|---|---|---|
| ticket_id | INT PK AUTO_INCREMENT | |
| booking_id | INT UNIQUE FK → `booking` | one-to-one |
| status | ENUM | `'active'`, `'cancelled'` |

#### `ticket_seat`
| Column | Type | Notes |
|---|---|---|
| ticket_seat_id | INT PK AUTO_INCREMENT | |
| ticket_id | INT FK → `ticket` | |
| seat_id | INT FK → `seat` | |
| seat_price | DECIMAL(8,2) | |

Unique constraint on `(ticket_id, seat_id)` prevents double-booking the same seat on the same ticket.

#### `payment`
| Column | Type |
|---|---|
| payment_id | INT PK AUTO_INCREMENT |
| booking_id | INT UNIQUE FK → `booking` |
| amount | DECIMAL(10,2) |

#### `sessions`
| Column | Type | Notes |
|---|---|---|
| session_id | VARCHAR(128) PK | 64-char hex token |
| user_id | INT FK → `user` | |
| created_at | DATETIME DEFAULT NOW() | |
| expires_at | DATETIME | |
| is_active | TINYINT(1) DEFAULT 1 | |

### Entity Relationship Summary

```
user ──< booking >── shows ──> movie
                 \         \── hall ──> theatre
                  \
                   ticket ──< ticket_seat >── seat
                         \
                          payment
user ──< sessions
movie ──> genre
hall ──> theatre
```

---

## 📁 Project File Structure

```
BajekoCinema/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/bajekocinema/
│       │       ├── controller/          # Servlets (MVC Controllers)
│       │       ├── dao/                 # Data Access Objects
│       │       ├── services/            # Business Logic Layer
│       │       ├── model/               # Domain POJOs
│       │       ├── filter/
│       │       └── utils/
│       └── webapp/
│           ├── assets/
│           │   └── css/                 # Stylesheets per page
│           ├── resources/
│           │   └── images/              # Uploaded images, logo, banners
│           └── WEB-INF/
│               ├── web.xml
│               └── pages/
│                   ├── public/          # Publicly accessible JSPs
│                   ├── auth/
│                   ├── user/
│                   ├── admin/
│                   ├── common/
│                   └── error/
├── Database/
│   └── bajekocinema.sql/                    # Database dump
└── pom.xml                              # Maven build config
```

---

## ⚙️ Installation & Setup

### Prerequisites

- Java JDK 17 or later
- Apache Tomcat 10.1+
- MySQL / MariaDB 10.4+
- Maven 3.8+ (or use your IDE's built-in Maven)
- A Java IDE (Eclipse with WTP, or IntelliJ IDEA Ultimate recommended)

---

### Step 1 — Clone the Repository

```bash
git clone https://github.com/your-org/bajekocinema.git
cd bajekocinema
```

---

### Step 2 — Create the Database

Open a MySQL shell or use a tool like phpMyAdmin / DBeaver, then run:

```sql
CREATE DATABASE bajekocinema
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE bajekocinema;
```

Then import the provided SQL dump to create all tables and seed data:

```bash
mysql -u root -p bajekocinema < bajekocinema.sql
```

Or from within the MySQL shell:

```sql
USE bajekocinema;
SOURCE /path/to/bajekocinema.sql;
```

---

### Step 3 — Configure the Database Connection

Open `src/main/java/com/bajekocinema/utils/DBconfig.java` and update the credentials to match your local MySQL setup:

```java
private static final String URL  = "jdbc:mysql://localhost:3306/bajekocinema";
private static final String USER = "root";       // your MySQL username
private static final String PASSWORD = "";       // your MySQL password
```

If your MySQL is running on a non-default port, update the URL accordingly.

---

### Step 4 — Default Admin
A default admin user has been stored in the dump file.
Email: admin@gmail.com
Password: admin@123

---

### Step 5 — Add the MySQL JDBC Driver

If you are using Maven, the `pom.xml` should already include the dependency:

```xml
<dependency>
    <groupId>com.mysql</groupId>
    <artifactId>mysql-connector-j</artifactId>
    <version>8.3.0</version>
</dependency>
```
---

### Step 6 — Build the Project

**With Maven:**

```bash
mvn clean package
```

This produces a `bajekocinema.war` file in the `target/` directory.

**With Eclipse:**
Right-click the project → Run As → Maven build → Goal: `clean package`

**With IntelliJ IDEA:**
Open the Maven panel → Lifecycle → `clean` then `package`.

---

### Step 7 — Deploy to Tomcat

**Option A — Deploy WAR manually:**

Configure a local Tomcat server in your IDE, add the project to it, and click Run / Debug. The IDE handles deployment automatically.

---

### Step 8 — Access the Application

Once Tomcat is running and the app is deployed:

| URL | Description |
|---|---|
| `http://localhost:8080/bajekocinema/home` | Public home page |
| `http://localhost:8080/bajekocinema/login` | Login page |
| `http://localhost:8080/bajekocinema/register` | Registration page |
| `http://localhost:8080/bajekocinema/admin/dashboard` | Admin dashboard (requires admin login) |

> The context path (`/bajekocinema`) depends on your WAR file name or server configuration. If you deploy the WAR as `ROOT.war`, the context path is omitted.

---

### Troubleshooting

- **DB connection fails:** Verify MySQL is running, the database name matches `bajekocinema`, and the credentials in `DBconfig.java` are correct.
- **404 on all pages:** Confirm the WAR deployed successfully. Check Tomcat logs at `logs/catalina.out`.
- **`ClassNotFoundException: com.mysql.cj.jdbc.Driver`:** The MySQL JDBC driver is not on the classpath. Ensure the JAR is in `WEB-INF/lib/` or declared in `pom.xml`.
- **Images not loading:** The app writes uploaded images to `resources/images/` relative to the deployed application root. This path is resolved via `ServletContext.getRealPath()` and is managed automatically on deployment.

---

## 📄 License

This project was developed as coursework for **Advanced Programming** at Islington College (affiliated with London Metropolitan University).

&copy; 2026 BajekoCinema Team — Khushi Shrestha, Pragun Bhattarai, Darsheel Bam, Sichu Maharjan, Aviyaan Shrestha. All rights reserved.
