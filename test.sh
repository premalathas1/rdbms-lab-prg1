#!/bin/bash

echo "====================================="
echo " SQL Assignment Test"
echo "====================================="

# Execute student's SQL file

mysql -h127.0.0.1 -uroot -proot < student_solution.sql

if [ $? -ne 0 ]; then
    echo "Student SQL contains syntax errors."
    exit 1
fi

marks=0

#################################################
echo ""
echo "Test Case 1 : Database"

db=$(mysql -N -h127.0.0.1 -uroot -proot -e "
SELECT SCHEMA_NAME
FROM INFORMATION_SCHEMA.SCHEMATA
WHERE SCHEMA_NAME='CollegeDB';")

if [ "$db" = "CollegeDB" ]; then
    echo "PASS"
    marks=$((marks+2))
else
    echo "FAIL"
fi

#################################################
echo ""
echo "Test Case 2 : Department Table"

table=$(mysql -N -h127.0.0.1 -uroot -proot CollegeDB -e "
SHOW TABLES LIKE 'Department';")

if [ "$table" = "Department" ]; then
    echo "PASS"
    marks=$((marks+2))
else
    echo "FAIL"
fi

#################################################
echo ""
echo "Test Case 3 : DepartmentID"

column=$(mysql -N -h127.0.0.1 -uroot -proot CollegeDB -e "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentID';")

if [ "$column" = "DepartmentID" ]; then
    echo "PASS"
    marks=$((marks+2))
else
    echo "FAIL"
fi

#################################################
echo ""
echo "Test Case 4 : DepartmentName"

column=$(mysql -N -h127.0.0.1 -uroot -proot CollegeDB -e "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='DepartmentName';")

if [ "$column" = "DepartmentName" ]; then
    echo "PASS"
    marks=$((marks+2))
else
    echo "FAIL"
fi

#################################################
echo ""
echo "Test Case 5 : HOD"

column=$(mysql -N -h127.0.0.1 -uroot -proot CollegeDB -e "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND COLUMN_NAME='HOD';")

if [ "$column" = "HOD" ]; then
    echo "PASS"
    marks=$((marks+1))
else
    echo "FAIL"
fi

#################################################
echo ""
echo "Test Case 6 : Primary Key"

pk=$(mysql -N -h127.0.0.1 -uroot -proot CollegeDB -e "
SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
WHERE TABLE_SCHEMA='CollegeDB'
AND TABLE_NAME='Department'
AND CONSTRAINT_NAME='PRIMARY';")

if [ "$pk" = "DepartmentID" ]; then
    echo "PASS"
    marks=$((marks+1))
else
    echo "FAIL"
fi

#################################################

echo ""
echo "====================================="
echo "Total Marks : $marks /10"
echo "====================================="

if [ "$marks" -eq 10 ]; then
    exit 0
else
    exit 1
fi
