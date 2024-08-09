// employee_controller.dart
// employee_model.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers-onboarding/employee_controller.dart';
import '../../modules/employee.dart';



// employee_model.dart


// admin_page.dart

class AdminPage extends StatelessWidget {
  final EmployeeController _employeeController = Get.put(EmployeeController());

  @override
  Widget build(BuildContext context) {
    _employeeController.addExampleEmployees(); // Add example employees

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: _employeeController.employees.length,
        itemBuilder: (context, index) {
          Employee employee = _employeeController.employees[index];

          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    employee.name,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Company: ${employee.companyName}'),
                  Text('Position: ${employee.position}'),
                  Text('Email: ${employee.email}'),
                  Text('Phone Number: ${employee.phoneNumber}'),
                  Text('Address: ${employee.address}'),
                ],
              ),
            ),
          );
        },
      )),
    );
  }
}
