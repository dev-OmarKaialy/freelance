import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class ProfileEditAdminController extends GetxController {
  var profileImage = ''.obs;
  var fullName = ''.obs;
  var birthDate = ''.obs;
  var city = ''.obs;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    profileImage.value = image.path;
  }

  void saveChanges() {
    print('Saving changes: ${fullName.value}, ${birthDate.value}, ${city.value}');
  }
}