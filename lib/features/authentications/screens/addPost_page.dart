
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddPostPage extends StatelessWidget {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Post'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: _postController,
              decoration: InputDecoration(
                hintText: 'Enter post content'.tr,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_postController.text.isNotEmpty) {

                  Navigator.pop(context, _postController.text);
                }
              },
              child: Text('Publish'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
