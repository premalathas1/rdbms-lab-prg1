#!/bin/bash

echo "========================================"
echo " CollegeDB SQL Assignment Test"
echo "========================================"

# Execute student SQL file
mysql -h127.0.0.1 -uroot -proot < student_solution.sql

echo ""

# -----------------------------
# Test Case 1
# -----------------------------
echo "Test Case 1: Checking Database..."

mysql -h127.0.0.1 -uroot -proot -e "SHOW DATABASES;" | grep -w "CollegeDB"

if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL: CollegeDB database not found."
    exit 1
fi

# -----------------------------
# Test Case 2
# -----------------------------
echo "Test Case 2: Checking Department Table..."

mysql -h127.0.0.1 -uroot -proot CollegeDB -e "SHOW TABLES;" | grep -w "Department"

if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL: Department table not created."
    exit 1
fi

# -----------------------------
# Test Case 3
# -----------------------------
echo "Test Case 3: Checking DepartmentID..."

mysql -h127.0.0.1 -uroot -proot CollegeDB -e "DESC Department;" | grep -w "DepartmentID"

if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL: DepartmentID column missing."
    exit 1
fi

# -----------------------------
# Test Case 4
# -----------------------------
echo "Test Case 4: Checking DepartmentName..."

mysql -h127.0.0.1 -uroot -proot CollegeDB -e "DESC Department;" | grep -w "DepartmentName"

if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL: DepartmentName column missing."
    exit 1
fi

# -----------------------------
# Test Case 5
# -----------------------------
echo "Test Case 5: Checking HOD..."

mysql -h127.0.0.1 -uroot -proot CollegeDB -e "DESC Department;" | grep -w "HOD"

if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL: HOD column missing."
    exit 1
fi

# -----------------------------
# Test Case 6
# -----------------------------
echo "Test Case 6: Checking Primary Key..."

mysql -h127.0.0.1 -uroot -proot CollegeDB -e "SHOW CREATE TABLE Department;" | grep "PRIMARY KEY"

if [ $? -eq 0 ]; then
    echo "PASS"
else
    echo "FAIL: Primary Key not defined."
    exit 1
fi

echo ""
echo "========================================"
echo "All Test Cases Passed"
echo "Score : 10/10"
echo "========================================"

exit 0
