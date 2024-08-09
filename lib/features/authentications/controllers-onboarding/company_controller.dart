// company_controller.dart

import 'package:get/get.dart';

import '../modules/admin.dart';
import '../modules/company.dart';


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
