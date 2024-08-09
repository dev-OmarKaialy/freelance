import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final List<Map<String, dynamic>> allEmployeee = [
    {"name": "nour", "dep": "SecSection"},
    {"name": "ahmad", "dep": "firstSection"},
    {"name": "shahad", "dep": "firstSection"},
    {"name": "aya", "dep": "lastSection"},
    {"name": "maram", "dep": "theSection"},
  ];
  Rx<List<Map<String, dynamic>>> foundEmployee =
  Rx<List<Map<String, dynamic>>>([]);
  @override
  void onInit() {
    super.onInit();
    foundEmployee.value = allEmployeee;
  }

  void onReady() {
    super.onReady();
  }

  void onClose() {}

  void filterEmployee(String employeeName) {
    List<Map<String, dynamic>> result = [];

    if (employeeName.isEmpty) {
      result = allEmployeee;
    } else {
      result = allEmployeee
          .where((element) => element["name"]
          .toString()
          .toLowerCase()
          .contains(employeeName.toLowerCase()))
          .toList();
    }
    foundEmployee.value = result;
  }
}

class SearchPage extends GetView<SearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SearchController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Searching'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => controller.filterEmployee(value),
              decoration: const InputDecoration(
                labelText: 'Search',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: controller.foundEmployee.value.length,
                itemBuilder: (context, index) {
                  if (index < controller.foundEmployee.value.length) {
                    return ListTile(
                      title: Text(
                        controller.foundEmployee.value[index]['name'] ?? '',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        controller.foundEmployee.value[index]['dep'] ?? '',
                      ),
                    );
                  } else {
                    return Container(); // or some other default widget
                  }
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
