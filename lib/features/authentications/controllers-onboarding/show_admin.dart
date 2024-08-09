import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Controller Class
class DropDownHelper extends GetxController {
  var selectedValue1 = "".obs;
  var selectedValue2 = "".obs;
  var selectedValue3 = "".obs;

  List<Map<String, String>> dropDownListData = [
    {"value": "1", "title": "Skill 1"},
    {"value": "2", "title": "Type 1"},
    {"value": "3", "title": "Category 1"},
    // Add more items as needed
  ];

  void onSelect1(String? value) {
    selectedValue1.value = value!;
    update();
  }

  void onSelect2(String? value) {
    selectedValue2.value = value!;
    update();
  }

  void onSelect3(String? value) {
    selectedValue3.value = value!;
    update();
  }

  void updateItem(String value, String newTitle) {
    int index = dropDownListData.indexWhere((item) => item['value'] == value);
    if (index != -1) {
      dropDownListData[index]['title'] = newTitle;
      update();
    }
  }

  void deleteItem(String value) {
    dropDownListData.removeWhere((item) => item['value'] == value);
    update();
  }

  void addItem(String title) {
    int newValue = dropDownListData.length + 1;
    dropDownListData.add({"value": newValue.toString(), "title": title});
    update();
  }
}