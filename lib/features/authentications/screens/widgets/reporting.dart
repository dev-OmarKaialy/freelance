import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/costants/const.dart';
import '../../controllers-onboarding/reporting_controller.dart';


class ReportingScreen extends StatelessWidget {
  final ReportingController reportingController = Get.put(ReportingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('REPORTING', style: TextStyle(color: Colors.white)),
        backgroundColor: ksecondColor,
        elevation: 0,
      ),
      body: Row(
        children: [
          Expanded(
            flex: 2,
            child: Obx(() {
              return ListView.builder(
                itemCount: (reportingController.orders.length / 2).ceil(),
                itemBuilder: (context, index) {
                  final order1 = reportingController.orders[index * 2];
                  final order2 = index * 2 + 1 < reportingController.orders.length
                      ? reportingController.orders[index * 2 + 1]
                      : null; // Handle odd count
                  return _buildOrderListTile(order1, order2, index);
                },
              );
            }),
          ),
          Expanded(
            flex: 1,
            child: _buildImageContainer(),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderListTile(Map<String, dynamic> order1, Map<String, dynamic>? order2, int index) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmployeeRow(order1),
            if (order2 != null) _buildEmployeeRow(order2),
            SizedBox(height: 5),
            Text("Report Reason: ${order1['reportReason'] ?? 'N/A'}", style: TextStyle(color: Colors.red)),
            SizedBox(height: 5),
            Text("Report Count: ${order1['reportCount']}", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
        trailing: _buildOrderActionButtons(index),
      ),
    );
  }

  Widget _buildEmployeeRow(Map<String, dynamic> order) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(order["imageUrl"]!),
        ),
        SizedBox(width: 10),
        Text(order["name"]!),
      ],
    );
  }

  Widget _buildOrderActionButtons(int index) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            reportingController.incrementReportCount(index * 2);
            reportingController.deleteReporting(index * 2);
            if (index * 2 + 1 < reportingController.orders.length) {
              reportingController.incrementReportCount(index * 2 + 1);
              reportingController.deleteReporting(index * 2 + 1);
            }
          },
        ),
      ],
    );
  }

  Widget _buildImageContainer() {
    return Container(
      color: Colors.grey[200],
      child: FittedBox(
        child: Image.asset(
          'assets/xxxxxxxx.jpg',
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

