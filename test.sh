#!/bin/bash

set -e

MYSQL="mysql -h127.0.0.1 -P3306 -uroot -proot"

echo "====================================="
echo " SQL Assignment Test"
echo "====================================="

# Check that the student's file exists
if [ ! -f student_solution.sql ]; then
    echo "ERROR: student_solution.sql not found."
    exit 1
fi

echo "Executing student_solution.sql..."

# Execute the student's SQL
$MYSQL --force < student_solution.sql

echo ""

marks=0

########################################
# Test Case 1 - Database
########################################

DB=$($MYSQL -Nse "SELECT SCHEMA_NAME FROM INFORMATION_SCHEMA.SCHEMATA WHERE SCHEMA_NAME='CollegeDB';")

if [ "$DB" = "CollegeDB" ]; then
    echo "✓ Database created"
    marks=$((marks+2))
else
    echo "✗ Database CollegeDB not found"
    echo "Marks : $marks /10"
    exit 1
fi

########################################
# Test Case 2 - Table
########################################

TABLE=$($MYSQL -D CollegeDB -Nse "SHOW TABLES LIKE 'Department';")

if [ "$TABLE" = "Department" ]; then
    echo "✓ Department table created"
    marks=$((marks+2))
else
    echo "✗ Department table missing"
    echo "Marks : $marks /10"
    exit 1
fi

########################################
# Test Case 3 - DepartmentID
########################################

COL=$($MYSQL -Nse "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentID';")

if [ "$COL" = "DepartmentID" ]; then
    echo "✓ DepartmentID exists"
    marks=$((marks+2))
fi

########################################
# Test Case 4 - DepartmentName
########################################

COL=$($MYSQL -Nse "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentName';")

if [ "$COL" = "DepartmentName" ]; then
    echo "✓ DepartmentName exists"
    marks=$((marks+2))
fi

########################################
# Test Case 5 - HOD
########################################

COL=$($MYSQL -Nse "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='HOD';")

if [ "$COL" = "HOD" ]; then
    echo "✓ HOD exists"
    marks=$((marks+1))
fi

########################################
# Test Case 6 - Primary Key
########################################

PK=$($MYSQL -Nse "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND CONSTRAINT_NAME='PRIMARY';")

if [ "$PK" = "DepartmentID" ]; then
    echo "✓ Primary Key correct"
    marks=$((marks+1))
fi

echo ""
echo "====================================="
echo "Total Marks : $marks /10"
echo "====================================="

if [ "$marks" -eq 10 ]; then
    exit 0
else
    exit 1
fi
