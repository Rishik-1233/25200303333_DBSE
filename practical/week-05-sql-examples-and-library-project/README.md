# Week 5 — SQL Practice Examples + Full-Stack Library Management Project

**Course:** Database System Engineering and Distributed Backend Development
**Course Code:** 25CS1302E

---

Week 5 has two parts: a set of SQL practice queries on `physician` / `department` tables, and
the complete full-stack **Library Management System** project that connects a ReactJS frontend
to a Spring Boot REST API backed by MySQL.

---

## Files

| Path | Description |
|------|-------------|
| [`week05_physician_department_examples.txt`](week05_physician_department_examples.txt) | SQL practice notes — `physician` and `department` tables, joins and subqueries |
| [`library_react_springboot_mysql/`](library_react_springboot_mysql/) | Complete project: ReactJS + Spring Boot 3 + MySQL 8 + Postman |

---

## Part 1 — SQL Practice Examples

The notes build a `physician` table (`employeeid`, `name`, `position`, `ssn`) and a
`department` table, seed them with data, and then work through queries that combine the two —
filtering, joining and using subqueries to answer questions about staff and departments.

Run the statements in order in **MySQL Workbench** and verify each step in the **Result Grid**.

---

## Part 2 — Library Management System (Full Stack)

### Technology Stack

| Layer | Technology |
|-------|-----------|
| Frontend | ReactJS, Vite, JavaScript |
| Backend | Spring Boot 3, Spring Security, JWT, BCrypt, Spring Data JPA, Bean Validation, `@Async` logging |
| Database | MySQL 8, MySQL Workbench |
| API testing | Postman |

### Architecture

```
ReactJS
   |
   |  REST / JSON / JWT
   v
Spring Boot REST API
   |
   +-- Validation
   +-- JWT Security
   +-- BCrypt
   +-- JPA / Hibernate
   +-- @Async Audit Task
   +-- Semantic Search Service
   |
   v
MySQL 8
   ^
   |
MySQL Workbench
```

### Project Layout

```
library_react_springboot_mysql/
├── backend/          # Spring Boot 3 REST API (Maven)
│   └── src/main/java/com/library/api/
│       ├── controller/   # Auth, Book, Health, GlobalExceptionHandler
│       ├── model/        # Book, Member entities
│       ├── dto/          # Request/response objects
│       ├── repository/   # Spring Data JPA repositories
│       ├── security/     # JWT filter, SecurityConfig, JwtService
│       └── service/      # BookService, AuditService, EmbeddingService
├── frontend/         # ReactJS + Vite client
├── database/         # library_database.sql
└── postman/          # Library_API.postman_collection.json
```

### Quick Start

1. **Database** — in MySQL Workbench run:
   ```sql
   CREATE DATABASE IF NOT EXISTS library_db;
   USE library_db;
   ```
   The same SQL lives in `library_react_springboot_mysql/database/library_database.sql`.
2. **Backend** — set your MySQL credentials in
   `backend/src/main/resources/application.properties`, then `mvn spring-boot:run`.
3. **Frontend** — `cd frontend && npm install && npm run dev`.
4. **API testing** — import `postman/Library_API.postman_collection.json` into Postman.

Full setup instructions are in
[`library_react_springboot_mysql/README.md`](library_react_springboot_mysql/README.md).
