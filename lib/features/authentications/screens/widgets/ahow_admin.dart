
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1company/utils/costants/const.dart';

import '../../controllers-onboarding/show_admin.dart';


class DropDownHelperView extends StatelessWidget {
  final dropDownHelperController = Get.put(DropDownHelper());

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text('SHOW', style: TextStyle(color: Colors.white)),
                backgroundColor: kfirstColor,
                elevation: 0,
              ),
              body: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/photo_2024-06-20_14-02-26.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(constraints.maxWidth > 600 ? 30 : 20),
                    child: ListView(
                      children: [
                        const SizedBox(height: 20),
                        _buildDropdownRow(context, constraints, dropDownHelperController.selectedValue1, dropDownHelperController.onSelect1, "Select Skill"),
                        const SizedBox(height: 20),
                        _buildDropdownRow(context, constraints, dropDownHelperController.selectedValue2, dropDownHelperController.onSelect2, "Select Type"),
                        const SizedBox(height: 20),
                        _buildDropdownRow(context, constraints, dropDownHelperController.selectedValue3, dropDownHelperController.onSelect3, "Select Categories"),
                        const SizedBox(height: 20),
                        _buildSubmitButton(constraints),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDropdownRow(BuildContext context, BoxConstraints constraints, RxString selectedValue, Function(String?) onSelect, String hintText) {
    return Row(
      children: [
        Expanded(
          child: GetBuilder<DropDownHelper>(
            builder: (_) => InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                contentPadding: EdgeInsets.all(constraints.maxWidth > 600 ? 15 : 10),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isDense: true,
                  value: selectedValue.value.isNotEmpty ? selectedValue.value : null,
                  hint: Text(hintText, style: TextStyle(color: kfirstColor)),
                  isExpanded: true,
                  menuMaxHeight: 350,
                  items: [
                    ...dropDownHelperController.dropDownListData.map<DropdownMenuItem<String>>(
                          (data) => DropdownMenuItem<String>(
                        value: data['value'],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: Text(data['title']!, overflow: TextOverflow.ellipsis)),
                            Row(
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color:kfirstColor ),
                                  onPressed: () => _showEditDialog(context, data),


                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color:kfirstColor ),
                                  onPressed: () => _deleteItem(data['value']!),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ).toList(),
                  ],
                  onChanged: onSelect,
                ),
              ),
            ),
          ),
        ),
        IconButton(
          icon: Icon(Icons.add, color:kfirstColor),
          onPressed: () => _showAddDialog(context, onSelect, hintText),
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context, Map<String, String> data) {
    TextEditingController _controller = TextEditingController(text: data['title']);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Item"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                dropDownHelperController.updateItem(data['value']!, _controller.text);
                Navigator.of(context).pop();
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  void _showAddDialog(BuildContext context, Function(String?) onSelect, String hintText) {
    TextEditingController _controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Add Item"),
          content: TextField(
            controller: _controller,
            decoration: InputDecoration(
              labelText: "Title",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  dropDownHelperController.addItem(_controller.text);
                  // لا تقم بتحديد العنصر الجديد مباشرة بعد إضافته
                }
                Navigator.of(context).pop();
              },
              child: Text("Add"),
            ),
          ],
        );
      },
    );
  }

  void _deleteItem(String value) {
    dropDownHelperController.deleteItem(value);
  }

  Widget _buildSubmitButton(BoxConstraints constraints) {
    return ElevatedButton(
      onPressed: () {
        // Implement your submit logic here
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor:ksecondColor, // لون النص
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15), // تخصيص الحواف
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      child: Text("Submit"),
    );
  }
}

