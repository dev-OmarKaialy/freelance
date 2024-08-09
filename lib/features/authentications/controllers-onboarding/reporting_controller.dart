import 'package:get/get.dart';

class ReportingController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs;

  void deleteReporting(int index) {
    orders.removeAt(index);
  }

  void incrementReportCount(int index) {
    orders[index]['reportCount'] = (orders[index]['reportCount'] ?? 0) + 1;
  }

  @override
  void onInit() {
    super.onInit();
    orders.addAll([
      {
        "name": "Amount",
        "imageUrl": "https://via.placeholder.com/150",
        "reportCount": 0,
        "reportReason": "No issues"
      },
      {
        "name": "Reporting",
        "imageUrl": "https://via.placeholder.com/150",
        "reportCount": 0,
        "reportReason": "No issues"
      },
      {
        "name": "Amount",
        "imageUrl": "https://via.placeholder.com/150",
        "reportCount": 0,
        "reportReason": "No issues" // أضف سبب التقرير هنا
      },
      {
        "name": "Reporting",
        "imageUrl": "https://via.placeholder.com/150",
        "reportCount": 0,
        "reportReason": "No issues" // أضف سبب التقرير هنا
      },
      {
        "name": "Amount",
        "imageUrl": "https://via.placeholder.com/150",
        "reportCount": 0,
        "reportReason": "No issues" // أضف سبب التقرير هنا
      },
      {
        "name": "Reporting",
        "imageUrl": "https://via.placeholder.com/150",
        "reportCount": 0,
        "reportReason": "No issues" // أضف سبب التقرير هنا
      },
    ]);

  }
}