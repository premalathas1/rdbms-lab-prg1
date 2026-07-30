#!/bin/bash

echo "========================================"
echo " CollegeDB SQL Assignment Test"
echo "========================================"

# Stop if student SQL contains an error
mysql -h127.0.0.1 -uroot -proot < student_solution.sql

if [ $? -ne 0 ]; then
    echo "Student SQL contains errors."
    exit 1
fi
