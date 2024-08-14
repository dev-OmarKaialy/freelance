import 'package:get/get.dart';
import 'package:project1company/core/services/shared_preferences_service.dart';
import 'package:project1company/core/utils/toaster.dart';
import 'package:project1company/data/company/register/company_repo.dart';
import 'package:project1company/main.dart';

class LoginController extends GetxController {
  final _fullName = ''.obs;
  final _birthDate = ''.obs;
  final _city = ''.obs;
  final _profilePhoto = ''.obs;

  String get fullName => _fullName.value;
  String get birthDate => _birthDate.value;
  String get city => _city.value;
  String get profilePhoto => _profilePhoto.value;

  void updateFullName(String value) {
    _fullName.value = value;
  }

  void updateBirthDate(String value) {
    _birthDate.value = value;
  }

  void updateCity(String value) {
    _city.value = value;
  }

  void updateProfilePhoto(String value) {
    _profilePhoto.value = value;
  }

  void login(body) async {
    // Call API to login
    Toaster.showLoading();
    final r = await CompanyRepo().postlogin(body);
    r.fold((l) {
      Toaster.showToast(l.message);
    }, (r) async {
      await SharedPreferencesService.setToken(r.authToken ?? '');
      Get.to(const MainScreen());
    });
    Toaster.closeLoading();

    print('Login successful!');
  }
}
