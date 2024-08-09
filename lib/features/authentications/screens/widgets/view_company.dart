// company_model.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../modules/admin.dart';
import '../../modules/company.dart';


// admin_model.dart

// company_controller.dart

class CompanyController extends GetxController {
  var companies = <Company>[].obs;
  var admins = <Admin>[].obs;

  void addCompany(Company company) {
    companies.add(company);
  }

  void addAdmin(Admin admin) {
    admins.add(admin);
  }

  // Example data
  void addExampleCompanies() {
    addCompany(
      Company(
        id: '1',
        name: 'ABC Corporation',
        address: '123 Main St, Anytown, USA',
        phoneNumber: '123-456-7890',
        email: 'abc@example.com',
      ),
    );

    addCompany(
      Company(
        id: '2',
        name: 'XYZ Inc.',
        address: '456 Elm St, Othertown, USA',
        phoneNumber: '987-654-3210',
        email: 'xyz@example.com',
      ),
    );
  }

  void addExampleAdmins() {
    addAdmin(
      Admin(
        id: '1',
        name: 'John Doe',
        companyId: '1',
        companyName: 'ABC Corporation',
      ),
    );

    addAdmin(
      Admin(
        id: '2',
        name: 'Jane Doe',
        companyId: '2',
        companyName: 'XYZ Inc.',
      ),
    );
  }
}

// admin_page.dart

class ViewEmployee extends StatelessWidget {
  final CompanyController _companyController = Get.put(CompanyController());

  @override
  Widget build(BuildContext context) {
    _companyController.addExampleCompanies(); // Add example companies
    _companyController.addExampleAdmins(); // Add example admins

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Page'),
      ),
      body: Obx(() => Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _companyController.companies.length,
              itemBuilder: (context, index) {
                Company company = _companyController.companies[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          company.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Address: ${company.address}'),
                        Text('Phone Number: ${company.phoneNumber}'),
                        Text('Email: ${company.email}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _companyController.admins.length,
              itemBuilder: (context, index) {
                Admin admin = _companyController.admins[index];

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          admin.name,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text('Company: ${admin.companyName}'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
