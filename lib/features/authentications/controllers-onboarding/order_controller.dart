import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <Map<String, String>>[].obs;

  void acceptOrder(int index) {

    orders.removeAt(index);
  }

  void deleteOrder(int index) {

    orders.removeAt(index);
  }

  @override
  void onInit() {
    super.onInit();

    orders.addAll([
      {"name": "Employee 1", "imageUrl": "https://via.placeholder.com/150"},
      {"name": "Employee 2", "imageUrl": "https://via.placeholder.com/150"},

    ]);
  }
}