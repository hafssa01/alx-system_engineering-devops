#!/usr/bin/python3
"""
Retrieves to-do list details for a specific employee ID.

This script accepts an employee ID as a command-line input,
retrieves the associated user data and to-do list from the
JSONPlaceholder API, and displays the tasks completed by the
employee.
"""
import requests
import sys
import csv

if __name__ == "__main__"
	url = 

	employee_id = sys.argv[1]
	user = requests.get(url + "users/{}".format(employee_id)).json()

	params = {"user_id": employee_id}
	todos = requests.get(url + "todos", params).json()

	completed = [t.get("title") for t in todos if t.get("completed") is True]

 	print("Employee {} is done with tasks({}/{}):".format(user.get("name"), len(completed), len(todos)))
	[print("\t {}".format(complete)) for complete in completed]
