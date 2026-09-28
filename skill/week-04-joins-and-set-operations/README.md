# Week 4 — Joins and Set Operations

**Course:** Database System Engineering and Distributed Backend Development  
**Course Code:** 25CS1302E

---

Every join type and set operation demonstrated on small, easy-to-trace tables
(`class` and `class_info`), so the effect of each operator on the result set is visible
row by row.

> Notes by Dr. Y Subbarayudu, Department of CSE, KL University, Bachupally, Hyderabad.

---

## Files

| File | Description |
|------|-------------|
| [`week04_joins_and_set_operations.txt`](week04_joins_and_set_operations.txt) | SQL practice notes — queries with step-by-step commentary |

---

## Topics Covered

- `CROSS JOIN` — Cartesian product
- `INNER JOIN` — only matching rows
- `LEFT JOIN` / `RIGHT JOIN` — keep all rows from one side
- `FULL OUTER JOIN` emulation in MySQL
- `SELF JOIN`
- Set operations: `UNION`, `UNION ALL`, `INTERSECT` and `EXCEPT` / `MINUS` emulation

---

## How to Run

Open **MySQL Workbench**, connect to your local instance, open a new query tab, and run the
statements in order from the notes file above. Confirm each step through the **Result Grid**
and the green tick in **Action Output**.
