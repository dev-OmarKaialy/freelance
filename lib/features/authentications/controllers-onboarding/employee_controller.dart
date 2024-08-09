import 'package:get/get.dart';

import '../modules/employee.dart';


class EmployeeController extends GetxController {
  var employees = <Employee>[].obs;

  void addEmployee(Employee employee) {
    employees.add(employee);
  }

  void removeEmployee(Employee employee) {
    employees.remove(employee);
  }

  // Example data
  void addExampleEmployees() {
    addEmployee(
      Employee(
        id: '1',
        name: 'John Doe',
        companyName: 'ABC Corporation',
        position: 'Software Engineer',
        email: 'john.doe@example.com',
        phoneNumber: '123-456-7890',
        address: '123 Main St, Anytown, USA',
      ),
    );

    addEmployee(
      Employee(
        id: '2',
        name: 'Jane Doe',
        companyName: 'XYZ Inc.',
        position: 'Marketing Manager',
        email: 'jane.doe@example.com',
        phoneNumber: '987-654-3210',
        address: '456 Elm St, Othertown, USA',
      ),
    );
  }
}