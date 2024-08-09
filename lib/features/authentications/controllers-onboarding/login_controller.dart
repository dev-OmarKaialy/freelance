
import 'package:get/get.dart';

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

  void login() {
    // Call API to login
    print('Login successful!');
  }
}
