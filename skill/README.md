# 🧪 Practical Module - Lab Exercises & Experiments

Welcome to the **Practical Module** of the DBMS & Database Design repository. This module contains hands-on lab experiments, practical SQL scripts, database administration tasks, and performance profiling exercises.

---

## 📌 Module Overview

The practical module bridges theoretical knowledge with hands-on implementation. It covers practical database creation, schema migrations, stored procedures, triggers, and query profiling.

### Key Focus Areas

1. **Practical Schema Implementation**
   - Writing DDL scripts for table creation, constraints, foreign key cascades, and check rules.
   - Database schema migrations using Alembic and raw SQL migration scripts.

2. **Advanced SQL & Stored Procedures**
   - Writing stored procedures, stored functions, and database triggers.
   - Views, materialized views, and dynamic SQL execution.

3. **Performance Profiling & Indexing Experiments**
   - Analyzing `EXPLAIN` and `EXPLAIN ANALYZE` output.
   - Index impact analysis (B-Tree vs Hash vs Composite Indexes).
   - Identifying and resolving slow query bottlenecks.

4. **Database Administration & Backup**
   - SQLite, PostgreSQL, and MySQL administration basics.
   - Database backup, dump, restore, and integrity checks.

---

## 📁 Repository Structure

```
practical/
├── week-01-ddl-and-constraints/                # BookFlow: CREATE DATABASE/TABLE, constraints
├── week-02-joins-aggregations-and-transactions/ # JOINs, GROUP BY, TRANSACTION, INDEX
├── week-03-aggregate-functions/                # COUNT/SUM/AVG with GROUP BY, HAVING, ORDER BY
├── week-04-joins-and-set-operations/           # CROSS/INNER/OUTER/SELF JOIN, UNION, INTERSECT
├── week-05-sql-examples-and-library-project/   # SQL examples + full-stack Library project
├── week-06-triggers-and-stored-procedures/     # Bank DB: procedures and BEFORE/AFTER triggers
├── week-07-sql-views/                          # Bank DB: simple, join, aggregate and GROUP BY views
└── week-08-acid-properties-and-isolation/      # Bank DB: COMMIT/ROLLBACK/SAVEPOINT, isolation levels
```

---

## 🗂️ Weekly Index

| Week | Topic | Contents |
|------|-------|----------|
| [01](week-01-ddl-and-constraints/) | DDL, Schema Definition & Constraints | SQL script, 10 output screenshots, MySQL Workbench installation guide |
| [02](week-02-joins-aggregations-and-transactions/) | JOINs, Aggregations, Transactions & Indexing | SQL script, 10 output screenshots (Fig 1–10), viva Q&A, assignments |
| [03](week-03-aggregate-functions/) | Aggregate Functions with `WHERE`, `GROUP BY`, `HAVING`, `ORDER BY` | Bank Management System practice notes |
| [04](week-04-joins-and-set-operations/) | Joins and Set Operations | All join types and `UNION` / `INTERSECT` / `EXCEPT` notes |
| [05](week-05-sql-examples-and-library-project/) | SQL Examples + Library Management System | Practice notes plus a ReactJS + Spring Boot + MySQL project |
| [06](week-06-triggers-and-stored-procedures/) | Triggers and Stored Procedures | Bank database procedural SQL and audit trail |
| [07](week-07-sql-views/) | SQL Views | Simple, `WHERE`, `JOIN`, aggregate and `GROUP BY` views |
| [08](week-08-acid-properties-and-isolation/) | ACID Properties and Isolation Levels | `COMMIT`, `ROLLBACK`, `SAVEPOINT` and the four isolation levels |

---

*Maintained by [NLR Group of Companies](https://nlrgroupofcompany.in)*
