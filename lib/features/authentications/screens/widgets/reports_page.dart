
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modules/post.dart';

class ReportPage extends StatelessWidget {
  final Post post;
  final TextEditingController _reportController = TextEditingController();

  ReportPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('report_post'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text('${'reporting_post_by'.tr} ${post.authorName}'),
            SizedBox(height: 10),
            TextField(
              controller: _reportController,
              decoration: InputDecoration(
                hintText: 'enter_report_details'.tr,
              ),
              maxLines: 5,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_reportController.text.isNotEmpty) {
                  Navigator.pop(context, _reportController.text);
                }
              },
              child: Text('report'.tr),
            ),
          ],
        ),
      ),
    );
  }
}

