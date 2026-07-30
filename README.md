# SQL Lab Assignment

## Title

Create CollegeDB Database and Department Table

---

## Objective

This assignment helps students learn how to:

- Create a database
- Select a database using USE
- Create a table
- Define a Primary Key
- Use INT and VARCHAR data types
- Verify the table structure

---

## Problem Statement

Create a database named **CollegeDB**.

Inside the database, create a table named **Department** with the following fields.

| Column Name | Data Type | Constraint |
|--------------|-----------|------------|
| DepartmentID | INT(5) | PRIMARY KEY |
| DepartmentName | VARCHAR(20) | |
| HOD | VARCHAR(20) | |

---

## Files Provided

```
student_solution.sql
test.sh
README.md
```

Complete only the SQL statements in **student_solution.sql**.

---

## Sample Output

```
mysql> SHOW DATABASES;

CollegeDB

mysql> USE CollegeDB;

mysql> SHOW TABLES;

Department

mysql> DESC Department;

+----------------+-------------+------+-----+---------+-------+
| Field          | Type        | Null | Key | Default | Extra |
+----------------+-------------+------+-----+---------+-------+
| DepartmentID   | int(5)      | NO   | PRI | NULL    |       |
| DepartmentName | varchar(20) | YES  |     | NULL    |       |
| HOD            | varchar(20) | YES  |     | NULL    |       |
+----------------+-------------+------+-----+---------+-------+
```

---

## Submission Instructions

1. Complete **student_solution.sql**.
2. Do not rename the file.
3. Commit the changes.
4. Push the repository to GitHub.
5. GitHub Actions will automatically execute the test cases.

---

## Marks Distribution

| Test Case | Marks |
|------------|------:|
| Database Created | 2 |
| Department Table Created | 2 |
| Correct Columns | 3 |
| Primary Key | 3 |
| **Total** | **10 Marks** |

---

## Repository Structure

```
CollegeDB-Assignment
│
├── student_solution.sql
├── test.sh
├── README.md
│
└── .github
    └── workflows
        └── autograding.yml
```

---

**Best of Luck!**
