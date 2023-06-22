apis=
companies apis
1.register a company to the system
url = http://127.0.0.1:8000/api/company/register/
body info = {
    "company_email":"nill2@nill.com",
    "company_name":"nill2",
    "password":"1234",
    "password2":"1234"
}

2.login as that company
url=http://127.0.0.1:8000/api/company/login/
body _info ={
    "company_email":"nill@nill.com",
    "password":"1234"
}

3.view company profile
url= http://127.0.0.1:8000/api/company/profile/
use beare token from login

employees apis
1.get ist of all employees of all companies
url=http://127.0.0.1:8000/api/employee/list/

2.add new employee
url=http://127.0.0.1:8000/api/employee/add/
body ={
    "company":"2",
    "employee_id":"nill3emp3",
    "name":"nill2",
    "department":"IT",
    "address":"DHAKA",
    "emp_email":"nill3@nill2.com",
    "date_joined":"2023-06-24"
}
3.update employee info
url=http://127.0.0.1:8000/api/employee/info_update/<id>
body ={
    "company":"2",
    "employee_id":"nill3emp3",
    "name":"nill2",
    "department":"IT",
    "address":"DHAKA",
    "emp_email":"nill3@nill2.com",
    "date_joined":"2023-06-24"
}
4.singel employee info
url=http://127.0.0.1:8000/api/employee/detail/<id>

5.delete employee
url=http://127.0.0.1:8000/api/employee/delete/<id>



Device apis
1.get ist of all device of all employees
url=http://127.0.0.1:8000/api/device/list/

2.add new device
url=http://127.0.0.1:8000/api/device/add/
body ={
    "id": 3,
    "assigned_employee": 2,
    "device_id": "N111",
    "device_company_name": "N1",
    "device_type": "laptop",
    "device_model": "Super N1",
    "device_info": "very good laptop",
    "device_assigned_from":"2023-06-24",
    "device_assigned_to": "2023-07-24",
    "device_log": "is being usedby nill2",
    "device_currently_used": "1",
    "device_returned": "0",
    "device_returned_date": null
}
3.update device info
url=http://127.0.0.1:8000/api/device/info_update/<id>
body ={
    "id": 3,
    "assigned_employee": 2,
    "device_id": "N111",
    "device_company_name": "N1",
    "device_type": "laptop",
    "device_model": "Super N1",
    "device_info": "very good laptop",
    "device_assigned_from":"2023-06-24",
    "device_assigned_to": "2023-07-24",
    "device_log": "is being usedby nill2",
    "device_currently_used": "1",
    "device_returned": "0",
    "device_returned_date": null
}
4.singel device info
url=http://127.0.0.1:8000/api/device/detail/<id>

5.delete device
url=http://127.0.0.1:8000/api/device/delete/<id>