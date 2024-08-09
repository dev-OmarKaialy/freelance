
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';



class ProfileEditController extends GetxController {
  var profileImage = ''.obs;
  var fullName = ''.obs;
  var birthDate = ''.obs;
  var city = ''.obs;
  var posts = <String>[

    'Post 1: Welcome to the admin profile!',
    'Post 2: Here you can manage user data.',
    'Post 3: Don\'t forget to check the latest updates.',
    'Post 4: Customize your profile settings.',
    'Post 5: Keep your information up to date.'
  ].obs; // قائمة المنشورات

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    profileImage.value = image.path;
  }

  void saveChanges() {
    print('Saving changes: ${fullName.value}, ${birthDate.value}, ${city.value}');
  }


}